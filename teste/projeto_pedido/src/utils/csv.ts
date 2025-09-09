export function exportToCsv(filename: string, rows: any[]) {
    if (!rows?.length) return;
    const headers = Object.keys(rows[0]);
    const escape = (v: any) => {
        const s = v == null ? '' : String(v);
        return /[",\n;]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
    };
    const csv = [headers.join(';')]
        .concat(rows.map(row => headers.map(h => escape(row[h])).join(';')))
        .join('\n');

    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url; a.download = filename; a.click();
    URL.revokeObjectURL(url);
}
