# Desenvolva um algoritmo que leia o público
# total de um jogo e calcule a renda da partida
# de acordo com os setores
# popular = 10% do publico total a 5 reais
# geral = 50% do publico total a 10 reais
# arquibancada = 30% do publico total a 20 reais
# cadeiras = 10% do publico total a 30 reais

publico = int(input("Informe o público total do jogo: "))

popular = publico * 0.1 # 10% do publico total
geral = publico * 0.5 # 50% do publico total
arquibancada = publico * 0.3 # 30% do publico total
cadeiras = publico * 0.1 # 10% do publico total

renda = (popular * 5) + (geral * 10) + (arquibancada * 20) + (cadeiras * 30)

print(f"A renda total do jogo foi de R$ {renda:.2f}")






