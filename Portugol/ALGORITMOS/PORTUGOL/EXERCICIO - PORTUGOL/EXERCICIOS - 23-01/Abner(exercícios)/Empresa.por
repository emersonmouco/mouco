programa
{
    funcao inicio()
    {
        
        cadeia usuario = "abner"
        cadeia senha = "1234"

        
        escreva("Bem-vindo ao sistema da Fortes Engenharia!\n")
        cadeia userInput, passInput
        escreva("Digite o usuário: ")
        leia(userInput)
        escreva("Digite a senha: ")
        leia(passInput)

        se (userInput != usuario ou passInput != senha) {
            escreva("Usuário ou senha incorretos. Encerrando o programa.\n")
            retorne 
        }

        
        cadeia nome
        inteiro cidade, numFilhos, planoSaude, valeTransporte, cargo
        real salarioBruto, salarioLiquido, totalAcrecimos = 0, totalDescontos = 0
        real descontoVale = 0 

        escreva("Digite o primeiro nome do funcionário: ")
        leia(nome)

        escreva("Escolha a cidade de atuação (\n1 - Agua Escura,\n 2 - Campo Pequeno,\n 3 - Três Rios e Meio): ")
        leia(cidade)

        escreva("Digite o número de filhos: ")
        leia(numFilhos)

        escreva("Plano de Saúde? (1 - Sim, 2 - Não): ")
        leia(planoSaude)

        escreva("Vale Transporte? (1 - Sim, 2 - Não): ")
        leia(valeTransporte)

        escreva("Escolha o cargo (1 - Engenheiro, 2 - Mestre de Obra, 3 - Pedreiro): ")
        leia(cargo)

       
        escolha (cargo)
        {
            caso 1:
                salarioBruto = 10000
            caso 2:
                salarioBruto = 2500
            caso 3:
                salarioBruto = 1500
        }

        real descontoTicket = salarioBruto * 0.11
        totalDescontos += descontoTicket

        real acrescimoCreche = numFilhos * (salarioBruto * 0.05)
        totalAcrecimos += acrescimoCreche

        se (valeTransporte == 1) {
            descontoVale = salarioBruto * 0.10
            totalDescontos += descontoVale
        }

        se (planoSaude == 1) {
            totalAcrecimos += 400
        }

        real acrescimoPericulosidade = 0
        se (cargo == 2 ou cargo == 3) {
            acrescimoPericulosidade = salarioBruto * 0.10
            totalAcrecimos += acrescimoPericulosidade
        }

        real descontoINSS
        se (cargo == 1 ou cargo == 2) {
            descontoINSS = salarioBruto * 0.11
        } senao {
            descontoINSS = salarioBruto * 0.10
        }
        totalDescontos += descontoINSS

        salarioLiquido = salarioBruto + totalAcrecimos - totalDescontos

        escreva("Nome: ", nome, "\n")
        escreva("Cargo: ", escolhaCargo(cargo), "\n")
        escreva("Cidade de Atuação: ", escolhaCidade(cidade), "\n")
        escreva("Salário Bruto: R$ ", salarioBruto, "\n")
        escreva("Acréscimos:\n")
        se (numFilhos > 0) {
            escreva("  - Auxílio Creche: R$ ", acrescimoCreche, "\n")
        }
        se (planoSaude == 1) {
            escreva("  - Plano de Saúde: R$ 400\n")
        }
        se (cargo == 2 ou cargo == 3) {
            escreva("  - Periculosidade: R$ ", acrescimoPericulosidade, "\n")
        }
        escreva("  Total de Acréscimos: R$ ", totalAcrecimos, "\n")

        escreva("Descontos:\n")
        escreva("  - Ticket Alimentação: R$ ", descontoTicket, "\n")
        se (valeTransporte == 1) {
            escreva("  - Vale Transporte: R$ ", descontoVale, "\n")
        }
        escreva("  - INSS: R$ ", descontoINSS, "\n")
        escreva("  Total de Descontos: R$ ", totalDescontos, "\n")

        escreva("Salário Líquido: R$ ", salarioLiquido, "\n")
    }

    funcao cadeia escolhaCargo(inteiro cargo)
    {
        escolha (cargo)
        {
            caso 1: retorne "Engenheiro"
            caso 2: retorne "Mestre de Obra"
            caso 3: retorne "Pedreiro"
        }
        retorne "Indefinido"
    }

    funcao cadeia escolhaCidade(inteiro cidade)
    {
        escolha (cidade)
        {
            caso 1: retorne "Agua Escura"
            caso 2: retorne "Campo Pequeno"
            caso 3: retorne "Três Rios e Meio"
        }
        retorne "Indefinida"
    }
}
