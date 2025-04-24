"""
Desenvolva um algoritmo utilizando função
que converta a temperatura entre Celcius e Fahrenheit
O usuario deve informar um valor para temperatura
e informar para qual que vai converter se é C (Celsius)
ou F (Fahrenheit).
"""

def converter_temperatura(temperatura, tipo):
    if tipo == 'C':
        return f"{temperatura}ºC é igual a {(temperatura * 9/5) + 32:.2f}ºF"
    elif tipo == 'F':
        return f"{temperatura}ºF é igual a {(temperatura - 32) * 5/9:.2f}ºC"
    else:
        return "Tipo inválido!. Use C para Celsius e F para Fahrenheit!"

temperatura = float(input("Informe uma temperatura: "))
tipo = input("Digite C para Celsius ou F para Fahrenheit: ").upper()
print(converter_temperatura(temperatura, tipo))










