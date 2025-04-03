programa
{
//coloquei para linha = i e para coluna = j
//fica muito mais rápido pra fazer, eu acho.
	inclua biblioteca Util
	
	inteiro cpf_gerado[11]
	
	funcao inicio()
	{
		para (inteiro i = 0; i < 9; i++) {
			cpf_gerado[i] = Util.sorteia(1, 9)
		}

		gerar_cpf_valido(cpf_gerado)
	}

	funcao gerar_cpf_valido(inteiro cpf[]) {
		inteiro i, j
		inteiro soma, resto
		inteiro dv1, dv2

		j = 10
		soma = 0

		para (i = 0; i < 9; i++) {
			soma += cpf[i] * j
			j--
		}

		resto = soma % 11

		se (resto < 2) {
			dv1 = 0
		} senao {
			dv1 = 11 - resto
		}

		// gera digito verificador 2

		j = 11
		soma = 0

		para (i = 0; i < 10; i++) {
			soma += cpf[i] * j
			j--
		}

		resto = soma % 11

		se (resto < 2) {
			dv2 = 0
		} senao {
			dv2 = 11 - resto
		}


		cpf[9] = dv1
		cpf[10] = dv2

		mostra_cpf(cpf)
	}

	funcao mostra_cpf(inteiro cpf[]) {
		
		escreva("CPF valido gerado: \n")
		
		para (inteiro i = 0; i < 11; i++) {
			
			se ((i == 2) ou (i == 5)) {
				escreva(cpf[i], ".")
			} senao se (i == 8) {
				escreva(cpf[i], "-")
			} senao {
				escreva(cpf[i])
			}
			
		}
	}
}