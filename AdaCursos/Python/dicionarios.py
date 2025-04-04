# dicionarios

# criando dicionarios
dicionario = {}

dicionario2 = dict() # posso usar essa funcao tb para criar um dicionario

# exemplo de dicionario com chave : valor
dicionario3 = {'nome' : 'Emerson', 'idade': 29, 'altura': 1.84}

print(dicionario3)

# para acessar um elemento do dicionario
print(dicionario3['nome'])
print(dicionario3['idade'])
print(dicionario3['altura'])

# adicionando elementos no dicionario
dicionario3['programador'] = True

print(dicionario3)

# iterando com o dicionario

"""
for variavel in dicionario3:
    print(variavel)
"""

for chave in dicionario3:
    print(chave, dicionario3[chave])
    
# testando a existencia de uma chave
print('peso' in dicionario3)
print('altura' in dicionario3)