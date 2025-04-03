# Composição é uma especialização da associação
# No entanto, quando o objeto "pai" é apagado, 
# todas as referências do objeto filho, também 
# são apagadas

class Cliente:
    def __init__(self, nome):
        self.nome = nome
        self.enderecos = []
    
    def inserir_endereco(self, rua, numero):
        self.enderecos.append(Endereco(rua, numero))

    def inserir_endereco_externo(self, endereco):
        self.enderecos.append(endereco)
    
    def listar_endereco(self):
        for endereco in self.enderecos:
            print(endereco.rua, endereco.numero)

    def __del__(self):
        print('Apagando endereço!', self.nome)

class Endereco:
    def __init__(self, rua, numero):
        self.rua = rua
        self.numero = numero
    
    def __del__(self):
        print('Apagando endereço!', self.rua, self.numero)

cliente = Cliente('Kenzo')
cliente.inserir_endereco('Av Brasil', 54)
cliente.inserir_endereco('Rua Um', 1234)

endereco_externo = Endereco('Av da Saudade', 4321)
cliente.inserir_endereco_externo(endereco_externo)
cliente.listar_endereco()

print(endereco_externo.rua, endereco_externo.numero)

del cliente

# print(cliente)