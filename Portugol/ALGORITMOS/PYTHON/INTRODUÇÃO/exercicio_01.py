"""

Faça um programa que peça ao usuário para digitar um número inteiro,
informe se este número é par ou ímpar. Caso o usuário não digite um número
inteiro, informe que não é um número inteiro.

"""

numero = input("Digite um número inteiro: ")

try:
    conversao = int(numero)
except:
    print("O número digitado não é inteiro, erro na conversão!")

if conversao % 2 == 0:
    print("O número é par!")
else:
    print("O número é impar!")