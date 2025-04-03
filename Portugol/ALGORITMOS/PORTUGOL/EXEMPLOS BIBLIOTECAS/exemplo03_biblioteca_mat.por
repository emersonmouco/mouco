programa {

  inclua biblioteca Matematica --> mat

  funcao inicio() {
    real a, b, calculo

    escreva("\nInforme o valor de A: ")
    leia(a)
    escreva("\nInforme o valor de B: ")
    leia(b)

    enquanto(testeAB(a,b) != verdadeiro){
      escreva("\nInforme o valor de A: ")
      leia(a)
      escreva("\nInforme o valor de B: ")
      leia(b)
      limpa()
    }

    calculo = calculaA_elevadoB(a,b)
    escreva("\nO valor de A^B é: ", calculo)
  }

  funcao logico testeAB(real x, real y){
    se(x > y){
      retorne falso
    }senao{
      retorne verdadeiro
    }
  }

  funcao real calculaA_elevadoB(real c, real d){
    retorne mat.potencia(c,d)
  }
}
