programa {
  inclua biblioteca Util
  funcao inicio() {
    
    inteiro vetor[10],x

    para(x = 0; x<10; x++){
        vetor[x] = Util.sorteia(0,100)
    }
    
    escreva(vetor)
  }
}
