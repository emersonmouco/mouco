programa {
  funcao inicio() {
    inteiro agencia, conta, senha
    real saldo, limite, deposito, saque
    cadeia extrato
    inteiro opcao

    saldo == 1500.00
    limite == 500.00
    extrato == "Extrato inicial: R$ 1500.00"

    escreva("Digite o número da agência: ")
    leia(agencia)
    escreva("Digite o número da conta: ")
    leia(conta)
    escreva("Digite a senha: ")
    leia(senha)

     escreva("\nMENU: \n1. Saldo \n2. Extrato \n3. Saque \n4. Depósito \n5. Sair\n")
     escreva("Escolha uma opção: ")
     leia(opcao)

      escreva("Saldo atual: R$ ", saldo)
      escreva("Extrato: ", extrato)

       escreva("Digite o valor do saque: ")
       leia(saque)
       se (saque <= saldo + limite)
       saldo == saldo - saque
       extrato == extrato + "\nSaque: R$ " + (saque)
       escreva("Saque realizado. Novo saldo: R$ ", saldo)

      escreva("Digite o valor do depósito: ")
      leia(deposito)
      saldo == saldo + deposito
      extrato == extrato + "\nDepósito: R$ " + (deposito)
      escreva("Depósito realizado com sucesso. Novo saldo: R$ ", saldo)

      
  }
}
