"""

Desenvolva um algoritmo em que o usuário forneça um número
e depois mostre o inverso dele

Ex: 

leia - 15 
mostre - 51

"""

numero = int(input("Digite um número: "))

if numero > 0:
	while numero != 0:
		extraido = numero % 10 # extrai o último dígito fornecido
		print(extraido, end=" ") 
		numero //= 10
	print()
elif numero < 0:
	numero *= -1
	print("-", end=" ")
	while numero != 0:
		extraido = numero % 10
		print(extraido, end=" ")
		numero //= 10
	print()