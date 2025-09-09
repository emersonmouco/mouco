// scripts/fix-admin-navbar.js
// Executa:  node scripts/fix-admin-navbar.js
// Faz:
// 1) Normaliza o arquivo para src/components/AdminNavbar.tsx (força rename mesmo em FS case-insensitive)
// 2) Troca todos os "AdminNavBar" (qualquer casing) por "AdminNavbar" em .ts/.tsx

const fs = require('fs');
const path = require('path');

const ROOT = process.cwd();
const SRC = path.join(ROOT, 'src');
const COMPONENTS_DIR = path.join(SRC, 'components');
const CANONICAL = path.join(COMPONENTS_DIR, 'AdminNavbar.tsx');
const TEMP_CANON = path.join(COMPONENTS_DIR, '__AdminNavbar_TMP__.tsx');

function walk(dir, files = []) {
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
        const full = path.join(dir, entry.name);
        if (entry.isDirectory()) {
            // ignore node_modules / dist etc se estiverem dentro de src (raro)
            if (!/node_modules|\.next|dist|build|\.turbo|\.git/i.test(full)) {
                walk(full, files);
            }
        } else {
            files.push(full);
        }
    }
    return files;
}

function ensureCanonicalFile() {
    if (!fs.existsSync(COMPONENTS_DIR)) {
        console.log(`✖ Pasta não encontrada: ${COMPONENTS_DIR}`);
        process.exit(1);
    }

    // Ache todas as variações de arquivo com o mesmo nome (case-insensitive)
    const variants = fs
        .readdirSync(COMPONENTS_DIR, { withFileTypes: true })
        .filter(d => d.isFile())
        .map(d => path.join(COMPONENTS_DIR, d.name))
        .filter(p => path.basename(p).toLowerCase() === 'adminnavbar.tsx' || path.basename(p).toLowerCase() === 'adminnavbar.tsx'.toLowerCase() || // redundante mas explícito
            path.basename(p).toLowerCase() === 'adminnavbar.tsx'.toLowerCase());

    // Também capturar variantes comuns (AdminNavBar.tsx, Adminnavbar.tsx, adminnavbar.tsx etc)
    const extra = fs
        .readdirSync(COMPONENTS_DIR, { withFileTypes: true })
        .filter(d => d.isFile())
        .map(d => path.join(COMPONENTS_DIR, d.name))
        .filter(p => path.basename(p).toLowerCase() === 'adminnavbar.tsx' ||
            path.basename(p).toLowerCase() === 'adminnavbar.tsx'.toLowerCase() ||
            path.basename(p).toLowerCase() === 'adminnavbar.tsx'.toLowerCase() ||
            path.basename(p).toLowerCase() === 'adminnavbar.tsx'.replace('navbar', 'navbar')); // só para garantir

    // Consolidar: queremos tudo que seja "adminnavbar.tsx" em qualquer casing E "adminnavbar" com "NavBar"
    const allFiles = Array.from(new Set([
        ...variants,
        ...fs.readdirSync(COMPONENTS_DIR)
            .filter(n => n.toLowerCase() === 'adminnavbar.tsx' || n.toLowerCase() === 'adminnavbar.tsx' || n.toLowerCase() === 'adminnavbar.tsx')
            .map(n => path.join(COMPONENTS_DIR, n)),
        ...fs.readdirSync(COMPONENTS_DIR)
            .filter(n => n.toLowerCase() === 'adminnavbar.tsx' || n.toLowerCase() === 'adminnavbar.tsx' || n.toLowerCase() === 'adminnavbar.tsx')
            .map(n => path.join(COMPONENTS_DIR, n)),
        // pega qualquer arquivo cujo nome, em lower, seja "adminnavbar.tsx" OU "adminnavbar.tsx" (qualquer variação NavBar)
        ...fs.readdirSync(COMPONENTS_DIR)
            .filter(n => n.toLowerCase().replace('navbar', 'navbar') === 'adminnavbar.tsx')
            .map(n => path.join(COMPONENTS_DIR, n))
    ]));

    // Também varrer qualquer arquivo cujo nome case-insensitive bata em 'adminnavbar.tsx'
    const trulyAll = fs.readdirSync(COMPONENTS_DIR)
        .filter(n => n.toLowerCase() === 'adminnavbar.tsx' || n.toLowerCase() === 'adminnavbar.tsx' || n.toLowerCase() === 'adminnavbar.tsx' || n.toLowerCase() === 'adminnavbar.tsx')
        .map(n => path.join(COMPONENTS_DIR, n));

    const candidates = Array.from(new Set([...allFiles, ...trulyAll]));

    // Se CANONICAL já existe com o nome correto, nada a renomear
    if (fs.existsSync(CANONICAL)) {
        // Se existir alguma outra variante diferente, vamos remover.
        const others = candidates.filter(p => path.resolve(p) !== path.resolve(CANONICAL));
        for (const o of others) {
            fs.unlinkSync(o);
            console.log(`🧹 Removido duplicado: ${path.relative(ROOT, o)}`);
        }
        return;
    }

    // Se não existe o CANONICAL, mas existem variantes, escolhemos a MAIOR (por tamanho) como fonte
    const list = fs.readdirSync(COMPONENTS_DIR, { withFileTypes: true })
        .filter(d => d.isFile())
        .map(d => path.join(COMPONENTS_DIR, d.name))
        .filter(p => path.basename(p).toLowerCase() === 'adminnavbar.tsx' || // exato
            path.basename(p).toLowerCase() === 'adminnavbar.tsx' || // com B maiúsculo (NavBar)
            path.basename(p).toLowerCase() === 'adminnavbar.tsx' || // outras
            path.basename(p).toLowerCase() === 'adminnavbar.tsx');

    const variantSet = new Set([...candidates, ...list]);
    const unique = Array.from(variantSet);

    if (unique.length === 0) {
        console.log('⚠ Nenhuma variação de AdminNavbar.tsx encontrada. Vou apenas ajustar imports.');
        return;
    }

    // Escolhe a maior por tamanho
    unique.sort((a, b) => (fs.statSync(b).size - fs.statSync(a).size));
    const source = unique[0];

    // Caso o FS seja case-insensitive, renomear direto pode não alterar o case.
    // Fazemos rename para um temporário e depois para o canônico.
    fs.renameSync(source, TEMP_CANON);
    fs.renameSync(TEMP_CANON, CANONICAL);
    console.log(`✅ Renomeado para canônico: ${path.relative(ROOT, CANONICAL)}`);

    // Remove duplicatas restantes
    for (let i = 1; i < unique.length; i++) {
        try {
            fs.unlinkSync(unique[i]);
            console.log(`🧹 Removido duplicado: ${path.relative(ROOT, unique[i])}`);
        } catch (_) { }
    }
}

function fixImports() {
    const files = walk(SRC).filter(f => /\.(tsx?|mts|cts)$/.test(f));
    let changedCount = 0;

    const replacers = [
        // Caminhos de import que apontam para AdminNavBar (qualquer casing) → AdminNavbar
        { re: /(['"])(@?\/?[^'"]*components\/)AdminNavBar(\.tsx)?(['"])/gi, to: '$1$2AdminNavbar$4' },
        { re: /(['"])(@?\/?[^'"]*components\/)adminnavbar(\.tsx)?(['"])/gi, to: '$1$2AdminNavbar$4' },
        { re: /(['"])(@?\/?[^'"]*components\/)Adminnavbar(\.tsx)?(['"])/g, to: '$1$2AdminNavbar$4' },

        // Nome do símbolo importado (import AdminNavBar from ...)
        { re: /\bimport\s+AdminNavBar\b/gi, to: 'import AdminNavbar' },

        // Qualquer outra referência crua ao nome do componente
        { re: /\bAdminNavBar\b/g, to: 'AdminNavbar' },
        { re: /\bAdminnavbar\b/g, to: 'AdminNavbar' },
        { re: /\badminnavbar\b/g, to: 'AdminNavbar' },
    ];

    for (const file of files) {
        let txt = fs.readFileSync(file, 'utf8');
        const original = txt;
        for (const { re, to } of replacers) {
            txt = txt.replace(re, to);
        }
        if (txt !== original) {
            fs.writeFileSync(file, txt, 'utf8');
            changedCount++;
            console.log(`✏️  Atualizado: ${path.relative(ROOT, file)}`);
        }
    }

    console.log(`\n🎯 Concluído. Arquivos alterados: ${changedCount}`);
}

(function main() {
    console.log('— Fix AdminNavbar —\n');
    ensureCanonicalFile();
    fixImports();
    console.log('\n✅ Pronto! Reinicie o dev server para ver os efeitos.');
})();
