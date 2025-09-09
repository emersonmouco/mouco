// src/routes/RequireCompany.tsx
import { useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';

export default function RequireCompany({ children }: { children: JSX.Element }) {
    const { isAuthenticated, isCompany, isAdmin } = useAuth();

    // Failsafe: evita ficar travado no "Carregando…" por causa de loading infinito
    const [deadlineReached, setDeadlineReached] = useState(false);
    useEffect(() => {
        const t = setTimeout(() => setDeadlineReached(true), 2500);
        return () => clearTimeout(t);
    }, []);

    if (!deadlineReached) {
        return (
            <div className="min-h-[60vh] grid place-items-center text-muted-foreground">
                Carregando permissões…
            </div>
        );
    }

    if (!isAuthenticated) return <Navigate to="/login" replace />;
    if (!(isCompany || isAdmin)) return <Navigate to="/" replace />;

    return children;
}
