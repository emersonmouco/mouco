"""

Escreva um algoritmo que leia 10 valores 
e encontre o maior e o menor deles e mostre para o usuário

"""

quantidade = int(input("Quantos números você deseja digitar? "))

maior = None
menor = None

for i in range(quantidade):
	numero = int(input(f"Informe o {i+1}º número: "))

	if maior is None or numero > maior:
		maior = numero
	
	if menor is None or numero < menor:
		menor = numero

print(f"O maior número é {maior} e o menor é {menor}")