"""

criando uma lista onde podemos:
inserir,
apagar,
e deletar elementos


"""

import os

# função clear no windows
# o comando os.system('clear') só funciona em sistemas Unix (Linux) e Mac
# para o windows ou para que funcione independente do sistema criamos
# função abaixo:
def clear_console():
    os.system('cls' if os.name == 'nt' else 'clear')

lista = []

while True:
    print("### Selecione uma opção ###\n")
    opcao = input("[i] - inserir [a] - apagar [l] - listar [s] - sair")

    # inserir elemento na lista
    if opcao == 'i':
        clear_console()
        elemento = input('Informe o elemento a ser adicionado: ')
        lista.append(elemento)
    # apagar elemento na lista
    elif opcao == 'a':
        indice_str = input("Escolha o índice para apagar (a posição dele, não o valor do elemento): ")

        try:
            elemento = int(indice_str)
            del lista[elemento]
        except ValueError:
            print("Por favor, digite um número inteiro!")
        except IndexError:
            print("Índice não existe na lista!")
        except Exception:
            print("Erro desconhecido!")
    # listando elementos da lista
    elif opcao == 'l':
        clear_console()

        if len(lista) == 0:
            print("Nada para listar, lista vazia!")
        
        for i, valor in enumerate(lista):
            print(i, valor)
    elif opcao == 's':
        clear_console()
        break
    else:
        print("Por favor, escolha i, a, l ou s")




