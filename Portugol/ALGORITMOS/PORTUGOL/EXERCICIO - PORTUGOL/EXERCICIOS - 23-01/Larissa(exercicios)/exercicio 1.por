programa {
    {
    // Login fixo
    caractere LOGIN_CORRETO[10] = "admin"
    caractere SENHA_CORRETA[10] = "1234"

    funcao inicio()
    {
        se (realizar_login()) {
            escreva("\n##### TLSENAC Engenharia #####\n")
            cadastrar_funcionario()
        }
        senao {
            escreva("Login falhou! Encerrando o sistema.\n")
        }
    }

    // Função para realizar login
    funcao logico realizar_login()
    {
        caractere login[10], senha[10]
        inteiro tentativas = 3

        enquanto (tentativas > 0)
        {
            escreva("Digite o login: ")
            leia(login)
            escreva("Digite a senha: ")
            leia(senha)

            se (login == LOGIN_CORRETO && senha == SENHA_CORRETA)
            {
                escreva("Login realizado com sucesso!\n")
                retorne verdadeiro
            }
            senao
            {
                tentativas -= 1
                escreva("Login ou senha incorretos. Tentativas restantes: ", tentativas, "\n")
            }
        }
        retorne falso
    }

    // Função para cadastrar funcionário
    funcao cadastrar_funcionario()
    {
        caractere nome[50]
        inteiro cidade, num_filhos, plano_saude, vale_transporte, cargo
        real salario_bruto, acrescimos = 0, descontos = 0, salario_liquido

        escreva("Digite o primeiro nome do funcionário: ")
        leia(nome)

        escreva("\nEscolha a cidade de atuação:\n1 - Agua Escura\n2 - Campo Pequeno\n3 - Três Rios e Meio\n")
        leia(cidade)

        escreva("Número de filhos: ")
        leia(num_filhos)

        escreva("Possui plano de saúde? (1 - Sim, 2 - Não): ")
        leia(plano_saude)

        escreva("Recebe vale transporte? (1 - Sim, 2 - Não): ")
        leia(vale_transporte)

        escreva("\nEscolha o cargo:\n1 - Engenheiro (R$ 10.000,00)\n2 - Mestre de Obra (R$ 2.500,00)\n3 - Pedreiro (R$ 1.500,00)\n")
        leia(cargo)

        // Definição de salário bruto por cargo
        escolha (cargo)
        {
            caso 1:
                salario_bruto = 10000
                descontos += salario_bruto * 0.11 // INSS 11%
                pare
            caso 2:
                salario_bruto = 2500
                descontos += salario_bruto * 0.11 // INSS 11%
                acrescimos += salario_bruto * 0.10 // Periculosidade
                pare
            caso 3:
                salario_bruto = 1500
                descontos += salario_bruto * 0.10 // INSS 10%
                acrescimos += salario_bruto * 0.10 // Periculosidade
                pare
            caso contrario:
                escreva("Opção de cargo inválida.\n")
                retorne
        }

        // Benefícios
        descontos += salario_bruto * 0.11  // Ticket alimentação
        se (num_filhos > 0) acrescimos += salario_bruto * 0.05 * num_filhos  // Auxílio creche
        se (vale_transporte == 1) descontos += salario_bruto * 0.10  // Vale transporte
        se (plano_saude == 1) acrescimos += 400  // Plano de saúde

        // Cálculo do salário líquido
        salario_liquido = salario_bruto + acrescimos - descontos

        // Impressão dos dados cadastrados
        escreva("\n##### TLSENAC Engenharia #####\n")
        escreva("Nome: ", nome, "\n")
        escolha (cidade)
        {
            caso 1: escreva("Cidade de Atuação: Agua Escura\n") pare
            caso 2: escreva("Cidade de Atuação: Campo Pequeno\n") pare
            caso 3: escreva("Cidade de Atuação: Três Rios e Meio\n") pare
        }

        escreva("Salário Bruto: R$ ", salario_bruto, "\n")

        escreva("\nAcréscimos:\n")
        se (num_filhos > 0) escreva("Auxílio creche: R$ ", salario_bruto * 0.05 * num_filhos, "\n")
        se (plano_saude == 1) escreva("Plano de saúde: R$ 400,00\n")
        se (cargo == 2 ou cargo == 3) escreva("Periculosidade: R$ ", salario_bruto * 0.10, "\n")
        escreva("Total de Acréscimos: R$ ", acrescimos, "\n")

        escreva("\nDescontos:\n")
        escreva("INSS: R$ ", salario_bruto * (0.11 se cargo != 3 senao 0.10), "\n")
        escreva("Ticket Alimentação: R$ ", salario_bruto * 0.11, "\n")
        se (vale_transporte == 1) escreva("Vale Transporte: R$ ", salario_bruto * 0.10, "\n")
        escreva("Total de Descontos: R$ ", descontos, "\n")

        escreva("\nSalário Líquido: R$ ", salario_liquido, "\n")
    }
}
  }
}
