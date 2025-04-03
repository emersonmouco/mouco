import contas
import pessoas

class Banco:
	def __init__(
			self,
			agencias: list[int] | None = None,
			clientes: list[pessoas.Pessoa] | None = None,
			contas: list[contas.Conta] | None = None,	  
		):
			self.agencias = agencias or []
			self.clientes = clientes or []
			self.contas = contas or []
	
	# verificações se existe agencia, cliente e conta
	def _checa_agencia(self, conta):
		if conta.agencia in self.agencias:
			print("_checa_agencia", True)
			return True
		print('_checa_agencia',False)
		return False
	
	def _checa_cliente(self, cliente):
		if cliente in self.clientes:
			print('_checa_cliente',True)
			return True
		print('_checa_cliente',False)
		return False
	
	def _checa_conta(self, conta):
		if conta in self.contas:
			print('_checa_conta',True)
			return True
		print('_checa_conta',False)
		return False

	def _checa_se_conta_e_do_cliente(self, cliente, conta):
		if conta in cliente.conta:
			print('_checa_se_conta_e_do_cliente',True)
			return True
		print('_checa_se_conta_e_do_cliente',False)
		return False
	
	# se todos os métodos anteriores estiverem ok (retornar True)
	# agora eu faço a autenticação e validação de tudo
	# Cliente, agencia e conta pertencentes a ele
	def autenticar(self, cliente: pessoas.Pessoa, conta: contas.Conta):
		return self._checa_agencia(conta) and \
			self._checa_cliente(cliente) and \
			self._checa_conta(conta) and \
			self._checa_se_conta_e_do_cliente(cliente, conta)
	
	def __repr__(self):
		class_name = type(self).__name__
		attrs = f'({self.agencias!r}, {self.clientes!r}, {self.contas!r})'
		return f'{class_name} {attrs}'
	
if __name__ == '__main__':
	print("### Mini Projeto Banco Senac ###")
	
	print("Cliente 1: \n")
	cliente = pessoas.Cliente('Luiz', 30)
	contaCorrente = contas.ContaCorrente(111, 222, 0, 0)
	cliente.conta = contaCorrente
	
	print("Cliente 2: \n")
	cliente2 = pessoas.Cliente('Maria', 20)
	contaPoupanca = contas.ContaPoupanca(112, 223, 100)
	cliente2 = contaPoupanca
	
	
	banco = Banco()
	banco.clientes.extend([cliente, cliente2])
	banco.contas.extend([cliente, cliente2])
	banco.agencias.extend([111, 222])

	if banco.autenticar(cliente, cliente2):
		contaPoupanca.depositar(150)
		cliente.conta.depositar(100)
		print(cliente.conta)

