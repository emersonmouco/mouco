class Pessoa:
	def __init__(self, nome, idade, telefone, rg, cidade):
		self.nome = nome
		self.idade = idade
		self.telefone = telefone
		self.rg = rg
		self.cidade = cidade
	
	def apresentar(self):
		print(f"Olá sou o {self.nome}, tenho {self.idade} anos.")
		print(f"Telefone: {self.telefone}")
		print(f"RG: {self.rg}")
		print(f"Cidade: {self.cidade}")
		
		