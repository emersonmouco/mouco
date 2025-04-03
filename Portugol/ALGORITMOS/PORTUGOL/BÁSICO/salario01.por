programa {
  funcao inicio() {
    real  salario, quantidade_horas, valor_hora_trabalhada

		escreva("Informe a quantidade de horas trabalhadas: ")
		leia(quantidade_horas)
		
    escreva("\nInforme o valor da hora trabalhada: ")
		leia(valor_hora_trabalhada)
		salario = quantidade_horas * valor_hora_trabalhada

		escreva("\nO valor final a receber é R$: ",salario)
  }
}
