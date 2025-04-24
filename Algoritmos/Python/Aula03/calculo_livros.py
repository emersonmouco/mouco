
"""
Desenvolva um algoritmo que leia a quantidade comprada de livros
se o cliente comprar ate 10 livros, cada livro custará 12 reais
se for maior que 10, custará 8 reais. 
Ao final mostre a quantidade comprada e o valor total pago por ele.
"""

numero_livros = int(input("Informe o número de livros comprados: "))

if numero_livros <= 10:
    total = numero_livros * 12
else:
    total = numero_livros * 8
    
print(f"Quantidade de livros comprados: {numero_livros}, preço total: R$ {total}")
