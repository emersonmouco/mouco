programa {
  
  /*
    UC3 - ALGORITMOS PORTUGOL

Elabore um algoritmo que leia uma matriz 4x4 de numeros inteiros

Depois, faça os seguintes cálculos:

soma dos números da PRIMEIRA LINHA
soma dos números da TERCEIRA COLUNA
subtração dos números da PRIMEIRA LINHA PELA TERCEIRA COLUNA

e mostre na tela depois 

a matriz original e os resultados das contas
  */

  funcao inicio() {
    
    inteiro matriz[4][4], somaLinha = 0, somaColuna = 0, subtracao
    inteiro linha, coluna

    escreva("\nInforme os valores da matriz\n")
    para(linha=0; linha<4; linha++){
      para(coluna=0; coluna<4; coluna++){
        leia(matriz[linha][coluna])

        se(linha == 0 e (coluna == 0 ou coluna == 1 ou coluna == 2 ou coluna == 3)){
          somaLinha += matriz[linha][coluna]
        }
        se(coluna == 0 e (linha == 0 ou linha == 1 ou linha == 2 ou linha == 3)){
          somaColuna += matriz[linha][coluna]
        }
        subtracao = somaLinha - somaColuna
      }
    }
    escreva("\nMatriz\n")
    para(linha=0; linha<4; linha++){
      para(coluna=0; coluna<4; coluna++){
        escreva("[",matriz[linha][coluna],"]")
      }
      escreva("\n")
    }

    escreva("Soma da 1ª linha da matriz: ",somaLinha)
    escreva("Soma da 3ª coluna da mtriz: ",somaColuna)
    escreva("Subtracao do resultado da 1 linha pela 3 coluna: ",subtracao)
  }
}
