
# Desenvolva um algoritmo que verifique
# se um numero digitado é multiplo de 3 ou de 5

numero = int(input("Digite um número: "))

if numero % 3 == 0 and numero % 5 == 0:
    print("O número é múltiplo de 3 e de 5!")
elif numero % 3 == 0:
    print("O número é múltiplo de 3!")
elif numero % 5 == 0:
    print("O número é múltiplo de 5!")
else:
    print("O número não é múltiplo de 3 nem de 5!")