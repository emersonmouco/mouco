# definindo uma funcao
def primeiraFuncao():
    print("Hello world!")

primeiraFuncao()

# exemplo 2 primeiraFuncao
def primeiraFuncao():
    nome = "Emerson"
    print("Olá %s" %nome)

primeiraFuncao()
# segunda funcao
# funcao com parametro
def segundaFuncao(nome):
    print("Olá %s" %nome)

segundaFuncao('Emerson Mouco')

# funcao para imprimir numeros
def imprimeNumeros():
    
    # loop
    for i in range(0, 5):
        print("Número: " + str(i))
        
imprimeNumeros()

# funcao para somar numeros
def somaNumeros(num1, num2):
    soma = num1 + num2
    print("Primeiro número: " + str(num1))
    print("Segundo numero: " + str(num2))
    print("Soma dos números: " + str(soma))

somaNumeros(2, 3)

# funcao com numero variavel de argumentos
# é utilizada quando nao sei o numero total de argumentos 
# que irao ser passados como parametros na funcao
def printVarInfo(arg1, *vartuple):
    
    # imprimindo o valor do primeiro argumento
    print("O primeiro parâmetro passado foi: ", arg1)
    
    # imprimindo o valor do segundo argumento
    for item in vartuple:
        print("O(s) segundo(s) parâmetro(s) passado(s): ", item)
    return;

# chamando a funcao usando apenas 1 argumento
printVarInfo(10)

printVarInfo(10, "Chocolate", "Morango", "Data Science")


#### Escopo de variavel

# variavel global
variavel_global = 10

# funcao
def multiplicaNumeros(num1, num2):
    variavel_global = num1 * num2 # neste caso variavel_global é uma variavel local
    print(variavel_global)

multiplicaNumeros(1,5)
    
