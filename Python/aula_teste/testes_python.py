
nome = input("Informe seu nome: ")
email = input("Informe seu e-mail: ")
senha = input("Informe sua senha: ")

def cadastrar(nome, email, senha):
    if len(nome) < 3:
        return "Erro: Nome deve ter pelo menos 3 caracteres"
    if '@' not in email or '.' not in email:
        return "Erro: Email inválido"
    if len(senha) < 6:
        return "Erro: Senha deve ter pelo menos 6 caracteres"
    return "Cadastro aceito"


print(cadastrar(nome, email, senha))