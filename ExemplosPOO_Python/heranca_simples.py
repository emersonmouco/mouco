
# vantagens da heranca
# reutilizacao de codigo em classes que possuem atributos iguais

class Veiculo:
    def __init__(self):
        print("Iniciando a classe Veículo!")
    
    def metodo_iniciando(self):
        print("Chamando o método iniciando!")
        
# classe carro herdando métodos, atributos etc de Veiculo
class Carro(Veiculo):
    # criando um novo método dentro da classe carro
    def acelerar(self):
        print("Carro acelerando!")

carro = Carro()
carro.metodo_iniciando()
carro.acelerar()






