"""
Faça um programa que pergunte a hora ao usuário e, baseando-se no horário 
descrito, exiba a saudação apropriada. 

Ex: 

6-11
Bom dia

12-17
Boa tarde

18-05
Boa noite

"""

hora = int(input("Informe a hora atual (SOMENTE A HORA): "))
nome = input("Digite seu nome: ")

try:
    if hora >= 6 and hora <= 11:
        print(f"Bom dia, {nome}, tenha um dia produtivo!")
    elif hora >= 12 and hora <= 17:
        print(f"Boa tarde, {nome}, tenha uma tarde agradável!")
    elif (hora >= 18 and hora <=24) or hora <= 5:
        print(f"Boa noite, {nome}, tenha uma ótima noite!")
    else:
        print(f"{nome} hora inválida!")
except:
    print("Informe um número inteiro entre 0 e 24!\n")