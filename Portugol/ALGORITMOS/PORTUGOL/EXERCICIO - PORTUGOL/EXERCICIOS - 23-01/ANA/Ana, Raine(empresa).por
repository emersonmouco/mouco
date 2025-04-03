programa {
  funcao inicio() {
    cadeia empresa, login, senha, usuario, senha_usuario, nome
    real salario_bruto, salario_liquido=0.0, beneficios=0.0, desconto=0.0, cidade
    inteiro num_filhos, plano_saude, vale_transporte=0.0, cargo_tipo, periculosidade
    real inss

    login = "admin"
    senha = "1234"
    empresa = "TLsenac"

    escreva("digite o login: ")
    leia(usuario)

    escreva("digite a senha: ")
    leia(senha_usuario)

    se(usuario == login e (senha==senha)){
    escreva("bem vindo a empresa ", empresa, "!")
  }senao{
  escreva("login ou senha incorreto, tente novamente")
  }

  escreva("Digite o nome do funcionário: ")
  leia(nome)

  escreva("escolha a cidade de atuação(1-agua Escura, 2-Campo pequeno, 3-Tres rios e meio):")
  leia(cidade)

  escreva("número de filhos: ")
  leia(num_filhos)

  escreva("plano de saúde?(1-sim, 2-nao):")
  leia(plano_saude)

  escreva("vale transporte?(1-sim, 2-nao):")
  leia(vale_transporte)

  escreva("escolha o cargo (1-engenheiro, 2-Mestre de Obra, 3-Pedreiro):")
  leia(cargo_tipo)

   se(cargo_tipo==1){
    salario_bruto=10000
    periculosidade=0
   }senao{
    se(cargo_tipo==2){
      salario_bruto=2500
      periculosidade=10
    }senao{(cargo_tipo==3)
    salario_bruto=1500
    periculosidade=10
    }
   }
    beneficios=0
    desconto=0

    beneficios=beneficios +(salario_bruto*0.11)


    se(num_filhos>0){
      beneficios + salario_bruto * 0.5 * num_filhos
    }
    
    se(vale_transporte==1){
      desconto=desconto + salario_bruto - 0.10
    }
    
    se(plano_saude==1){
      beneficios=beneficios + 400
    } 

    beneficios=beneficios + (salario_bruto *(periculosidade/100))
  
    se (cargo_tipo==1 ou (cargo_tipo==2)){
      inss=salario_bruto*0.11
    }senao{
      inss=salario_bruto*0.10
    }

    desconto=desconto + inss

    salario_liquido=salario_bruto + beneficios - desconto

    escreva("\n#####TLSANAC####\n")

    escreva("nome:",nome, "\n")

    se(cargo_tipo==1){
      "engenheiro"
    }senao{
      se(cargo_tipo==2){
        "mestre de obra"
    }
    }
    

    escreva("ticket alimentacao:R$", salario_bruto  - 0.11,"\n")

    se(num_filhos>0){
      escreva("auxulio creche:R$",salario_bruto*0.05*num_filhos,"\n")
    }
     se(vale_transporte==1){
      escreva("vale transporte:R$",salario_bruto - 0.10,"\n")
     }
     se(plano_saude==1){
      escreva("plano saude:R$400 \n")
     }

     se(periculosidade>0){
      escreva("periculosidade:R$", salario_bruto * (periculosidade/ 100), "\n")
     }

     escreva("\nDescontos:\n")
     escreva("INSS:R$", inss,"\n")

     escreva("total de descontos:R$", desconto,"\n")

     escreva("\nSalario liquido:R$", salario_liquido,"\n")
  }  
}
