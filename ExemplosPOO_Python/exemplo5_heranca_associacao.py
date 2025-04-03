#  Relações entre as classes: associação, agregação e composição

# Associação: é um tipo de relacionamento onde os objetos
# estão ligados dentro do sistema. Essa relação é mais comum
# entre objetos e subconjuntos, como agregação e composição.

# Geralmente, temos a associação de um objeto quando existe um atributo
# que referencie este objeto. A associação não especifica como um objeto
# controla o ciclo de vida do outro.

class Escritor:
    def __init__(self, nome) -> None:
        self.nome = nome
        self._ferramenta = None

        @property
        def ferramenta(self):
            return self._ferramenta
        
        @ferramenta.setter
        def ferramenta(self, ferramenta):
            self._ferramenta = ferramenta 
            # um ´underline´ -> protected, dois ´underline´ -> private

class FerramentaDeEscrever:
    def __init__(self, nome):
        self.nome = nome
    
    def escrever(self):
        return f'{self.nome} está escrevendo!'


escritor = Escritor('Luiz')
caneta = FerramentaDeEscrever('Caneta Bic')
maquinaDeEscrever = FerramentaDeEscrever('Máquina')
escritor.ferramenta = maquinaDeEscrever

print(caneta.escrever())
print(maquinaDeEscrever.escrever())
print(escritor.ferramenta.escrever())