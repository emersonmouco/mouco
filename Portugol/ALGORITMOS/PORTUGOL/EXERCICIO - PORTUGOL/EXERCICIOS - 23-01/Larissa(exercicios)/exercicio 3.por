programa {
  funcao inicio() {
    algoritmo "Validar CPF"
var
    cpf: caractere
    soma, resto, i: inteiro
    digito1, digito2: inteiro

inicio
    escreva("Digite o CPF (somente números): ")
    leia(cpf)

    // Verifica se o CPF tem 11 dígitos
    se comprimento(cpf) <> 11 entao
        escreva("CPF inválido! Deve conter 11 dígitos.")
        pare
    fimse

    // Cálculo do primeiro dígito verificador
    soma <- 0
    para i de 1 ate 9 faca
        soma <- soma + (caracter_para_inteiro(cpf[i]) * (11 - i))
    fimpara
    resto <- (soma * 10) mod 11
    se resto = 10 entao
        digito1 <- 0
    senao
        digito1 <- resto
    fimse

    // Cálculo do segundo dígito verificador
    soma <- 0
    para i de 1 ate 10 faca
        soma <- soma + (caracter_para_inteiro(cpf[i]) * (12 - i))
    fimpara
    resto <- (soma * 10) mod 11
    se resto = 10 entao
        digito2 <- 0
    senao
        digito2 <- resto
    fimse

    // Verifica se os dígitos calculados são iguais aos do CPF informado
    se (digito1 = caracter_para_inteiro(cpf[10])) e (digito2 = caracter_para_inteiro(cpf[11])) entao
        escreva("CPF válido!")
    senao
        escreva("CPF inválido!")
    fimse
fimalgoritmo
  }
}
