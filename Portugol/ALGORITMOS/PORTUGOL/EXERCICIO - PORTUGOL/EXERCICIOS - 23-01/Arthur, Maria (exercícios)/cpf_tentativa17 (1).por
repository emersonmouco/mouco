programa {
  inclua biblioteca Texto --> t
  inclua biblioteca Tipos --> ti
    funcao inicio() {

       cadeia cpf
       inteiro cpf_digitos[11],digito1, digito2
       logico resto = falso
        escreva("Digite o CPF: ")
        leia(cpf)

        para (inteiro i=0;i<11;i++)
        {
         cpf_digitos[i] = ti.caracter_para_inteiro(t.obter_caracter(cpf, i))
        }

        resto = ValidaCPF(cpf_digitos)

        se (resto==verdadeiro)
        {
            escreva("CPF válido!")
        }
        senao 
        {
            escreva("CPF inválido!")
        }

   
    
        
      }

    funcao logico ValidaCPF(inteiro num[]) {
        inteiro a,m, soma, resto, dg1, dg2

        soma=0
        m=10
        para (a=0;a<9;a++)
        {
            soma += num[a]*m
            m -= 1
        }

        resto=soma %11
        se(resto<2) 
        {
            dg1=0
        } 
        senao
        {
            dg1=11 - resto
        }

        soma= 0
        m=11
        para (a=0;a<10;a++)
        {
            soma += (num[a]) *m
            m-= 1
        }

        resto=soma %11
        se (resto<2) 
        {
            dg2=0
        } 
        senao 
        {
            dg2=11 - resto
        }

        se ((num[9] == dg1) e (num[10] == dg2)) 
        {
            retorne verdadeiro
        } 
        senao
        {
            retorne falso
        }
    }
}