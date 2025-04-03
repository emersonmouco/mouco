programa {
  funcao inicio() {
    real n1, n2, n3, media
		inteiro codigo

		faca{
			escreva("Informe o Código do Aluno: ")
		  leia(codigo)
		  
      se(codigo == 0){
		    pare
		  }
			
      escreva("\nInforme a primeira nota: ")
			leia(n1)
			escreva("\nInforme a segunda nota: ")
			leia(n2)
			escreva("\nInforme a terceira nota: ")
			leia(n3)
			media = (n1+n2+n3)/3
			escreva("\nA média é: ",media,"\n")
			
      }enquanto(codigo != 0)	
  }
}
