import { ProductCategory } from '@/models/Product';
import { Button } from '@/components/ui/button';
import { Pizza, Beef, Coffee, IceCream } from 'lucide-react';

interface CategoryFilterProps {
  selectedCategory: ProductCategory | 'all';
  onCategoryChange: (category: ProductCategory | 'all') => void;
}

const categories = [
  { id: 'all' as const, label: 'Todos', icon: null },
  { id: 'pizza' as ProductCategory, label: 'Pizzas', icon: Pizza },
  { id: 'burger' as ProductCategory, label: 'Lanches', icon: Beef },
  { id: 'drink' as ProductCategory, label: 'Bebidas', icon: Coffee },
  { id: 'dessert' as ProductCategory, label: 'Sobremesas', icon: IceCream },
];

export function CategoryFilter({ selectedCategory, onCategoryChange }: CategoryFilterProps) {
  return (
    <div className="flex gap-2 overflow-x-auto pb-2 scrollbar-hide">
      {categories.map(({ id, label, icon: Icon }) => (
        <Button
          key={id}
          variant={selectedCategory === id ? 'default' : 'outline'}
          className={selectedCategory === id ? 'bg-primary text-primary-foreground' : ''}
          onClick={() => onCategoryChange(id)}
        >
          {Icon && <Icon className="w-4 h-4 mr-2" />}
          {label}
        </Button>
      ))}
    </div>
  );
}