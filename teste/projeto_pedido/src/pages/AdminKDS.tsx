import { useEffect, useMemo, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import AdminNavbar from '@/components/AdminNavbar';
import { Button } from '@/components/ui/button';

type Order = {
    id: string;
    created_at: string;
    items: any;
    delivery_address: string | null;
    total: number;
    status: 'pending' | 'confirmed' | 'preparing' | 'delivering' | 'delivered' | 'cancelled';
};

const label = {
    pending: 'NOVOS',
    preparing: 'PREPARANDO',
    delivered: 'SAIU / ENTREGUES',
    delivering: 'SAIU / ENTREGUES',
} as const;

export default function AdminKDS() {
    const { companyKey } = useAuth();
    const [orders, setOrders] = useState<Order[]>([]);

    const load = async () => {
        if (!companyKey) return;
        const { data } = await supabase
            .from('orders')
            .select('id,created_at,items,delivery_address,total,status')
            .eq('company_id', companyKey)
            .in('status', ['pending', 'preparing', 'delivering', 'delivered'])
            .order('created_at', { ascending: false });

        setOrders((data ?? []) as Order[]);
    };

    useEffect(() => {
        if (!companyKey) return;
        load();

        const channel = supabase
            .channel('kds')
            .on(
                'postgres_changes',
                { event: '*', schema: 'public', table: 'orders', filter: `company_id=eq.${companyKey}` },
                () => load()
            )
            .subscribe();

        return () => { supabase.removeChannel(channel); };
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [companyKey]);

    const novos = useMemo(() => orders.filter(o => o.status === 'pending' || o.status === 'confirmed'), [orders]);
    const preparando = useMemo(() => orders.filter(o => o.status === 'preparing'), [orders]);
    const saiu = useMemo(() => orders.filter(o => o.status === 'delivering' || o.status === 'delivered'), [orders]);

    const updateStatus = async (id: string, status: Order['status']) => {
        await supabase.from('orders').update({ status }).eq('id', id);
    };

    const Column = ({ title, children }: { title: string; children: React.ReactNode }) => (
        <div className="rounded-xl border bg-card p-4">
            <h2 className="mb-2 text-xl font-bold">{title}</h2>
            {children}
        </div>
    );

    const Card = (o: Order) => (
        <div className="mb-3 rounded-lg border p-3">
            <div className="text-sm text-muted-foreground">#{o.id.slice(0, 8)} — {new Date(o.created_at).toLocaleTimeString()}</div>
            <div className="mt-1 font-medium">Total: R$ {o.total.toFixed(2).replace('.', ',')}</div>
            <div className="text-sm">{o.delivery_address ?? '-'}</div>
            <div className="mt-2 flex gap-2">
                {o.status === 'pending' || o.status === 'confirmed' ? (
                    <>
                        <Button onClick={() => updateStatus(o.id, 'preparing')}>Preparar</Button>
                        <Button variant="destructive" onClick={() => updateStatus(o.id, 'cancelled')}>Cancelar</Button>
                    </>
                ) : null}
                {o.status === 'preparing' ? (
                    <Button onClick={() => updateStatus(o.id, 'delivering')}>Saiu</Button>
                ) : null}
            </div>
        </div>
    );

    return (
        <div className="container mx-auto px-4 py-6">
            <AdminNavbar />
            <div className="grid gap-4 md:grid-cols-3">
                <Column title={label.pending}>
                    {novos.length === 0 ? <p>Sem pedidos aqui.</p> : novos.map(o => <Card key={o.id} {...o} />)}
                </Column>
                <Column title={label.preparing}>
                    {preparando.length === 0 ? <p>Sem pedidos aqui.</p> : preparando.map(o => <Card key={o.id} {...o} />)}
                </Column>
                <Column title={label.delivered}>
                    {saiu.length === 0 ? <p>Sem pedidos aqui.</p> : saiu.map(o => <Card key={o.id} {...o} />)}
                </Column>
            </div>
        </div>
    );
}
