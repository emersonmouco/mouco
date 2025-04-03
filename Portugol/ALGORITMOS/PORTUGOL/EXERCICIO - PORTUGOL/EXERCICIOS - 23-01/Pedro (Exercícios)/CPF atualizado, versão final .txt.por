programa {
  inteiro cpf[11],primeiroDigito,segundoDigito
  funcao inicio() {
    inteiro teste,re,teste2,ra
    logico analisar,verifi
    escreva("informe os numeros do seu cpf : ")
	escreva("\n")
    para(inteiro i = 0; i<11;i++){
      leia(cpf[i])
    }
    limpa()
    teste = primeiroNumero(re)
    teste2 = calculoSegundo(ra)
    para(inteiro b = 0 ; b<11 ; b++){
      escreva(cpf[b])
    }
    se(teste == cpf[9] e teste2==cpf[10]){
      escreva("\n\nCPf VÁLIDO !")
    }senao{
      escreva("\n\nCPF INVÁLIDO !")
    }
    escreva("\n\n")
  
  }
  funcao inteiro primeiroNumero(inteiro informar){
    inteiro multiplicar,divisao,resto,subtrair
    multiplicar = cpf[0]*10+cpf[1]*9+cpf[2]*8+cpf[3]*7+cpf[4]*6+cpf[5]*5+cpf[6]*4+cpf[7]*3+cpf[8]*2
    divisao = multiplicar /11
    resto = multiplicar % 11
    subtrair = 11-resto
    primeiroDigito = subtrair
    retorne primeiroDigito
  }
  funcao inteiro calculoSegundo(inteiro n1){
    inteiro multiplicar2, divisao, resto,subtrair
    multiplicar2 = cpf[0]*11+cpf[1]*10+cpf[2]*9+cpf[3]*8+cpf[4]*7+cpf[5]*6+cpf[6]*5+cpf[7]*4+cpf[8]*3+cpf[9]*2
    divisao = multiplicar2 / 11
    resto = multiplicar2 % 11
    subtrair = 11-resto
    segundoDigito=subtrair
    retorne segundoDigito
  }

}