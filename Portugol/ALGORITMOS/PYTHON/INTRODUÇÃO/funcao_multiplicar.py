"""
Crie uma função que receba um numero não definido
de argumentos e multiplica todos eles
retorne o total para uma variavel e depois mostre
o valor final dessa variavel 

"""

def multiplicar(*args):
    total = 1
    for numero in args:
        total *= numero
    return total

multiplicacao = multiplicar(1,2,3,4,5)
print(multiplicacao)