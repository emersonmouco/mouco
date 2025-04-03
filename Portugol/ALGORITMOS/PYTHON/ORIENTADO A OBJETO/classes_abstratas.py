# classes abstratas
# as classes abstratas não podem ser ser instanciadas diretamente
# alem disso seus métodos não possuem "corpo", ou seja, nao possuem implementacao

# ABC -> Abstract Classes
from abc import ABC, abstractmethod

class Log(ABC):
	@abstractmethod
	def _log(self, msg):
		pass

	def log_error(self, msg):
		return self._log(f'Error: {msg}')
	
	def log_sucess(self, msg):
		return self._log(f'Sucess: {msg}')
	
class LogPrintMixin(Log):
	def _log(self, msg):
		print(f'{msg} ({self.__class__.__name__})')

# como a classe Log é uma classe Abstrata (ABC)
# eu não poderia instanciar ela aqui
# para isso eu criei a LogPrintMixin que herda ela 
# e ai acesso essa classe e seus métodos
l = LogPrintMixin() # instancia
l.log_error('Oi estou aqui.')
