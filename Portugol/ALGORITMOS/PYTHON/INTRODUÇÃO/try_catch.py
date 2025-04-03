
"""
Try catch ou try except no python

try -> tentar executar o código
        caso funcione corretamente, não acontecerá nada de anormal

except -> quando houver algum problema dentro do try ou fora dele que possa impactar 
            o funcionamento do código, existe o except (exceção) para enviar
            uma mensagem ao usuário do que pode estar causando o erro

"""

numero = input("Digite um número: ")

try:
    numero_float = float(numero)
    print('Float: ', numero_float)
    print(f'O dobro de {numero} é {numero_float * 2:.2f}')
except:
    print("Isso não é um erro, é um aviso de exceção!")





