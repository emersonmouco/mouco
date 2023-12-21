"""

Exiba "Bem-vindo ao Calculador de Área de Paralelogramo"
Peça para o usuário inserir o comprimento da base
Armazene o comprimento da base em uma variável
Peça para o usuário inserir a altura
Armazene a altura em uma variável
Calcule a área do paralelogramo:  base * altura
Armazene o resultado em uma variável
Exiba o resultado


"""

# calcular a área de um paralelograma

"""

print("Bem-vindo ao calculador de área de paralelograma")

base = float(input("Insira o comprimento da base: "))

altura = float(input("Insira a altura: "))

area = base * altura

print("A área do paralelograma é: ", area)

"""

#######

## Pseudocódigo 2 - Calculadora Simples

"""

Inicie

    Exiba "Bem-vindo à Calculadora"
    Peça para o usuário inserir o primeiro número
    Armazene o primeiro número em uma variável
    Peça para o usuário inserir o segundo número
    Armazene o segundo número em uma variável
    Peça para o usuário selecionar uma operação (+, -, *, /)
    Armazene a operação em uma variável
    Utilize a operação selecionada e os números armazenados para realizar o cálculo
    Exiba o resultado

Fim

"""

"""

print("Bem-vindo a calculadora")

num1 = float(input("Insira o primeiro número: "))
num2 = float(input("Insira o segundo número: "))
operacao = input("Selecione uma operação (+, -, *, /): ")

if operacao == "+":
    resultado = num1 + num2
    print("Resultado da soma é: ", resultado)
elif operacao == "-":
    resultado = num1 - num2
    print("Resultado da subtração é: ", resultado)
elif operacao == "*":
    resultado = num1 * num2
    print("Resultado da multiplicação é: ", resultado)
elif operacao == "/":
    resultado = num1 - num2
    print("Resultado da divisão é: ", resultado)
else:
    print("Operação inválida!")

"""



## Pseudocódigo 3 - Algoritmo Bubble Sort

"""
Bubble Sort é um algoritmo de ordenação simples que funciona comparando cada elemento com o próximo, e trocando-os de lugar se eles estiverem em ordem incorreta. O algoritmo repete esse processo várias vezes, até que todos os elementos estejam ordenados. A cada passagem, o maior elemento "flutua" para o final do array, como uma bolha, dando origem ao nome do algoritmo.

Inicie
    
    Para cada elemento i no array de tamanho n
        Para cada elemento j no array de tamanho n - 1
            Se elemento i for maior que elemento j
                Troque os elementos i e j
    Exiba o array ordenado

Fim


"""

# Considere esta lista como exemplo para ordenação com o Bubble sort
lista = [6, 3, 12, 7]

# Primeira passada do algoritmo (troca os elementos 6 e 3 de lugar)
lista = [3, 6, 12, 7]

# Segunda passada do algoritmo (não tem troca entre 6 e 12)
lista = [3, 6, 12, 7]

# Terceira passada do algoritmo (troca os elementos 12 e7 de lugar)
lista = [3, 6, 7, 12]

# convertendo o pseudocogio para linguagem de programacao

lista = [6,7,8,3,10,19,4,1,0,61,30,16,17,82,29,34,43,21,11,39,56,67,12]

def bubble_sort(arr):
    
    n = len(arr)
    
    # Para cada elemento i do array
    for i in range(n):
    
        # Para cada elemento j do array
        for j in range(0, n-i-1):
        
            # Se elemento i for maior que elemento j
            if arr[j] > arr[j+1]:
            
                # Troque os elementos i e j
                arr[j], arr[j+1] = arr[j+1], arr[j]
    
    return arr


print(lista)
print(bubble_sort(lista))