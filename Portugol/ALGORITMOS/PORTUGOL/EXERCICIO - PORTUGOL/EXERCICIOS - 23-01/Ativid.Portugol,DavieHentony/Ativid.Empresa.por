programa {


  funcao inicio() {
    logarSistema()
  }

  funcao logarSistema(){
    inteiro password
    cadeia login

    escreva("\nInforme o login: ")
    leia(login)
    escreva("\nInforme a senha: ")
    leia(password)
    

    limpa()
    cadastro()
  }

  funcao cadastro(){
    cadeia nome, cargo1, cidade_atuacao1
    inteiro cidade_atuacao, numero_filhos, plano_saude, vale_transporte, cargo
    real salario_bruto, Ticket_Alimentcao, Auxilio_Creche = 0
    real Vale_Transporte, Plano_de_Saude, Periculosidade, INSS

    escreva("Cadastro Do RH SENACTL Engenharia \n")
    escreva("Nome: \n")
    leia(nome)
    escreva("Cidade onde atua:\n[1-Agua Escura]\n[2-Campo Pequeno]\n[3-Três Rios e Meio]\n")
    leia(cidade_atuacao)
    escreva("\nNúmero de filhos: ")
    leia(numero_filhos)
    escreva("\nPlano de saúde: \n[1-Sim]\n[2-Não]\n")
    leia(plano_saude)
    escreva("\nVale transporte: \n[1-Sim]\n[2-Não]\n")
    leia(vale_transporte)
    escreva("\nCargo: \n[1 - Engenheiro]\n[2 - Mestre de obras]\n[3 - Pedreiro]\n")
    leia(cargo)

    se(cidade_atuacao == 1){
      cidade_atuacao1 = "Agua Escura"
    }senao se(cidade_atuacao == 2){
      cidade_atuacao1 = "Campo Pequeno"
    }senao{
      cidade_atuacao1 = "Três Rios e Meio"
    }

    se(cargo == 1){
      salario_bruto = 10000
      cargo1 = "Engenheiro"
      Periculosidade = 0
      INSS = salario_bruto * 0.11
    }senao se(cargo == 2){
      salario_bruto = 2500
      cargo1 = "Mestre de Obras"
      Periculosidade = salario_bruto * 0.10
      INSS = salario_bruto * 0.11
    }senao{
      salario_bruto = 1500
      cargo1 = "Pedreiro"
      Periculosidade = salario_bruto * 0.10
      INSS = salario_bruto * 0.11
    }

    Ticket_Alimentcao = salario_bruto * 0.11

    escolha(numero_filhos){
      caso 0:
      Auxilio_Creche = 0
      pare
      caso 1:
      Auxilio_Creche = salario_bruto * 0.05
      pare
      caso 2:
      Auxilio_Creche = (salario_bruto * 0.05) * 2
      pare
      caso 3:
      Auxilio_Creche = (salario_bruto * 0.05) * 3
      pare
      caso 4:
      Auxilio_Creche = (salario_bruto * 0.05) * 4
      pare
      caso 5:
      Auxilio_Creche = (salario_bruto * 0.05) * 5
      pare
      caso contrario:
      escreva("\nERRO!!!\n")
    }

    se(vale_transporte == 1){
      Vale_Transporte = salario_bruto * 0.10
    }senao{
      Vale_Transporte = 0
    }

    se(plano_saude == 1){
      Plano_de_Saude = 400
    }senao{
      Plano_de_Saude = 0
    }

    montar_tela(
      nome,
      cargo1,
      cidade_atuacao1,
      salario_bruto,
      Auxilio_Creche,
      Periculosidade,
      Plano_de_Saude,
      Ticket_Alimentcao,
      INSS, 
      Vale_Transporte
    )
  }  
    funcao montar_tela(
      cadeia nome,
      cadeia cargo1,
      cadeia cidade_atuacao1,
      real salario_bruto,
      real Auxilio_Creche,
      real Periculosidade,
      real Plano_de_Saude,
      real Ticket_Alimentcao,
      real INSS, 
      real Vale_Transporte
    ){
      real Acrescimo = 0
      real Desconto = 0
      
      escreva("##########")
      escreva("\n CADASTRO PESSOAL SENACTL Engenharia \n")
      escreva("\n##########")
      escreva("\nNome: ", nome)
      escreva("\nCargo: ", cargo1)
      escreva("\nCidade de atuação: ",cidade_atuacao1)
      escreva("\nSalário bruto: R$ ",salario_bruto)
      escreva("\nAcréscimos: ")
      se(Auxilio_Creche > 0){
        escreva("\nAuxílio creche: R$ ", Auxilio_Creche)
      }
      se(Periculosidade > 0){
        escreva("\nPericulosidade: R$ ", Periculosidade)
      }
      se(Plano_de_Saude > 0){
        escreva("\nPlano de saúde: R$ ",Plano_de_Saude)
      }
      se(Auxilio_Creche == 0 e Periculosidade == 0 e Plano_de_Saude == 0){
        escreva("\nFuncionário sem acréscimos!")
      }senao{
        Acrescimo = Auxilio_Creche + Periculosidade + Plano_de_Saude
        escreva("\nTotal de acréscimos: R$ ", Acrescimo)
      }

      escreva("\nDescontos: \n")
      escreva("\nTicket Alimentação: R$ ",Ticket_Alimentcao)
      escreva("\nINSS: R$ ",INSS)
      se(Vale_Transporte > 0){
        escreva("\nVale transporte: R$ ",Vale_Transporte)
      }

      Desconto = Ticket_Alimentcao + INSS + Vale_Transporte
      escreva("\nTotal de descontos: R$ ",Desconto)
      escreva("\nSalário Líquido: R$ ",salario_bruto + Acrescimo - Desconto)
  }
}
