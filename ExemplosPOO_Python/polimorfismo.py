
class Cachorro:
    def falar(self):
        return "Au au!"

class Gato:
    def falar(self):
        return "Miau!"
        

def imitar_animal(animal):
    print(animal.falar())
    
# usando o polimorfismo
imitar_animal(Cachorro())
imitar_animal(Gato())
print("-------------")

# classe "mae"
class Veiculo:
    def __init__(self, marca, modelo):
        self.marca = marca
        self.modelo = modelo
    
    def acelerar(self):
        pass
    
    def frear(self):
        pass

# subclasses - que herdam de Veiculo
class Carro(Veiculo):
    def acelerar(self):
        print("O carro está acelerando!")
    
    def frear(self):
        print("O carro está freando!")


class Moto(Veiculo):
    
    def acelerar(self):
        print("A moto está acelerando!")
    
    def frear(self):
        print("A moto está freando!")
        
        
# lista de veiculos
lista_veiculos = [Carro("Porshe", "911 Turbo"), Moto("Honda", "CB 1000R Black Edition")]

type(lista_veiculos)

# loop - laço de repeticao

for item in lista_veiculos:
    
    
    
    # o metodo acelerar tem comportamento diferente a depender do tipo do objeto
    item.acelerar()
    
    # o metodo frear tem comportamento diferente a depender do tipo de objeto
    item.frear()
    
    print("-------------")
    
    






        
        




        
        
        




