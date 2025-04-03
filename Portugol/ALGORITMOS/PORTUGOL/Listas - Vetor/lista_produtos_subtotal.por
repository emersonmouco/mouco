programa {
  funcao inicio() {
    real valor[10], subtotal[10], quantidade[10]
		inteiro x
		cadeia nome[10]

		para(x = 0; x < 10; x++){
			escreva("\nInforme o nome do produto: ")
			leia(nome[x])
			escreva("\nInforme a quantidade do produto: ")
			leia(quantidade[x])
			escreva("\nInforme o valor do produto: ")
			leia(valor[x])
			subtotal[x] = valor[x] * quantidade[x]
			limpa()
		}
		para(x = 0; x < 10; x++){
			escreva("\nO sutotal do produto ",nome[x]," é de R$ ",subtotal[x])
			
		}
  }
}
