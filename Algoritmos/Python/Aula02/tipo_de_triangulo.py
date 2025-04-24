# verifiar o triangulo

lado1 = float(input("Digite o primeiro lado: "))
lado2 = float(input("Digite o segundo lado: "))
lado3 = float(input("Digite o terceiro lado: "))

if lado1 == lado2 == lado3:
    print("Triângulo equilátero!") # tres lados iguais
elif lado1 == lado2 or lado1 == lado3 or lado2 == lado3:
    print("Triângulo isóceles!") # dois lados iguais
else:
    print("Triângulo escaleno!") # tres lados diferentes