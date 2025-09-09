import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';

export type Profile = {
    id: string;
    email: string;
    full_name?: string | null;
    user_type: 'customer' | 'company';
    company_slug?: string | null;
};

export function useProfile() {
    const { user } = useAuth();
    const [profile, setProfile] = useState<Profile | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        let cancelled = false;
        async function load() {
            if (!user) { setProfile(null); return; }
            setLoading(true); setError(null);
            const { data, error } = await (supabase as any)
                .from('profiles')
                .select('id, email, full_name, user_type, company_slug')
                .eq('id', user.id)
                .limit(1);
            if (!cancelled) {
                setProfile((data?.[0] ?? null) as Profile | null);
                setError(error?.message ?? null);
                setLoading(false);
            }
        }
        load();
        return () => { cancelled = true; };
    }, [user?.id]);

    return {
        profile,
        loading,
        error,
        isCompany: profile?.user_type === 'company',
        isCustomer: profile?.user_type === 'customer',
    };
}
