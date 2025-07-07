class Marca:
	def __init__(self, id, nome, descricao):
		self.id = id
		self.nome = nome
		self.descricao = descricao
	
	# utilizaremos para retornar no nome da marca
	# em componentes como select (option)
	# na hora do cadastro do produto
	def __str__(self):
		return self.nome