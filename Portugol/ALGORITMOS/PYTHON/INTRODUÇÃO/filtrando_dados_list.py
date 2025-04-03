# filtrando dados a partir de uma 
# list comprehension
# List comprehension é uma maneira
# de criar listas de forma rápida e que sejam iterativas


import pprint

def p(v):
    pprint.pprint(v, sort_dicts=False, width=40)

lista = []
for numero in range(10):
    lista.append(numero)

print(lista)

lista = [
    numero * 2
    for numero in range(10)
]

print(lista)


# mapeando os dados da lista
produtos = [
    {'nome':'Detergente', 'preco':2.20},
    {'nome':'Agua', 'preco':1.50},
    {'nome':'Arroz', 'preco':32.50},
]

print(produtos)

novos_produtos = [
    {**produto, 'preco':produto['preco'] * 1.05}
    if produto['preco'] > 20 else {**produto}
    for produto in produtos
    if (produto['preco'] >= 20 and produto['preco'] * 1.05) >10
]

p(novos_produtos)