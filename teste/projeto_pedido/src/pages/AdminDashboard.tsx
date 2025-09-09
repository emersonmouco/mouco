import AdminNavbar from '@/components/AdminNavbar';
import { useAuth } from '@/hooks/useAuth';
import { supabase } from '@/integrations/supabase/client';
import { useEffect, useState } from 'react';
import type { Database } from '@/integrations/supabase/database.types';
type Order = Database['public']['Tables']['orders']['Row'];

export default function AdminDashboard() {
    const { user } = useAuth();
    const companyId = user?.id ?? null;
    const [orders, setOrders] = useState<Order[]>([]);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        if (!companyId) return;
        (async () => {
            setLoading(true);
            const { data } = await supabase.from('orders').select('*').eq('company_id', companyId).order('created_at', { ascending: false });
            setOrders(data || []);
            setLoading(false);
        })();
    }, [companyId]);

    const now = new Date();
    const isSameDay = (d: Date) => d.getFullYear() === now.getFullYear() && d.getMonth() === now.getMonth() && d.getDate() === now.getDate();
    const todayOrders = orders.filter(o => isSameDay(new Date(o.created_at)));
    const todayRevenue = todayOrders.reduce((s, o) => s + Number(o.total), 0);
    const pending = orders.filter(o => o.status === 'pending').length;
    const monthRevenue = orders
        .filter(o => { const d = new Date(o.created_at); return d.getFullYear() === now.getFullYear() && d.getMonth() === now.getMonth(); })
        .reduce((s, o) => s + Number(o.total), 0);

    return (
        <div>
            <AdminNavbar />
            <main className="container mx-auto px-4 py-6 space-y-6">
                <h1 className="text-2xl font-bold">Dashboard</h1>
                {loading ? <p>Carregando…</p> : (
                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                        <Kpi title="Faturamento hoje" value={`R$ ${todayRevenue.toFixed(2).replace('.', ',')}`} />
                        <Kpi title="Pedidos hoje" value={String(todayOrders.length)} />
                        <Kpi title="Pendentes" value={String(pending)} />
                        <Kpi title="Faturamento do mês" value={`R$ ${monthRevenue.toFixed(2).replace('.', ',')}`} />
                    </div>
                )}
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
