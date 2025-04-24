# tipos de dados
# no python nao precisa declarar variavel

# inteiro, qualquer numero positivo ou negativo
print(type(25))
print(type(-25))

# float, qualquer número positivo ou negativo com casas decimais
print(type(25.50))
print(type(-25.50))

# string - str
print(type("Hello world!"))
print("Hello world")
print("Hello"+"world")
print("Hello","world")

print(type(1),type(2.2),type("Hello"))

# tipos boolean
print(10 == 10)
print(10 != 10)
print(type(True))
print(type(False))

# conversao
print('1') # string
print(int('123')) # convertendo string para inteiro
print(type(int('123'))) # conversao e verificando o tipo do dado
print(str(123)) # convertendo numero inteiro para string
print(type(str(123)))

# variaveis
# variaveis sao alocações de espaço na memória do computador
nome = "Emerson"
sobrenome = "Mouco"
idade = 31
print("Olá ",nome," ",sobrenome,", sua idade é: ",idade)

x = 10
y = 15
soma = x + y
print("O resultado da soma de X + Y é: ",soma)
multiplicacao = x * y
print("O resultado da multiplicação de x e y é: ",multiplicacao)

# exercicio
# mostre o seu nome, idade, ano de nascimento e altura
# atraves de variáveis
nome = "Emerson Mouco"
idade = 31
anoNascimento = 1994
altura = 1.84
print("Olá ",nome,"sua idade é: ",idade,
    ", seu ano de nascimento é: ",anoNascimento,", e sua altura é: ",altura)







