# Agregação: é a forma mais especializada de associação
# entre dois ou mais objetos. Cada objeto terá seu ciclo de vida independente

# Geralmente a agregação é uma relação de um para muitos (1...N) / (1...*)
# onde um objeto tem um ou muitos objetos associados

# Os objetos podem viver separadamente, mas podem se tratar
# de uma relação em que um objeto precise do outro
# Ex: Um funcionário precisa de um cargo, um produto precisa de uma marca

class Carrinho:
    def __init__(self):
        self._produtos = []
    
    def total(self):
        return sum([p.preco for p in self._produtos])
    
    def inserir_produtos(self, *produtos):
        for produto in produtos:
            self._produtos.append(produto)
    
    def listar_produtos(self):
        print()
        for produto in self._produtos:
            print(produto.nome, produto.preco)
        print()

class Produto:
    def __init__(self, nome, preco):
        self.nome = nome
        self.preco = preco

carrinho = Carrinho()
p1 = Produto('Caneta', 1.20)
p2 = Produto('Camiseta', 20)
carrinho.inserir_produtos(p1, p2)
carrinho.listar_produtos()
print(carrinho.total())