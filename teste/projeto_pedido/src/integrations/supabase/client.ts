// src/integrations/supabase/client.ts
import { createClient } from '@supabase/supabase-js';

const url = import.meta.env.VITE_SUPABASE_URL as string | undefined;
const anon = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined;

if (!url || !anon) {
  // Ajuda no diagnóstico em dev
  // eslint-disable-next-line no-console
  console.error('[Supabase] VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY ausentes. Confira seu .env.local');
}



if (!url || !anon) {
  console.error('[Supabase] ENV ausente:',
    { VITE_SUPABASE_URL: url, VITE_SUPABASE_ANON_KEY_len: anon?.length });
}

export const supabase = createClient(url ?? '', anon ?? '', {
  auth: { persistSession: true, autoRefreshToken: true, detectSessionInUrl: true, storage: window.localStorage },
});

/*
export const supabase = createClient(url, anon, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: true,
    storage: window.localStorage,
  },
});*/
