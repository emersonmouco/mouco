programa {

  inclua biblioteca Util --> util

  funcao inicio() {
    inteiro vetor[10], valor, x
    cadeia resposta

    escreva("\nDigite um número: ")
    leia(valor)

    para(x=0; x<10; x++){
      vetor[x] = util.sorteia(1,20)
    }

    para(x=0; x<10; x++){
      escreva("[",vetor[x],"]")
    }

    ordenaVetor(vetor, 10)

    escreva("\nVetor ordenado!\n")

    para(x=0; x<10; x++){
      escreva("[",vetor[x],"]")
    }

    // resposta é a mensagem que vem de retorno do algoritmo
    // de busca binária, indicando se o valor foi ou não encontrado
    resposta = buscaVetor(valor, vetor, 0, 10-1)

    escreva("\nO valor ", valor, " ", resposta)
  }

  // Bubble sort - ordena o vetor
  funcao ordenaVetor(inteiro vetor[], inteiro tamanho){
    inteiro temp, x, y

    // temp = temporaria

    para (x=0; x<tamanho-1; x++){
      para(y=(x+1); y<tamanho-1; y++){
        se(vetor[y] < vetor[x]){
          // se o valor inicial analisado da posição do vetor inicial
          // for menor que o da segunda posição, ele armazena na variavel temporaria
          temp = vetor[x]
          // nisso o vetor inicial recebe o que sobrou para ser analisado
          vetor[x] = vetor[y]
          // por fim, ele pega o que está na variável temporária e vai armazenando
          // no segundo vetor (o que será ordenado), na ordem crescente
          vetor[y] = temp
        }
      }
    }
  }

  // Busca binária 
  funcao cadeia buscaVetor(inteiro valorRecebido, inteiro vetor[], inteiro inicial, inteiro fim){
    
    inteiro meio

    // a primeira ação do algoritmo é dividir o vetor ao meio e armazenar o resultado
    // na variavel meio para ele saber por onde começar
    meio = (inicial + fim)/2

    // valorRecebido = numero fornecido pelo usuário
    se(vetor[meio] == valorRecebido){
      retorne "foi encontrado"
    }

    se(inicial >= fim){
      retorne "não foi encontrado"
    }senao{
      se(vetor[meio] < valorRecebido){
        retorne buscaVetor(valorRecebido, vetor, meio+1, fim)
      }senao{
        retorne buscaVetor(valorRecebido, vetor, inicial, meio-1)
      }
    }
  }
}
