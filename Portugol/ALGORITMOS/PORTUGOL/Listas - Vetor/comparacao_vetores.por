programa {
  funcao inicio() {
    inteiro vetor1[5], vetor2[5], qtd = 0, x, y, z

    para(x=0; x<5; x++){
      escreva("Informe o ", x+1, " valor do primeiro vetor: ")
      leia(vetor1[x])
    }

    limpa()
    para(x=0;x<5;x++){
      escreva("Informe o ", x+1, " valor do segundo vetor: ")
      leia(vetor2[x])
    }

    limpa()
    para(z=0; z<5; z++){
      para(y=0; y<5; y++){
        se(vetor1[z] == vetor2[y]){
          qtd++
        }
      }
    }
    escreva("A quantidade de valores iguais é: ", qtd)
  }
}
