programa {
  funcao inicio() {
    real n1, n2, opcao, calculo

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
    
    limpa()
	     escolha(opcao){
	      caso 1:
	        calculo = n1 + n2
	        escreva("O resultado da soma é: ", calculo)
	      pare
	      caso 2:
	        calculo = n1 - n2
	        escreva("O resultado da subtração é: ", calculo)
	      pare
	      caso 3:
	        calculo = n1 * n2
	        escreva("O resultado da multiplicação é: ", calculo)
	      pare
	      caso 4:
	        calculo = n1 / n2
	        escreva("O resultado da divisão é: ", calculo)
	      pare
		    caso contrario:
		      escreva("Opção inválida!")
      }    
  }
}
