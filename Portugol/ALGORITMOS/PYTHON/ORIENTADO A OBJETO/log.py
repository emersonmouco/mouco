

"""
Gerando logs
normalmente utilizados para armazenar registros de erro
"""

class Log:
	def _log(self, msg):
		raise NotImplementedError("Implemente o método log!")
	
	def log_error(self, msg):
		return self._log(f'Error: {msg}')
	
	def log_sucess(self, msg):
		return self._log(f'Success: {msg}')

class LogFileMixin(Log):
	def log(self, msg):
		self._log(msg)

	def _log(self, msg):
		print(msg)

class LogPrintMixin(Log):
	def _log(self, msg):
		print(f'{msg} ({self.__class__.__name__})')


if __name__ == '__main__':
	l = LogFileMixin()
	l.log('Imprimindo qualquer coisa aqui para registrar')
	l = LogPrintMixin()
	l.log_error("Erro qualquer")
	l.log_sucess("Não teve erro, que legal!")