"""

Desenvolva um algoritmo que verifique o número de elementos 
em comum entre dois vetores preenchidos pelo usuario
"""

V1 = []
V2 = []

vetor1 = int(input("Informe a quantidade do primeiro vetor: "))

qtd = 0

for x in range(vetor1):
	valor = int(input(f"\nInforme o valor do {x+1}º elemento: "))
	V1.append(valor)

vetor2 = int(input("\nInforme a quantidade do segundo vetor: "))

for x in range(vetor2):
	valor = int(input(f"\nInforme o valor do {x+1}º elemento: "))
	V2.append(valor)

for x in V1:
	for y in V2:
		if x == y:
			qtd += 1

print(f"\nA quantidade de valores iguais é: {qtd}")