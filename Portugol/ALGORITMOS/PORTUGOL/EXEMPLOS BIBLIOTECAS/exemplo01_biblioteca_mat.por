programa {
  
  // estamos incluindo a biblioteca matematica
  // e o --> indica que para utiliza-la estaremos abreviando
  // chamando de mat
  inclua biblioteca Matematica --> mat
  
  funcao inicio() {
    // calculo da area de um circulo utilizando a biblioteca matematica

    real area, raio

    escreva("\nInforme o raio da circunferência em cm: ")
    leia(raio)

    // neste caso utilizamos o valor de PI (3,14) que já está armazenado na biblioteca 
    // e utilizamos a funcao de potencia, tambem da biblioteca
    area = mat.PI * mat.potencia(raio, 2.0)

    area = mat.arredondar(area,2)

    limpa()

    escreva("\n A area da circunferencia: ", area, "cm")
  }
}
