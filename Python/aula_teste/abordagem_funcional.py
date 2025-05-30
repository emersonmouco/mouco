precos_com_imposto = [110.0, 220.0, 330.0, 440.0]

precos_altos = list(filter(lambda p: p > 250, precos_com_imposto))
print(precos_altos)

