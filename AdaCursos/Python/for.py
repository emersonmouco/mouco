# laço for

# neste caso estou indicando que uma variavel qualquer
# ira percorrer uma lista, um intervalo até 10 numeros
# e depois imprimir na tela

"""
for variavel in range(10):
    print(variavel)

"""    

"""    
# range = faixa
# ele admite até 3 parametros
# (5) -> ele ira gerar uma lista de 0 até 4, ou seja, menor que 5
# (1, 10) -> ele irá gerar uma lista de 1 até 9, ou seja, menor que 10
# ele sempre irá até o valor anterior de parada
for variavel in range(1, 10):
    print(variavel)
"""

# neste caso quando colo o terceiro parametro
# ele irá imprimir uma lista por exemplo de 1 ate 14 (menor que 15)
# mas pulando de 3 em 3
"""
for variavel in range(1, 15, 3):
    print(variavel)
"""

# calcular media de um aluno

"""

poderia fazer o seguinte codigo
mas nao ficaria automatizado

nota1 = float(input("Digite sua nota 1: "))
nota2 = float(input("Digite sua nota 2: "))
nota3 = float(input("Digite sua nota 3: "))

"""

soma = 0

for i in range(1, 4):
    nota = float(input(f"Digite sua nota {i}: "))
    soma = soma + nota

print(soma / 3)