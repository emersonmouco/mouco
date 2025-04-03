programa {
  inteiro nr_agencia = 1, nr_conta = 1, nr_senha = 1
    real saldo = 1500.00, limite = 500.00, total = saldo + limite, saque, deposito, diferenca
    real operacao_credito[1000], operacao_debito[1000]
    caracter voltar
  funcao inicio() {
   
   inteiro senha, conta, agencia
   preencheVetor()
  faca{
     escreva("Informe o numero da agencia: ")
    leia(agencia)
    escreva("\n Informe o numero da conta: ")
    leia(conta)
    escreva("\ninforme a senha: ")
    leia(senha)
    limpa()
   }enquanto(nr_agencia != agencia ou nr_conta != conta ou nr_senha != senha)
   chama_menu()


  }

  funcao preencheVetor(){
  para(inteiro x = 0; x < 1000; x++){
    operacao_credito[x] = 0.0
  }
   para(inteiro x = 0; x < 1000; x++){
    operacao_debito[x] = 0.0
   }
  
  }

  funcao chama_menu(){
    inteiro op
    escreva("\nEscolha operação")
    escreva("\n1 - saldo")
    escreva("\n2 - extrato")
    escreva("\n3 - saque")
    escreva("\n4 - deposito")
    escreva("\n5 - sair")
    escreva("\nOpção: ")
    leia(op)
    limpa()
    escolha(op){
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
      fazer_deposito()
      pare
      caso 5:
      pare
      caso contrario:
      escreva("Opção inválida")
      chama_menu()
    }
    
  }

  funcao verifica_saldo(){
    faca{
        escreva("\n saldo:      R$ ", saldo)
        escreva("\nLimite:      R$ ", limite)
        escreva("\nDisponivel:  R$ ",total)
        escreva("\n----------------------")
        escreva("\nVoltador ao menu?  [S | N] ")
        leia(voltar)
        limpa()
        }enquanto(voltar != 'S')
    chama_menu()    
     }
  funcao verifica_extrato(){
     faca{
        escreva("\nExtrato")
        escreva("\n----------------------")
        para(inteiro x = 0; x < 1000; x++){
          se(operacao_credito[x] > 0){
            escreva("\nCredito:     R$", operacao_credito[x])
          }
        }
        para(inteiro x = 0; x < 1000; x++){
          se(operacao_debito[x] > 0){
            escreva("\nDebito:     R$", operacao_debito[x])
          }
        }
        escreva("\n saldo:      R$ ", saldo)
        escreva("\nLimite:      R$ ", limite)
        escreva("\nDisponivel:  R$ ",total)
        escreva("\n----------------------")
        escreva("\nVoltador ao menu?  [S | N] ")
        leia(voltar)
        limpa()
        }enquanto(voltar != 'S')
  }
  funcao faz_saque(){
    faca{
      escreva("\nInforme o valor do saque: ")
      leia(saque)
      diferenca = 0.0
      diferenca = saldo - saque
      se(diferenca < 0){
        escreva("\nNão é possivel sacar valor!")
        pare
      }
      saldo -= saque
      total = saldo + limite

      para(inteiro x = 0; x < 1000; x++){
        se(operacao_debito[x] == 0){
            operacao_debito[x] = saque
            pare
          }
      }
      escreva("\nDeseja realizar outro saque? [S | N] ")
      leia(voltar)
      limpa()
    }enquanto(voltar != 'N')
    chama_menu()
  }
  funcao fazer_deposito(){
    faca{
    escreva("\nInforme o valor do depósito: ")
    leia(deposito)
    saldo =+ deposito
    total = saldo +limite

    para(inteiro x = 0; x < 1000; x++){
      se(operacao_credito[x] == 0){
        operacao_credito[x] = deposito
        pare
      }
    }

    escreva("\ndeseja realizar outro deposito? [S | N] ")
    leia(voltar)
    limpa()
  }enquanto(voltar != 'N')
  chama_menu()
  }
}
