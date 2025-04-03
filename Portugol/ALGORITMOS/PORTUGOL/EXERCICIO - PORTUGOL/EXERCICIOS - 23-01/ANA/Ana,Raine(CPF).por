programa {

  inclua biblioteca Texto --> t 
  inclua biblioteca Tipos --> ti 
  cadeia cpf
  inteiro digito1, digito2, cpf_digitos[11]
  logico res = falso

  funcao inicio() {
    escreva("digite o cpf para validar: ")
    leia(cpf)
    para(inteiro i = 0; i < 11; i++){
      cpf_digitos[i] = ti.caracter_para_inteiro(t.obter_caracter(cpf, i))
    }

    res = ValidaCPF(cpf_digitos)

    se(res == verdadeiro){
      escreva("CPF Válido!")
    }senao{
      escreva("CPF inválido...")
    }
    
  }

  funcao logico ValidaCPF(inteiro num[]){
    inteiro i, j, soma, resto, dv1, dv2

    soma = 0
    j = 10

    para(i = 0; i < 9; i++){
      soma += num[i] * j
      j -= 1
    }
    resto = soma % 11
    
    se (resto < 2) {
      dv1 = 0
    }senao{
      dv1 = 11 - resto
    }

    soma = 0
    j = 11

    para(i = 0; i < 10; i++){
      soma += num[i] * j
      j -= 1
     }

     resto = soma % 11

     se(resto < 2){
      dv2 = 0
      }senao{
        dv2 = 11 - resto
       }

       se((num[9] == dv1) e (num[10] == dv2)){
        retorne verdadeiro
       }senao{
        retorne falso
       }
  }
}
