"""

Desenvolva um algoritmo que leia uma matriz 3x4 e depois 
imprima sua transposta (4x3)

"""

matrizA = [[0] * 3 for _ in range(4)]
matrizB = [[0] * 4 for _ in range(3)]

# matriz A
for x in range(3):
	for y in range(4):
		matrizA[x][y] = int(input(f"Digite o valor da linha [{x}] e da coluna [{y}]: "))

# gerando a matriz transposta
for x in range(3):
	for y in range(4):
		matrizB[y][x] = matrizA[x][y]

# matriz original
print("\nMatriz original")
for linha in matrizA:
	print(" ".join(f"[{x}]" for x in linha))

# matriz transposta
print("\nMatriz transposta")
for linha in matrizB:
	print(" ".join(f"[{x}]" for x in linha))