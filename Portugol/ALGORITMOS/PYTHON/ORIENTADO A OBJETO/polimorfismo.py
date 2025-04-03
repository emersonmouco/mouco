"""

Polimorfismo

Polimorfismo é quando as classes derivadas/classes que herdam
da classe mãe, tenham métodos iguais (com mesma assinatura/nome)
mas com comportamentos diferentes

Assinatura = mesmo nome e quantidade de parâmetros

"""

from abc import ABC, abstractmethod

class Notificacao(ABC):
	def __init__(self, mensagem):
		self.mensagem = mensagem

	@abstractmethod
	def enviar(self) -> bool:
		pass

class NotificacaoEmail(Notificacao):
	def enviar(self) -> bool:
		print('Email: enviando - ', self.mensagem)
		return True

class NotificacaoSMS(Notificacao):
	def enviar(self) -> bool:
		print('SMS: enviando - ', self.mensagem)

def notificar(notificacao: Notificacao):
	notificacao_enviada = notificacao.enviar()

	if notificacao_enviada:
		print("Notificação enviada!")
	else:
		print("Notificação NÃO enviada!")

notificacao_email = NotificacaoEmail('testando e-mail')
notificar(notificacao_email)

notificacao_sms = NotificacaoSMS('testando SMS')
notificar(notificacao_sms)