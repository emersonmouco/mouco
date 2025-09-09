import { useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Button } from '@/components/ui/button';
import { toast } from 'sonner';

export default function ResetPassword() {
    const [email, setEmail] = useState('');
    const [sent, setSent] = useState(false);

    const submit = async (e: React.FormEvent) => {
        e.preventDefault();
        const { error } = await supabase.auth.resetPasswordForEmail(email, {
            redirectTo: `${window.location.origin}/update-password`,
        });
        if (error) return toast.error(error.message);
        setSent(true);
    };

    return (
        <div className="min-h-screen grid place-items-center">
            <div className="w-full max-w-md rounded-xl border bg-card p-6">
                <h1 className="text-xl font-bold mb-2">Redefinir senha</h1>
                {!sent ? (
                    <form onSubmit={submit} className="space-y-4">
                        <div>
                            <Label>Email</Label>
                            <Input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
                        </div>
                        <Button type="submit" className="w-full">Enviar link</Button>
                    </form>
                ) : (
                    <p>Enviamos um link de redefinição para <b>{email}</b>. Verifique sua caixa de entrada.</p>
                )}
            </div>
        </div>
    );
}
