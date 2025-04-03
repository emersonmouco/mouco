programa {
  funcao inicio() {
   cadeia nome
   real preco, codigo

    escreva("Informe o nome do produto: \n")
    leia(nome)
		escreva("Informe o preço do produto: \n")
		leia(preco)

		escreva("1 - Região Norte - desconto de 5%\n")
		escreva("2 - Região Sul - desconto de 15%\n")
		escreva("3 - Região Sudeste - desconto de 7%\n")
		escreva("4 - Região Nordeste - desconto de 12%\n")
		escreva("5 - Região Centro-Oeste - desconto de 20%\n")
    escreva("6 - Importado - imposto de 50%\n")
    escreva("Informe o código da região: \n")
		leia(codigo)

		escolha(codigo){
			caso 1:
			preco -= (preco * 0.05) 
			escreva("O preço do produto " + nome + " com desconto é R$ ",preco)
			pare
			caso 2:
			preco -= (preco * 0.15) 
			escreva("O preço do produto " + nome + " com desconto é R$ ",preco)
			pare
			caso 3:
			preco -= (preco * 0.07) 
			escreva("O preço do produto " + nome + " com desconto é R$ ",preco)
			pare
			caso 4:
			preco -= (preco * 0.12) 
			escreva("O preço do produto " + nome + " com desconto é R$ ",preco)
			pare
			caso 5:
			preco -= (preco * 0.20) 
			escreva("O preço do produto " + nome + " com desconto é R$ ",preco)
			pare
			caso 6:
			preco += (preco * 0.50) 
			escreva("O preço do produto " + nome + " com imposto é R$ ",preco)
			pare

			caso contrario:
			escreva("Opções inválidas!\n")
			}
	}
}