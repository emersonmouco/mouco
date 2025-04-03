programa {
  funcao inicio() {
    /*
    Faça um programa que receba a 

EM UM UNICO VETOR (NO CASO SERÁ UMA MATRIZ)
* idade
* altura
* peso

de 5 pessoas.

real dados[5][3]
// 5 -> quantidade de linhas da matriz (quantidade de pessoas)
// 3 -> quantidade de colunas da matriz (idade, altura e peso)

Calcule e mostre:
* A quantidade de pessoas com idade superior a 50 anos;
* A média das alturas das pessoas com idade entre 10 e 20 anos;
* A percentagem de pessoas com peso inferior a 40 
    quilos entre todas as pessoas analisadas.
    
     */
    
    real dados[5][3]
    // 5 -> quantidade de linhas da matriz (quantidade de pessoas)
    // 3 -> quantidade de colunas da matriz (idade, altura e peso)

    real pesoMenor40, qtdPeso = 0.0, media = 0.0
    real qtdSuperior50 = 0.0, somaAltura = 0.0, contadorAltura = 0.0
    inteiro x, y

    // laço que irá representar os dados coletados das pessoas
    // ou seja, as cinco linhas de informações de cada pessoa
    para(x=0; x<5; x++){
      escreva("Informe os dados da ", x+1, "pessoa: Idade, altura e peso \n")
      
      // este laço irá coletar as informações das colunas
      // idade, altura e peso
      para(y=0; y<3; y++){
        // ou seja, ex: pessoa 1 (1ª linha (coluna 1, 2, 3))
        // [1][1] - [1][2] - [1][3]
        // [2][1] - [2][2] - [2][3] e assim por diante
        leia(dados[x][y])
      }

      limpa()

      // quando houver uma pessoa com idade superior a 50
      // ele armazena na variavel qtdSuperior50
      se(dados[x][0] > 50.0){
        qtdSuperior50++
      }

      // nesta condição ele analisa as pessoas entre 10 e 20 anos
      // e vai armazenando e somando suas alturas para fazer a média depois
      // alem de armazenar em contadorAltura a quantidade 
      // de pessoas que estão nesse intervalo 
      se(dados[x][0] >= 10.0 e dados[x][0] <=20.0){
        somaAltura += dados[x][1]
        contadorAltura++
      }

      // armazena em qtdPeso a quantidade de pessoas com peso menor que 40
      se(dados[x][2] < 40.0){
        qtdPeso++
      }
    }

    // calculo da media
    media = somaAltura / contadorAltura

    // calculo da porcentagem
    pesoMenor40 = (qtdPeso / 5) * 100

    escreva("Idade\tAltura\tPeso\n")

    // mostrar os dados de cada uma das 5 pessoas
    para(x=0; x<5; x++){
      para(y=0; y<3; y++){
        escreva(dados[x][y], "\t")
      }
      escreva("\n")
    }

    escreva("\nQuantidade de pessoas com idade maior que 50: ", qtdSuperior50)
    escreva("\nMédia das alturas das idades entre 10 e 20: ", media)
    escreva("\nPorcentagem de pessoas com peso menor que 40: ", pesoMenor40, "%")
  }
}
