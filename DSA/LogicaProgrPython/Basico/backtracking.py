# algoritmo backtracking

# Função para o algoritmo Backtracking
def permuta(combinacoes, lista):
    # Verificamos se o número de combinações é igual a 1
    # # e retornamos a própria lista, pois não há combinações a fazer
    if combinacoes == 1:
        return lista
    
    # Se quisermos mais de 1 combinação dos elementos, começamos a recursão
    else:
        # Usamos list comprehension com recursão (chamada à própria função)
        return [ y + x for y in permuta(1, lista) for x in permuta(combinacoes -1, lista) ]


# Executa a função buscando diferentes combinações e aplicando a técnica de Backtracking
print(permuta(1, ["a","b","c"]))
print(permuta(2, ["a","b","c"]))
print(permuta(3, ["a","b","c"]))