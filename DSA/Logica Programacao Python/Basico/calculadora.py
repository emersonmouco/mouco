print("##### Calculadora em Python ######")

print("Selecione uma opção desejada! \n")

print("1- Soma")
print("2- Subtração")
print("3- Multiplicação")
print("4- Divisão \n")

opcao = int(input("Digite a opção desejada: (1, 2, 3 ou 4): "))

valor1 = int(input("Digite o primeiro numero: "))
valor2 = int(input("Digite o segundo numero: "))

if opcao == 1:
    soma = valor1 + valor2
    print(" %d " % valor1 + "+ %d " % valor2 + "= %d" % soma)
elif opcao == 2:
    sub = valor1 - valor2
    print(" %d " % valor1 + "- %d " % valor2 + "= %d" % sub)
elif opcao == 3:
    mult = valor1 * valor2
    print(" %d " % valor1 + "* %d " % valor2 + "= %d" % mult)
elif opcao == 4:
    div = valor1 / valor2
    print(" %d " % valor1 + "/ %d " % valor2 + "= %d" % div)
else:
    print("Opcao inválida!")