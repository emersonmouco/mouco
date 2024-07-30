# pesquisa binaria

"""

Programa Python para pesquisa binária recursiva.

Retorna o índice de x no vetor se x estiver presente, caso contrário -1

"""

# Retorna o índice de x no vetor se x estiver presente, caso contrário -1
def pesquisaBinaria(vetor, primeira_posicao, ultima_posicao, x):
    # Verifica se a última posição do vetor é maior ou igual a 1 para garantir
    # que tenhamos um vetor de comprimento maior que zero
    if ultima_posicao >= primeira_posicao:
        meio = primeira_posicao + (ultima_posicao - primeira_posicao) // 2
        # Se o elemento estiver presente no meio em si
        if vetor[meio] == x:
            return meio
        
        #  Se  o  elemento  for  menor  que  o  meio,  ele  poderá  estar  presente  apenas  no  sub-vetor esquerdo
        elif vetor[meio] > x:
            return pesquisaBinaria(vetor, primeira_posicao, meio-1, x)
        
        # Senão, o elemento pode estar presente apenas no sub-vetor direito

        else:
            return pesquisaBinaria(vetor, meio + 1, ultima_posicao, x)
    else:
        # o elemento nao esta presente na matriz
        return -1


# teste
listaNum = [12, 13, 40, 56, 93]

x = 12

# chamando a funcao
resultado = pesquisaBinaria(listaNum, 0, len(listaNum)-1, x)

if resultado != -1:
    print("O elemento está presente no indice %d! " % resultado)
else:
    print("O elemento não está presente no índice!")