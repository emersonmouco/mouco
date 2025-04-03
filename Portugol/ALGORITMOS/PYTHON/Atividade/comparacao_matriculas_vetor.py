"""
Uma escola deseja saber, em uma turma de 5 alunos, quantos estão 
cursando simultaneamente as disciplinas de Lógica de programação 
e Programação orientada a objetos. 
Desenvolva um algoritmo que leia as matrículas dos alunos 
que estejam cursando Lógica de programação (vetor1) e depois
que leia quem está cursando Programação orientada a objetos (vetor2).
O algoritmo deverá calcular e mostrar a quantidade de alunos 
que estão cursando as duas disciplinas.

Obs: a matrícula deles pode ser números inteiros


"""

vetor1 = [0] * 5
vetor2 = [0] * 5
soma = 0

print("\nInforme as matrículas dos alunos da disciplina de Lógica de programação")
for x in range(5):
	vetor1[x] = int(input(f"Matrícula {x+1}: "))

print("\nInforme as matrículas dos alunos da disciplina de Programação orientada a objetos")
for x in range(5):
	vetor2[x] = int(input(f"Matrícula {x+1}: "))

# Contagem dos alunos matriculados em ambas disciplinas
for x in range(5):
	for y in range(5):
		if vetor1[x] == vetor2[y]:
			soma += 1

print(f"\nA quantidade de alunos matriculados em ambas disciplinas é: {soma}")