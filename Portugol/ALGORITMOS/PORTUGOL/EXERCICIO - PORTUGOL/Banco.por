programa {

  inteiro numero_agencia = 1, numero_conta = 1, numero_senha = 1
  real saldo = 1500.00, limite = 500.00, total = saldo + limite
  real saque, deposito, diferenca
  real operacao_credito[1000], operacao_debito[1000]
  caracter voltar

  funcao inicio() {
    inteiro agencia, conta, senha
    preencherVetores()

    faca{
      escreva("Informe o número da agência: ")
      leia(agencia)
      escreva("Informe o número da conta: ")
      leia(conta)
      escreva("Informe a senha: ")
      leia(senha)
    }enquanto((numero_agencia != agencia) ou (numero_conta != conta) ou (numero_senha != senha))
    menu_banco()
  }

  funcao preencherVetores(){
    inteiro x
    para(x=0; x<1000; x++){
      operacao_credito[x] = 0.0
    }

    para(x=0; x<1000; x++){
      operacao_debito[x] = 0.0
    }
  }

  funcao menu_banco(){
    inteiro operacao
    escreva("\nEscolha uma operação\n")
    escreva("\n1 - Saldo ")
    escreva("\n2 - Extrato ")
    escreva("\n3 - Saque ")
    escreva("\n4 - Depósito ")
    escreva("\n5 - Sair ")
    escreva("\nOpção: \n ")
    leia(operacao)
    limpa()

    escolha(operacao){
      caso 1:
      verifica_saldo()
      pare
      caso 2:
      verifica_extrato()
      pare
      caso 3:
      faz_saque()
      pare
      caso 4:
      faz_deposito()
      pare
      caso 5:
      pare
      caso contrario:
      escreva("Opção inválida!")
      menu_banco()
    }
  }

  funcao verifica_saldo(){
    faca{
      escreva("\nSaldo: R$ ",saldo)
      escreva("\nLimite: R$ ",limite)
      escreva("\nDisponível: R$ ",total)
      escreva("\n----------------------\n")
      escreva("Voltar ao menu? [S] ou [N]\n")
      leia(voltar)
      limpa()
    }enquanto(voltar != "S")
    menu_banco()
  }

  funcao verifica_extrato(){
    
    faca{
      escreva("\nExtrato\n")
      escreva("-----------------------\n")
      para(inteiro x=0; x<1000; x++){
        se(operacao_credito[x]>0){
          escreva("\nCrédito: R$ ",operacao_credito[x])
        }
      }

      para(inteiro x=0; x<1000; x++){
        se(operacao_debito[x]>0){
          escreva("\nDébito: R$ ",operacao_debito[x])
        }
      }

      escreva("\nSaldo: R$ ",saldo)
      escreva("\nLimite: R$ ",limite)
      escreva("\nDisponível: R$ ",total)
      escreva("\n----------------------\n")
      escreva("Voltar ao menu? [S] ou [N]\n")
      leia(voltar)
      limpa()
    }enquanto(voltar != "S")
    menu_banco()
  }

  funcao faz_saque(){
    faca{
      escreva("\nInforme o valor do saque: R$ ")
      leia(saque)
      diferenca = 0.0
      diferenca = saldo - saque
      se(diferenca < 0){
        escreva("\nNão é possível sacar o valor!")
        pare
      }

    saldo -= saque
    total = saldo + limite
    para(inteiro x=0; x<1000; x++){
      se(operacao_debito[x] == 0){
        operacao_debito[x] = saque
        pare
      }
    }

    escreva("\nDeseja realizar outro saque? [S] ou [N]")
    leia(voltar)
    limpa()
    }enquanto(voltar != "N")
    menu_banco()
  }

  funcao faz_deposito(){
    faca{
      escreva("\nInforme o valor do depósito: R$ ")
      leia(deposito)
      saldo += deposito
      total = saldo + limite

      para(inteiro x=0; x<1000;x++){
        se(operacao_credito[x] == 0){
          operacao_credito[x] = deposito
          pare
        }
      }

    escreva("\nDeseja realizar outro deposito? [S] ou [N]")
    leia(voltar)
    limpa()
    }enquanto(voltar != "N")
    menu_banco()
  }
}
