# calculadora simples

num1 = float(input("Digite o primeiro numero: "))
num2 = float(input("Digite o segundo numero: "))

operacao = input("Digite a operacao desejada: (+, -, *, /): ")

if operacao == '+':
    resultado = num1 + num2
    print("Resultado: ",resultado)
elif operacao == '-':
    resultado = num1 - num2
    print("Resultado: ",resultado)
elif operacao == '*':
    resultado = num1 * num2
    print("Resultado: ",resultado)
elif operacao == '/':
    if num2 != 0:
        resultado = num1 / num2
        print("Resultado: ",resultado)
    else:
        print("Não é possível dividir por zero!")
else:
    print("Operação inválida!")