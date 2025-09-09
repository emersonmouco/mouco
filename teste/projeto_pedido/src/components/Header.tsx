import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';

export default function Header() {
  const nav = useNavigate();
  const { isAuthenticated, isCompany, signOut } = useAuth();

  return (
    <header className="h-14 flex items-center justify-between px-4 border-b">
      <Link to="/" className="font-semibold">FastFood <span className="text-neutral-500">Delivery</span></Link>

      <nav className="flex items-center gap-3">
        {isCompany && <Link className="btn" to="/admin">Painel</Link>}
        {!isAuthenticated ? (
          <Link className="btn" to="/login">Entrar</Link>
        ) : (
          <button
            className="btn"
            onClick={async () => { await signOut(); nav('/'); }}
          >
            Sair
          </button>
        )}
      </nav>
    </header>
  );
}
