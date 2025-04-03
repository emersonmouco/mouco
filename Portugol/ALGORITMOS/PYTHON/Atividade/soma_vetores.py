"""

Desenvolva um algoritmo que preencha dois vetores
de cinco posicoes, some cada elemento
com o elemento do outro vetor da respectiva posicao
depois mostre os vetores e o novo vetor com o resultado
dessa soma


"""

vetor1 = [0] * 5
vetor2 = [0] * 5
vetor3 = [0] * 5

for a in range(5):
	vetor1[a] = int(input(f"\nDigite o {a+1}º elemento do vetor: "))

for b in range(5):
	vetor2[b] = int(input(f"\nDigite o {b+1}º elemento do vetor: "))

	vetor3[b] = vetor1[b] + vetor2[b]

print("\nPrimeiro Vetor: ")
print("\t".join(map(str, vetor1)))
print("\nSegundo Vetor: ")
print("\t".join(map(str, vetor2)))
print("\nTerceiro Vetor: ")
print("\t".join(map(str, vetor3)))