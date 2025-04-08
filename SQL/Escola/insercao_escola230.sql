INSERT INTO Pessoa (nome, cpf, data_nascimento, telefone, email, endereco) VALUES
('Ana Silva', '111.222.333-44', '1980-05-15', '(11) 9999-8888', 'ana.silva@escola.com', 'Rua A, 100 - São Paulo'),
('Carlos Oliveira', '222.333.444-55', '1975-08-20', '(11) 8888-7777', 'carlos.oliveira@escola.com', 'Av. B, 200 - São Paulo'),
('Mariana Santos', '333.444.555-66', '1982-03-10', '(11) 7777-6666', 'mariana.santos@escola.com', 'Rua C, 300 - São Paulo'),
('Pedro Costa', '444.555.666-77', '1978-11-25', '(11) 6666-5555', 'pedro.costa@escola.com', 'Av. D, 400 - São Paulo'),
('João Pereira', '555.666.777-88', '2005-02-10', '(11) 5555-4444', 'joao.pereira@aluno.com', 'Rua E, 500 - São Paulo'),
('Maria Fernandes', '666.777.888-99', '2006-04-15', '(11) 4444-3333', 'maria.fernandes@aluno.com', 'Av. F, 600 - São Paulo'),
('Lucas Souza', '777.888.999-00', '2005-07-20', '(11) 3333-2222', 'lucas.souza@aluno.com', 'Rua G, 700 - São Paulo'),
('Julia Martins', '888.999.000-11', '2006-09-05', '(11) 2222-1111', 'julia.martins@aluno.com', 'Av. H, 800 - São Paulo'),
('Gabriel Lima', '999.000.111-22', '2005-12-12', '(11) 1111-0000', 'gabriel.lima@aluno.com', 'Rua I, 900 - São Paulo'),
('Isabela Rocha', '000.111.222-33', '2006-01-30', '(11) 9999-0000', 'isabela.rocha@aluno.com', 'Av. J, 1000 - São Paulo');

INSERT INTO Professor (id, registro, formacao, area_atuacao) VALUES
(1, 'PROF12345', 'Licenciatura em Matemática', 'Matemática'),
(2, 'PROF23456', 'Doutorado em Física', 'Ciências Exatas'),
(3, 'PROF34567', 'Mestrado em Letras', 'Língua Portuguesa'),
(4, 'PROF45678', 'Licenciatura em História', 'Ciências Humanas');

INSERT INTO Aluno (id, matricula, data_ingresso, situacao) VALUES
(5, 'AL2023001', '2023-02-01', 'Ativo'),
(6, 'AL2023002', '2023-02-01', 'Ativo'),
(7, 'AL2023003', '2023-02-01', 'Ativo'),
(8, 'AL2023004', '2023-02-01', 'Ativo'),
(9, 'AL2023005', '2023-02-01', 'Ativo'),
(10, 'AL2023006', '2023-02-01', 'Ativo');

INSERT INTO Disciplina (nome, carga_horaria, ementa, codigo) VALUES
('Matemática Básica', 80, 'Conceitos fundamentais de matemática', 'MAT101'),
('Física I', 60, 'Mecânica clássica', 'FIS101'),
('Português', 80, 'Gramática e interpretação de textos', 'POR101'),
('História do Brasil', 60, 'Panorama histórico do Brasil', 'HIS101'),
('Geografia', 60, 'Geografia física e humana', 'GEO101');

INSERT INTO Turma (nome, ano_letivo, periodo, sala, capacidade) VALUES
('1º Ano A', 2023, 'Matutino', 'Sala 101', 30),
('1º Ano B', 2023, 'Vespertino', 'Sala 102', 30),
('2º Ano A', 2023, 'Matutino', 'Sala 201', 30),
('2º Ano B', 2023, 'Vespertino', 'Sala 202', 30);

INSERT INTO Matricula (aluno_id, turma_id, data_matricula, status) VALUES
(5, 1, '2023-02-01', 'Ativa'),
(6, 1, '2023-02-01', 'Ativa'),
(7, 2, '2023-02-01', 'Ativa'),
(8, 2, '2023-02-01', 'Ativa'),
(9, 3, '2023-02-01', 'Ativa'),
(10, 4, '2023-02-01', 'Ativa');

INSERT INTO Lecionamento (professor_id, turma_id, disciplina_id, dia_semana, horario) VALUES
(1, 1, 1, 'Seg', '08:00:00'),
(1, 1, 1, 'Qua', '08:00:00'),
(2, 1, 2, 'Ter', '09:00:00'),
(3, 1, 3, 'Qui', '08:00:00'),
(4, 1, 4, 'Sex', '10:00:00'),
(1, 2, 1, 'Seg', '14:00:00'),
(2, 2, 2, 'Qua', '14:00:00'),
(3, 2, 3, 'Ter', '15:00:00'),
(4, 2, 4, 'Sex', '14:00:00'), 
(1, 3, 1, 'Seg', '10:00:00'),
(2, 3, 2, 'Qua', '10:00:00'),
(3, 3, 3, 'Ter', '11:00:00'),
(4, 3, 5, 'Sex', '10:00:00'),
(1, 4, 1, 'Seg', '16:00:00'),
(2, 4, 2, 'Qua', '16:00:00'),
(3, 4, 3, 'Ter', '17:00:00'),
(4, 4, 5, 'Sex', '16:00:00');

INSERT INTO Avaliacao (disciplina_id, turma_id, descricao, tipo, data_avaliacao, peso) VALUES
(1, 1, 'Prova 1 - Conjuntos Numéricos', 'Prova', '2023-03-15', 0.3),
(1, 1, 'Trabalho - Álgebra', 'Trabalho', '2023-04-10', 0.2),
(2, 1, 'Prova 1 - Cinemática', 'Prova', '2023-03-20', 0.3),
(3, 1, 'Prova 1 - Gramática', 'Prova', '2023-03-17', 0.4),
(1, 2, 'Prova 1 - Conjuntos Numéricos', 'Prova', '2023-03-16', 0.3),
(2, 2, 'Prova 1 - Cinemática', 'Prova', '2023-03-21', 0.3),
(3, 2, 'Prova 1 - Gramática', 'Prova', '2023-03-18', 0.4),
(1, 3, 'Prova 1 - Funções', 'Prova', '2023-03-15', 0.3),
(2, 3, 'Prova 1 - Termodinâmica', 'Prova', '2023-03-20', 0.3),
(5, 3, 'Trabalho - Geografia Física', 'Trabalho', '2023-04-05', 0.2),
(1, 4, 'Prova 1 - Funções', 'Prova', '2023-03-16', 0.3),
(5, 4, 'Prova 1 - Cartografia', 'Prova', '2023-03-22', 0.3);

INSERT INTO Nota (aluno_id, avaliacao_id, valor, observacao) VALUES
(5, 1, 8.5, 'Bom desempenho'),
(5, 3, 7.0, 'Precisa melhorar em cálculos'),
(5, 4, 9.0, 'Excelente desempenho'),
(6, 1, 6.5, 'Razoável'),
(6, 3, 8.0, 'Bom desempenho'),
(6, 4, 7.5, 'Pode melhorar'),
(7, 5, 9.0, 'Ótimo trabalho'),
(7, 6, 8.5, 'Muito bom'),
(7, 7, 7.0, 'Regular'),
(8, 5, 5.5, 'Precisa estudar mais'),
(8, 6, 6.0, 'Melhorou, mas ainda abaixo'),
(8, 7, 8.0, 'Boa evolução'),
(9, 8, 7.5, 'Bom'),
(9, 9, 6.5, 'Regular'),
(9, 10, 9.5, 'Excelente trabalho'),
(10, 11, 8.0, 'Muito bom'),
(10, 12, 9.0, 'Ótimo desempenho');