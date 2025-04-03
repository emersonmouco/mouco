programa {
  // vamos utilizar a biblioteca util
  // para gerar números aleatórios
  inclua biblioteca Util --> util
  funcao inicio() {
    inteiro a, vetor[10], maior, x

    para(x=0; x<10; x++){
      // a função sorteia é a que gera números aleatórios
      // neste caso está sendo usada para preencher o vetor
      // ela exige que vc determine dois valores para o intervalo
      // ou seja, no nosso caso, irá preencher o vetor com 10 números de 1 a 100
      vetor[x] = util.sorteia(1, 100)
    }

    para(x=0; x<10; x++){
      escreva("[", vetor[x] ,"]")
    }

    maior = maiorElementoVetor(vetor, 10)

    escreva("\nO maior elemento do vetor é: ",maior)
  }

  funcao inteiro maiorElementoVetor(inteiro vetor[], inteiro tamanho){
    se (tamanho == 1){
      retorne vetor[0]
    }senao{
      inteiro maior
      maior = maiorElementoVetor(vetor, tamanho-1)
      // a variavel maior recebe o vetor criado aleatoriamente 
      // pela funcao sorteia da biblioteca util e analisa 
      // quando o elemento do vetor for maior do que todos os outros analisados
      // ele retorna esse valor como maior 
      se(maior > vetor[tamanho-1]){
        retorne maior
      }senao{
        retorne vetor[tamanho-1]
      }
    }
  }
}
