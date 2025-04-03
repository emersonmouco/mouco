"""

Desenvolva um algoritmo que leia os elementos de uma matriz 5x5 
ao final o algoritmo deverá mostrar a soma de todos os elementos 
da matriz

"""

matriz = [[0] * 5 for _ in range(5)]
soma = 0

print("\nInforme os valores da matriz: ")
for linha in range(5):
	for coluna in range(5):
		matriz[linha][coluna] = int(input(f"Elemento [{linha}][{coluna}]: "))
		soma += matriz[linha][coluna]

print("\nMatriz")
for linha in matriz:
	print(" ".join(f"[{num}]" for num in linha))

print(f"\nA soma dos elementos é: {soma}")