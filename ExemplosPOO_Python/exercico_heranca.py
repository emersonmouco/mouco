# criar uma classe principal (ou super classe)
# chamada Pessoa com os atributos: nome, sobrenome, cpf
# classe Pessoa deve conter dois métodos: cadastrar e excluir, mas que nao fazem nada
# criar duas classes que herdam: cliente e funcionario
# cliente com os atributos: login e senha
# funcionario com os atributos: codigo e salario

class Pessoa():
    def __init__(self, nome, sobrenome, cpf):
        self.nome = nome
        self.sobrenome = sobrenome
        self.cpf = cpf
        
    def cadastrar(self):
        pass
    
    def excluir(self):
        pass

class Cliente(Pessoa):
    def __init__(self, nome, sobrenome, cpf, login, senha):
        
        super().__init__(nome, sobrenome, cpf)
        
        self.login = login
        self.senha = senha
    
    def cadastrar(self):
        print("O cliente está sendo cadastrado!")

class Funcionario(Pessoa):
    def __init__(self, nome, sobrenome, cpf, codigo, salario):
        
        super().__init__(nome, sobrenome, cpf)
        
        self.codigo = codigo
        self.salario = salario
    
    def cadastrar(self):
        print("O funcionário está sendo cadastrado!")

cliente = Cliente('Emerson','Mouco', '123456', 'emersonmouco','123')
funcionario = Funcionario('Prof Emerson', 'Mouco', '123456', 123, 123.45)

print(cliente.nome, cliente.sobrenome, cliente.cpf, cliente.login, cliente.senha)
print("---------")
print(funcionario.nome, funcionario.sobrenome, funcionario.cpf, funcionario.codigo, funcionario.salario)













        
        
        
        
        
        
        
        
        