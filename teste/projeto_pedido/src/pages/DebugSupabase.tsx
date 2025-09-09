// src/pages/DebugSupabase.tsx
import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';

export default function DebugSupabase() {
    const [out, setOut] = useState<string>('Carregando...');

    useEffect(() => {
        (async () => {
            try {
                const url = (import.meta as any).env?.VITE_SUPABASE_URL;
                const key = (import.meta as any).env?.VITE_SUPABASE_ANON_KEY;

                let log = '';
                log += `ENV URL: ${url}\n`;
                log += `ENV KEY LEN: ${key ? String(key).length : 'undefined'}\n`;

                // 1) sessão
                const sess = await supabase.auth.getSession();
                log += `SESSION: ${sess.data.session ? 'SIM' : 'NÃO'}\n`;

                // 2) SELECT via cliente
                const r1 = await supabase.from('products')
                    .select('id,name,is_available')
                    .eq('is_available', true)
                    .limit(5);
                log += `DB(products) err: ${r1.error ? r1.error.message : 'OK'}\n`;
                log += `DB(products) data: ${JSON.stringify(r1.data ?? null)}\n`;

                // 3) SELECT via REST fetch (bypassa o client, testa CORS/policies)
                if (url && key) {
                    const res = await fetch(`${url}/rest/v1/products?select=id,name,is_available&is_available=eq.true&limit=3`, {
                        headers: {
                            apikey: key,
                            Authorization: `Bearer ${key}`,
                        },
                    });
                    log += `REST /products status: ${res.status}\n`;
                    const json = await res.json().catch(() => null);
                    log += `REST /products json: ${JSON.stringify(json)}\n`;
                }

                // 4) se logado, tenta profiles
                const u = (await supabase.auth.getUser()).data.user;
                if (u) {
                    const r2 = await supabase.from('profiles').select('id,email,user_type').eq('id', u.id).single();
                    log += `DB(profile) err: ${r2.error ? r2.error.message : 'OK'}\n`;
                    log += `DB(profile) data: ${JSON.stringify(r2.data ?? null)}\n`;
                }

                setOut(log);
                console.log('[DEBUG]', log);
            } catch (e: any) {
                const msg = e?.message ?? String(e);
                setOut(`EXCEPTION: ${msg}`);
                console.error(e);
            }
        })();
    }, []);

    return (
        <pre style={{ padding: 24, whiteSpace: 'pre-wrap' }}>{out}</pre>
    );
}
