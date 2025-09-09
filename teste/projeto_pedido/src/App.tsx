// src/App.tsx
import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";

import { AuthProvider } from "@/hooks/useAuth"; // <- IMPORTANTE

import Index from "./pages/Index";
import NotFound from "./pages/NotFound";
import Login from "./pages/Login";
import OAuthCallback from "./pages/OAuthCallback";
import Register from "./pages/Register";
import RegisterCompany from "./pages/RegisterCompany";

import Admin from "./pages/Admin";
import AdminDashboard from "@/pages/AdminDashboard";
import AdminCustomers from "@/pages/AdminCustomers";
import AdminDelivery from "@/pages/AdminDelivery";
import RequireCompany from "@/routes/RequireCompany";

import AdminOrders from "@/pages/AdminOrders";
import AdminReports from "@/pages/AdminReports";
import AdminKDS from "@/pages/AdminKDS";

import ResetPassword from "./pages/ResetPassword";
import UpdatePassword from "./pages/UpdatePassword";

import AdminTeam from "./pages/AdminTeam";
import AcceptInvite from "./pages/AcceptInvite";


/* verificar status do supabase */
import DebugSupabase from "@/pages/DebugSupabase";
import DebugPing from "@/pages/DebugPing";

const queryClient = new QueryClient();

export default function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <Toaster />
        <Sonner />
        {/* PROVIDER do auth envolvendo TODAS as rotas */}
        <AuthProvider>
          <BrowserRouter>
            <Routes>
              {/* Públicas */}
              <Route path="/" element={<Index />} />
              <Route path="/c/:slug" element={<Index />} />
              <Route path="/login" element={<Login />} />
              <Route path="/register" element={<Register />} />
              <Route path="/register-company" element={<RegisterCompany />} />
              <Route path="/oauth/callback" element={<OAuthCallback />} />

              {/* Admin (protegidas) */}
              <Route path="/admin" element={<RequireCompany><Admin /></RequireCompany>} />
              <Route path="/admin/dashboard" element={<RequireCompany><AdminDashboard /></RequireCompany>} />
              <Route path="/admin/clientes" element={<RequireCompany><AdminCustomers /></RequireCompany>} />
              <Route path="/admin/delivery" element={<RequireCompany><AdminDelivery /></RequireCompany>} />
              <Route path="/admin/orders" element={<RequireCompany><AdminOrders /></RequireCompany>} />
              <Route path="/admin/reports" element={<RequireCompany><AdminReports /></RequireCompany>} />
              <Route path="/admin/kds" element={<RequireCompany><AdminKDS /></RequireCompany>} />

              {/* Senha */}
              <Route path="/reset-password" element={<ResetPassword />} />
              <Route path="/update-password" element={<UpdatePassword />} />

              {/* Invite de colaborador */}
              <Route path="/admin/team" element={<RequireCompany><AdminTeam /></RequireCompany>} />
              <Route path="/accept-invite" element={<AcceptInvite />} />

              {/* status supabase */}
              <Route path="/__debug" element={<DebugSupabase />} />
              <Route path="/__ping" element={<DebugPing />} />


              {/* Catch-all */}
              <Route path="*" element={<NotFound />} />
            </Routes>
          </BrowserRouter>
        </AuthProvider>
      </TooltipProvider>
    </QueryClientProvider>
  );
}
