programa {
  funcao inicio() {
    real num_livros, vlr_total

    escreva("Digite a quantidade de livros que deseja comprar: ")
    leia(num_livros)

    se(num_livros <= 10){
      
      vlr_total = num_livros * 12
      
      escreva("o preço total a ser pago será: R$ ",vlr_total)
    }
    senao{
      
      vlr_total = num_livros * 8
      
      escreva("o preço total a ser pago será: R$ ", vlr_total)
    }
    
  }
}
