// src/pages/Admin.tsx (ou equivalente)
import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';

type Product = { id: string; name: string };

export default function Admin() {
  const { companyKey } = useAuth(); // vem do seu provider
  const [items, setItems] = useState<Product[]>([]);
  const [err, setErr] = useState<string | null>(null);

  useEffect(() => {
    (async () => {
      setErr(null);
      try {
        const { data, error } = await supabase
          .from('products')
          .select('id,name')       // sem join
          .eq('company_id', companyKey!)
          .order('name', { ascending: true });

        if (error) throw error;
        setItems(data ?? []);
      } catch (e: any) {
        console.error('[Admin] load products failed:', e);
        setErr(e?.message ?? 'Falha ao carregar produtos');
      }
    })();
  }, [companyKey]);

  if (!companyKey) return <div className="p-4">Carregando permissões...</div>;

  return (
    <div className="p-4">
      <h1 className="font-semibold mb-3">Meus produtos</h1>
      {err && <div className="text-red-600 text-sm mb-3">{err}</div>}
      <ul className="space-y-1">
        {items.map(p => <li key={p.id}>{p.name}</li>)}
      </ul>
    </div>
  );
}
