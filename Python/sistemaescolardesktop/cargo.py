class Cargo:
	def __init__(self, nome, descricao, salarioBase):
		self.nome = nome
		self.descricao = descricao
		self.salarioBase = salarioBase
	
	def detalhes(self):
		print(f"Cargo: {self.nome}")
		print(f"Descrição: {self.descricao}")
		print(f"Salário base: R$ {self.salarioBase}")
		