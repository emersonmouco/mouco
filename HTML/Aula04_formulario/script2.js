document.getElementById('cpfCnpj').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, '');
    if (value.length <= 11) {
        value = value.replace(/(\d{3})(\d)/, '$1.$2')
            .replace(/(\d{3})(\d)/, '$1.$2')
            .replace(/(\d{3})(\d{1,2})$/, '$1-$2');
    } else {
        value = value.replace(/^(\d{2})(\d)/, '$1.$2')
            .replace(/^(\d{2})\.(\d{3})(\d)/, '$1.$2.$3')
            .replace(/\.(\d{3})(\d)/, '.$1/$2')
            .replace(/(\d{4})(\d)/, '$1-$2');
    }
    e.target.value = value;
});

// Máscara para telefone
document.getElementById('telefone').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, '');
    if (value.length > 11) value = value.slice(0, 11);
    value = value.replace(/^(\d{2})(\d)/g, '($1) $2')
        .replace(/(\d{5})(\d)/, '$1-$2');
    e.target.value = value;
});

// Validação de email
function validarEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

// Validação de CPF
function validarCPF(cpf) {
    cpf = cpf.replace(/\D/g, '');
    if (cpf.length !== 11 || /^(\d)\1+$/.test(cpf)) return false;
    let soma = 0;
    for (let i = 0; i < 9; i++) soma += parseInt(cpf.charAt(i)) * (10 - i);
    let resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) resto = 0;
    if (resto !== parseInt(cpf.charAt(9))) return false;
    soma = 0;
    for (let i = 0; i < 10; i++) soma += parseInt(cpf.charAt(i)) * (11 - i);
    resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) resto = 0;
    return resto === parseInt(cpf.charAt(10));
}

// Validação de CNPJ
function validarCNPJ(cnpj) {
    cnpj = cnpj.replace(/\D/g, '');
    if (cnpj.length !== 14 || /^(\d)\1+$/.test(cnpj)) return false;
    let tamanho = cnpj.length - 2
    let numeros = cnpj.substring(0, tamanho);
    let digitos = cnpj.substring(tamanho);
    let soma = 0;
    let pos = tamanho - 7;
    for (let i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2) pos = 9;
    }
    let resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(0)) return false;
    tamanho = tamanho + 1;
    numeros = cnpj.substring(0, tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (let i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2) pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    return resultado == digitos.charAt(1);
}

// Validação de telefone
function validarTelefone(telefone) {
    const regex = /^\(?\d{2}\)?[\s-]?\d{4,5}-?\d{4}$/;
    return regex.test(telefone);
}

// Validação do formulário
document.getElementById('cadastroForm').addEventListener('submit', function (e) {
    e.preventDefault();
    let isValid = true;
    document.querySelectorAll('.error').forEach(el => el.textContent = '');

    // Email
    const email = document.getElementById('email').value;
    if (!validarEmail(email)) {
        document.getElementById('emailError').textContent = 'Email inválido';
        isValid = false;
    }

    // CPF ou CNPJ
    const cpfCnpj = document.getElementById('cpfCnpj').value.replace(/\D/g, '');
    if (cpfCnpj.length === 11) {
        if (!validarCPF(cpfCnpj)) {
            document.getElementById('cpfCnpjError').textContent = 'CPF inválido';
            isValid = false;
        }
    } else if (cpfCnpj.length === 14) {
        if (!validarCNPJ(cpfCnpj)) {
            document.getElementById('cpfCnpjError').textContent = 'CNPJ inválido';
            isValid = false;
        }
    } else {
        document.getElementById('cpfCnpjError').textContent = 'Digite um CPF ou CNPJ válido';
        isValid = false;
    }

    // Telefone
    const telefone = document.getElementById('telefone').value;
    if (!validarTelefone(telefone)) {
        document.getElementById('telefoneError').textContent = 'Telefone inválido';
        isValid = false;
    }

    if (isValid) {
        alert('Cadastro realizado com sucesso!');
        // Envio dos dados pode ser feito aqui
    }
});