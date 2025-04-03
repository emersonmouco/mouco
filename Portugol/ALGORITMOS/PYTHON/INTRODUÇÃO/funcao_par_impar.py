# crie uma função
# que retorne se o número é impar ou par

def par_impar(numero):
    if numero % 2 ==0:
        return "par"
    else:
        return "impar"

numero = int(input("Digite um número inteiro: "))
print(f"O número {numero} é",par_impar(numero))
