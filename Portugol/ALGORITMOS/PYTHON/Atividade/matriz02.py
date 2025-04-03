"""

Desenvolva um algoritmo que leia uma matriz 4x4.
Ao final, deverá apresentar o resultado da subtracao
da soma dos elementos da primeira linha 
pela soma dos elementos da terceira coluna

"""

matriz = [[0] * 4 for _ in range(4)]
somaLinha = 0.0
somaColuna = 0.0
subtracao = 0.0

print("\nInforme os valores da matriz")
for linha in range(4):
	for coluna in range(4):
		matriz[linha][coluna] = float(input(f"Elemento [{linha}][{coluna}]"))

		if linha == 0:
			somaLinha += matriz[linha][coluna]
		
		if coluna == 2:
			somaColuna += matriz[linha][coluna]

subtracao = somaLinha - somaColuna

print("\nMatriz")

for linha in matriz:
	print(" ".join(f"[{num:.2f}]" for num in linha))

print(f"\nSoma da primeira linha: {somaLinha}")
print(f"\nSoma da terceira coluna: {somaColuna}")
print(f"Subtração da 1ª linha pela 3ª coluna: {subtracao:.2f}")