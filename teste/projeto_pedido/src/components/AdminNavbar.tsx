// src/components/AdminNavbar.tsx
import { NavLink, useNavigate } from "react-router-dom";
import { useAuth } from "@/hooks/useAuth";
import { Button } from "@/components/ui/button";


function linkClass(isActive: boolean) {
    return [
        "rounded-xl",
        "border",
        "px-4",
        "py-2",
        "text-sm",
        "transition",
        isActive
            ? "bg-green-600 text-white border-green-600"
            : "bg-background text-foreground hover:bg-muted"
    ].join(" ");
}

export default function AdminNavbar() {
    const navigate = useNavigate();
    const { profile, signOut } = useAuth();

    const handleLogout = async () => {
        await signOut();
        navigate("/");
    };

    return (
        <div className="sticky top-0 z-30 w-full bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60 border-b">
            <div className="mx-auto w-full max-w-7xl px-4 py-3 flex items-center gap-3 overflow-x-auto">
                <div className="font-semibold whitespace-nowrap">
                    Painel da Empresa{profile?.company_name ? ` — ${profile.company_name}` : ""}
                </div>

                <nav className="ml-4 flex gap-2">
                    <NavLink to="/admin/dashboard" className={({ isActive }) => linkClass(isActive)}>
                        Dashboard
                    </NavLink>
                    <NavLink to="/admin" className={({ isActive }) => linkClass(isActive)}>
                        Produtos
                    </NavLink>
                    <NavLink to="/admin/orders" className={({ isActive }) => linkClass(isActive)}>
                        Pedidos
                    </NavLink>
                    <NavLink to="/admin/delivery" className={({ isActive }) => linkClass(isActive)}>
                        Entrega &amp; Horários
                    </NavLink>
                    <NavLink to="/admin/reports" className={({ isActive }) => linkClass(isActive)}>
                        Relatórios
                    </NavLink>
                    <NavLink to="/admin/kds" className={({ isActive }) => linkClass(isActive)}>
                        KDS
                    </NavLink>
                    <NavLink to="/admin/clientes" className={({ isActive }) => linkClass(isActive)}>
                        Clientes
                    </NavLink>
                </nav>

                <div className="ml-auto flex items-center gap-2">
                    <span className="text-sm text-muted-foreground hidden sm:inline">
                        {profile?.full_name ?? "Olá"}
                    </span>
                    <Button variant="outline" onClick={handleLogout}>
                        Sair
                    </Button>
                </div>
            </div>
        </div>
    );
}
