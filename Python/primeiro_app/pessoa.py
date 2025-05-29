class Pessoa:
    def __init__(self, id, nome, rg, cpf, idade, endereco, telefone):
        self.id = id
        self.nome = nome
        self.rg = rg
        self.cpf = cpf
        self.idade = idade
        self.endereco = endereco
        self.telefone = telefone
    
    def apresentar(self):
        return f"Nome: {self.nome}, idade: {self.idade}, telefone: {self.telefone}"
        
        