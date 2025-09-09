// src/pages/AdminDelivery.tsx
import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { toast } from 'sonner';
import AdminNavbar from '@/components/AdminNavbar';

type Zone = { id: string; min_km: number; max_km: number | null; fee: number };
type Hour = { id: string; weekday: number; open_time: string; close_time: string };

export default function AdminDelivery() {
    const { user } = useAuth();
    const companyId = user?.id ?? null;

    // empresa
    const [lat, setLat] = useState<string>('');
    const [lng, setLng] = useState<string>('');
    const [tz, setTz] = useState<string>('America/Sao_Paulo');

    // zonas
    const [zones, setZones] = useState<Zone[]>([]);
    const [zMin, setZMin] = useState('0');
    const [zMax, setZMax] = useState('');
    const [zFee, setZFee] = useState('');

    // horários
    const [hours, setHours] = useState<Hour[]>([]);
    const [hWeekday, setHWeekday] = useState('1'); // 0=Dom ... 6=Sáb
    const [hOpen, setHOpen] = useState('18:00');
    const [hClose, setHClose] = useState('23:00');

    useEffect(() => {
        if (!companyId) return;

        (async () => {
            // PERFIL
            const { data: profile } = await (supabase as any)
                .from('profiles')
                .select('company_lat, company_lng, timezone')
                .eq('id', companyId)
                .limit(1);

            const p = (profile?.[0] ?? null) as { company_lat?: number; company_lng?: number; timezone?: string } | null;
            setLat(p?.company_lat != null ? String(p.company_lat) : '');
            setLng(p?.company_lng != null ? String(p.company_lng) : '');
            setTz(p?.timezone ?? 'America/Sao_Paulo');

            // ZONAS
            const { data: z } = await (supabase as any)
                .from('delivery_zones')
                .select('id, min_km, max_km, fee')
                .eq('company_id', companyId)
                .order('min_km', { ascending: true });

            setZones(((z ?? []) as any[]).map(r => ({
                id: r.id, min_km: Number(r.min_km), max_km: r.max_km == null ? null : Number(r.max_km), fee: Number(r.fee),
            })) as Zone[]);

            // HORÁRIOS
            const { data: h } = await (supabase as any)
                .from('opening_hours')
                .select('id, weekday, open_time, close_time')
                .eq('company_id', companyId)
                .order('weekday', { ascending: true });

            setHours(((h ?? []) as any[]).map(r => ({
                id: r.id, weekday: Number(r.weekday), open_time: String(r.open_time), close_time: String(r.close_time),
            })) as Hour[]);
        })();
    }, [companyId]);

    async function saveLocation() {
        if (!companyId) return;
        const { error } = await (supabase as any)
            .from('profiles')
            .update({
                company_lat: lat ? Number(lat) : null,
                company_lng: lng ? Number(lng) : null,
                timezone: tz || 'America/Sao_Paulo',
            })
            .eq('id', companyId);
        if (error) return toast.error(error.message);
        toast.success('Local e fuso salvos!');
    }

    async function addZone() {
        if (!companyId) return;
        const payload = {
            company_id: companyId,
            min_km: Number(zMin || 0),
            max_km: zMax ? Number(zMax) : null,
            fee: Number(zFee || 0),
        };
        const { error } = await (supabase as any).from('delivery_zones').insert(payload);
        if (error) return toast.error(error.message);

        setZMin('0'); setZMax(''); setZFee('');
        const { data: z } = await (supabase as any)
            .from('delivery_zones')
            .select('id, min_km, max_km, fee')
            .eq('company_id', companyId)
            .order('min_km', { ascending: true });

        setZones(((z ?? []) as any[]).map(r => ({
            id: r.id, min_km: Number(r.min_km), max_km: r.max_km == null ? null : Number(r.max_km), fee: Number(r.fee),
        })) as Zone[]);
        toast.success('Zona criada!');
    }

    async function delZone(id: string) {
        const { error } = await (supabase as any).from('delivery_zones').delete().eq('id', id);
        if (error) return toast.error(error.message);
        setZones(prev => prev.filter(z => z.id !== id));
    }

    async function addHour() {
        if (!companyId) return;
        const payload = {
            company_id: companyId,
            weekday: Number(hWeekday),
            open_time: hOpen,
            close_time: hClose,
        };
        const { error } = await (supabase as any).from('opening_hours').insert(payload);
        if (error) return toast.error(error.message);

        const { data: h } = await (supabase as any)
            .from('opening_hours')
            .select('id, weekday, open_time, close_time')
            .eq('company_id', companyId)
            .order('weekday', { ascending: true });

        setHours(((h ?? []) as any[]).map(r => ({
            id: r.id, weekday: Number(r.weekday), open_time: String(r.open_time), close_time: String(r.close_time),
        })) as Hour[]);
        toast.success('Horário adicionado!');
    }

    async function delHour(id: string) {
        const { error } = await (supabase as any).from('opening_hours').delete().eq('id', id);
        if (error) return toast.error(error.message);
        setHours(prev => prev.filter(h => h.id !== id));
    }

    if (!companyId) {
        return <div className="container mx-auto p-6">Faça login como empresa para acessar.</div>;
    }

    return (
        <div>
            <AdminNavbar />
            <main className="container mx-auto px-4 py-6 space-y-8">
                {/* Local e fuso */}
                <section className="rounded-xl border p-4">
                    <h2 className="text-xl font-semibold mb-3">Local da Empresa</h2>
                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                        <div>
                            <Label>Latitude</Label>
                            <Input value={lat} onChange={e => setLat(e.target.value)} placeholder="-23.55" />
                        </div>
                        <div>
                            <Label>Longitude</Label>
                            <Input value={lng} onChange={e => setLng(e.target.value)} placeholder="-46.63" />
                        </div>
                        <div>
                            <Label>Fuso horário (IANA)</Label>
                            <Input value={tz} onChange={e => setTz(e.target.value)} placeholder="America/Sao_Paulo" />
                        </div>
                    </div>
                    <Button className="mt-3" onClick={saveLocation}>Salvar</Button>
                </section>

                {/* Zonas de entrega */}
                <section className="rounded-xl border p-4">
                    <h2 className="text-xl font-semibold mb-3">Zonas de Entrega</h2>
                    <div className="grid grid-cols-1 sm:grid-cols-4 gap-3">
                        <div>
                            <Label>De (km)</Label>
                            <Input value={zMin} onChange={e => setZMin(e.target.value)} />
                        </div>
                        <div>
                            <Label>Até (km)</Label>
                            <Input value={zMax} onChange={e => setZMax(e.target.value)} placeholder="vazio = sem limite" />
                        </div>
                        <div>
                            <Label>Taxa (R$)</Label>
                            <Input value={zFee} onChange={e => setZFee(e.target.value)} />
                        </div>
                        <div className="flex items-end">
                            <Button onClick={addZone}>Adicionar</Button>
                        </div>
                    </div>

                    <ul className="mt-4 space-y-2">
                        {zones.map(z => (
                            <li key={z.id} className="flex items-center justify-between rounded border p-2">
                                <span>{z.min_km} km — {z.max_km ?? '∞'} km · R$ {z.fee.toFixed(2).replace('.', ',')}</span>
                                <Button size="sm" variant="destructive" onClick={() => delZone(z.id)}>Excluir</Button>
                            </li>
                        ))}
                    </ul>
                </section>

                {/* Horários */}
                <section className="rounded-xl border p-4">
                    <h2 className="text-xl font-semibold mb-3">Horários de Funcionamento</h2>
                    <div className="grid grid-cols-1 sm:grid-cols-4 gap-3">
                        <div>
                            <Label>Dia</Label>
                            <select
                                className="w-full rounded border px-3 py-2"
                                value={hWeekday}
                                onChange={e => setHWeekday(e.target.value)}
                            >
                                <option value="0">Domingo</option>
                                <option value="1">Segunda</option>
                                <option value="2">Terça</option>
                                <option value="3">Quarta</option>
                                <option value="4">Quinta</option>
                                <option value="5">Sexta</option>
                                <option value="6">Sábado</option>
                            </select>
                        </div>
                        <div>
                            <Label>Abre</Label>
                            <Input type="time" value={hOpen} onChange={e => setHOpen(e.target.value)} />
                        </div>
                        <div>
                            <Label>Fecha</Label>
                            <Input type="time" value={hClose} onChange={e => setHClose(e.target.value)} />
                        </div>
                        <div className="flex items-end">
                            <Button onClick={addHour}>Adicionar</Button>
                        </div>
                    </div>

                    <ul className="mt-4 space-y-2">
                        {hours.map(h => (
                            <li key={h.id} className="flex items-center justify-between rounded border p-2">
                                <span>{['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'][h.weekday]} · {h.open_time}–{h.close_time}</span>
                                <Button size="sm" variant="destructive" onClick={() => delHour(h.id)}>Excluir</Button>
                            </li>
                        ))}
                    </ul>
                </section>
            </main>
        </div>
    );
}
