import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';

export default function OAuthCallback() {
    const navigate = useNavigate();

    useEffect(() => {
        // só garante que a sessão foi criada e segue pro app
        supabase.auth.getSession().then(() => {
            navigate('/', { replace: true });
        });
    }, [navigate]);

    return <div className="p-6 text-center">Conectando…</div>;
}