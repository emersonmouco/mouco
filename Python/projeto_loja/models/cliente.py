from .pessoa import Pessoa
from db import database_manager as db # importando o gerenciador do banco de dados

class Cliente(Pessoa):
	def __init__(self, id, nome, endereco, cpf, email, senha, nivel):
		super().__init__(id, nome, endereco)
		self.cpf = cpf
		self.email = email
		self.senha = senha
		self.nivel = nivel

	# pegando o metodo save da classe principal 
	# para executar
	def save(self, conn):
		# o método irá decidir se salva ou se altera o cliente
		# com base na existencia (alterar) ou nao (criar) de um id
		
		# se nao existir ID ele irá criar
		if self.id is None:
			db.cadastrar_cliente(
				conn, self.nome, self.cpf, self.endereco,
				self.email, self.senha, self.nivel				
				)
		else:
			# caso já exista um ID, ele irá alterar
			db.alterar_cliente(
				conn, self.id, self.nome, self.cpf, self.endereco,
				self.email, self.senha, self.nivel
			)
	
	def __str__(self):
		return f"{super().__str__()}, Email: {self.email}, Nivel: {self.nivel}"