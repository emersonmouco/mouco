programa {
  funcao inicio() {
    
    inteiro matrizNormal[2][3]
    inteiro matrizTransposta[3][2]
    inteiro x, y

    // informando os elementos da matriz
    para(x=0;x<2;x++){
      para(y=0;y<3;y++){
        escreva("\nInforme o elemento da matriz: [",x,"][",y,"]: ")
        leia(matrizNormal[x][y])
      }
    }

    // variavel matrizTransposta recebendo os elementos
    // da outra matriz a Normal
    para(x=0;x<2;x++){
      para(y=0;y<3;y++){
        matrizTransposta[y][x] = matrizNormal[x][y]
      }
    }

    limpa()

    escreva("\n### Matriz original ###")
    para(x=0;x<2;x++){
      para(y=0;y<3;y++){
        escreva("[",matrizNormal[x][y],"]")
      }
    }

    escreva("\n### Matriz transposta ###")
    para(y=0;y<3;y++){
      para(x=0;x<2;x++){
        escreva("[",matrizTransposta[y][x],"]")
      }
      escreva("\n")
    }
  }
}
