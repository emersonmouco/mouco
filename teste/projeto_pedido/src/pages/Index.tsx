import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import Header from '@/components/Header';

type Product = {
  id: string;
  name: string;
  description: string | null;
  price: number | null;
  image_url: string | null;
  category: string | null;
};

export default function Index() {
  const [loading, setLoading] = useState(true);
  const [err, setErr] = useState<string | null>(null);
  const [products, setProducts] = useState<Product[]>([]);

  useEffect(() => {
    let mounted = true;
    async function fetchProducts() {
      setLoading(true);
      setErr(null);
      try {
        console.debug('[Index] querying products…');
        const { data, error } = await supabase
          .from('products')
          .select('id,name,description,price,image_url,category')
          .order('name', { ascending: true }) // seguro (não exige colunas extras)
          .limit(200);

        if (error) throw error;
        if (!mounted) return;
        setProducts(data ?? []);
      } catch (e: any) {
        console.error('[Index] load products failed:', e);
        setErr(
          e?.message ??
          'Não foi possível carregar os produtos no momento.'
        );
      } finally {
        if (mounted) setLoading(false);
      }
    }
    fetchProducts();
    return () => {
      mounted = false;
    };
  }, []);

  return (
    <>
      <Header />
      <main className="max-w-6xl mx-auto px-4 py-6">
        <section className="rounded-lg bg-gradient-to-r from-orange-600 to-red-500 text-white p-6 mb-8">
          <h1 className="text-2xl font-semibold mb-2">
            Delivery Rápido e Delicioso
          </h1>
          <p>Pizzas artesanais, hambúrgueres suculentos e muito mais!</p>
        </section>

        <h2 className="text-xl font-semibold mb-4">Todos os Produtos</h2>

        {loading && <p>Carregando produtos…</p>}

        {err && !loading && (
          <div className="rounded border border-red-300 bg-red-50 p-3 text-red-800">
            <p className="font-medium">Não foi possível carregar.</p>
            <p className="text-sm mt-1">{err}</p>
            <p className="text-xs mt-2 text-red-700">
              Dica: verifique no Supabase se a tabela <code>products</code> está
              com RLS permitindo <em>select</em> (policy pública temporária) e se
              as colunas <code>id,name,description,price,image_url,category</code>{' '}
              existem.
            </p>
          </div>
        )}

        {!loading && !err && (
          <ul className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {products.map((p) => (
              <li key={p.id} className="border rounded-lg p-4">
                <div className="h-36 bg-neutral-100 rounded mb-3 flex items-center justify-center overflow-hidden">
                  {p.image_url ? (
                    <img
                      src={p.image_url}
                      alt={p.name}
                      className="h-full w-full object-cover"
                    />
                  ) : (
                    <span className="text-neutral-400 text-sm">Sem imagem</span>
                  )}
                </div>
                <h3 className="font-medium">{p.name}</h3>
                {p.description && (
                  <p className="text-sm text-neutral-600 mt-1 line-clamp-2">
                    {p.description}
                  </p>
                )}
                {typeof p.price === 'number' && (
                  <p className="mt-2 font-semibold">
                    {p.price.toLocaleString('pt-BR', {
                      style: 'currency',
                      currency: 'BRL',
                    })}
                  </p>
                )}
                {p.category && (
                  <span className="inline-block mt-2 text-xs px-2 py-1 rounded bg-neutral-100 text-neutral-700">
                    {p.category}
                  </span>
                )}
              </li>
            ))}
          </ul>
        )}
      </main>
    </>
  );
}
