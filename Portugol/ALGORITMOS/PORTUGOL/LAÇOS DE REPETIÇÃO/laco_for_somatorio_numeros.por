programa {
  funcao inicio() {
    real  valor, soma = 0, contador

		para(contador = 0; contador < 5; contador ++){
      escreva("Informe o número você deseja somar: \n")
		  leia(valor)
		  soma += valor
		}
		
    escreva("O somatório é: ",soma)	
  }
}
