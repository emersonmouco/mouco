# ordenacao

# Ordenação por Bolha
def bubble_sort(lista):
    # Função que realiza a troca dos elementos
    def troca(i, j):
        lista[i], lista[j] = lista[j], lista[i]
    n = len(lista)
    trocado = True
    x = -1
    
    while trocado:
        trocado = False
        x = x + 1
        
        for i in range(1, n -x):
            if lista[i -1] > lista[i]:
                troca(i -1, i)
                trocado = True
    return lista

# Lista não ordenada
listaNaoOrdenada = [9, 3, 5, 4, 6, 2, 7, 1, 8]


print("Lista nao ordenada: ", listaNaoOrdenada)

# Ordena a lista
listaOrdenada = bubble_sort(listaNaoOrdenada)

print("\n")
print("Lista ordenada - Bubble Sort: ", listaOrdenada)




