"""

EM PYTHON

Escreva um algoritmo que receba o nome, sexo e o salário fixo de um funcionário.
Calcule e mostre o nome e salário líquido de acordo com a tabela:

a - sexo = M e Idade >= 30, imposto = 10%
b - sexo = M e idade < 30, imposto = 35%
c - sexo = F e Idade >= 30, imposto = 7,5%
d - sexo = F e idade < 30, imposto = 28%

"""

nome = input("Informe seu nome: ")
idade = int(input("Informe a idade: "))
sexo = input("Informe o sexo (M/F): ").strip().upper()
salario_fixo = float(input("Informe o salário fixo: "))

imposto = 0

if sexo == "M" and idade >= 30:
	imposto = 0.10 
elif sexo == "M" and idade < 30:
	imposto = 0.35
elif sexo == "F" and idade >= 30:
	imposto = 0.075
elif sexo == "F" and idade < 30:
	imposto = 0.28
else:
	print("Opção inválida!")

salario_liquido = salario_fixo * (1 - imposto)

print(f"Olá {nome} seu salário líquido será de R$ {salario_liquido}")
