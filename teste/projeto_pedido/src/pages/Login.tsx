import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';

export default function Login() {
  const nav = useNavigate();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [err, setErr] = useState<string | null>(null);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setErr(null);
    try {
      const { error } = await supabase.auth.signInWithPassword({ email, password });
      if (error) throw error;
      // após logar, o AuthProvider carrega o perfil; vamos para a home
      nav('/');
    } catch (e: any) {
      setErr(e?.message ?? 'Falha no login. Verifique suas credenciais.');
    } finally {
      setLoading(false);
    }
  }

  return (
    <main className="max-w-md mx-auto px-4 py-8">
      <h1 className="text-2xl font-semibold mb-6">Entrar na conta</h1>

      <form onSubmit={onSubmit} className="space-y-4">
        <div>
          <label className="block text-sm mb-1">Email</label>
          <input
            type="email"
            autoComplete="email"
            className="w-full border rounded px-3 py-2"
            placeholder="voce@email.com"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </div>

        <div>
          <label className="block text-sm mb-1">Senha</label>
          <input
            type="password"
            autoComplete="current-password"
            className="w-full border rounded px-3 py-2"
            placeholder="••••••••"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </div>

        {err && (
          <p className="text-red-600 text-sm">{err}</p>
        )}

        <button
          className="w-full bg-orange-600 hover:bg-orange-700 text-white rounded px-4 py-2 disabled:opacity-60"
          type="submit"
          disabled={loading}
        >
          {loading ? 'Entrando…' : 'Entrar'}
        </button>
      </form>

      <div className="mt-6 text-sm flex items-center justify-between">
        <Link to="/register" className="text-orange-700 hover:underline">
          Criar conta
        </Link>
        <Link to="/register-company" className="text-orange-700 hover:underline">
          Cadastrar empresa
        </Link>
      </div>

      <div className="mt-4">
        <Link to="/" className="text-sm text-neutral-600 hover:underline">
          Voltar para a loja
        </Link>
      </div>
    </main>
  );
}
