import { useState } from 'react';
import { useCart } from '@/hooks/useCart';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription } from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group';
import { Separator } from '@/components/ui/separator';
import { CreditCard, DollarSign, QrCode, CheckCircle } from 'lucide-react';
import { toast } from 'sonner';
import { useAuth } from '@/hooks/useAuth';
import { supabase } from '@/integrations/supabase/client';

interface CheckoutModalProps {
  isOpen: boolean;
  onClose: () => void;
}

type ViaCep = {
  cep: string; logradouro: string; bairro: string; localidade: string; uf: string; erro?: boolean;
};

async function fetchViaCep(cep: string): Promise<ViaCep | null> {
  const clean = cep.replace(/\D/g, '');
  if (clean.length !== 8) return null;
  const res = await fetch(`https://viacep.com.br/ws/${clean}/json/`);
  if (!res.ok) return null;
  const data = await res.json();
  if (data.erro) return null;
  return data as ViaCep;
}

async function geocodeFromParts(
  street: string,
  number: string,
  neighborhood: string,
  city: string,
  state: string,
  cep: string
): Promise<{ lat: number; lng: number } | null> {
  const cepDigits = (cep || '').replace(/\D/g, '');

  // 1) Query estruturada (street/city/state/postalcode) — melhor precisão
  const url1 = new URL('https://nominatim.openstreetmap.org/search');
  url1.searchParams.set('format', 'json');
  url1.searchParams.set('limit', '1');
  url1.searchParams.set('addressdetails', '1');
  if (street || number) url1.searchParams.set('street', `${street} ${number}`.trim());
  if (city) url1.searchParams.set('city', city);
  if (state) url1.searchParams.set('state', state);
  url1.searchParams.set('country', 'Brazil');
  if (cepDigits.length === 8) url1.searchParams.set('postalcode', cepDigits);

  // 2) Texto livre com número
  const free1 = `https://nominatim.openstreetmap.org/search?format=json&limit=1&addressdetails=1&q=${encodeURIComponent(
    `${street} ${number}, ${neighborhood}, ${city} - ${state}, ${cep} , Brasil`
  )}`;

  // 3) Texto livre sem número
  const free2 = `https://nominatim.openstreetmap.org/search?format=json&limit=1&addressdetails=1&q=${encodeURIComponent(
    `${street}, ${neighborhood}, ${city} - ${state}, ${cep} , Brasil`
  )}`;

  // 4) Somente CEP (fallback)
  const free3 = `https://nominatim.openstreetmap.org/search?format=json&limit=1&addressdetails=1&q=${encodeURIComponent(
    `${cepDigits}, Brasil`
  )}`;

  const candidates = [url1.toString(), free1, free2, free3];

  for (const url of candidates) {
    try {
      const res = await fetch(url, { headers: { 'Accept-Language': 'pt-BR' } });
      if (!res.ok) continue;
      const arr = await res.json();
      if (Array.isArray(arr) && arr.length > 0 && arr[0]?.lat && arr[0]?.lon) {
        const lat = Number(arr[0].lat), lng = Number(arr[0].lon);
        if (isFinite(lat) && isFinite(lng)) return { lat, lng };
      }
    } catch {
      // tenta o próximo formato
    }
  }
  return null;
}


export function CheckoutModal({ isOpen, onClose }: CheckoutModalProps) {
  const { cart, total, clearCart, itemCount } = useCart();
  const { user } = useAuth();
  const [orderPlaced, setOrderPlaced] = useState(false);

  const [form, setForm] = useState({
    name: '',
    phone: '',
    cep: '',
    street: '',
    number: '',
    neighborhood: '',
    city: '',
    state: '',
    paymentMethod: 'card',
  });

  const [geo, setGeo] = useState<{ lat: number | null; lng: number | null }>({ lat: null, lng: null });
  const [deliveryFee, setDeliveryFee] = useState<number | null>(null);
  const finalTotal = Number(total) + Number(deliveryFee ?? 0);

  function formatCep(v: string) {
    const s = v.replace(/\D/g, '').slice(0, 8);
    return s.length > 5 ? `${s.slice(0, 5)}-${s.slice(5)}` : s;
  }

  async function handleCepBlur() {
    const data = await fetchViaCep(form.cep);
    if (!data) return;
    setForm(f => ({
      ...f,
      street: f.street || data.logradouro || '',
      neighborhood: f.neighborhood || data.bairro || '',
      city: f.city || data.localidade || '',
      state: f.state || data.uf || '',
    }));
  }

  async function computeDelivery(companyId: string) {
    // monta o endereço a partir do formulário
    const pos =
      (await geocodeFromParts(
        form.street,
        form.number,
        form.neighborhood,
        form.city,
        form.state,
        form.cep
      )) || null;

    if (!pos) {
      // aqui era onde aparecia seu erro
      toast.error('Não foi possível localizar seu endereço. Verifique o número e o CEP.');
      return null;
    }
    setGeo({ lat: pos.lat, lng: pos.lng });

    // chama a RPC para calcular a taxa com base nas zonas
    const { data, error } = await (supabase as any).rpc('calculate_delivery_fee', {
      p_company_id: companyId,
      p_lat: pos.lat,
      p_lng: pos.lng,
    });

    if (error) {
      toast.error(error.message);
      return null;
    }
    if (data == null) {
      toast.error('Endereço fora da área de entrega desta empresa.');
      return null;
    }

    setDeliveryFee(Number(data));
    return Number(data);
  }


  async function checkOpen(companyId: string) {
    const { data, error } = await (supabase as any).rpc('is_company_open', {
      p_company_id: companyId,
    });
    if (error) {
      toast.error(error.message);
      return false;
    }
    return !!data;
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!form.name || !form.phone || !form.street || !form.number || !form.city || !form.state || !form.cep) {
      toast.error('Preencha todos os campos de entrega');
      return;
    }
    if (!user) {
      toast.error('Você precisa estar logado para finalizar o pedido');
      return;
    }
    if (!cart?.length) {
      toast.error('Seu carrinho está vazio');
      return;
    }

    // mesma empresa
    const companyIds = Array.from(new Set(cart.map(i => i.product.company_id)));
    if (companyIds.length !== 1 || !companyIds[0]) {
      toast.error('Carrinho tem itens de empresas diferentes');
      return;
    }
    const companyId = companyIds[0] as string;

    // aberto?
    const open = await checkOpen(companyId);
    if (!open) {
      toast.error('A empresa está fechada no momento 😕');
      return;
    }

    // taxa dinâmica
    const fee = await computeDelivery(companyId);
    if (fee == null) return;

    // itens
    const items = cart.map(i => ({
      product_id: i.product.id,
      name: i.product.name,
      price: Number(i.product.price),
      quantity: i.quantity,
    }));

    const deliveryAddress = `${form.street}, ${form.number} - ${form.neighborhood}, ${form.city} - ${form.state}, ${form.cep}`;

    const { error } = await supabase.from('orders').insert({
      customer_id: user.id,
      company_id: companyId,
      items,
      total: Number((Number(total) + fee).toFixed(2)),
      delivery_fee: fee,
      delivery_address: deliveryAddress,
      delivery_cep: form.cep,
      delivery_lat: geo.lat,
      delivery_lng: geo.lng,
      payment_method: form.paymentMethod as any,
      status: 'pending',
    });

    if (error) {
      toast.error(`Erro ao criar pedido: ${error.message}`);
      return;
    }

    setOrderPlaced(true);
    toast.success('Pedido realizado com sucesso!');
    setTimeout(() => {
      clearCart();
      onClose();
      setOrderPlaced(false);
      setForm({
        name: '', phone: '', cep: '', street: '', number: '',
        neighborhood: '', city: '', state: '', paymentMethod: 'card'
      });
      setGeo({ lat: null, lng: null });
      setDeliveryFee(null);
    }, 2000);
  };

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-[520px]">
        {!orderPlaced ? (
          <>
            <DialogHeader>
              <DialogTitle>Finalizar Pedido</DialogTitle>
              <DialogDescription>Informe seus dados e endereço para calcular a entrega</DialogDescription>
            </DialogHeader>

            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="name">Nome completo</Label>
                <Input id="name" value={form.name} onChange={e => setForm({ ...form, name: e.target.value })} required />
              </div>

              <div className="space-y-2">
                <Label htmlFor="phone">Telefone</Label>
                <Input id="phone" value={form.phone} onChange={e => setForm({ ...form, phone: e.target.value })} required />
              </div>

              <Separator />

              <div className="grid grid-cols-3 gap-3">
                <div className="col-span-3 sm:col-span-1">
                  <Label htmlFor="cep">CEP</Label>
                  <Input
                    id="cep"
                    value={form.cep}
                    onChange={e => setForm({ ...form, cep: formatCep(e.target.value) })}
                    onBlur={handleCepBlur}
                    placeholder="00000-000"
                    required
                  />
                </div>
                <div className="col-span-3 sm:col-span-2">
                  <Label htmlFor="street">Rua</Label>
                  <Input id="street" value={form.street} onChange={e => setForm({ ...form, street: e.target.value })} required />
                </div>
                <div className="col-span-3 sm:col-span-1">
                  <Label htmlFor="number">Número</Label>
                  <Input id="number" value={form.number} onChange={e => setForm({ ...form, number: e.target.value })} required />
                </div>
                <div className="col-span-3 sm:col-span-2">
                  <Label htmlFor="neighborhood">Bairro</Label>
                  <Input id="neighborhood" value={form.neighborhood} onChange={e => setForm({ ...form, neighborhood: e.target.value })} />
                </div>
                <div className="col-span-3 sm:col-span-2">
                  <Label htmlFor="city">Cidade</Label>
                  <Input id="city" value={form.city} onChange={e => setForm({ ...form, city: e.target.value })} required />
                </div>
                <div className="col-span-3 sm:col-span-1">
                  <Label htmlFor="state">UF</Label>
                  <Input id="state" value={form.state} onChange={e => setForm({ ...form, state: e.target.value.toUpperCase() })} required />
                </div>
              </div>

              <div className="space-y-2">
                <Label>Forma de pagamento</Label>
                <RadioGroup value={form.paymentMethod} onValueChange={(v) => setForm(f => ({ ...f, paymentMethod: v }))}>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="card" id="card" />
                    <Label htmlFor="card" className="flex items-center gap-2 cursor-pointer"><CreditCard className="w-4 h-4" /> Cartão</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="cash" id="cash" />
                    <Label htmlFor="cash" className="flex items-center gap-2 cursor-pointer"><DollarSign className="w-4 h-4" /> Dinheiro</Label>
                  </div>
                  <div className="flex items-center space-x-2">
                    <RadioGroupItem value="pix" id="pix" />
                    <Label htmlFor="pix" className="flex items-center gap-2 cursor-pointer"><QrCode className="w-4 h-4" /> PIX</Label>
                  </div>
                </RadioGroup>
              </div>

              <Separator />

              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span>Subtotal ({itemCount} itens)</span>
                  <span>R$ {Number(total).toFixed(2).replace('.', ',')}</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span>Entrega</span>
                  <span>{deliveryFee == null ? '—' : `R$ ${deliveryFee.toFixed(2).replace('.', ',')}`}</span>
                </div>
                <Separator />
                <div className="flex justify-between font-bold text-lg">
                  <span>Total</span>
                  <span className="text-primary">R$ {finalTotal.toFixed(2).replace('.', ',')}</span>
                </div>
              </div>

              <Button type="submit" className="w-full">Confirmar Pedido</Button>
            </form>
          </>
        ) : (
          <div className="flex flex-col items-center justify-center py-8">
            <CheckCircle className="w-24 h-24 text-green-600 mb-4" />
            <h3 className="text-2xl font-bold mb-2">Pedido Confirmado!</h3>
            <p className="text-muted-foreground text-center">
              Seu pedido foi recebido e está sendo preparado.
            </p>
          </div>
        )}
      </DialogContent>
    </Dialog>
  );
}
