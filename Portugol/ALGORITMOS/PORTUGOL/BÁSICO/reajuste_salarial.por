programa {
  funcao inicio() {
    real salario, salario_novo, diferenca

    escreva("Informe seu salario: ")
    leia(salario)

    salario_novo = salario * 1.17

    diferenca = salario_novo - salario

    escreva("Salário antigo: ", salario)
    escreva("\nSalário novo: ", salario_novo)
    escreva("\nDiferença entre eles: ", diferenca)

    escreva("O salário antigo é: " + salario + ", o salário novo é: " + salario_novo + ", e a diferença entre eles é: " + diferenca)
  }
}
