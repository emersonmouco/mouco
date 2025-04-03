"""

repetições
while

executa uma ação enquanto a condição for verdadeira
se não houver algo que torne a condição falsa, 
ficará um loop infinito

"""

condicao = True

while condicao:
    nome = input("Digite seu nome: ")
    print(f"Seu nome é: {nome}")

    if nome == "sair":
        break

print("Laço encerrado!")