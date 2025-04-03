"""

EM PYTHON

Escreva um algoritmo que leia um valor numério inteiro e depois
apresente a tabela COM CABEÇALHO contendo os valores referentes
ao numero da sequencia, seu dobro e seu triplo.
Deverá mostrar todos os valores até 1.
Exemplo: se o usuario digitar 5 
vai apresentar 

Numero	dobro Triplo
5		10		15
4		8		12
3		6		9
... e assim por diante

"""

numero = int(input("Informe um número: "))

print("NUMERO\tDOBRO\tTRIPLO")

for i in range(numero, 0, -1):
	dobro = i * 2
	triplo = i * 3
	print(f"{i}\t{dobro}\t{triplo}")