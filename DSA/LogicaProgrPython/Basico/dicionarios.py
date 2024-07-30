# isso é uma lista

estudantes_lista = ['Pedro', 24, 'Ana', 22, 'Ronaldo', 'Janaina', 25]

print("Lista: ",estudantes_lista)

# isso é um dicionario
estudantes_dicionario = {"Pedro":24, "Ana":22, "Ronaldo":26, "Janaina":25}

print("Dicionario: ", estudantes_dicionario)

# imprimindo um valor da chave do dicionario
print("Idado do Pedro: ", estudantes_dicionario["Pedro"])

# adicionando uma chave e um valor no dicionario
estudantes_dicionario["Marcelo"] = 23

print("Dicionario atualizado com o Marcelo: ",estudantes_dicionario)

# limpar o dicionario
estudantes_dicionario.clear()

# no caso acima ele nao deleta A VARIAVEL, deleta somente o conteúdo
# para deletar a variavel com tudo dentro usamos o metodo del
del estudantes_dicionario

estudantes = {"Pedro":24, "Ana":22, "Ronaldo":26, "Janaina":25}

# saber o tamanho do dicionario
len(estudantes)

# imprimindo as chaves do dicionario
print(estudantes.keys())

# imprimindo os valores do dicionario
print(estudantes.values())

# imprimindo os itens dicionario
# um item no dicionario é o conjunto chave:valor
print(estudantes.items())


estudantes_2 = {"Camila":27, "Adriana":28, "Roberta":26}

print(estudantes_2)


# fazendo um update no primeiro dicionario
# atualizando o primeiro dicionario com os itens do segundo
estudantes.update(estudantes_2)

print(estudantes)

# dicionario de listas
dicionario_listas = {"chave 1": 1230, "chave 2": [22,453,73,4], "chave 3":['picanha', 'fraldinha', 'alcatra']}