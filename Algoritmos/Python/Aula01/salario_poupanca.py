"""
Desenvolva um algoritmo que receba o valor
aplicado na poupanca por uma pessoa, calcule
e mostre o valor após um mes de aplicacao.
Sabendo que taxa de juros é igual a 0.5% ao mes.
"""
salario = float(input("Informe o salário: R$ "))

juros = 0.005

rendimento = salario * juros
salario_poupanca = salario + rendimento

print(f"O valor do novo salário é de R$ {salario_poupanca}")