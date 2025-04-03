programa {
  funcao inicio() {
    inteiro cont, x, dobro, triplo
		escreva("Informe um número: \n")
		leia(x)
		escreva("VALOR \t DOBRO \t TRIPLO\n")
		para(cont = x; cont >= 1; cont --){
			dobro = cont*2
			triplo = cont*3
			escreva(cont," \t ",dobro," \t ",triplo,"\n") 
			}		
	}
}
