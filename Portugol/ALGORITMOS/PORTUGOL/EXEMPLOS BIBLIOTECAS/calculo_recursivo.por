programa {
  funcao inicio() {
    /*
    Elabore um algoritmo que receba um valor inteiro e depois implemente 
    uma função recursiva que execute a soma de todos os valores de n até 0.
    Obs: nao precisa utilizar a biblioteca Matematica, mas precisa ter uma função
         separada
    
     */

    inteiro x, calculo

    escreva("Informe um número: ")
    leia(x)
    calculo = calculo_recursivo(x)
    escreva("\n A soma recursiva é: ",calculo)
  }

  funcao inteiro calculo_recursivo(inteiro a){
    inteiro soma
    se(a == 0 ou a == 1){
      retorne a
    }senao{
      
      // soma = a * calculo_recursivo(a - 1)
       
      soma = a + calculo_recursivo(a - 1)
      
      retorne soma
    }
  }
}
