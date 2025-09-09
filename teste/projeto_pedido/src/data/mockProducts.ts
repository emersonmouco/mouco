import { Product } from '@/models/Product';
import pizzaHero from '@/assets/pizza-hero.jpg';
import burgerImage from '@/assets/burger-image.jpg';

export const mockProducts: Product[] = [
  // Pizzas
  {
    id: '1',
    name: 'Pizza Margherita',
    description: 'Molho de tomate, mussarela fresca, manjericão e azeite de oliva',
    price: 45.90,
    image: pizzaHero,
    category: 'pizza',
    available: true,
    preparationTime: 30,
    tags: ['vegetariana', 'tradicional']
  },
  {
    id: '2',
    name: 'Pizza Pepperoni',
    description: 'Molho de tomate, mussarela e fatias generosas de pepperoni',
    price: 52.90,
    image: pizzaHero,
    category: 'pizza',
    available: true,
    preparationTime: 30,
    tags: ['picante']
  },
  {
    id: '3',
    name: 'Pizza Quatro Queijos',
    description: 'Mussarela, provolone, parmesão e gorgonzola',
    price: 56.90,
    image: pizzaHero,
    category: 'pizza',
    available: true,
    preparationTime: 30,
    tags: ['vegetariana']
  },
  {
    id: '4',
    name: 'Pizza Calabresa',
    description: 'Molho de tomate, mussarela, calabresa fatiada e cebola',
    price: 48.90,
    image: pizzaHero,
    category: 'pizza',
    available: true,
    preparationTime: 30,
    tags: ['tradicional']
  },
  // Burgers
  {
    id: '5',
    name: 'Classic Burger',
    description: 'Hambúrguer 180g, queijo cheddar, alface, tomate e molho especial',
    price: 28.90,
    image: burgerImage,
    category: 'burger',
    available: true,
    preparationTime: 15,
    tags: ['clássico']
  },
  {
    id: '6',
    name: 'Bacon Burger',
    description: 'Hambúrguer 180g, queijo, bacon crocante, cebola caramelizada',
    price: 34.90,
    image: burgerImage,
    category: 'burger',
    available: true,
    preparationTime: 15,
    tags: ['bacon']
  },
  {
    id: '7',
    name: 'Veggie Burger',
    description: 'Hambúrguer de grão-de-bico, queijo, rúcula e tomate seco',
    price: 26.90,
    image: burgerImage,
    category: 'burger',
    available: true,
    preparationTime: 15,
    tags: ['vegetariano']
  },
  // Drinks
  {
    id: '8',
    name: 'Coca-Cola 350ml',
    description: 'Refrigerante gelado',
    price: 6.90,
    image: pizzaHero,
    category: 'drink',
    available: true,
    preparationTime: 0,
    tags: ['refrigerante']
  },
  {
    id: '9',
    name: 'Suco Natural Laranja',
    description: 'Suco de laranja natural 500ml',
    price: 12.90,
    image: pizzaHero,
    category: 'drink',
    available: true,
    preparationTime: 5,
    tags: ['natural', 'saudável']
  },
  {
    id: '10',
    name: 'Água Mineral',
    description: 'Água mineral sem gás 500ml',
    price: 4.90,
    image: pizzaHero,
    category: 'drink',
    available: true,
    preparationTime: 0,
    tags: ['água']
  },
  // Desserts
  {
    id: '11',
    name: 'Brownie com Sorvete',
    description: 'Brownie quentinho com bola de sorvete de creme',
    price: 18.90,
    image: burgerImage,
    category: 'dessert',
    available: true,
    preparationTime: 10,
    tags: ['chocolate']
  },
  {
    id: '12',
    name: 'Pudim',
    description: 'Pudim de leite condensado tradicional',
    price: 12.90,
    image: burgerImage,
    category: 'dessert',
    available: true,
    preparationTime: 0,
    tags: ['tradicional']
  }
];