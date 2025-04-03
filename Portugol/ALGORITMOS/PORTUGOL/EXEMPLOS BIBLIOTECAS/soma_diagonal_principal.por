programa {
  funcao inicio() {
    inteiro matriz[3][3], soma = 0
    inteiro x, y

    para(x=0;x<3;x++){
      para(y=0;y<3;y++){
        escreva("\nInforme os elementos da matriz [",x,"][",y,"]: ")
        leia(matriz[x][y])
        se(x == y){
          soma += matriz[x][y]
        }
      }
    }
    limpa()
    para(x=0; x<3; x++){
      para(y=0; y<3; y++){
        escreva("[",matriz[x][y],"]")
      }
      escreva("\n")
    }
    escreva("\nA soma dos elementos da diagonal principal é: ",soma)
  }
}
