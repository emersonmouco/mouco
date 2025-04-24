"""
Desenvolva um algoritmo que leia o salario
do trabalhador, a porcentagem de aumento
e depois calcule o novo salario com o aumento
informado e mostre na tela
"""
salario = float(input("Digite o salário: R$ "))
porcentagem_aumento = float(input("Informe a porcentagem de aumento: "))

aumento = salario * (porcentagem_aumento / 100)
novo_salario = salario + aumento

print(f"O novo salário é de R$ {novo_salario}")