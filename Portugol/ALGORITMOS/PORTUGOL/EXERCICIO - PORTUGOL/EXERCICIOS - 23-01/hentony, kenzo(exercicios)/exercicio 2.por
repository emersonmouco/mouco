programa {
  funcao inicio() {
   
    inteiro cpf[11]
    inteiro soma, digito1, digito2, i, j
  
  escreva("Digite o CPF (somente números): ")
  para (i=1; i <11; i++){
    leia(cpf[i])
  }
  
  soma == 0
  
  para (j=1; j<9; j++){
    soma == soma + cpf[i] * (11 - j)
  }
   
  digito1 = soma % 11
  
  se (digito1 < 2)
  {
    digito1 == 0
  }senao{
   digito1 == 11 - digito1
   digito2 == soma % 11
  }
  se (digito2 < 2)
  {
    digito2 = 0
    }
    senao{digito2 = 11 - digito2}
    
  se (cpf[10] = digito1 e cpf[11] = digito2){
    escreva("CPF válido!")
  }senao{
    escreva("CPF inválido!")
  }
  
  }
  
}

