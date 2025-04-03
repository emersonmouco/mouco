programa {
  funcao inicio() {
    
    real cont, idade, altura, peso, media, porc, qtde = 0.0, qtde2 = 0.0, qtde3 = 0.0, soma = 0.0

      	para(cont = 0; cont < 5; cont++){
          	escreva ("\nDigite a idade: ")
          	leia (idade)
               escreva ("\nDigite a altura: ")
               leia (altura)
               escreva ("\nDigite o peso: ")
               leia (peso)

	         se(idade>50){
                 qtde++
              }

              se(idade > 10 e idade < 20){
                 soma = soma+altura
                 qtde2++
              }

              se(peso < 40){
                 qtde3++
              }
         }

        media = soma / qtde2
        porc = (qtde3 / cont)*100

       escreva ("\n A quantidade de pessoas acima de 50 anos é: ", qtde)
       escreva ("\n A média das alturas entre as idade de 10 e 20 anos é: ", media)
       escreva ("\n A porcentagem com peso inferior a 40 KG é: ", porc)
		
	}
}