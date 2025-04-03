# Criando uma super-classe/classe mãe
class Animal: 
    
    def __init__(self):
        print("Animal criado.")
    
    def imprimir(self):
        print("Este é um animal.")
    
    def comer(self):
        print("Hora de comer.")
        
    def emitir_som(self):
        pass

# classe cachorro sub-classe
# lembrando que a classe Animal dentro dos parenteses 
# indica que a classe cachorro está Herdando os atributos e métodos de Animal
class Cachorro(Animal):
    
    def __init__(self):
        Animal.__init__(self)
        print("O objeto cachorro foi criado.")
        
    def emitir_som(self):
        print("Au au!")
        
class Gato(Animal):
    
    def __init__(self):
        Animal.__init__(self)
        print("O objeto gato foi criado.")
    
    def emitir_som(self):
        print("Miau!")

# criando o objeto das classes
# instanciando elas

cachorro = Cachorro()

gato = Gato()

cachorro.emitir_som()
gato.emitir_som()

cachorro.comer()
gato.comer()