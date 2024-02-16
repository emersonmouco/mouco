# funcao range

# imprimindo numeros de 1 a 10
for i in range(1, 11):
    print(i)


# imprimindo numeros pares entre 50 e 101
for i in range(50, 101, 2):
    print(i)
    
# imprimindo os numeros pares negativos  entre 0 e -20
for i in range(0, -20, -2):
    print(i)

# usando o tamanho de uma lista na funcao range()
lista = ['Abacaxi', 'Banana', 'Morango', 'Uva']
lista_tamanho = len(lista)
for i in range(0, lista_tamanho):
    print(lista[i])
