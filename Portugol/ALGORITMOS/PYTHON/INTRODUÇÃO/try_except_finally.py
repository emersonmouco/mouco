"""

try
except
finally

"""

try:
    print("Abrir arquivo")
    a = 10
    b = 0
    c = a/b
except ZeroDivisionError as e:
    print(e.__class__.__name__)
    print("Mensagem: ", e)
    print("Você dividiu por zero!")
except IndexError as error:
    print("Index Error")
except(NameError, ImportError):
    print("Name error, Import Error")
else:
    print("Não houve erro!")
finally:
    print("Fechar arquivo!")
