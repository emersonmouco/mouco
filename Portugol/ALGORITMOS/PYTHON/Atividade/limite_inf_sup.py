"""

elabore um algoritmo que leia os limites inferior e superior 
de um intervalo e mostre todos os números pares do intervalo
o algoritmo deve mostrar também o somatório desses números pares. 

"""

limiteInferior = int(input("\nInforme o valor do limite inferior: "))
limiteSuperior = int(input("\nInforme o valor do limite superior: "))

# verifica se o limite inferior é par
if limiteInferior % 2 == 0:
	# se for par, soma 2 para começar com o próximo número par
	limiteInferior += 2
else:
	# se não for par, soma 1 para torná-lo par
	limiteInferior += 1

soma = 0.0

print("\nNúmeros pares no intervalo: \n")

for i in range(limiteInferior, limiteSuperior, 2):
	print(f"\t{i}")
	soma += i

print(f"\nSomatório dos números pares: {soma}")