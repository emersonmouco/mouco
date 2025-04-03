"""
Faça um programa que peça o primeiro nome do usuário. 
Se o nome tiver:
4 letras ou menos escreva "Seu nome é curto";
se tiver entre 5 e 6 letras,escreva "Seu nome é normal"; 
maior que 6 escreva "Seu nome é muito grande". 
"""

nome = input("Digite seu nome: ")
tamanho_nome = int(len(nome))

if tamanho_nome <= 4:
    print(f"O tamanho do seu nome é curto, contém apenas {tamanho_nome} letras.")
elif tamanho_nome > 4 and tamanho_nome <=6:
    print(f"O tamanho do seu nome é normal, contém {tamanho_nome} letras.")
else:
    print(f"O tamanho do seu nome é grande, contém {tamanho_nome} letras.")