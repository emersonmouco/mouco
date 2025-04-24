
# calculo do imc com funcao

# sempre que for criar uma função
# devemos colocar o def antes

# peso e altura sao os parametros da função
def calcular_imc(peso, altura):
    imc = peso / (altura ** 2) # ** 2 representa elevado ao quadrado
    if imc < 18.5:
        return f"IMC: {imc:.2f} (Abaixo do peso)"
    elif 18.5 <= imc < 24.9:
        return f"IMC: {imc:.2f} (Peso normal)"
    elif 25 <= imc < 29.9:
        return f"IMC: {imc:.2f} (Sobrepeso)"
    else:
        return f"IMC: {imc:.2f} (Obsidade)"

# entrada de dados pelo usuário
peso = float(input("Digite seu peso em kg: "))
altura = float(input("Digite sua altura em metros: "))
print(calcular_imc(peso, altura))
    
    
    
    
    
    
    
    
    
    
    
    
    