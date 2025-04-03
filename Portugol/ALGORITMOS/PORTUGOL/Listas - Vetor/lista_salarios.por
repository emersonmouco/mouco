programa {
  funcao inicio() {
    real salario[5]
		inteiro x

		para(x = 0; x < 5; x++){
			escreva("\nInforme o ",x+1," salário: ")
			leia(salario[x])

			se(salario[x] < 1500){

				salario[x] += salario[x] * 0.1
			}
		}
		limpa()
		escreva("\nLista de salários:")
		para(x = 0; x < 5; x++){
			escreva("\n",x+1," salário R$ ",salario[x])		
			
		}
  }
}
