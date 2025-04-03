"""

Criar uma classe funcionario
com os atributos:
    id, nome, cpf, telefone, cargo (classe separada), setor (classe separada)

Criar uma classe cargo 
com os atributos:
    id, nome

criar uma classe setor
com os atributos:
    id, nome

e relaciona-las 

"""

class Funcionario:
    def __init__(self, id, nome, cpf, telefone):
        self.id = id
        self.nome = nome
        self.cpf = cpf
        self.telefone = telefone
        self.cargo = None
        self.setor = None
    
    @property
    def cargo(self):
        return self._cargo
    
    @cargo.setter
    def cargo(self, valor):
        self._cargo = valor
    
    @property
    def setor(self):
        return self._setor
    
    @setor.setter
    def setor(self, valor):
        self._setor = valor

class Cargo:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

class Setor:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

cargo1 = Cargo(1, 'Professor')
setor1 = Setor(1, 'Tecnologia da Informação')

funcionario = Funcionario(1,'Emerson','12345666','119929292')
funcionario.cargo = cargo1
funcionario.setor = setor1

print(
    'Id: ',funcionario.id,
    '\nNome: ',funcionario.nome,
    '\nCPF: ',funcionario.cpf,
    '\nTel: ',funcionario.telefone,
    '\nCargo:',funcionario.cargo.nome,
    '\nSetor: ',funcionario.setor.nome
)