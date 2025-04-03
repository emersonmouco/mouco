programa {
  funcao inicio() {
    real media[10]
		inteiro aprov = 0, reprov = 0, x

		para(x = 0; x < 10; x++){
			escreva("\nInforme a média do ",x+1," aluno: ")
			leia(media[x])

			se(media[x] >= 6){
				aprov += 1
				}senao{
					reprov += 1
					}
			}
		limpa()
		escreva("\nO total de alunos aprovados é: ",aprov)
		escreva("\nO total de alunos reprovados é: ",reprov)
  }
}
