"""

Desenvolva um algoritmo que leia um vetor de 10 elementos inteiros.
Após isso, deverá mostrar qual o maior elemento do vetor e qual a 
posição dele no vetor e qual o menor elemento e qual a posição dele
no vetor.

"""

vetor = [0] * 5
maior = menor = posicaoMaior = posicaoMenor = 0

print("\nInforme os valores do vetor: ")
for x in range(5):
	vetor[x] = int(input(f"Valor {x+1}: "))

maior = menor = vetor[0]

print("\nVetor: ", end=" ")
for numero in vetor:
	print(f"[{numero}]", end=" ")

for x in range(5):
	if vetor[x] > maior:
		maior = vetor[x]
		posicaoMaior = x
	
	if vetor[x] < menor:
		menor = vetor[x]
		posicaoMenor = x

print(f"\nO maior valor do vetor é {maior} e ele está na posição {posicaoMaior}")
print(f"\nO menor valor do vetor é {menor} e ele está na posição {posicaoMenor}")
