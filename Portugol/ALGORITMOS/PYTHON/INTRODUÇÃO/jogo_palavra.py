"""
Faça um jogo para o usuário adivinhar qual a palavra secreta.

Você vai propor uma palavra secreta qualquer 
e vai dar a possibilidade para o usuário digitar apenas uma letra.

Quando o usuário digitar uma letra, você vai conferir
se a letra digitada está na palavra secreta.
    - Se a letra digitada estiver na
    palavra secreta; exiba a letra;
    - Se a letra digitada não estiver
    na palavra secreta; exiba *.

Faça a contagem de tentativas do seu usuário.
"""

import os

palavra_secreta = "senac"
letras_certas = ''
numero_tentativas = 0

while True:

    letra_digitada = input("Digite uma letra: ")
    numero_tentativas += 1

    # verifico a quantidade de letras digitas com a função len()
    if len(letra_digitada) > 1:
        print("Digite apenas uma letra!")
        continue

    if letra_digitada in palavra_secreta:
        letras_certas += letra_digitada
    
    palavra_formada = ''

    for letra_secreta in palavra_secreta:
        if letra_secreta in letras_certas:
            palavra_formada += letra_secreta
        else:
            palavra_formada += "*"
    
    print("Palavra formada: ",palavra_formada)

    if palavra_formada == palavra_secreta:
        os.system('clear')
        print("Você ganhou! Parabéns!!!")
        print("A palavra era ", palavra_secreta)
        print("Tentativas: ", numero_tentativas)
        letras_certas = ''
        numero_tentativas = 0