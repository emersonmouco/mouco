# verificar se um numero é primo
# por função

def verifica_numero_primo(numero):
    if numero <= 1:
        return False
    else:
        for i in range(2, int(numero ** 0.5) + 1):
            if numero % 1 == 0: 
                return False
        return True

numero = int(input("Informe um número: "))

if verifica_numero_primo(numero):
    print(f"O número {numero} é primo!")
else:
    print(f"O número {numero} não é primo!")
    