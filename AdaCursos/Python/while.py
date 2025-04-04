# while

# exemplo 1

numero_sorteado = 15

numero_escolhido = int(input("Digite um numero entre 1 e 20: "))

"""

if numero_sorteado == numero_escolhido:
    print("Voce acertou!")
else:
    print("Voce errou!")
   

 o problema no codigo acima é que ele só permitira uma execucao
 ou seja, nao conseguirá ter mais de uma tentativa 
"""

while numero_sorteado != numero_escolhido:
    print("Você errou! Tente novamente...")
    
    # se nao existir essa linha de codigo do numero_escolhido
    # ira criar um loop infinito
    numero_escolhido = int(input("Digite um numero entre 1 e 20: "))

print("Parabéns, você acertou!!!")

# exemplo com contador

contador = 0

while contador < 5:
    print(contador)
    
    contador = contador + 1
