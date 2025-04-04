# comentario

# primeira aula
print("Hello World!!!")
print("Seja bem-vindo ao curso de Python da Coding Tank!")

# input("Qual a linguagem de programação que você está usando?")

# 1. Variaveis

# criando uma variável
idade = 29

# o python tem tipagem dinâmica, então ele já entende
# que a variável está recebendo um valor inteiro

print(idade)

nome = "Emerson Mouco"

print(nome)

"""
tipos de variáveis

(tipos primitivos)

1- int: números inteiros, ou seja, números sem parte decimal: 0, 5, -1, 1000 etc.
2- float: números reais, ou seja, números com casas decimais: 1.0, -2.7, 3.14 etc.
3- str: cadeias de caracteres, ou seja, dados textuais (str -> abreviatura para string)
4- bool: valores lógicos(booleanos), verdadeiro ou falso

Obs: Python é case sensitive

"""

idade = 29
altura = 1.84
nome = "Emerson Mouco"
estudando = True

print(idade, altura, nome, estudando)

# para imprimir o tipo da variável

print(type(idade))
print(type(altura))
print(type(nome))
print(type(estudando))

# salvando os dados em uma variável

linguagem = input("Qual a linguagem de programação que você está usando?")

print("A linguagem que está usando é: " + linguagem)