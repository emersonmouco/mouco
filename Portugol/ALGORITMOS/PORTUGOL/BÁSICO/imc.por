programa {
  funcao inicio() {
    
    real imc, peso, altura

    escreva("Informe a sua altura: ")
		leia(altura)
		
    escreva("\nInforme o seu peso: ")
		leia(peso)
		
    imc = peso / (altura * altura)

		escreva("\nSeu IMC é : ", imc)
  }
}
