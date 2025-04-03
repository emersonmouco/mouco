"""

Quando tivermos trabalhndo com um sistema maior
precisamos tratar melhor as exceções que ocorrem
é o que veremos agora

"""

try:
    a = 18
    b = 0
    print('Linha 1'[1000])
    c = a / b
    print('Linha 2')
except ZeroDivisionError as e:
    print("Você dividiu por zero!")
    print(e.__class__.__name__)
    print(e)
except NameError:
    print("Variavel B não está definida!")
except (TypeError, IndexError) as error:
    print("Type Error + Index Error")
    print("Mensagem: ", error)
    print("Nome: ", error.__class__.__name__)
except Exception:
    print("Parabéns, você conseguiu fazer um erro desconhecido!")

print("Continuar...")