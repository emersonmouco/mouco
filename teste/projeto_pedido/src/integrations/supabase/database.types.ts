// ---- database.types.ts ----
export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: {
          id: string;
          email: string;
          full_name: string | null;
          phone: string | null;
          address: string | null;
          user_type: 'customer' | 'company';
          company_name: string | null;
          company_document: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id: string;
          email: string;
          full_name?: string | null;
          phone?: string | null;
          address?: string | null;
          user_type: 'customer' | 'company';
          company_name?: string | null;
          company_document?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          email?: string;
          full_name?: string | null;
          phone?: string | null;
          address?: string | null;
          user_type?: 'customer' | 'company';
          company_name?: string | null;
          company_document?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Relationships: [];
      };

      products: {
        Row: {
          id: string;
          company_id: string;
          name: string;
          description: string | null;
          price: number;
          category: string;
          image_url: string | null;
          is_available: boolean;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          company_id: string;
          name: string;
          description?: string | null;
          price: number;
          category: string;
          image_url?: string | null;
          is_available?: boolean;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          company_id?: string;
          name?: string;
          description?: string | null;
          price?: number;
          category?: string;
          image_url?: string | null;
          is_available?: boolean;
          created_at?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: 'products_company_id_fkey';
            columns: ['company_id'];
            isOneToOne: false;
            referencedRelation: 'profiles';
            referencedColumns: ['id'];
          }
        ];
      };

      orders: {
        Row: {
          id: string;
          customer_id: string;
          company_id: string;
          items: Json;
          total: number;
          status: 'pending' | 'confirmed' | 'preparing' | 'delivering' | 'delivered' | 'cancelled';
          delivery_address: string;
          payment_method: string;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          customer_id: string;
          company_id: string;
          items: Json;
          total: number;
          status?: 'pending' | 'confirmed' | 'preparing' | 'delivering' | 'delivered' | 'cancelled';
          delivery_address: string;
          payment_method: string;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          customer_id?: string;
          company_id?: string;
          items?: Json;
          total?: number;
          status?: 'pending' | 'confirmed' | 'preparing' | 'delivering' | 'delivered' | 'cancelled';
          delivery_address?: string;
          payment_method?: string;
          created_at?: string;
          updated_at?: string;
        };
        Relationships: [
          {
            foreignKeyName: 'orders_customer_id_fkey';
            columns: ['customer_id'];
            isOneToOne: false;
            referencedRelation: 'profiles';
            referencedColumns: ['id'];
          },
          {
            foreignKeyName: 'orders_company_id_fkey';
            columns: ['company_id'];
            isOneToOne: false;
            referencedRelation: 'profiles';
            referencedColumns: ['id'];
          }
        ];
      };
    };

    Views: {
      [_ in never]: never;
    };

    Functions: {
      [_ in never]: never;
    };

    Enums: {
      order_status: 'pending' | 'confirmed' | 'preparing' | 'delivering' | 'delivered' | 'cancelled';
    };
  };
}

// Helpers opcionais que facilitam a tipagem por tabela:
export type Tables<T extends keyof Database['public']['Tables']> =
  Database['public']['Tables'][T]['Row'];

export type TablesInsert<T extends keyof Database['public']['Tables']> =
  Database['public']['Tables'][T]['Insert'];

export type TablesUpdate<T extends keyof Database['public']['Tables']> =
  Database['public']['Tables'][T]['Update'];
