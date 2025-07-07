from .pessoa import Pessoa
from db import database_manager as db # importando o gerenciador do banco de dados

class Funcionario(Pessoa):
	def __init__(self, id, nome, cpf, endereco, salario, cargo):
		super().__init__(id, nome, cpf, endereco)
		self.salario = salario
		self.cargo = cargo

	def save(self, conn):
		if self.id is None:
			db.cadastrar_funcionario(
				conn, self.nome, self.cpf, self.endereco,
				self.salario, self.cargo				
				)
		else:
			db.alterar_funcionario(
				conn, self.id, self.nome, self.cpf, self.endereco,
				self.salario, self.cargo
				)
	
	def __str__(self):
		return f"{super().__str__()}, Salário: {self.salario}, Nivel: {self.cargo}"		