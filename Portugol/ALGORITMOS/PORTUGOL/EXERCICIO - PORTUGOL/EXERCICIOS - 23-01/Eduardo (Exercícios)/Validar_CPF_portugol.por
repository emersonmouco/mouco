programa
{	
	funcao inicio()
	{
		inteiro cpf[]={7,7,7,7,7,7,7,7,7,7,7}
		inteiro mult1[]={10,9,8,7,6,5,4,3,2}
		inteiro mult2[]={11,10,9,8,7,6,5,4,3,2}
		inteiro soma = 0
		inteiro resto

		se(cpf[0]==cpf[1] e cpf[1]==cpf[2] e cpf[2]==cpf[3] e cpf[3]==cpf[4] e cpf[4]==cpf[5] e cpf[5]==cpf[6] e cpf[6]==cpf[7]
		 e cpf[7]==cpf[8] e cpf[8]==cpf[9] e cpf[9]==cpf[10]){
		 	escreva("CPF inválido!")
		 	
		 	}senao{
		 		para(inteiro i = 0; i < 9; i++){
				soma+=(cpf[i] * mult1[i])
				}
				resto = (soma*10) % 11
				se(resto == 10){
					resto = 0
					}
				se(resto != cpf[9]){
					escreva("CPF inválido!")
					}senao{
						soma=0
						para(inteiro i = 0; i < 10; i++){
							soma+=(cpf[i] * mult2[i])
						}
						resto = (soma*10) % 11
		
						se(resto == 10){
							resto = 0
						}
						se(resto != cpf[10]){
						escreva("CPF inválido!")
						} senao{
							escreva("CPF válido")
							}
					}
		 }
	}
}
