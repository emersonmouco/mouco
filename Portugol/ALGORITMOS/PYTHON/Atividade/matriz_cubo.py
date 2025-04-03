"""

Desenvolva um algoritmo que receba uma matriz 5x5
depois calcule o cubo de cada elemento da atriz
e imprima a matriz original e a nova matriz

"""

matriz = [[0] * 5 for _ in range(5)]
matriz_cubo = [[0] * 5 for _ in range(5)]

for x in range(5):
	for y in range(5):
		matriz[x][y] = int(input(f"\nInforme o elemento [{x}][{y}] da matriz: "))

# criando a matriz ao cubo
for x in range(5):
	for y in range(5):
		matriz_cubo[x][y] = matriz[x][y] ** 3

print("\nMatriz Original: ")
for linha in matriz:
	print(" ".join(f"[{elemento}]" for elemento in linha))

print("\nMatriz ao Cubo: ")
for linha in matriz_cubo:
	print(" ".join(f"[{elemento}]" for elemento in linha))