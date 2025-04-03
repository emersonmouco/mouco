programa {
  funcao inicio() {
    inteiro agencia,conta,opcao
    cadeia confirma
    cadeia senha
    real saldo, limite, valor
    cadeia extrato[100]
    inteiro cExtrato,loop=1
    inteiro i


    real saldo=1500.0
    real limite=500.0
    cExtrato=0
    login(agencia,conta,senha)
    faca
    {
      exibirmenu()
      escreva("\nEscolha uma opção (1-5): ")
      leia(opcao)
      se(opcao==1)
      {
        limpa()
        mostrarsaldo(saldo,limite)
        escreva("\naperte Enter para continuar ")
        leia(confirma)
        limpa()
      }
      senao se(opcao==2)
      {
        limpa()
        mostrarextrato(extrato,cExtrato)
        escreva("\naperte Enter para continuar ")
        leia(confirma)
        limpa()
      }
      senao se(opcao==3)
      {
        limpa()
        saque(saldo,extrato,cExtrato,valor,limite)
        escreva("\naperte Enter para continuar ")
        leia(confirma)
        limpa()
      }
      senao se(opcao==4)
      {
        limpa()
        deposito(valor,saldo,extrato,cExtrato)
        escreva("\naperte Enter para continuar ")
        leia(confirma)
        limpa()
      }
      senao se (opcao == 5)
      {
        limpa()
        escreva("\nSaindo... Até logo!\n")
        pare
      }
      senao
      {
        limpa()
        escreva("\nOpção inválida! Tente novamente.\n")
        leia(confirma)
        limpa()
      }

    }
    enquanto(1==1)
  }
  funcao exibirmenu()
  {
    escreva(">>>>>Caixa Eletronico<<<<<")
    escreva("\n[1] -- saldo")
    escreva("\n[2] -- Extrato")
    escreva("\n[3] -- Saque")
    escreva("\n[4] -- Depósito")
    escreva("\n[5] -- Sair")
  }
  funcao mostrarsaldo(real saldo, real limite)
  {
    escreva("\nSaldo atual: R$ ", saldo, "\n")
    escreva("Limite disponível: R$ ", limite, "\n")
  }
  funcao mostrarextrato(cadeia extrato[], inteiro &cExtrato)
  {
    inteiro i
    se(cExtrato==0)
    {
      escreva("\nNenhuma transação realizada ainda:\n")
    }
    senao
    {
      escreva("\nExtrato de transações:\n")
      para (i=0;i<=cExtrato;i++)
      {
      escreva(extrato[i], "\n")
      }
    }
  }
  funcao saque(real &saldo, cadeia extrato[],inteiro &cExtrato, real &valor, real &limite)
  {
    escreva("\nDigite o valor do saque: R$ ")
    leia(valor)
    real limiteteste
    inteiro fun
    fun=cExtrato
    limiteteste=saldo
    limiteteste=+limite
    se (valor > limiteteste)
    {
        escreva("\nSaldo insuficiente!\n")
    }
    senao
   {
      saldo = saldo - valor
      extrato[cExtrato] = "Saque: R$ " + valor
      fun=fun+1
      escreva("\nSaque de R$ ", valor, " realizado com sucesso!\n")
      cExtrato=fun
    }
  }
  funcao deposito(real valor,real &saldo, cadeia extrato[], inteiro &cExtrato)
  {
    inteiro ajuda
    inteiro fun
    fun=cExtrato
    escreva("\nDigite o valor do depósito: R$ ")
    leia(valor)
    ajuda=saldo
    ajuda = (ajuda + valor)
    saldo=ajuda
    extrato[cExtrato] = "Depósito: R$ " + valor
    fun = fun + 1
    escreva("\nDepósito de R$ ", valor, " realizado com sucesso!\n")
    cExtrato=fun

  }
  funcao login(inteiro agencia,inteiro conta,cadeia senha)
  {
    cadeia confirma
    escreva("Digite o número da agência: ")
        leia(agencia)
        escreva("Digite o número da conta: ")
        leia(conta)
        escreva("Digite a senha: ")
        leia(senha)
        escreva("\nAcesso concedido! Bem-vindo ao seu caixa eletrônico.\n")
        escreva("\naperte Enter para continuar ")
        leia(confirma)
        limpa()

  }
}
