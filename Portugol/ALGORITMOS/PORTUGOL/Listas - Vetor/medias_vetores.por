
programa {
  funcao inicio() {
    real notas[5], notasInvertidas[5], soma=0.0, media, nota
    inteiro qtdLidos = 0, qtdAcimaDaMedia = 0, x

    para(x = 0; x <5; x++){
      escreva("Informe a ", x+1, "nota: ")
      leia(nota)
      se(nota == -1){
        pare
      }senao{
        notas[x] = nota
        qtdLidos++
        soma += notas[x]
      }
    }

    media = soma/qtdLidos

    para(x = 0; x < 5; X++){
      se(notas[x] > media){
        qtdAcimaDaMedia++
      }
    }

    limpa()

    escreva("A quantidade de valores lidos foi: ",qtdLidos)
    escreva("\nValores na ordem que foram informados: ")

    para(x=0; x<5; x++){
      escreva(notas[x],"\t")
    }

    escreva("\nValores na ordem inversa: ")

    para(x=4; x>=0; x--){
      escreva(notas[x], "\t")
    }

    escreva("\n A soma é: ",soma)
    escreva("\n A média é: ",media)
    escreva("\n A quantidade acima da média é: ",qtdAcimaDaMedia)
  }
}
