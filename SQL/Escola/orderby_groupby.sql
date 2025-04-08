/*
Group by

O GROUP BY tem finalidade de agrupar linhas
que tem valores iguais em colunas específicas
*/

/*
Agrupar por id, a quantidade de alunos
em cada turma 
*/
SELECT turma_id, COUNT(*) AS total_alunos
FROM matricula
GROUP BY turma_id;

/*
ORDER BY
Tem por finalidade ordenar o conjunto de resultados
da consulta por uma ou mais colunas
*/

/* ordernou do mais novo para o mais velho */
SELECT nome, data_nascimento
FROM pessoa
ORDER BY data_nascimento DESC;

/*
COMBINACAO DOS DOIS JUNTOS
*/

/*
RETORNOU AS TURMAS ORDENADAS PELA MÉDIA DAS NOTAS
DA MAIOR PARA A MENOR
*/
SELECT turma_id, AVG(valor) AS media_notas
FROM nota n
JOIN avaliacao a ON n.avaliacao_id = a.id
GROUP BY turma_id
ORDER BY media_notas DESC;

/*
LISTAR ALUNOS POR TURMA
*/
SELECT t.nome AS turma, p.nome AS aluno
FROM turma t
JOIN matricula m ON t.id = m.turma_id
JOIN aluno a ON m.aluno_id = a.id
JOIN pessoa p ON a.id = p.id
ORDER BY t.nome, p.nome;

/*
APRESENTEM A MÉDIA DOS ALUNOS
EM CADA DISCIPLINA, DA MENOR PARA A MAIOR
*/
SELECT d.nome AS disciplina, p.nome AS aluno, AVG(n.valor) AS media
FROM disciplina d
JOIN avaliacao a ON d.id = a.disciplina_id
JOIN nota n ON a.id = n.avaliacao_id
JOIN aluno al ON n.aluno_id = al.id
JOIN pessoa p ON al.id = p.id
GROUP BY d.id, p.id
ORDER BY d.nome, media DESC;

/*
professores as disciplinas que lecionam 
ordernar por nome
*/
SELECT p.nome AS professor, d.nome AS disciplina, COUNT(l.turma_id) AS turmas
FROM pessoa p
JOIN professor prof ON p.id = prof.id
JOIN lecionamento l ON prof.id = l.professor_id
JOIN disciplina d on l.disciplina_id = d.id
GROUP BY p.id, d.id
ORDER BY p.nome, d.nome;

/*
Mostre o nome dos alunos, a turma em que estão e o período
a matricula deve estar com o status Ativa
*/
SELECT p.nome AS aluno, t.nome AS turma, t.periodo
FROM pessoa p
JOIN aluno a ON p.id = a.id
JOIN matricula m ON a.id = m.aluno_id
JOIN turma t ON m.turma_id = t.id
WHERE m.status = 'Ativa';

/*
Listar todos os professores e as disciplinas
que lecionam, incluindo os horarios
caso queira, pode ordenar por nome
*/
SELECT p.nome AS professor, d.nome AS disciplina,
	l.dia_semana, l.horario, t.nome AS turma
FROM pessoa p
JOIN professor prof ON p.id = prof.id
JOIN lecionamento l ON prof.id = l.professor_id
JOIN disciplina d ON l.disciplina_id = d.id
JOIN turma t ON l.turma_id = t.id
ORDER BY p.nome, l.dia_semana, l.horario;








