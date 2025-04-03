programa {
  funcao inicio() {
    inteiro numero, invertido

    escreva("Digite o número: ")
    leia(numero)

    se(numero > 0){
      faca{
        invertido = numero % 10
        escreva(invertido)
        numero /= 10
      }enquanto(numero != 0)
    escreva("\n")
    }senao se(numero < 0){
      numero *= -1
      escreva("-")
      faca{
        invertido = numero % 10
        escreva(invertido)
        numero /= 10
      }enquanto(numero != 0)
      escreva("\n")
    }
  }
}
