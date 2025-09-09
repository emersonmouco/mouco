import React from 'react';
import { Button } from '@/components/ui/button';
import { Separator } from '@/components/ui/separator';
import { Trash2, Plus, Minus } from 'lucide-react';
import { useCart } from '@/hooks/useCart';

type Props = { onCheckout: () => void };

/** Normaliza um item do carrinho (independente do formato do hook) */
function normalizeItem(raw: any) {
  const product = raw?.product ?? raw ?? {};
  const id = product.id ?? raw?.id;
  const name = product.name ?? raw?.name ?? 'Produto';
  const price = Number(product.price ?? raw?.price ?? 0);
  const image =
    product.image ?? product.image_url ?? raw?.image ?? '/placeholder.png';
  const quantity = Number(raw?.quantity ?? raw?.qty ?? 1);

  return { id, name, price: isFinite(price) ? price : 0, image, quantity, product, raw };
}

/** Escolhe a função disponível no hook e informa se ela espera ID ou PRODUTO */
function pickFn(cartApi: any, candidates: Array<{ name: string; expects: 'id' | 'product' }>) {
  for (const c of candidates) {
    const fn = cartApi?.[c.name];
    if (typeof fn === 'function') return { fn, expects: c.expects };
  }
  return { fn: undefined, expects: 'id' as const };
}

export function Cart({ onCheckout }: Props) {
  const cartApi = useCart() as any;

  // lista de itens tolerante a diferentes nomes
  const items: any[] = Array.isArray(cartApi?.cart)
    ? cartApi.cart
    : Array.isArray(cartApi?.items)
      ? cartApi.items
      : [];

  const norm = items.map(normalizeItem);

  // total SEM depender do hook (evita NaN)
  const total = norm.reduce(
    (sum, it) => sum + (isFinite(it.price) ? it.price : 0) * (isFinite(it.quantity) ? it.quantity : 0),
    0
  );

  // ações
  const incChooser = pickFn(cartApi, [
    { name: 'increment', expects: 'id' },
    { name: 'increase', expects: 'id' },
    { name: 'increaseItem', expects: 'id' },
    { name: 'addItem', expects: 'product' },
    { name: 'addToCart', expects: 'product' },
    { name: 'add', expects: 'product' },
  ]);

  const decChooser = pickFn(cartApi, [
    { name: 'decrement', expects: 'id' },
    { name: 'decrease', expects: 'id' },
    { name: 'decreaseItem', expects: 'id' },
    { name: 'removeOne', expects: 'id' },
    { name: 'subtract', expects: 'id' },
  ]);

  const removeChooser = pickFn(cartApi, [
    { name: 'removeItem', expects: 'id' },
    { name: 'removeFromCart', expects: 'id' },
    { name: 'deleteItem', expects: 'id' },
    { name: 'delete', expects: 'id' },
    { name: 'clearItem', expects: 'id' },
  ]);

  const clearAll =
    cartApi?.clearCart ??
    cartApi?.clear ??
    cartApi?.reset ??
    (() => { });

  const handleInc = (it: ReturnType<typeof normalizeItem>) => {
    const { fn, expects } = incChooser;
    if (!fn) return;
    expects === 'product' ? fn(it.product) : fn(it.id);
  };

  const handleDec = (it: ReturnType<typeof normalizeItem>) => {
    // Se a quantidade atual é 1, ao “−” o item deve sair do carrinho
    if (it.quantity <= 1) {
      // tenta remover pelo(s) nome(s) conhecido(s)
      const removeFn =
        removeChooser?.fn ||
        cartApi?.removeItem ||
        cartApi?.removeFromCart ||
        cartApi?.deleteItem ||
        cartApi?.delete ||
        cartApi?.clearItem;

      if (typeof removeFn === 'function') {
        removeFn(it.id);
        return;
      }

      // fallback: se não houver remove, zera a quantidade
      if (typeof cartApi?.setQuantity === 'function') return cartApi.setQuantity(it.id, 0);
      if (typeof cartApi?.updateQuantity === 'function') return cartApi.updateQuantity(it.id, 0);
      if (typeof cartApi?.updateItem === 'function') return cartApi.updateItem(it.id, { quantity: 0 });
      return;
    }

    // Tenta a função "decrement/decrease…" que seu hook expõe
    try {
      const { fn, expects } = decChooser || ({} as any);
      if (typeof fn === 'function') {
        expects === 'product' ? fn(it.product) : fn(it.id);
        return;
      }
    } catch {
      /* continua para fallback */
    }

    // Fallback: atualiza quantidade manualmente (qty - 1)
    if (typeof cartApi?.setQuantity === 'function') return cartApi.setQuantity(it.id, it.quantity - 1);
    if (typeof cartApi?.updateQuantity === 'function') return cartApi.updateQuantity(it.id, it.quantity - 1);
    if (typeof cartApi?.updateItem === 'function') return cartApi.updateItem(it.id, { quantity: it.quantity - 1 });
  };

  const handleRemove = (it: ReturnType<typeof normalizeItem>) => {
    const { fn } = removeChooser;
    if (!fn) return;
    fn(it.id);
  };

  const hasItems = norm.length > 0;

  return (
    <div className="h-full flex flex-col">
      <div className="flex items-center justify-between mb-2">
        <div className="text-lg font-semibold">Seu carrinho</div>
        {hasItems && (
          <Button variant="ghost" size="sm" onClick={clearAll}>
            Esvaziar
          </Button>
        )}
      </div>

      {!hasItems ? (
        <div className="flex-1 grid place-items-center text-muted-foreground">
          Seu carrinho está vazio.
        </div>
      ) : (
        <>
          <div className="flex-1 overflow-auto space-y-4 pr-1">
            {norm.map((it) => (
              <div key={String(it.id)} className="flex gap-3">
                <img
                  src={it.image}
                  alt={it.name}
                  className="w-16 h-16 rounded object-cover bg-muted"
                />
                <div className="flex-1">
                  <div className="flex items-start justify-between gap-3">
                    <div>
                      <div className="font-medium leading-tight">{it.name}</div>
                      <div className="text-sm text-muted-foreground">
                        R$ {it.price.toFixed(2).replace('.', ',')}
                      </div>
                    </div>
                    <Button
                      variant="ghost"
                      size="icon"
                      onClick={() => handleRemove(it)}
                      aria-label="Remover"
                    >
                      <Trash2 className="w-4 h-4" />
                    </Button>
                  </div>

                  <div className="mt-2 flex items-center gap-2">
                    <Button
                      type="button"
                      size="sm"
                      variant="outline"
                      onClick={() => handleDec(it)}
                      aria-label="Diminuir"
                    >
                      <Minus className="w-4 h-4" />
                    </Button>
                    <span className="min-w-[2ch] text-center">{it.quantity}</span>
                    <Button
                      type="button"
                      size="sm"
                      variant="outline"
                      onClick={() => handleInc(it)}
                      aria-label="Aumentar"
                    >
                      <Plus className="w-4 h-4" />
                    </Button>
                  </div>
                </div>
              </div>
            ))}
          </div>

          <Separator className="my-3" />

          <div className="flex items-center justify-between">
            <div className="text-lg font-semibold">Total</div>
            <div className="text-lg font-bold">
              R$ {total.toFixed(2).replace('.', ',')}
            </div>
          </div>

          <Button className="mt-3 w-full" onClick={onCheckout}>
            Finalizar pedido
          </Button>
        </>
      )}
    </div>
  );
}

export default Cart;
