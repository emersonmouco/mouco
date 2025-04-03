programa {
  funcao inicio() {
    inteiro vetor[5], x, par = 0, impar = 0

    escreva("\nInforme os valores do vetor: ")
    para(x=0; x<5; x++){
      leia(vetor[x])

      se(vetor[x] % 2 == 0){
        par++
      }senao{
        impar++
      }
    }

    escreva("\nVetor: \n")
    para(x=0; x<5; x++){
      escreva("[",vetor[x],"]")
    }

    escreva("\nQuantidade de numeros pares: ",par)
    escreva("\nQuantidade de numeros impares: ",impar)
  }
}
