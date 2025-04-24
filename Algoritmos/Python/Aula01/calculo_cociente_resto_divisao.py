"""
Desenvolva um algoritmo que receba um valor
numérico, calcule e mostre o cociente e o resto
da divisao desse numero por 3
"""
numero = int(input("Informe um numero: "))

# calcula o cociente 
cociente = numero // 3
# calcula o resto 
resto = numero % 3

print(f"O cociente da divisao de {numero} por 3 é: {cociente}")
print(f"O resto da divisao de {numero} por 3 é: {resto}")

