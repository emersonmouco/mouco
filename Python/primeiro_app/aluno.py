from pessoa import Pessoa

class Aluno(Pessoa):
    def __init__(self, id, nome, rg, cpf, idade, endereco, telefone, matricula):
        super().__init__(id, nome, rg, cpf, idade, endereco, telefone)
        self.matricula = matricula
    
    def apresentar(self): # Sobrescreve o método da classe pai
        apresentar = super().apresentar()
        return f"{apresentar}\nSou aluno(a) com matrícula {self.matricula}."

    def estudar(self):
        return f"{self.nome} está estudando."