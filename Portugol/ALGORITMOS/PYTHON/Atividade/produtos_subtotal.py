"""

Desenvolva um algoritmo em que o usuário deve fornecer
o nome do produto
a quantidade do produto
e o valor
ao final deverá calcular o subtotal de cada produto e 
apresentar na tela

"""
nome = []
quantidade = []
valor = []
subtotal = []

lista = int(input("Informe a quantidade de produtos a serem calculados: "))

for x in range(lista):
	nome.append(input("\nInforme o nome do produto: "))
	quantidade.append(int(input("\nInforme a quantidade do produto: ")))
	valor.append(float(input("\nInforme o preço do produto: R$ ")))

	subtotal.append(valor[x] * quantidade[x])

print("\nLista de produtos e subtotais")
for x in range(lista):
	print(f"O subtotal do produto {nome[x]} é de R$ {subtotal[x]:.2f}")