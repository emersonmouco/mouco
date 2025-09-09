import { Product } from '@/models/Product';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Clock, Plus } from 'lucide-react';
import { useCart } from '@/hooks/useCart';
import { toast } from 'sonner';

interface ProductCardProps {
  product: Product;
}

export function ProductCard({ product }: ProductCardProps) {
  const { addToCart } = useCart();

  const handleAddToCart = () => {
    addToCart(product);
    toast.success(`${product.name} adicionado ao carrinho!`);
  };

  return (
    <div className="bg-card rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300 group">
      <div className="relative aspect-[4/3] overflow-hidden bg-muted">
        <img 
          src={product.image} 
          alt={product.name}
          className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
        />
        {product.tags && product.tags.length > 0 && (
          <div className="absolute top-2 left-2 flex gap-1">
            {product.tags.map(tag => (
              <Badge key={tag} variant="secondary" className="bg-primary/90 text-primary-foreground">
                {tag}
              </Badge>
            ))}
          </div>
        )}
      </div>
      
      <div className="p-4">
        <h3 className="font-bold text-lg text-foreground mb-2">{product.name}</h3>
        <p className="text-muted-foreground text-sm mb-3 line-clamp-2">
          {product.description}
        </p>
        
        <div className="flex items-center gap-2 mb-4">
          {product.preparationTime > 0 && (
            <div className="flex items-center gap-1 text-muted-foreground text-sm">
              <Clock className="w-4 h-4" />
              <span>{product.preparationTime} min</span>
            </div>
          )}
        </div>
        
        <div className="flex items-center justify-between">
          <span className="text-2xl font-bold text-primary">
            R$ {product.price.toFixed(2).replace('.', ',')}
          </span>
          <Button
            onClick={handleAddToCart}
            disabled={!product.available}
            className="bg-primary hover:bg-primary-glow text-primary-foreground"
            size="sm"
          >
            <Plus className="w-4 h-4 mr-1" />
            Adicionar
          </Button>
        </div>
      </div>
    </div>
  );
}