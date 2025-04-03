# manipulando dados em dicionarios

pessoa = {}

chave = 'nome'
pessoa[chave] = 'Emerson'
pessoa['sobrenome'] = 'Mouco'

print(pessoa[chave])

pessoa[chave] = 'Senac'
pessoa['sobrenome'] = 'Tres Lagoas'

print(pessoa[chave])

del pessoa['sobrenome']

if pessoa.get('sobrenome') is None:
    print("Não existe essa chave!")
else:
    print(pessoa['sobrenome'])

"""
métodos úteis dos dicionarios

len -> quantidade de chaves
keys -> iteratividade com as chaves
values -> itaratividade com os valores
items -> iteratividade com chave e valor
setdefault -> adiciona valor se a chave não existir
copy -> retorna uma cópia rasa 
get -> obtém uma chave
pop -> apaga um item com a chave especificada (pode ser del tb)
popitem -> apaga o último item adicionado ao dicionario
update -> atualiza o dicionario com outro item


"""