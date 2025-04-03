programa {
  funcao inicio() {
    cadeia nome, sexo
		inteiro idade
		real salario

		escreva("Informe o nome do funcionário: \n")
		leia(nome)
		
		escreva("Informe a idade do funcionário: \n")
		leia(idade)
		
		escreva("Informe o sexo do funcionário: (M - Masculino ou F - Feminino) \n")
		leia(sexo)
		
		escreva("Informe o salário fixo R$: \n")
		leia(salario)

		se(sexo == 'M' e idade >=30){ 
			salario += 100
			escreva("O salário do funcionário ",nome," é de R$ ",salario)
		}
    senao se (sexo == 'M' e idade < 30){ 
			salario += 50
			escreva("O salário do funcionário ",nome," é de R$ ",salario)
	  }
		senao se (sexo == 'F' e idade >= 30){ 
			salario += 200
			escreva("O salário da funcionário ",nome," é de R$ ",salario)
		}
		senao se (sexo == 'F' e idade < 30){ 
			salario += 80
			escreva("O salário da funcionário ",nome," é de R$ ",salario)
		}
    senao{
      escreva("Opções inválidas!")
    }
  }
}
