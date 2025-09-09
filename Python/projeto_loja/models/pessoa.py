class Pessoa:
	def __init__(self, id, nome, endereco):
		self.id = id
		self.nome = nome
		self.endereco = endereco
	
	# metodo salvar que será implementado pela subclasse
	def save(self, conn):
		"""
			Esse método será abstrato implementado pelas classes filhas
			é como se fosse um contrato feito com elas, para tirar a responsabilidade
			da classe superior
		"""
	
	def __str__(self):
		return f"ID: {self.id}, Nome: {self.nome}"