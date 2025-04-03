programa {
  cadeia email,senha,confirmar,nome
    inteiro menu,cidade,qtdfilhos,planoSaude,valetransporte,cargo
    real salarioCargo=0.0
    inteiro salarioLiquido,descontos,acrescimos
    inteiro tick,plano,creche,inss,periculo,trans
  funcao inicio() {
    inteiro sala,pla,cre,in,peri,tra,mais,menos
	cadeia qualcargo
    escreva("#### Visionarios ####\n\n\n")
    escreva("Informe seu email : ")
    leia(email)
    escreva("informe seu senha : ")
    leia(senha)
    escreva("Repita sua senha :")
    leia(confirmar)
    enquanto(confirmar!= senha){
      limpa()
      escreva("Senha Incorreta!!\nEscreva novamente :")
      leia(confirmar)
      
    }limpa()
    escreva(" iremos coletar algumas informações. Responda com sinceridade\n")
    escreva("\n\nPrimeiro nome :")
    leia(nome)
	limpa()
    escreva("\n\n1-Agua Escura\n2-Campo Pequeno\n3-Tres Rios e Meio")
	escreva("\nQual Cidade : ")
    leia(cidade)
	limpa()
    escreva("\nNumero de Filhos : ")
    leia(qtdfilhos)
	limpa()
    escreva("\nPlano de Saúde? : \n1-Sim\n2-Não")
	escreva("\nInforme uma opção: ")
    leia(planoSaude)
	limpa()
    escreva("\nVale transporte ? : \n1-sim\n2-não")
	escreva("\nInforme uma opção: ")
    leia(valetransporte)
	limpa()
    escreva("\n1-Engenheiro\n2-Mestre de Obra\n3-Pedreiro ")
	escreva("\nSelecione um cargo :")
    leia(cargo)
	limpa()
    se(cargo == 1){
		qualcargo = "Engenheiro"
      salarioCargo+= 10000
    }senao se(cargo == 2 ){
		qualcargo= "Mestre de Obra"
      salarioCargo+=2500
    }senao se(cargo == 3){
		qualcargo= "Pedreiro"
      salarioCargo+=1500
    }

    limpa()


    escreva("Nome : ",nome)
    escreva("\nCargo : ",qualcargo)
    escreva("\nSalario Bruto : R$",salarioCargo)


    escreva("\nDescontos :")
    escreva("\n  Ticket Alimentação : R$",ticketAlimento(tick))
    escreva("\n  Vale Transporte : R$",transporte(tra))
    escreva("\n  INSS : R$",inss(in))
    escreva("\n Total de Descontos : R$",retirar(menos))


    escreva("\nAcrescimos : ")
    escreva("\n  Auxílio Creche : R$",auxiliocreche(cre))
    escreva("\n  Plano Saude : R$",planosaude(pla))
    escreva("\n  Periculosidade : R$",tipoCargo(peri))
    escreva("\nTotal de Acrescimos : R$",adicionar(mais))
    escreva("\n\n\nSalario Liquido : R$",salaLiquido(sala))
    





  }funcao inteiro ticketAlimento(inteiro alimentar){
    inteiro calculo,porcentagem,atualizar
    porcentagem = (salarioCargo*11)/100
    tick = porcentagem
    retorne tick


  }
  funcao inteiro auxiliocreche(inteiro salario){
    inteiro calculo,divisao
	se(qtdfilhos>0){
    	divisao = (salarioCargo*5)/100
    	calculo = divisao * qtdfilhos
    	creche = calculo
    	retorne creche
	}senao{
		creche =0
		retorne creche
	}
  }
  funcao inteiro transporte(inteiro veiculo){
    inteiro calculo,divisao
    se(valetransporte==1){
      divisao = (salarioCargo*10)/100
      trans = divisao
      retorne trans
    }senao{
		trans = 0
      retorne trans
    }
  }
  funcao inteiro planosaude(inteiro vida){
    inteiro calculo,acrescimo
    se(planoSaude ==1){
      acrescimo = 400
      plano = acrescimo
      retorne plano
    }senao{
		plano = 0
      retorne plano
    }
  }
  funcao inteiro tipoCargo(inteiro tipo){
    inteiro verificar,calculo
    se(cargo == 2 ou cargo ==3){
      calculo = (salarioCargo*10)/100
      periculo = calculo
      retorne periculo
    }senao{
    	periculo = 0
		retorne periculo
    }
  }
  funcao inteiro inss(inteiro desconto){
    inteiro retirar
    se(cargo == 1 ou cargo == 2){
      retirar = (salarioCargo*11)/100
      inss = retirar
      retorne retirar
      }senao se(cargo==3){
        retirar = (salarioCargo*10)/100
        inss = retirar
        retorne inss
      }
    }
    funcao inteiro adicionar(inteiro mais){
      inteiro adicionar
      acrescimos = creche + plano + periculo
      retorne acrescimos
    }
    funcao inteiro retirar(inteiro menos){
      inteiro retirar
      descontos = tick + trans + inss
      retorne descontos
    }
    funcao inteiro salaLiquido(inteiro dinheiro){
      salarioLiquido = salarioCargo + acrescimos - descontos
      retorne salarioLiquido
    }
  }