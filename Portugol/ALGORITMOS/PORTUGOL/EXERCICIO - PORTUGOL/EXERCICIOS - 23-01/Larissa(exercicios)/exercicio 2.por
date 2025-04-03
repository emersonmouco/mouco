programa {
  funcao inicio() {
    algoritmo "Caixa Eletrônico Simples"
var
    agencia, conta, senha: inteiro
    saldo, limite: real
    extrato: vetor[100] de caractere
    opcao, indexExtrato: inteiro
    valor: real

// Função para verificar credenciais
funcao logar(): logico
var
    agenciaDigitada, contaDigitada, senhaDigitada: inteiro
inicio
    escreva("Digite o número da agência: ")
    leia(agenciaDigitada)
    escreva("Digite o número da conta: ")
    leia(contaDigitada)
    escreva("Digite a senha: ")
    leia(senhaDigitada)

    se agenciaDigitada = agencia e contaDigitada = conta e senhaDigitada = senha entao
        retorne verdadeiro
    senao
        escreva("Dados incorretos! Tente novamente.")
        retorne falso
    fimse
fimalgoritmo

// Função para exibir o saldo
funcao verSaldo()
inicio
    escreva("Saldo disponível: R$ ", saldo:0:2, "\n")
    escreva("Limite disponível: R$ ", limite:0:2, "\n")
fimalgoritmo

// Função para realizar depósito
funcao
  }
}
