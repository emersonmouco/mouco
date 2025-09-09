import { useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Button } from '@/components/ui/button';
import { toast } from 'sonner';
import { useNavigate } from 'react-router-dom';

export default function UpdatePassword() {
    const [password, setPassword] = useState('');
    const navigate = useNavigate();

    const submit = async (e: React.FormEvent) => {
        e.preventDefault();
        const { error } = await supabase.auth.updateUser({ password });
        if (error) return toast.error(error.message);
        toast.success('Senha atualizada!');
        navigate('/login', { replace: true });
    };

    return (
        <div className="min-h-screen grid place-items-center">
            <div className="w-full max-w-md rounded-xl border bg-card p-6">
                <h1 className="text-xl font-bold mb-2">Definir nova senha</h1>
                <form onSubmit={submit} className="space-y-4">
                    <div>
                        <Label>Nova senha</Label>
                        <Input type="password" value={password} onChange={(e) => setPassword(e.target.value)} required />
                    </div>
                    <Button type="submit" className="w-full">Salvar</Button>
                </form>
            </div>
        </div>
    );
}
