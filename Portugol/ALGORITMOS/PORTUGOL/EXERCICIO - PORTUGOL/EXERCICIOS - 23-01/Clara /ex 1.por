programa {
  funcao inicio() {
    cadeia nome, cidade_atuacao
    inteiro cidade, num_filhos, plano_saude, vale_transporte, cargo
    real salario_bruto, ticket_alimentacao, auxilio_creche, vale_transporte_desc, plano_saude_adi, periculosidade, inss, salario_liquido
    real acressimos, descontos

    cadeia login = "admin"
    cadeia senha = "1234"
    cadeia login_usuario
    cadeia senha_usuario

    escreva("Digite o login: ")
    leia(login_usuario)
    escreva("Digite a senha: ")
    leia(senha_usuario)

    se (login_usuario <= login ou senha_usuario <= senha)
    escreva("Login ou senha incorretos!")
    

    escreva("Bem-vindo ao sistema da TLSENAC Engenharia!\n")
    escreva("Digite o nome do funcionário (somente o primeiro nome): ")
    leia(nome)
    escreva("Escolha a cidade de atuação (1 - Agua Escura, 2 - Campo Pequeno, 3 - Três Rios e Meio): ")
    leia(cidade)

    se (cidade == 1)
    cidade_atuacao == "Agua Escura"

    se (cidade == 2)
    cidade_atuacao == "Campo Pequeno"

    senao
    cidade_atuacao == "Três Rios e Meio"

    escreva("Número de filhos: ")
    leia(num_filhos)
    
    escreva("Plano de saúde? (1 - Sim, 2 - Não): ")
    leia(plano_saude)

    escreva("Vale Transporte? (1 - Sim, 2 - Não): ")
    leia(vale_transporte)
    escreva("Escolha o cargo (1 - Engenheiro, 2 - Mestre de Obra, 3 - Pedreiro): ")
    leia(cargo)

    se (cargo == 1){
    salario_bruto == 10000.00
    periculosidade == 0
    }

    se (cargo == 2){
    salario_bruto <= 2500.00
    periculosidade == 0.10 * salario_bruto
    }

    salario_bruto == 1500.00
    periculosidade == 0

    ticket_alimentacao == 0.11 * salario_bruto // 11% de desconto
    auxilio_creche == 0

    se (num_filhos > 0)
    auxilio_creche == 0.05 * salario_bruto * num_filhos // 5% por filho

    vale_transporte_desc == 0

    se (vale_transporte == 1)
    vale_transporte_desc == 0.10 * salario_bruto // 10% de desconto

    plano_saude_adi == 0

    se (plano_saude == 1)
    plano_saude_adi == 400.00 // R$ 400.00 de acréscimo

    inss == 0
    se (cargo == 1 ou cargo == 2)
        inss == 0.11 * salario_bruto // 11% para Engenheiro e Mestre de Obra
    senao
        inss == 0.10 * salario_bruto // 10% para Pedreiro

    acressimos == plano_saude_adi + auxilio_creche + periculosidade
    descontos == ticket_alimentacao + vale_transporte_desc + inss
    salario_liquido == salario_bruto + acressimos - descontos

    escreva("Nome: ", nome, "\n")
    escreva("Cargo: ", cargo, "\n")

    se (cargo == 1) "Engenheiro"

    senao 
    se (cargo == 2) "Mestre de Obra"
    
    senao 
    se (cargo == 3 ) "Pedreiro"

    escreva("Cidade de Atuação: ", cidade_atuacao, "\n")
    escreva("Salário Bruto: R$ ", salario_bruto, "\n")
    escreva("Acréscimos:\n")
    escreva("* Ticket Alimentação: R$ ", ticket_alimentacao, "\n")
    escreva("* Auxílio Creche: R$ ", auxilio_creche, "\n")
    escreva("* Vale Transporte: R$ ", vale_transporte_desc, "\n")
    escreva("* Plano de Saúde: R$ ", plano_saude_adi, "\n")
    escreva("* Periculosidade: R$ ", periculosidade, "\n")
    escreva("Total Acréscimos: R$ ", acressimos, "\n")
    
    escreva("Descontos:\n")
    escreva("* INSS: R$ ", inss, "\n")
    escreva("* Ticket Alimentação: R$ ", ticket_alimentacao, "\n")
    escreva("* Vale Transporte: R$ ", vale_transporte_desc, "\n")
    escreva("Total Descontos: R$ ", descontos, "\n")

    escreva("Salário Líquido: R$ ", salario_liquido, "\n")


  }
}
