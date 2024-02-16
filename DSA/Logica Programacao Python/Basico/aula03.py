
"""

Exercicio 1

1 - Leia 2 números, representados pelas variáveis a e b.
2 - Se a for maior que b, retorne a como maior.
3 - Senão, retorne b.

"""

def maximo2(a,b):
    if a > b:
        return a
    else:
        return b

resultado = maximo2(2,3)

print("Resultado maximo2: ", resultado)
    
resultado = maximo2(5,2)

print("Resultado maximo2: ", resultado)

print(" ########## ")

"""

Exercicio 2

1 - Leia 3 números, representados pelas variáveis a, b e c.
2 - Se a for maior que b e a for maior que c, retorna a.
3 - Senão, se b for maior que a e b for maior que c, retorna b.
4 - Senão, retorna c

"""

def maximo3_v1(a, b, c):
    if a > b and a > c:
        return a
    elif b > a and b > c:
        return b
    else: 
        return c

resultado = maximo3_v1(5,3,1)

print("Resultado maximo3_v1: ", resultado)
    
resultado = maximo3_v1(2,6,1)

print("Resultado maximo3_v1: ", resultado)

resultado = maximo3_v1(5,2,7)

print("Resultado maximo3_v1: ", resultado)

print(" ########## ")

"""

Exercicio 3

maximo3_v2

"""

def maximo3_v2(a, b, c):
    if a < b:
        return maximo2(b, c)
    else:
        return maximo2(a, c)

resultado = maximo3_v1(5,3,1)

print("Resultado maximo3_v2: ", resultado)
    
resultado = maximo3_v1(2,6,1)

print("Resultado maximo3_v2: ", resultado)

resultado = maximo3_v1(5,2,7)

print("Resultado maximo3_v2: ", resultado)

