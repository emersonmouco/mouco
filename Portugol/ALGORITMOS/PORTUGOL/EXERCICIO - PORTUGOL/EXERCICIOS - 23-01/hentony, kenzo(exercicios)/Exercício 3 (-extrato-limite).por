programa {
   cadeia nome, senha, a
    inteiro numAgencia, acao
    real saldo = 1500, extrato, deposito, limite = 500.00,saquei, opcao, contador = 0, acrescimo, limitee
  funcao inicio() {
    escreva("Bem vindo ao sistema Senac Bancos!")
    escreva("\n----------------------------------")
    escreva("\nDigite o número da agência bancária: ")
    leia(numAgencia)
    escreva("\nDigite seu nome: ")
    leia(nome)
    escreva("\nDigite sua senha: ")
    leia(senha)
    limpa()
    escreva("--------------------------------")
    menu()
  }
    funcao menu(){
    escreva("\nBem vindo à agência de Número: ",numAgencia)
    escreva("\n",nome,", o que deseja realizar em nosso banco hoje?\n Saldo: 1 \n Extrato: 2 \n Saque: 3 \n Deposito: 4\nSair: 5\n")
    leia(acao)
    escolha(acao){
      caso(1) : limpa() saldor()
      caso(4): limpa() depositor()
      caso (3): limpa() saque()
      caso (2): escreva("\nAinda n ta pronto caraaaaa!")
      retorne menu()
    }
  }
  funcao saldor(){
    escreva("\n",nome,", Seu saldo atual é de: ", saldo)
    escreva("\n",nome,", Seu limite é de: ",limitee)
    escreva("\nDigite ENTER para continuar: ")
    leia(a)
    retorne menu()
  }
  funcao saque(){
    escreva("\nSeu saldo atual é de: ",saldo)
    escreva("\nQuanto você deseja sacar? \ndigite 0 para ir ao menu\n")
    leia(saquei)
    saldo = saldo - saquei
    limpa()
    se (saldo < -500){
    escreva("\nVocê ultrapassou o valor do limite!")
    escreva("\nPor favor, digite um valor que não ultrapasse o valor somados de seu saldo e limite\nSaldo: ",saldo,"\nLimite: ",limitee,"\n")
    escreva("\nDigite ENTER para continuar")
    leia(a)
    saldo = saldo + saquei
    retorne saque()
    }
    se(saquei == 0){
      retorne menu()
    }
    senao se(saldo >= 0){
    escreva("\nvocê sacou: ",saquei,"R$")
    escreva("\nSeu saldo atual é de: ",saldo)
    escreva("\nDeseja sacar mais?: \nSIM - 1\nNÃO - 2\n")
    leia(opcao)
    escolha(opcao){
      caso(1): 
      limpa()
      retorne saque()
    }
    }
    senao se(saquei > saldo e saldo < limite){
      escreva("\nVocê utilizou todo seu saldo, estamos trabalhando com seu limite agora!")
      escreva("\nSeu saldo atual é de: ",saldo)
      escreva("\nUtilizando o limite de seu cartão ",limite,"R$ deseja ver quanto você anda pode usar até bater o limite?\nSIM - 1\nNÃO - 2\n")
      leia(opcao)
      escolha(opcao){
        caso(1): 
        limite = (limite + saldo) - saquei
        escreva("\nVocê só possui ",limite," R$ de limite até o máximo")
        escreva("\nDigite ENTER para prosseguir: ")
        leia(a)
        retorne saque()
        caso(2):
        escreva("\nvoltando para o menu!")
        escreva("-------------------------------")
        retorne menu()
        caso contrario:
        escreva("\nDigite um valor válido:")
        retorne saque()
      }
      
    }
    se(saldo > 0){
    escreva("\nvocê sacou: ",saquei,"R$")
    escreva("\nDigite ENTER para prosseguir: ")
    leia(a)
    }
 
  }
     funcao depositor(){
    escreva("\n",nome,", Seu saldo atual é de: ", saldo)
    escreva("\nDeseja depositar alguma quantia em sua conta?: \nSIM - 1\nNÃO - 2")
    leia(opcao)
    escolha(opcao){
      caso (1):
    escreva("\nO quanto você deseja acrescentar ao saldo de: ",saldo,"R$? \n: ")
    leia(acrescimo)
    saldo = saldo + acrescimo
    escreva("\nDigite ENTER para continuar: ")
    leia(a)
    limpa()
    retorne depositor()
    caso(2):
    escreva("\nOK, retornando ao menu!")
    escreva("--------------------------------")
    escreva("\nDigite ENTER para continuar: ")
    leia(a)
    retorne menu()
    }
    }
}
