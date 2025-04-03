programa {
  funcao inicio() {
    
    inteiro valores[5], menor, maior, x

    para(x = 0; x<5;x++){
      escreva("Valor ", x ,": ")
      leia(valores[x])
    
    }
    menor = valores[0]
    maior = valores[0]

    para(x = 0; x<5; x++){
      
      se(valores[x] < menor){
        menor = valores[x]
      }

      se(valores[x] > maior){
        maior = valores[x]
      }
    }
    
    
    escreva("Valor Menor: ", menor)
    escreva(" Valor Maior: ", maior)
  }
}
