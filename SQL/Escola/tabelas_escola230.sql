CREATE TABLE Pessoa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Aluno (
    id INT PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    data_ingresso DATE NOT NULL,
    situacao ENUM('Ativo', 'Inativo', 'Concluido') DEFAULT 'Ativo',
    FOREIGN KEY (id) REFERENCES Pessoa(id) ON DELETE CASCADE
);

CREATE TABLE Professor (
    id INT PRIMARY KEY,
    registro VARCHAR(20) UNIQUE NOT NULL,
    formacao VARCHAR(100),
    area_atuacao VARCHAR(100),
    FOREIGN KEY (id) REFERENCES Pessoa(id) ON DELETE CASCADE
);

CREATE TABLE Disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    ementa VARCHAR(100),
    codigo VARCHAR(20) NOT NULL
);


CREATE TABLE Turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    ano_letivo INT NOT NULL,
    periodo ENUM('Matutino', 'Vespertino', 'Noturno') NOT NULL,
    sala VARCHAR(20),
    capacidade INT
);

CREATE TABLE Matricula (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    turma_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    status ENUM('Ativa', 'Trancada', 'Cancelada') DEFAULT 'Ativa',
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id)
);

CREATE TABLE Lecionamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT NOT NULL,
    turma_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    dia_semana ENUM('Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab') NOT NULL,
    horario TIME NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES Professor(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id)
);

CREATE TABLE Avaliacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    disciplina_id INT NOT NULL,
    turma_id INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    tipo ENUM('Prova', 'Trabalho', 'Apresentacao', 'Participacao') NOT NULL,
    data_avaliacao DATE NOT NULL,
    peso DECIMAL(3,2) DEFAULT 1.00,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id)
);

CREATE TABLE Nota (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    avaliacao_id INT NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    observacao TEXT,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (avaliacao_id) REFERENCES Avaliacao(id)
);