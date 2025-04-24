"""
Desenvolva um algoritmo que leia a velocidade do carro
e se ele estiver acima de 90 km alem dele ser multado
para cada km a mais, deverá pagar uma multa de 5 reais
por km acima dos 90. Se nao estiver, nao será multado.
"""
velocidade = float(input("Informe a velocidade do carro: "))

if velocidade > 90:
    multa = (velocidade - 90) * 5
    print(f"O veículo será multado em R$ {multa}")
else:
    print("O veículo está dentro do limite de velocidade!")
    