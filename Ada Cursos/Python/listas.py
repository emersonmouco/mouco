# listas

# antes

nota1 = 10
nota2 = 7
nota3 = 8

# com listas

notas = [10, 7, 8]

# criando listas
# para criar listas eu sempre uso o []
lista = [] # lista vazia
lista = list() # tambem é uma lista vazia
lista = [1, "Ola mundo", 1.10, True]
lista_de_lista = [10, [1, 2, 3]]

print(lista)
print(lista_de_lista)

# imprimindo os indices da lista
print(lista[0])
print(lista[1])
print(lista[2])
print(lista[3])

# uma outra forma de acessar o ULTIMO elemento de 
# um lista, é usar o -1, penultimo -2 e assim sucessivamente
print(lista[-1])
print(lista[-2])

# slices
lista = [10, 50, 30, 40, 25, 60, 5]

# neste caso ele vai do indice 0 até o indice 2 (menor que 3)
print(lista[0:3])

# neste caso é do indice 0 ate 6 pulando de 2 em 2
print(lista[0:6:2])

# iteracoes com FOR

# 1 utilizando o FOR para percorrer todos elementos da lista
for elemento in lista:
    print(elemento)

# 2 utilizando os indices da lista

# len() -> length -> comprimento
print("Comprimento da lista: ", len(lista))

for i in range(len(lista)):
    print(lista[i])
    

# metodos de listas
lista = [1, 2, 12, 8, 2]

# append
print("Antes do append: ",lista)

# o metodo append é para adicionar um elemento a lista
# o append é sempre no final da lista
lista.append(3)

print("Depois do append: ", lista)

# insert 

# no insert eu escolho a posicao do indice que eu quero adicionar
# entao no caso insert(posicao_do_indice, valor_a_ser_inserido)
lista.insert(2, 10)

print("Depois do insert: ", lista)

# extend
# serve para juntar duas listas

lista2 = [1, 2, 3]

lista.extend(lista2)

print("Listas juntadas, depois do extend: ", lista)

# pop
# para remover um elemento
# se nao especificar qual a posicao (indice) que quero remover
# ele irá remover o ultimo elemento da lista

listaPop = [1, 2, 3, 4]

# listaPop.pop()
listaPop.pop(0)

print(listaPop)

# remove
# neste caso eu indico qual o ELEMENTO 
# que eu quero remover e nao o indice
# mas ele irá remover somente o primeiro que ele encontrar
# nao todos os elementos iguais

listaRemove = [1, 2, 3, 4, 5]

listaRemove.remove(3)
print(listaRemove)

# count
# contar a quantidade de determinado 
# elemento em uma lista

listaCount = [1, 2, 3, 4, 5, 2, 2, 2]


print("Quantidade de elementos na lista: ", listaCount.count(2))

# index
# verifica qual o indice de determinado elemento
# em uma lista, no entanto, se existir mais de um 
# elemento igual, ele irá retornar o indice do primeiro
# que aparece na lista

listaIndex = [1, 2, 3, 4, 5, 2, 2, 2]

print("Indice do elemento 1 na lista: ", listaIndex.index(2))

# sort
# ordena a lista em ordem crescente

listaSort = [3, 2, 9, 1, 98, 34, 23]

listaSort.sort()

print(listaSort)

# para deixar a lista em ordem
# decrescente é so usar o parametro reverse=True

listaSort.sort(reverse=True)

print(listaSort)

# funcoes para as listas

# len
# para saber quantos elementos tem na lista

print("Quantidades de elementos da lista: ",len(listaSort))

# sum
# faz a soma de todos os elementos da lista

print("A soma de todos elementos da lista é: ", sum(listaSort))

# min
# retorna o menor elemento da lista
print("Menor elemento da lista é: ", min(listaSort))

# max
# retorna o maior elemento da lista
print("Maior elemento da lista é: ", max(listaSort))