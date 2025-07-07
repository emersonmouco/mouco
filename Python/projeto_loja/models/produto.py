from marca import Marca

class Produto:
	def __init__(self, id, nome, marca: Marca, preco, descricao):
		self.id = id
		self.nome = nome
		self.marca = marca # recebendo o objeto marca
		self.preco = preco
		self.descricao = descricao
	
	def __str__(self):
		# verifica se a marca existe, se existir atribui a variavel
		# marca_nome o nome da marca
		marca_nome = self.marca.nome if self.marca else "Não existe marca cadastrada!"
		return f"ID: {self.id}, Nome: {self.nome}, Preço: R$ {self.preco:.2f}, Marca: {marca_nome}"