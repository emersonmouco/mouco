"""

Desenvolva um algoritmo que leia uma quantidade de notas (pelo menos 5)
após ler as notas

- mostre todos os valores que foram lidos na ordem informada
- mostre todos os valores que foram lidos na ordem inversa
- calcule e mostre o somatório das notas
- calcule e mostre a média das notas
- calcule e mostre a quantidade de valores acima da média calculada


"""

notas = []
soma = 0.0
qtd_lidas = 0
qtd_acima_media = 0

quantidade = int(input("\nInforme a quantidade de notas: "))

for x in range(quantidade):
	nota = float(input(f"\nInforme a {x+1}ª nota: "))
	notas.append(nota)

	qtd_lidas += 1

	soma += nota

	if qtd_lidas > 0:
		media = soma / qtd_lidas
	else:
		media = 0

for nota in notas:
	if nota > media:
		qtd_acima_media += 1

print(f"\nA quantidade de notas lidas foi de: {qtd_lidas}")
print("\nValores na ordem informada: \n")
print("\t".join(map(str, notas)))
print("\nValores na ordem inversa: \n")
print("\t".join(map(str, reversed(notas))))
print(f"\nA soma das notas é de: {soma:.2f}")
print(f"\nA média das notas é de: {media:.2f}")
print(f"\nA quantidade acima da média foi de: {qtd_acima_media}")
