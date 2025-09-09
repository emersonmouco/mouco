export type ProductCategory = 'pizza' | 'burger' | 'drink' | 'dessert';

export interface Product {
  id: string;
  name: string;
  description: string;
  price: number;
  image: string;
  category: ProductCategory;
  available: boolean;
  preparationTime: number; // in minutes
  tags?: string[];
  company_id?: string;
}

export interface CartItem {
  product: Product;
  quantity: number;
  observations?: string;
}

export interface Order {
  id: string;
  items: CartItem[];
  total: number;
  subtotal: number;
  deliveryFee: number;
  customerName: string;
  customerPhone: string;
  deliveryAddress: string;
  paymentMethod: 'cash' | 'card' | 'pix';
  status: 'pending' | 'confirmed' | 'preparing' | 'delivering' | 'delivered';
  createdAt: Date;
  estimatedDelivery: Date;
}