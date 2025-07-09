from db import database_manager as db # importando o gerenciador do banco de dados

class Marca:
	def __init__(self, id, nome, descricao):
		self.id = id
		self.nome = nome
		self.descricao = descricao
	

	def save(self, conn):
		# o método irá decidir se salva ou se altera o cliente
		# com base na existencia (alterar) ou nao (criar) de um id
		
		# se nao existir ID ele irá criar
		if self.id is None:
			db.cadastrar_marca(
				conn, 
				self.nome, 
				self.descricao				
				)
		else:
			# caso já exista um ID, ele irá alterar
			db.alterar_marca(
				conn, 
				self.id,
				self.nome,
				self.descricao
			)


	# utilizaremos para retornar no nome da marca
	# em componentes como select (option)
	# na hora do cadastro do produto
	def __str__(self):
		return self.nome