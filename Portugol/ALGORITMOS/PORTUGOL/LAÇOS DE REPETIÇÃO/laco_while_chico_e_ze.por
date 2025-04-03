programa {
  funcao inicio() {
    inteiro anos = 0
		real alt_Chico = 1.5, alt_Ze=1.10 

    enquanto (alt_Chico > alt_Ze) { 
      anos++
			alt_Chico += 0.02
			alt_Ze += 0.03
		} 
		
    escreva ("Serão necessários ", anos, " anos para que Zé seja maior que Chico") 
  }
}
