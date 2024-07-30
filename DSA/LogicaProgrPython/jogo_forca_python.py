# desenvolvimento do jogo da forca
# em python v1

# Import
import random
from os import system, name

# funcao para limpar a tela a cada execucao
def limpa_tela():
    
    # windows
    if name == 'nt':
        _ = system('cls')
    
    # mac ou linux
    else:
        _ = system('clear')

# funcao game
def game():
    
    limpa_tela()
    
    print("\nBem vindo(a) ao jogo da forca!")
    print("\nAdvinhe a palavra abaixo: \n")
    
    # lista de palavras para o jogo
    palavras = ['banana', 'abacate', 'uva', 'morango', 'laranja']
    
    # escolhendo randomicamente uma palavra
    palavra = random.choice(palavras)
    
    # list comprehension
    letras_descobertas = ['_' for letra in palavra]
    
    # numero de chances para cada palavra - numero de tentativas
    chances = 6
    # obs: o numero de letras depende do numero de letras da maior palavra da lista
    
    # lista para as letras erradas
    letras_erradas = []
    
    # loop enquanto o número de chances for maior que zero
    while chances > 0:
        
        # mensagem para o usuario
        print(" ".join(letras_descobertas))
        print("\nChances restantes: ", chances)
        print("Letras erradas: ", " ".join(letras_erradas))
        
        # tentativa
        tentativa = input("\n Digite uma letra: ").lower()
        
        # condicional
        if tentativa in palavra:
            index = 0
            
            for letra in palavra:
                if tentativa == letra:
                    letras_descobertas[index] = letra
                index += 1
        
        else:
            chances -= 1
            letras_erradas.append(tentativa)
        
        # condicional final
        if "_" not in letras_descobertas:
            print("\n Você venceu, a palavra era: ", palavra)
            break
        
    
    if "_" in letras_descobertas:
        print("\n Você perdeu! A palavra era: ", palavra)

if __name__ == '__main__':
    game()
    print("\n Parabéns você está aprendendo Python na DSA!")


    
    