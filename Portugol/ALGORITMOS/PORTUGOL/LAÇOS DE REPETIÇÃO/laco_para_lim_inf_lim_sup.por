programa {
  funcao inicio() {
    
    inteiro liminferior, limsuperior, x
		real soma = 0.0
		escreva("\nInforme o valor do limite inferior: ")
		leia(liminferior)
		escreva("\nInforme o valor do limite superior: ")
		leia(limsuperior)
		
    se(liminferior % 2 == 0){
      liminferior = liminferior
		}senao{ 
      liminferior += 1
		}
		
		para(x=liminferior; x <= limsuperior; x+=2){
			escreva("\t",x)
			soma += x
		}
		
    escreva("\n\n")
		escreva("Somatorio: ",soma)
		escreva("\n\n")
  }
}
