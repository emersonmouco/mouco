programa {
  funcao inicio() {
    real opcao, n1, n2, calculo

    escreva("### Calculadora Voucher ###")
    
    escreva("\nDigite o primeiro número: ")
    leia(n1)
    escreva("\nDigite o segundo número: ")
    leia(n2)

    escreva("\n1 - Soma")
    escreva("\n2 - Subtração")
    escreva("\n3 - Multiplicação")
    escreva("\n4 - Divisão")
    escreva("\nDigite a opcao a ser selecionada: ")
    leia(opcao)
    
    se(opcao == 1){
      calculo = n1 + n2
      escreva("O resultado da soma é: ", calculo)
    }
    senao se(opcao == 2){
      calculo = n1 - n2
      escreva("O resultado da subtração é: ", calculo)
    }
    senao se(opcao == 3){
      calculo = n1 * n2
      escreva("O resultado da multiplicação é: ", calculo)
    }
    senao se (opcao == 4){
      calculo = n1 / n2
      escreva("O resultado da divisão é: ", calculo)
    }
    senao
      escreva("Opção inválida!")
    
  
  }
}
