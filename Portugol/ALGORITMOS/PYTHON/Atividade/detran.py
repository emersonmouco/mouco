"""

Crie um algoritmo que ajude o DETRAN a calcular o total
de recursos que foram arrecadados com aplicação de multas.
O algoritmo deve ler as seguintes informações para 5 motoristas:

-> numero da carteira do motorista (numeros inteiros - 4 digitos)
-> numero de multas do motorista
-> valor da multa (considere que todas as multas tem o mesmo valor)

Ao final, deve-se apresentar o total de recursos arrecadados (somatório
das multas de TODOS os motoristas). O algoritmo deve mostrar também 
o número da carteira do motorista que obteve o maior número de multas.

"""

soma = 0.0
maior = 0.0
numero = 0.0
cnh = []
quantidade = []
valorMulta = []

for i in range(3):

	while True:
		numero_cnh = input("Informe o número da CNH (4 Dígitos): ")

		if numero_cnh.isdigit() and len(numero_cnh) == 4:
			cnh.append(int(numero_cnh))
			break
		else:
			print("Erro! O número da carteira deve conter 4 digitos!")
		
	quantidade.append(int(input("Informe a quantidade de multas: ")))

	# calculo do valor total das multas
	if quantidade[i] > 0:
		preco = float(input("\nInforme o valor da multa: R$ "))
		valorMulta.append(preco * quantidade[i])
		soma += valorMulta[i]
	else:
		valorMulta.append(0.0)
	
	# identificacao da maior multa
	if i == 0 or valorMulta[i] > maior:
		maior = valorMulta[i]
		numero = i

# exibição das dívidas de cada motorista
for i in range(3):
	print(f"\nDívida do motorista da carteira {cnh[numero]}: ")
	print(f"R$ {valorMulta[i]:.2f}")


# exibição do total de multas e da maior multa
print(f"\nA soma das multas é: R$ {soma:.2f}")
print(f"\nO motorista que recebeu a maior multa foi o de número: {cnh[i]}")






