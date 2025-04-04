# conversao de tipos

idade1 = '10'
idade2 = '20'

print(idade1 + idade2)
# no caso acima ele imprime concatenando, pois o python entende
# que sao dois textos que vc quer que junte e não que seja para 
# realizar a soma deles 

# caso tenha uma variavel inteira e outra texto
# ele irá imprimir um erro na tela

# dando sequencia a conversao

idade = '29'

print(idade, type(idade))
# no caso acima ele imprimiu a variavel e mostrou que o tipo dela é texto

idade_inteira = int(idade)

print(idade_inteira, type(idade_inteira))
# neste caso, convertemos a variavel idade que era um texto
# para um valor inteiro

"""

tipos de conversao

- int() -> para inteiro
- str() -> para string
- float() -> double ou valores flutuantes (casas decimais)
- bool() -> para booleano

"""

altura = input("Qual é a sua altura? ")
print(altura, type(altura))
# neste exemplo ele irá pegar a altura do usuário e imprimi-la na tela
# além disso, irá imprimir o tipo dela, que neste caso é 
# STRING

# o que podemos fazer é envolver a funcao input dentro da funcao float

altura2 = float(input("Qual é a sua altura? "))
print(altura2, type(altura2))
