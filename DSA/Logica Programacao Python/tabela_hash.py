# criando uma tabela hash

# para cirar uma tabela hash em python
# utilizamos a funcao dict()

# Cria um dicionáro vazio
dicionario = dict()
# Adiciona pares de chaves/valores ao dicionário
# As letras são as chaves e os números os valores
dicionario['a'] = 1
dicionario['b'] = 2
dicionario['c'] = 3

# Podemos imprimir o dicionário
print(dicionario)

# Ou imprimir um valor com base em sua chave
print(dicionario['b'])

# Podemos usar um loop e imprimir as chaves
for chave in dicionario.keys():
    print(dicionario[chave])
    # Podemos usar um loop e imprimir os pares chave/valor
for chave, valor in dicionario.items():
    print (chave, ':', valor)