programa {

  /*
    Escreva um algoritmo que leia dois valores numéricos inteiros A e B.
Após, apresente o resultado da subtração de A por B.

Obs: Mesmo que A seja menor que B, 
o resultado deverá ser sempre positivo.

Obs: utilize a biblioteca Matematica
  
   */


  inclua biblioteca Matematica --> mat

  funcao inicio() {
    
    real a, b, c
    
    escreva("\nInforme o valor de A: ")
    leia(a)
    escreva("\nInforme o valor de B: ")
    leia(b)

    c = calculaAB(a, b)
    escreva("\nO resultado absoluto é: ",c)
  }

  funcao real calculaAB(real x, real y){
    real z
    z = mat.valor_absoluto(x-y)
    retorne z
  }
}
