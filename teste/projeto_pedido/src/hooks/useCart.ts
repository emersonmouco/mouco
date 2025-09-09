import { useState, useEffect } from 'react';
import { cartController } from '@/controllers/CartController';
import { Product, CartItem } from '@/models/Product';

export function useCart() {
  const [cart, setCart] = useState<CartItem[]>(cartController.getCart());
  const [itemCount, setItemCount] = useState(cartController.getItemCount());
  const [total, setTotal] = useState(cartController.getTotal());

  useEffect(() => {
    const updateState = () => {
      setCart(cartController.getCart());
      setItemCount(cartController.getItemCount());
      setTotal(cartController.getTotal());
    };

    const unsubscribe = cartController.subscribe(updateState);
    return unsubscribe;
  }, []);

  const addToCart = (product: Product, quantity: number = 1, observations?: string) => {
    cartController.addItem(product, quantity, observations);
  };

  const removeFromCart = (productId: string) => {
    cartController.removeItem(productId);
  };

  const updateQuantity = (productId: string, quantity: number) => {
    cartController.updateQuantity(productId, quantity);
  };

  const clearCart = () => {
    cartController.clearCart();
  };

  return {
    cart,
    itemCount,
    total,
    addToCart,
    removeFromCart,
    updateQuantity,
    clearCart
  };
}