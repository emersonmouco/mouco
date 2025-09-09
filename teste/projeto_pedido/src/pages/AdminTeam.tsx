import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import AdminNavbar from '@/components/AdminNavbar';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { Label } from '@/components/ui/label';
import { toast } from 'sonner';

type Invite = {
    id: string;
    email: string;
    role: 'staff';
    token: string;
    created_at: string;
};

export default function AdminTeam() {
    const { profile, companyKey, isOwner } = useAuth();
    const [email, setEmail] = useState('');
    const [invites, setInvites] = useState<Invite[]>([]);
    const [loading, setLoading] = useState(false);

    const load = async () => {
        if (!companyKey || !isOwner) return;
        const { data, error } = await supabase
            .from('invites')
            .select('id,email,role,token,created_at')
            .eq('company_id', companyKey)
            .order('created_at', { ascending: false });
        if (error) toast.error(error.message);
        else setInvites(data as any);
    };

    useEffect(() => { load(); /* eslint-disable-next-line */ }, [companyKey, isOwner]);

    const sendInvite = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!companyKey || !isOwner) return toast.error('Acesso negado');
        setLoading(true);
        try {
            // cria invite no banco
            const { data, error } = await supabase
                .from('invites')
                .insert({ company_id: companyKey, email, role: 'staff' })
                .select('id,token')
                .single();
            if (error) throw error;

            // envia magic link para o email do convidado
            const url = `${window.location.origin}/accept-invite?invite=${data.token}`;
            const { error: otpErr } = await supabase.auth.signInWithOtp({
                email,
                options: { emailRedirectTo: url },
            });
            if (otpErr) throw otpErr;

            toast.success('Convite enviado!');
            setEmail('');
            load();
        } catch (err: any) {
            toast.error(err.message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div>
            <AdminNavbar />
            <main className="container mx-auto px-4 py-6 space-y-6">
                <h1 className="text-2xl font-bold">Equipe</h1>
                {!isOwner ? (
                    <p className="text-sm text-muted-foreground">Apenas o dono pode convidar membros.</p>
                ) : (
                    <>
                        <form onSubmit={sendInvite} className="max-w-md space-y-3">
                            <div>
                                <Label>Email do funcionário</Label>
                                <Input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
                            </div>
                            <Button type="submit" disabled={loading}>Enviar convite</Button>
                        </form>

                        <div>
                            <h2 className="text-lg font-semibold mt-6 mb-2">Convites enviados</h2>
                            {!invites.length ? (
                                <p className="text-sm text-muted-foreground">Nenhum convite ainda.</p>
                            ) : (
                                <ul className="text-sm list-disc pl-5 space-y-1">
                                    {invites.map((i) => (
                                        <li key={i.id}>
                                            {i.email} — enviado em {new Date(i.created_at).toLocaleString()}
                                        </li>
                                    ))}
                                </ul>
                            )}
                        </div>
                    </>
                )}
            </main>
        </div>
    );
}
