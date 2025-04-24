"""
Desenvolva uma função para calcular o fatorial
de um numero fornecido pelo usuario.
Obs: O numero fornecido deve ser inteiro (tipo int)
"""

def calcular_fatorial(numero):
    if numero < 0:
        return f"Não é possível calcular o fatorial do número {numero}, pois ele é negativo!"
    else:
        fatorial = 1
        for i in range(1, numero + 1):
            fatorial *= i
        return f"Fatorial de {numero} é: {fatorial}"

numero = int(input("Digite um número inteiro: "))
print(calcular_fatorial(numero))

