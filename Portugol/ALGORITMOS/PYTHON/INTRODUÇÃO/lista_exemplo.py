
# lembrando que os indices de um vetor
# sempre começam com zero
#indices 0   1   2   3
lista = [10, 20, 30, 40]

# método append -> adiciona um elemento ao final da lista
lista.append(50)

# método pop -> remove o último elemento da lista
lista.pop()

lista.append(60)
lista.append(70)

print(lista)

# concatenando listas
lista_a = [1, 2, 3]
lista_b = [4, 5, 6]
lista_c = lista_a + lista_b
print(lista_c)

# utilizando o for in em listas
lista = ['Kenzo','Pedro','José', 1, 25.0]

for nome in lista:
    print(nome, type(nome))

# exibindo os indices da lista
indices = range(len(lista))

for indice in indices:
    print("Indice [",indice,"] ", lista[indice], type(lista[indice]))