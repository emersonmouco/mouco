# funcoes

# 1. Para que serve as funcoes?

# funcoes que ja utilizamos anteriormente

"""

print() # -> Imprimir uma mensagem no terminal
input() # -> retorna um dado informado pelo usuário, possibilita que ele digie algo
len() # -> verificar quantos itens existem dentro de uma lista
max() # -> retorna o maior valor de uma lista

"""

# 2. Criando funcoes

# funcao inicial

# para criar uma funcao utilizo a palavra reservada def
def saudacao():
    print("Olá seja bem-vinda(o)!")
    print("É um prazer contar com você aqui!")
    
# para mostrar eu preciso chamar a funcao
saudacao()

# funcao com parametros
def saudacao_parametros(nome, curso):
    print(f"Seja bem-vinda(o), {nome}!")
    print(f"É um prazer contar com você neste curso de {curso}!")

saudacao_parametros("Emerson", "Python")

# funcao com parametros default
# quando utilizo parametros default
# quando eu chamar a funcao eu nao preciso mais passar 
# aquele parametro que está como default
# neste caso seria o parametro curso
def saudacao_parametros(nome, curso="Javascript"):
    print(f"Seja bem-vinda(o), {nome}!")
    print(f"É um prazer contar com você neste curso de {curso}!")

saudacao_parametros("Emerson")

# funcoes com retorno
# quando utilizo return na funcao, tudo que eu colocar após ele
# nao sera lido pela funcao
def soma(num1, num2):
    return num1 + num2

resultado = soma(2, 3)

print("O resultado da soma é ", resultado)

def calculadora(num1, num2, operacao = '+'):
    if operacao == '+':
        return num1 + num2
    elif operacao == '-':
        return num1 - num2
    elif operacao == '*':
        return num1 * num2
    elif operacao == '/':
        return num1 / num2

resultado2 = calculadora(10, 20)
print("O resultado é: ", resultado2)

