import { useEffect, useMemo, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Separator } from '@/components/ui/separator';
import AdminNavbar from '@/components/AdminNavbar';
import { exportToCsv } from '@/utils/csv';

type OrderRow = { id: string; total: number; created_at: string; status: string };
type ItemRow = { product_id: string | null; product_name: string; quantity: number; line_total: number };

export default function AdminReports() {
    const { user } = useAuth();
    const companyId = user?.id ?? null;

    const [start, setStart] = useState<string>('');
    const [end, setEnd] = useState<string>('');
    const [orders, setOrders] = useState<OrderRow[]>([]);
    const [items, setItems] = useState<ItemRow[]>([]);
    const [loading, setLoading] = useState(false);

    async function load() {
        if (!companyId) return;
        setLoading(true);
        try {
            // orders no período (status concluídos e em trânsito contam faturamento — ajuste como quiser)
            let q1: any = (supabase as any)
                .from('orders')
                .select('id,total,created_at,status')
                .eq('company_id', companyId)
                .in('status', ['completed', 'out_for_delivery', 'preparing', 'pending']); // ou só completed

            if (start) q1 = q1.gte('created_at', start);
            if (end) q1 = q1.lt('created_at', new Date(new Date(end).getTime() + 24 * 3600 * 1000).toISOString());
            const { data: o } = await q1;
            setOrders((o ?? []).map((r: any) => ({ ...r, total: Number(r.total) })));

            // itens (view)
            let q2: any = (supabase as any)
                .from('order_items_view')
                .select('product_id,product_name,quantity,line_total,created_at')
                .eq('company_id', companyId);

            if (start) q2 = q2.gte('created_at', start);
            if (end) q2 = q2.lt('created_at', new Date(new Date(end).getTime() + 24 * 3600 * 1000).toISOString());
            const { data: i } = await q2;
            setItems((i ?? []).map((r: any) => ({
                product_id: r.product_id ?? null,
                product_name: r.product_name,
                quantity: Number(r.quantity),
                line_total: Number(r.line_total),
            })));
        } finally {
            setLoading(false);
        }
    }

    useEffect(() => { load(); /* eslint-disable-next-line */ }, [companyId]);

    const totalRevenue = useMemo(() => orders.reduce((s, o) => s + Number(o.total), 0), [orders]);
    const orderCount = orders.length;
    const avgTicket = orderCount ? totalRevenue / orderCount : 0;

    const topProducts = useMemo(() => {
        const map = new Map<string, { name: string; qty: number; revenue: number }>();
        items.forEach(it => {
            const key = it.product_id ?? it.product_name;
            const rec = map.get(key) ?? { name: it.product_name, qty: 0, revenue: 0 };
            rec.qty += it.quantity;
            rec.revenue += it.line_total;
            map.set(key, rec);
        });
        return Array.from(map.values()).sort((a, b) => b.revenue - a.revenue).slice(0, 10);
    }, [items]);

    const exportTopCsv = () => {
        exportToCsv(`top-produtos-${new Date().toISOString().slice(0, 10)}.csv`,
            topProducts.map(x => ({
                produto: x.name,
                quantidade: x.qty,
                faturamento: x.revenue.toFixed(2).replace('.', ',')
            }))
        );
    };

    return (
        <div>
            <AdminNavbar />
            <main className="container mx-auto px-4 py-6 space-y-6">
                <h1 className="text-2xl font-bold">Relatórios</h1>

                <div className="grid grid-cols-1 md:grid-cols-4 gap-3 items-end">
                    <div>
                        <Label>De</Label>
                        <Input type="date" value={start} onChange={e => setStart(e.target.value)} />
                    </div>
                    <div>
                        <Label>Até</Label>
                        <Input type="date" value={end} onChange={e => setEnd(e.target.value)} />
                    </div>
                    <div className="md:col-span-2 flex gap-2 justify-end">
                        <Button variant="outline" onClick={load} disabled={loading}>Aplicar</Button>
                    </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    <Kpi title="Faturamento" value={`R$ ${totalRevenue.toFixed(2).replace('.', ',')}`} />
                    <Kpi title="Pedidos" value={String(orderCount)} />
                    <Kpi title="Ticket médio" value={`R$ ${avgTicket.toFixed(2).replace('.', ',')}`} />
                </div>

                <Separator />

                <div className="flex items-center justify-between">
                    <h2 className="text-xl font-semibold">Top produtos</h2>
                    <Button onClick={exportTopCsv} disabled={!topProducts.length}>Exportar CSV</Button>
                </div>

                <div className="overflow-x-auto">
                    <table className="min-w-full text-sm">
                        <thead>
                            <tr className="text-left border-b">
                                <th className="py-2 pr-4">Produto</th>
                                <th className="py-2 pr-4">Quantidade</th>
                                <th className="py-2 pr-4">Faturamento</th>
                            </tr>
                        </thead>
                        <tbody>
                            {topProducts.map((p, i) => (
                                <tr key={i} className="border-b">
                                    <td className="py-2 pr-4">{p.name}</td>
                                    <td className="py-2 pr-4">{p.qty}</td>
                                    <td className="py-2 pr-4">R$ {p.revenue.toFixed(2).replace('.', ',')}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    );
}

function Kpi({ title, value }: { title: string; value: string }) {
    return (
        <div className="rounded-xl border p-4 bg-card">
            <div className="text-sm text-muted-foreground">{title}</div>
            <div className="text-2xl font-semibold">{value}</div>
        </div>
    );
}
