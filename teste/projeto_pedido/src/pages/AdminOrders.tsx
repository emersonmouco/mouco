// src/pages/AdminOrders.tsx
import { useEffect, useMemo, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import AdminNavbar from '@/components/AdminNavbar';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { format } from 'date-fns';

type OrderStatus =
    | 'pending'
    | 'confirmed'
    | 'preparing'
    | 'delivering'
    | 'delivered'
    | 'cancelled';

type Order = {
    id: string;
    created_at: string;
    customer_id: string | null;
    customer_name: string | null;
    delivery_address: string | null;
    payment_method: 'card' | 'cash' | 'pix';
    total: number;
    status: OrderStatus;
    items: any;
};

const STATUS_LABEL: Record<OrderStatus | 'all', string> = {
    all: 'Todos',
    pending: 'Pendente',
    confirmed: 'Confirmado',
    preparing: 'Preparando',
    delivering: 'Saiu para entrega',
    delivered: 'Entregue',
    cancelled: 'Cancelado',
};

export default function AdminOrders() {
    const { companyKey, loading } = useAuth();
    const [orders, setOrders] = useState<Order[]>([]);
    const [q, setQ] = useState('');
    const [status, setStatus] = useState<'all' | OrderStatus>('all');
    const [dateFrom, setDateFrom] = useState<string>('');
    const [dateTo, setDateTo] = useState<string>('');

    const fetchOrders = async () => {
        if (!companyKey) return;

        let query = supabase
            .from('orders')
            .select('id, created_at, customer_id, delivery_address, payment_method, total, status, items')
            .eq('company_id', companyKey)
            .order('created_at', { ascending: false });

        if (status !== 'all') query = query.eq('status', status);
        if (dateFrom) query = query.gte('created_at', new Date(dateFrom).toISOString());
        if (dateTo) {
            const dt = new Date(dateTo);
            dt.setHours(23, 59, 59, 999);
            query = query.lte('created_at', dt.toISOString());
        }

        const { data, error } = await query;
        if (error) {
            console.error('[AdminOrders] fetch error:', error);
            setOrders([]);
            return;
        }
        setOrders((data ?? []) as Order[]);
    };

    useEffect(() => {
        if (!companyKey || loading) return;
        fetchOrders();
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [companyKey, loading]);

    const filtered = useMemo(() => {
        if (!q.trim()) return orders;
        const s = q.trim().toLowerCase();
        return orders.filter((o) =>
            (o.delivery_address ?? '').toLowerCase().includes(s) ||
            (o.customer_name ?? '').toLowerCase().includes(s) ||
            o.id.toLowerCase().includes(s)
        );
    }, [orders, q]);

    const exportCSV = () => {
        const rows = [
            ['ID', 'Data', 'Status', 'Pagamento', 'Total', 'Endereço'],
            ...filtered.map((o) => [
                o.id,
                format(new Date(o.created_at), 'dd/MM/yyyy HH:mm:ss'),
                STATUS_LABEL[o.status],
                o.payment_method.toUpperCase(),
                o.total.toFixed(2).replace('.', ','),
                o.delivery_address ?? '',
            ]),
        ];
        const csv = rows.map((r) => r.map((c) => `"${String(c).replace(/"/g, '""')}"`).join(';')).join('\n');
        const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = `pedidos_${Date.now()}.csv`;
        link.click();
    };

    return (
        <div className="container mx-auto px-4 py-6">
            <AdminNavbar />
            <h1 className="mb-4 text-2xl font-bold">Pedidos (filtros)</h1>

            <div className="mb-4 grid grid-cols-1 gap-3 md:grid-cols-5">
                <Input placeholder="Buscar por endereço, cliente ou ID" value={q} onChange={(e) => setQ(e.target.value)} />
                <Select value={status} onValueChange={(v) => setStatus(v as any)}>
                    <SelectTrigger><SelectValue placeholder="Status" /></SelectTrigger>
                    <SelectContent>
                        <SelectItem value="all">Todos</SelectItem>
                        <SelectItem value="pending">Pendente</SelectItem>
                        <SelectItem value="confirmed">Confirmado</SelectItem>
                        <SelectItem value="preparing">Preparando</SelectItem>
                        <SelectItem value="delivering">Saiu para entrega</SelectItem>
                        <SelectItem value="delivered">Entregue</SelectItem>
                        <SelectItem value="cancelled">Cancelado</SelectItem>
                    </SelectContent>
                </Select>
                <Input type="date" value={dateFrom} onChange={(e) => setDateFrom(e.target.value)} />
                <Input type="date" value={dateTo} onChange={(e) => setDateTo(e.target.value)} />
                <div className="flex gap-2">
                    <Button onClick={fetchOrders}>Atualizar</Button>
                    <Button variant="secondary" onClick={exportCSV}>Exportar CSV</Button>
                </div>
            </div>

            {filtered.length === 0 ? (
                <p>Nenhum pedido encontrado.</p>
            ) : (
                <div className="space-y-4">
                    {filtered.map((o) => (
                        <div key={o.id} className="rounded-xl border p-4">
                            <div className="flex flex-wrap items-center justify-between gap-2">
                                <div className="text-sm text-muted-foreground">
                                    Pedido <span className="font-mono font-semibold">#{o.id.slice(0, 8)}</span> — {format(new Date(o.created_at), 'dd/MM/yyyy, HH:mm:ss')}
                                </div>
                                <div className="text-right font-bold">Total: R$ {o.total.toFixed(2).replace('.', ',')}</div>
                            </div>
                            <div className="mt-2 text-sm">
                                <b>Status:</b> {STATUS_LABEL[o.status]} &middot; <b>Pagamento:</b> {o.payment_method.toUpperCase()}
                                <br />
                                <b>Endereço:</b> {o.delivery_address ?? '-'}
                            </div>
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
}
