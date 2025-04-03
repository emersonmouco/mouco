"""

Desenvolva um algoritmo que leia uma lista de salários dos funcionários de uma empresa.
Você deve fornecer a quantidade antes, igual no exemplo anterior. 
Após ler os salários, deve aplicar um aumento de 17,5% somente aos salários abaixo
de 1750 reais.

Mostre na tela a lista dos salários depois.

"""

salario = []

quantidade = int(input("\nInforme a quantidade de salários: "))

for x in range(quantidade):
	valor = float(input(f"\nInforme o valor do {x+1}º salário: R$ "))

	if valor < 1750:
		valor += valor * 0.175
	
	salario.append(valor)

print("\nLista de salários: \n")
for x in range(quantidade):
	print(f"\n{x+1}º salário: R$ {salario[x]:.2f}")

