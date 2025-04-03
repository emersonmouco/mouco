"""
Dicionarios em python

Os dicionários são uma estrutura de dados usada para armazenar pares de chave-valor. 
Os dicionários funcionam de forma similar as listas no Python
    só que você pode atribuir rótulos aos dados.

Com os dicionários podemos organizar os dados de 
    maneira que possamos acessá-lo de forma intuitiva e eficiente.

Ao contrário das listas, onde os elementos são 
    acessados por índices numéricos, os dicionários utilizam chaves únicas.


O valor pode ser de qualquer tipo, incluindo outro dicionário.
Usamos as chaves - {} - ou a classe dict para criar dicionários.
Imutáveis: str, int, float, bool, tuple
Mutável: dict, list

Exemplo: 

    'chave' : valor

pessoa = {
    'nome' : 'Emerson',
    'idade' : 30
}


"""

pessoa = {
    'nome' : 'Emerson',
    'sobrenome' : 'Mouco',
    'idade' : 30,
    'altura' : 1.84,
    'endereco' : [
        {
            'nome_endereco' : 'trabalho',
            'rua' : 'antonio trajano',
            'numero' : 123,
            'bairro' : 'centro'
        },
        {
            'nome_endereco' : 'casa',
            'rua' : 'alguma',
            'numero' : 1234,
            'bairro' : 'centro'
        },
    ],
}

print(pessoa)
print(pessoa['nome'],pessoa['sobrenome'])

print('\n\n\n')

for chave in pessoa:
    print(chave, pessoa[chave])