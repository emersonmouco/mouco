import { CartItem, Product } from '@/models/Product';

export class CartController {
  private cart: CartItem[] = [];
  private listeners: Set<() => void> = new Set();

  constructor() {
    this.loadFromStorage();
  }

  private loadFromStorage(): void {
    const stored = localStorage.getItem('cart');
    if (stored) {
      try {
        this.cart = JSON.parse(stored);
      } catch (error) {
        console.error('Failed to load cart from storage:', error);
        this.cart = [];
      }
    }
  }

  private saveToStorage(): void {
    localStorage.setItem('cart', JSON.stringify(this.cart));
  }

  private notifyListeners(): void {
    this.listeners.forEach(listener => listener());
  }

  subscribe(listener: () => void): () => void {
    this.listeners.add(listener);
    return () => this.listeners.delete(listener);
  }

  addItem(product: Product, quantity: number = 1, observations?: string): void {
    const existingIndex = this.cart.findIndex(item => item.product.id === product.id);
    
    if (existingIndex >= 0) {
      this.cart[existingIndex].quantity += quantity;
      if (observations) {
        this.cart[existingIndex].observations = observations;
      }
    } else {
      this.cart.push({ product, quantity, observations });
    }
    
    this.saveToStorage();
    this.notifyListeners();
  }

  removeItem(productId: string): void {
    this.cart = this.cart.filter(item => item.product.id !== productId);
    this.saveToStorage();
    this.notifyListeners();
  }

  updateQuantity(productId: string, quantity: number): void {
    const item = this.cart.find(item => item.product.id === productId);
    if (item) {
      if (quantity <= 0) {
        this.removeItem(productId);
      } else {
        item.quantity = quantity;
        this.saveToStorage();
        this.notifyListeners();
      }
    }
  }

  clearCart(): void {
    this.cart = [];
    this.saveToStorage();
    this.notifyListeners();
  }

  getCart(): CartItem[] {
    return [...this.cart];
  }

  getTotal(): number {
    return this.cart.reduce((total, item) => total + (item.product.price * item.quantity), 0);
  }

  getItemCount(): number {
    return this.cart.reduce((count, item) => count + item.quantity, 0);
  }
}

export const cartController = new CartController();