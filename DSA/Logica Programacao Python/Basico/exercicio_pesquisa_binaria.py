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
    print("O autor está presente no indice %d! " % resultado)
else:
    print("O autor não está presente no índice!")
    
"""

def main():
    # outra resolucao

    autores  =  ['Monteiro Lobato',  'José de Alencar',  'Cecília Meireles',  'Carlos Drummond de Andrade', 'Machado de Assis',  'Clarice Lispector', 'Gracilia no Ramos', 'Guimarães Rosa', 'Ruth Rocha', 'Luis Fernando Veríssimo']

    lista_ordenada = sorted(autores)

    # Solicita que o usuário digite o nome do autor
    autor = input('Digite o nome do autor para pesquisar na lista: ')

    # Grava a posição retornada pela pesquisa binária
    position = binary_search(lista_ordenada, autor)

    # Imprime mensagem de acordo com o resultado da pesquisa binária
    print("\nLista Ordenada de Autores: \n")
    print(lista_ordenada)
    if position == -1:
        print("\n")
        print("Desculpe, mas esse autor não faz parte da lista.")
    else:
        print("\n")
        print(autor,  "é  parte  da  lista  e  está  na  posição",  position  +  1, "(  equivalente  ao  índice", position, ") na lista ordenada de autores.")


    # Função para a pesquisa binária
    def binary_search(autores_ordenados, autor):
        # Variáveis de controle
        primeiro_elemento = 0
        ultimo_elemento = len(autores_ordenados) -1
        position = -1
        achei = False
        
        # Loop
        while not achei and primeiro_elemento <= ultimo_elemento:

            # Calcula o meio
            meio = (primeiro_elemento + ultimo_elemento) // 2
            # Verifica o meio e compara os elementos
            if autores_ordenados[meio] == autor:
                achei = True
                position = meio
            elif autores_ordenados[meio] > autor:
                ultimo_elemento = meio -1
            else:
                primeiro_elemento = meio + 1
            return position

main()


a funcao acima apresentava o seguinte erro: UnboundLocalError: cannot access local variable 
'position' where it is not associated with a value 

O problema ocorre porque a declaração da função binary_search está dentro da função main, e a variável position é utilizada antes de ser declarada dentro do escopo da função binary_search. Para corrigir isso, você pode mover a definição da função binary_search para fora da função main. Além disso, ajuste o recuo do retorno da função para garantir que ele esteja fora do loop. Aqui está uma versão corrigida do código:


"""

# Função para a pesquisa binária
def binary_search(autores_ordenados, autor):
    # Variáveis de controle
    primeiro_elemento = 0
    ultimo_elemento = len(autores_ordenados) - 1
    position = -1
    achei = False

    # Loop
    while not achei and primeiro_elemento <= ultimo_elemento:
        # Calcula o meio
        meio = (primeiro_elemento + ultimo_elemento) // 2
        # Verifica o meio e compara os elementos
        if autores_ordenados[meio] == autor:
            achei = True
            position = meio
        elif autores_ordenados[meio] > autor:
            ultimo_elemento = meio - 1
        else:
            primeiro_elemento = meio + 1

    return position

def main():
    # outra resolucao
    autores = ['Monteiro Lobato', 'José de Alencar', 'Cecília Meireles', 'Carlos Drummond de Andrade', 'Machado de Assis', 'Clarice Lispector', 'Gracilia no Ramos', 'Guimarães Rosa', 'Ruth Rocha', 'Luis Fernando Veríssimo']
    lista_ordenada = sorted(autores)

    # Solicita que o usuário digite o nome do autor
    autor = input('Digite o nome do autor para pesquisar na lista: ')

    # Grava a posição retornada pela pesquisa binária
    position = binary_search(lista_ordenada, autor)

    # Imprime mensagem de acordo com o resultado da pesquisa binária
    print("\nLista Ordenada de Autores: \n")
    print(lista_ordenada)
    if position == -1:
        print("\n")
        print("Desculpe, mas esse autor não faz parte da lista.")
    else:
        print("\n")
        print(autor, "é parte da lista e está na posição", position + 1, "( equivalente ao índice", position, ") na lista ordenada de autores.")

main()