import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import AdminNavbar from "@/components/AdminNavbar";

type Row = {
    customer_id: string | null;
    customer_email: string | null;
    total_orders: number;
    last_order_at: string | null;
    total_spent: number;
};

export default function AdminCustomers() {
    const { companyKey } = useAuth();
    const [rows, setRows] = useState<Row[]>([]);

    useEffect(() => {
        if (!companyKey) return;

        // Exemplo simples: agrega por customer_id. (Adapte conforme seu schema)
        supabase
            .from('orders')
            .select('customer_id, customer_email:profiles!inner(email), created_at, total')
            .eq('company_id', companyKey)
            .order('created_at', { ascending: false })
            .then(({ data }) => {
                const agg = new Map<string, Row>();
                (data ?? []).forEach((o: any) => {
                    const key = o.customer_id ?? 'anon';
                    const prev = agg.get(key) ?? { customer_id: key, customer_email: o.customer_email ?? null, total_orders: 0, last_order_at: null, total_spent: 0 };
                    prev.total_orders += 1;
                    prev.total_spent += Number(o.total || 0);
                    if (!prev.last_order_at || new Date(o.created_at) > new Date(prev.last_order_at)) {
                        prev.last_order_at = o.created_at;
                    }
                    agg.set(key, prev);
                });
                setRows(Array.from(agg.values()));
            });
    }, [companyKey]);

    return (
        <div className="container mx-auto px-4 py-6">
            <AdminNavbar />
            <h1 className="mb-4 text-2xl font-bold">Clientes e Histórico</h1>

            {rows.length === 0 ? (
                <p>Ainda não há pedidos.</p>
            ) : (
                <div className="space-y-3">
                    {rows.map((r) => (
                        <div key={r.customer_id ?? 'anon'} className="rounded-xl border p-4">
                            <div className="font-medium">{r.customer_email ?? '—'}</div>
                            <div className="text-sm text-muted-foreground">
                                Pedidos: {r.total_orders} &middot; Gasto total: R$ {r.total_spent.toFixed(2).replace('.', ',')}
                                {r.last_order_at ? <> &middot; Último: {new Date(r.last_order_at).toLocaleString()}</> : null}
                            </div>
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
}
