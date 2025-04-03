programa {
  funcao inicio() {
    

		inteiro x,y
    real valor_estoque=0.0

    escreva("\nInforme a quantidade de produtos: ")
    leia(y)

    real valor[y]

		para (x = 0; x < y; x++){
			escreva("\nInforme o ",x+1," valor: ")
			leia(valor[x])

			valor_estoque += valor[x]
		}
		escreva("\nO valor do estoque é de R$ ",valor_estoque)
  }
}
