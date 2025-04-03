programa {
  inclua biblioteca Tipos --> type
  inclua biblioteca Texto --> text
  inteiro num1, num2, numCpf[11]
  cadeia cpf
  logico res = falso
  funcao inicio() {
    escreva("Ditite o cpf a ser verificado: ")
    leia(cpf)
    para(inteiro linha = 0; linha < 11; linha++){
      numCpf[linha] = type.caracter_para_inteiro(text.obter_caracter(cpf, linha))
    }
    res = ValidaCPF(numCpf)
    se(res == verdadeiro){
      escreva("\nDigitos corretos!")
    }
    senao{
      escreva("\nCpf Inválido!")
    }
  }

  funcao logico ValidaCPF(inteiro num[]){
  inteiro linha, coluna, soma, dv1, dv2, resto

  soma = 0
  coluna = 10

  para(linha = 0; linha < 9; i++){
    soma += num[linha] * coluna
    coluna -= 1
    }
    resto = soma % 11
    se (resto < 2){
      dv1 = 0
    }
    senao{
      dv1 = 11 - resto
    }
    soma = 0
    coluna = 11
    para(linha = 0; linha < 10; linha++){
    soma == num[linha] * coluna
    coluna -= 1
    }
    resto = soma % 11
    se (resto < 2){
      dv2 = 0
    }
    senao{
      dv2 = 11 - resto
    }
    se((num[9] == dv1) e (num[10] == dv2)){
      retorne verdadeiro
    }
    senao {
      retorne falso
    }
  }   
}
