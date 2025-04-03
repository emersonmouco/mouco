programa {
  funcao inicio() {
    real preco, desconto, calculo_desconto, preco_novo

    escreva("Informe o preco da roupa: ")
    leia(preco)

    escreva("Informe o desconto a ser aplicado: ")
    leia(desconto)

    calculo_desconto = preco * desconto / 100

    preco_novo = preco - calculo_desconto

    escreva("O preço original da roupa é: " + preco + ", o preço com o desconto de "+ desconto +"% é: " + preco_novo)
  }
}
