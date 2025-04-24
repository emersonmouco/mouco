"""
Desenvolva um algoritmo com função que calcule o valor 
final de um produto com desconto.
seguindo: 
se a quantidade for maior ou igual a 20, desconto de 20%
se a quantidade for menor que 20, desconto de 10%
o usuario deve fornecer o preço do produto e a quantidade.
"""

def calcular_desconto(quantidade, preco):
    if quantidade >= 20:
        total = quantidade * preco
        desconto = total - (total * 0.20)
        return f"O preço total com desconto será de: R$ {desconto}"
    elif (quantidade < 20 and quantidade >= 1):
        total = quantidade * preco
        desconto = total - (total * 0.10)
        return f"O preço total com desconto será de: R$ {desconto}"
    else:
        return "Não é possível uma quantidade menor que zero!"

quantidade = float(input("Informe a quantidade do produto: "))
preco = float(input("Informe o preço do produto: R$ "))
print(calcular_desconto(quantidade, preco))

        
        
        