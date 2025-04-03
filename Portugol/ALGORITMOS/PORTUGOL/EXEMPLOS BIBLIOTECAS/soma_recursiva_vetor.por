programa {
  funcao inicio() {
    inteiro x,soma
    real y, vetor[7]

    escreva("\nPreencha o vetor: ")
    para(x=0; x<7; x++){
      leia(vetor[x])
    }

    para(x=0; x<7; x++){
      escreva(" [ ", vetor[x], " ]")
    }

    soma = somaVetor(vetor, 7)

    escreva("\n A soma dos elementos do vetor é: ", soma)
  }

  funcao real somaVetor(real vetor[], inteiro tamanho){
    se(tamanho == 1){
      retorne vetor[0]
    }senao{
      retorne vetor[tamanho - 1] + somaVetor(vetor, tamanho-1)
    }
  }
}
