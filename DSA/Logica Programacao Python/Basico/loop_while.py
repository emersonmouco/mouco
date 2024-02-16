# while difere do for pela verificacao da condicao
# no for ele entra pelo menos uma vez no loop
# no while ele só entra se a condicao for verdadeira

# é possivel usar a clausula else para encerrar o loop while
x = 0 

while x < 10:
    print("O valor de X nesta iteracao é: ", x)
    print("X ainda é menor que 10, somando +1 a X")
    x += 1

else:
    print("Loop concluído!")

print(x)

# outras formas de manipular o loop while
# pass, break e continueß

valor = 0
while valor < 10:
    if valor == 4:
        break
    else:
        pass
    print(valor)
    valor += 1
    
# desconsiderando a letra Z ao imprimir os caracteres de uma frase

for letra in "Python é zzz incrível!!!":
    if letra == "z":
        continue
    print(letra)