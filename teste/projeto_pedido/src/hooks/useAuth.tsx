import {
  createContext, useContext, useEffect, useMemo, useState, type ReactNode,
} from 'react';
import type { User } from '@supabase/supabase-js';
import { supabase } from '@/integrations/supabase/client';

type Role = 'owner' | 'staff' | null;

export interface UserProfile {
  id: string;
  email: string | null;
  user_type: 'customer' | 'company';
  role: Role;
  is_admin: boolean | null;
  full_name: string | null;
  phone: string | null;
  address: string | null;
  company_name: string | null;
  company_document: string | null;
  company_ref: string | null;
}

type AuthCtx = {
  user: User | null;
  profile: UserProfile | null;
  loading: boolean;
  isAuthenticated: boolean;
  isAdmin: boolean;
  isCompany: boolean;
  isOwner: boolean;
  isStaff: boolean;
  companyKey: string | null;
  signOut: () => Promise<void>;
};

const AuthContext = createContext<AuthCtx | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [profile, setProfile] = useState<UserProfile | null>(null);
  const [loading, setLoading] = useState(true);

  // carrega sessão + perfil
  useEffect(() => {
    let mounted = true;
    async function boot() {
      setLoading(true);
      const { data: { session } } = await supabase.auth.getSession();
      const u = session?.user ?? null;
      if (!mounted) return;
      setUser(u);

      if (u) {
        const p = await readOrCreateProfile(u);
        if (mounted) setProfile(p);
      } else {
        if (mounted) setProfile(null);
      }
      if (mounted) setLoading(false);
    }
    boot();

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (_evt, session) => {
      const u = session?.user ?? null;
      setUser(u);
      if (u) setProfile(await readOrCreateProfile(u));
      else setProfile(null);
      setLoading(false);
    });

    return () => { mounted = false; subscription.unsubscribe(); };
  }, []);

  const isAdmin = !!profile?.is_admin;
  const isCompany = profile?.user_type === 'company' || isAdmin;
  const isOwner = profile?.role === 'owner' || isAdmin;
  const isStaff = profile?.role === 'staff';
  const companyKey = useMemo(() => profile?.company_ref ?? profile?.id ?? null, [profile?.company_ref, profile?.id]);

  const value: AuthCtx = {
    user, profile, loading,
    isAuthenticated: !!user,
    isAdmin, isCompany, isOwner, isStaff, companyKey,
    signOut: async () => { await supabase.auth.signOut(); },
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

export const useAuth = () => {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used inside <AuthProvider>');
  return ctx;
};

// -------- helpers --------
async function readOrCreateProfile(u: User): Promise<UserProfile> {
  const { data: found, error: selErr } = await supabase
    .from('profiles')
    .select('id,email,user_type,role,is_admin,full_name,phone,address,company_name,company_document,company_ref')
    .eq('id', u.id)
    .maybeSingle();
  if (selErr) throw selErr;

  if (found) return found as UserProfile;

  // cria perfil mínimo (RLS permite pois id=auth.uid())
  const payload = {
    id: u.id,
    email: u.email ?? null,
    user_type: 'customer' as const,
    role: null as Role,
    is_admin: false,
    full_name: (u.user_metadata as any)?.full_name ?? null,
    phone: null,
    address: null,
    company_name: null,
    company_document: null,
    company_ref: null,
  };
  const { data: created, error: insErr } = await supabase
    .from('profiles')
    .insert(payload)
    .select('*')
    .single();
  if (insErr) throw insErr;
  return created as UserProfile;
}
