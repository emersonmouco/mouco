programa {
  funcao inicio() {
    inteiro x, num=0, tabuada = 0

    escreva("Informe um número de 1 a 10: ")
    leia(num)

    escreva("\nA tabuada do "+ num + " é \n")
    para(x = 1; x<=10; x++){
      tabuada = x * num
      escreva(num, " x ", x , " = ", tabuada , "\n")
    }

  }
}
