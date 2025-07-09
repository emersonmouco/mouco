from db import database_manager as db # importando o gerenciador do banco de dados
from .marca import Marca

class Produto:
	def __init__(self, id, nome, marca: Marca, preco, descricao):
		self.id = id
		self.nome = nome
		self.marca = marca # recebendo o objeto marca
		self.preco = preco
		self.descricao = descricao
	
	def save(self, conn):
		# o método irá decidir se salva ou se altera o cliente
		# com base na existencia (alterar) ou nao (criar) de um id
		
		# se nao existir ID ele irá criar

		id_marca = self.marca.id

		if self.id is None:
			db.cadastrar_produto(
				conn, 
				self.nome,
				self.preco,
				self.descricao,
				id_marca				
				)
		else:
			# caso já exista um ID, ele irá alterar
			db.alterar_produto(
				conn, 
				self.id,
				self.nome,
				self.preco,
				self.descricao,
				id_marca
			)

	
	def __str__(self):
		# verifica se a marca existe, se existir atribui a variavel
		# marca_nome o nome da marca
		marca_nome = self.marca.nome if self.marca else "Não existe marca cadastrada!"
		return f"ID: {self.id}, Nome: {self.nome}, Preço: R$ {self.preco:.2f}, Marca: {marca_nome}"