# do arquivo pessoa estamos importando a classe Pessoa
from pessoa import Pessoa
# do arqivo cargo estamos importando a classe Cargo
from cargo import Cargo

class Funcionario(Pessoa):
	def __init__(self, nome, idade, telefone, rg, cidade, codigo, senha, cargo):
		super().__init__(nome, idade, telefone, rg, cidade)
		self.codigo = codigo
		self.senha = senha
		self.cargo = cargo # Recebendo o objeto cargo da classe Cargo
	
	def mostrar_cargo(self):
		self.cargo.detalhes()
