"""
desenvolva um algoritmo que leia uma matriz 4x4 e imprima
a soma dos elementos da diagonal principal

"""

matriz = [[0] * 3 for _ in range(3)]
soma = 0

print("\nInforme os elementos da matriz")
for x in range(3):
	for y in range(3):
		matriz[x][y] = int(input(f"Informe o elemento da matriz na posição [{x}][{y}] "))
		if x == y:
			soma += matriz[x][y]
	
print("\nMatriz informada: ")
for linha in matriz:
	print(" ".join(f"[{x}]" for x in linha))

print(f"\nA soma dos elementos da diagonal principal é: {soma}")
	