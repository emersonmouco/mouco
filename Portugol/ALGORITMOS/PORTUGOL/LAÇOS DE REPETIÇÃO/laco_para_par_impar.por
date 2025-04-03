programa {
  funcao inicio() {
    
    inteiro par=0, impar=0, produtoPar=1 ,somaImpar=0, nro, x
		
    para (x = 0;x < 10;x++){
			escreva("\nDigite um valor inteiro: ")
			leia(nro)
			
      se(nro == 0){
				pare
			}
			
      enquanto(nro < 0){
				escreva("\nValor inválido, tente um número positivo: ")
				leia(nro)
			}
			
      se(nro % 2 == 0){
				par += 1
				produtoPar *= nro
			}senao{
     		impar += 1
     		somaImpar += nro
     	}
		}
			limpa()
			escreva("\nNumero de impares: ", impar)
			escreva("\nNumero de pares: ", par)
			escreva("\nO produto dos pares: ", produtoPar)
			escreva("\nA soma dos impares: ", somaImpar) 
  }
}
