import { useEffect, useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';
import { toast } from 'sonner';

export default function AcceptInvite() {
    const [sp] = useSearchParams();
    const token = sp.get('invite');
    const navigate = useNavigate();
    const [done, setDone] = useState(false);

    useEffect(() => {
        (async () => {
            try {
                const { data: { user } } = await supabase.auth.getUser();
                if (!user) {
                    toast.error('Faça login pelo link do email e tente novamente.');
                    navigate('/login'); return;
                }
                if (!token) {
                    toast.error('Convite inválido.');
                    navigate('/'); return;
                }

                // acha o convite
                const { data: inv, error: invErr } = await supabase
                    .from('invites')
                    .select('id, company_id, email, role, accepted_at')
                    .eq('token', token)
                    .limit(1)
                    .maybeSingle();
                if (invErr || !inv) throw new Error('Convite não encontrado');

                // confere email
                const email = user.email?.toLowerCase();
                if (!email || email !== inv.email.toLowerCase()) {
                    throw new Error('Este convite é para outro email.');
                }

                // atualiza perfil do usuário: vira staff da empresa
                const updates = {
                    user_type: 'company' as const,
                    role: 'staff' as const,
                    company_ref: inv.company_id,
                };

                const { error: profErr } = await supabase.from('profiles').update(updates).eq('id', user.id);
                if (profErr) throw profErr;

                await supabase.from('invites').update({ accepted_at: new Date().toISOString() }).eq('id', inv.id);

                toast.success('Convite aceito! Bem-vindo à equipe.');
                setDone(true);
                navigate('/admin', { replace: true });
            } catch (e: any) {
                toast.error(e.message ?? 'Erro ao aceitar convite');
                navigate('/', { replace: true });
            }
        })();
    }, [token, navigate]);

    return <div className="p-6 text-center">{done ? 'Tudo certo!' : 'Processando convite…'}</div>;
}
