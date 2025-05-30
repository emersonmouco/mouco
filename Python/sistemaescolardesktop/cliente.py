from pessoa import Pessoa

class Cliente(Pessoa):
	def __init__(self, nome, idade, telefone, rg, cidade, nivelCliente):
		super().__init__(nome, idade, telefone, rg, cidade)
		self.nivelCliente = nivelCliente
	
	def mostrar_cliente(self):
		print(f"Nível cliente: {self.nivelCliente}")