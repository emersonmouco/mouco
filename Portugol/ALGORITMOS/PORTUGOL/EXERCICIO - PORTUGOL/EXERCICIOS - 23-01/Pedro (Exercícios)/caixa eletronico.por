programa {
  // Saldo, extrato, saque, deposito e sair. 
  inteiro saldo=1500,extratoMais=0,extratoMenos=0,limite=500
  funcao inicio() {
    inteiro menu,dinheiro,via,diminuir,adicionar
    cadeia email,senha,confirmar
    escreva("Informe seu email : ")
    leia(email)
    escreva("informe seu senha : ")
    leia(senha)
    escreva("Repita sua senha :")
    leia(confirmar)
    enquanto(confirmar!= senha){
      limpa()
      escreva("Senha Incorreta!!\rEscreva novamente :")
      leia(confirmar)
      
    }limpa()


    faca{
      escreva("\nBem vindo ao banco")
      escreva("\r1 - Saldo\r2 - Extrato\r3 - Saque\r4 - Depósito\r5 - Sair")
      escreva("\nInforme uma opcao : ")
      leia(menu)
      escolha(menu){
        caso 1 :
        limpa()
        faca{
          limpa()
          caracter voltar
          mostrarSaldo(dinheiro) 
          escreva("\n\nDigite S para voltar ao menu :")
          leia(voltar)
        }enquanto(voltar!="S")
        limpa()
        pare
        caso 2 :
        limpa()
        faca{
          caracter voltar
          extrato(via)
          escreva("\n\nDigite S para voltar ao menu :")
          leia(voltar)
        }enquanto(voltar!="S")
        limpa()
        pare
        caso 3 :
        limpa()
        faca{
          caracter voltar
          saque(diminuir)
          escreva("\n\nDigite S para voltar ao menu :")
          leia(voltar)
          limpa()
        }enquanto(voltar!="S")
        limpa()
        pare 
        caso 4 :
        limpa()
        faca{
          caracter voltar
          deposito(adicionar)
          escreva("\n\nDigite S para voltar ao menu :")
          leia(voltar)
          limpa()
        }enquanto(voltar!="S")
        limpa()
        pare
        caso 5 :
        limpa()
        escreva("\n\n\n\n#### Volte Sempre !! ####")
        escreva("\n\n\n\n\n")
        pare
      }
      
    }enquanto(menu!=5)
    
  } 

  funcao inteiro mostrarSaldo(inteiro n1){
    inteiro exibir,cartao
    exibir = saldo
    cartao = limite
 
    escreva("\n\nSaldo atual : R$",exibir)
    escreva("\nLimite atual : R$",cartao)
    retorne exibir

  } funcao inteiro extrato(inteiro mostrar){
    inteiro mostrarDeposito,mostrarSaque,amostra
    mostrarDeposito=extratoMais
    mostrarSaque=extratoMenos

    escreva("\n\nExtrato : " ," Depósito: R$",mostrarDeposito,";"," Saque: R$",mostrarSaque)
    retorne amostra
  }
  funcao inteiro saque(inteiro retirar){
    inteiro tirar ,calculo
    escreva("Valor do saque : ")
    leia(tirar)
    limpa()
    escreva("Saque de R$",tirar," Concluído")
    extratoMenos+=(tirar)
    saldo-=tirar
    retorne calculo
  }
  funcao inteiro deposito(inteiro n1){
    inteiro mais, adicionar
    escreva("Valor do deposito : ")
    leia(mais)
    limpa()
    extratoMais+=(mais)
    se(mais>0){
      saldo +=mais
      escreva("Depósito de R$",mais," Concluido")
      retorne adicionar
    }
    retorne mais
  }

}
