# lacos de repeticao

"""

1 - Define e inicializa a variável soma com 0.
2 - Para cada valor de i começando por 1, repetimos por n vezes:
2.1 - A variável soma recebe seu próprio valor mais i
3 - Retorna soma


"""

def soma(n):
    soma = 0
    for i in range(n+1):
        soma = soma + i
    return soma

resultado = soma(5)

print("Resultado da funcao soma: ", resultado)

# outra opcao é utilizar o loop while

def soma_while(n):
    soma = 0
    i = 1
    while i <= n:
        soma = soma + i
        i = i + 1
    return soma

resultado = soma_while(5)

print("Resultado da funcao soma_while(5): ", resultado)

resultado = soma_while(1000)

print("Resultado da funcao soma_while(1000): ", resultado)

"""

Consideracoes

1 - No Loop For, SEMPRE entraremos no Loop e executaremos a instrução pelo menos uma vez 
    e saímos do Loop quando a condição chegar ao fim.
2 - No  Loop  While, SOMENTE  entraremos  no  Loop  se  a  condição  for  verdadeira.  
    E  somente sairemos do Loop quando a condição se tornar falsa.
3 - Observe  ainda  que  devemos  inicializar  i  antes  do  Loop  While.  No  Loop  For  isso  não  é 
    necessário, embora possa ser feito


Por  isso,  cabe  ao  programador,  garantir  que  em  algum  momento  a  condição  mude  dentro  do 
Loop,  e  assim  colocamos  i  =  i  +  1,  pois  em  algum momento  i  deixará  de  ser  menor 
que  n  e  a condição passará a ser falsa.


"""