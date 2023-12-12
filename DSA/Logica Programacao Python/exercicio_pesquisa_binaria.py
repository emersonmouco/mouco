# exercicio

autores  =  ['Monteiro  Lobato',  'José  de  Alencar',  'Cecília  Meireles',  'Carlos  Drummond  de Andrade',  'Machado  de Assis',  'Clarice  Lispector',  'Gracilia no  Ramos',  'Guimarães  Rosa',  'Ruth Rocha', 'Luis Fernando Veríssimo']

lista_ordenada = sorted(autores)

print("Lista ordenada por comprimento: ", lista_ordenada)

#### pesquisa binaria

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


item_a_ser_verificado = 'Clarice  Lispector'

# chamando a funcao
resultado = pesquisaBinaria(lista_ordenada, 0, len(lista_ordenada)-1, item_a_ser_verificado)

if resultado != -1:
    print("O elemento está presente no indice %d! " % resultado)
else:
    print("O elemento não está presente no índice!")

