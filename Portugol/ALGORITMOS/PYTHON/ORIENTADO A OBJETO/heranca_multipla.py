# herança multipla
# a herança multipla não é muito utilizada
# porém pode ser necessária em casos raros

class ClasseMae: 

	def quem_sou(self):
		print('Classe Mae')

# classe Filha está herdando da ClasseMae
class ClasseFilha(ClasseMae):

	def quem_sou(self):
		print("Classe Filha Mais Velha")

# classe Filha Nova está herdando também da ClasseMae
class ClasseFilhaNova(ClasseMae):

	def quem_sou(self):
		print("Classe Filha Mais Nova")

# agora iniciamos a herança múltipla, a classe "neta"
# onde a classe HerançaMultipla irá herdar das outras tres
# classes anteriores
class HerancaMultipla(ClasseFilha, ClasseFilhaNova):

	def quem_sou(self):
		print("Sou a classe 'neta', eu herdo os atributos", 
				"da classe mãe e das outras duas classes filhas!")

herancaMultipla = HerancaMultipla()
herancaMultipla.quem_sou()
print(HerancaMultipla.mro())