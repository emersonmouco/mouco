"""
compreendendo funcoes

com retorno
"""

def soma(x, y):
    if x > 10:
        return [10, 20]
    return x + y

soma1 = soma(2, 2)
soma2 = soma(3, 3)

print(soma1)
print(soma2)
print(soma(11, 55))


"""
funções com argumentos não definidos

args

*args -> empacotando e desempacotando o atributo

* quando coloco o * antes de um parâmetro é porque
    eu não defini a quantidade de argumentos/parâmetros que ele irá receber

"""

def soma(*args):
    total = 0
    for numero in args:
        total += numero
    return total

soma_args1 = soma(1,2,3)
print(soma_args1)

numeros = 1,2,3,4,5,6,7,8,9,10
outra_soma = soma(*numeros)
print(outra_soma)

print(sum(numeros))


