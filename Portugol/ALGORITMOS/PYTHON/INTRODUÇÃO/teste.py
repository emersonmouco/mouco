
"""

No portugol nós utilizavamos 
Escreva e leia 
escreva para poder mostrar a mensagem para o usuario
leia para armazenar o dado fornecido pelo usuario

"""

# no python utilizamos a função input()  
# para receber algo digitado pelo usuario e armazenar 

print("Olá mundo")
nome = input("Digite o seu nome: ")

print(nome)

# no python não temos {} para delimitar o início e fim de uma função
# por isso é importante nos atentarmos a identação do código
# a tabulação, os espaços que tem entre uma linha e outra
# caso não esteja na mesma identação, irá dar erro

# if else - se... senao...
entrada = input("Você quer entrar ou sair do sistema?")

if entrada == "entrar":
    print("Você entrou no sistema!")
elif entrada == "sair":
    print("Você saiu do sistema!")
else:
    print("Opção inválida!")
