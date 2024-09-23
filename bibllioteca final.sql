SELECT pg_encoding_to_char(encoding) FROM pg_database WHERE datname = 'BibliotecaBD';
CREATE DATABASE BibliotecaBD WITH ENCODING 'UTF8';

SHOW SERVER_ENCODING;
SET client_encoding = 'UTF8';

-- Tabela Usuario
CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Tipo_Usuario VARCHAR(20) CHECK (Tipo_Usuario IN ('Aluno', 'Professor'))
);

-- Tabela Aluno
CREATE TABLE Aluno (
    ID_Aluno INT PRIMARY KEY,
    Curso VARCHAR(100),
    Ano_Entrada INT,
    FOREIGN KEY (ID_Aluno) REFERENCES Usuario(ID_Usuario)
);

-- Tabela Professor
CREATE TABLE Professor (
    ID_Professor INT PRIMARY KEY,
    Departamento VARCHAR(100),
    Especialidade VARCHAR(100),
    FOREIGN KEY (ID_Professor) REFERENCES Usuario(ID_Usuario)
);

-- Tabela Livro
CREATE TABLE Livro (
    ID_Livro INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Autor VARCHAR(100),
    Ano_Publicacao INT,
    Editora VARCHAR(100),
    Categoria VARCHAR(50),
    Nivel_Acesso VARCHAR(20) CHECK (Nivel_Acesso IN ('Aluno', 'Professor', 'Geral'))
);

-- Tabela Bibliotecario
CREATE TABLE Bibliotecario (
    ID_Bibliotecario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(15)
);

-- Tabela Emprestimo
CREATE TABLE Emprestimo (
    ID_Emprestimo INT PRIMARY KEY,
    ID_Usuario INT,
    ID_Bibliotecario INT,
    Data_Emprestimo DATE,
    Data_Devolucao DATE,
    Status VARCHAR(20),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Bibliotecario) REFERENCES Bibliotecario(ID_Bibliotecario)
);

-- Tabela Reserva
CREATE TABLE Reserva (
    ID_Reserva INT PRIMARY KEY,
    ID_Livro INT,
    ID_Usuario INT,
    Data_Reserva DATE,
    Status VARCHAR(20),
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

-- Tabela Multa
CREATE TABLE Multa (
    ID_Multa INT PRIMARY KEY,
    ID_Emprestimo INT,
    Valor DECIMAL(10, 2),
    FOREIGN KEY (ID_Emprestimo) REFERENCES Emprestimo(ID_Emprestimo)
);

-- Inserção de dados nas tabelas

-- Dados da tabela Usuario
INSERT INTO Usuario (ID_Usuario, Nome, Endereco, Telefone, Email, Tipo_Usuario) VALUES
(1, 'Ana Silva', 'Rua A, 123', '85 9 1234-5678', 'ana.silva@alu.ufc.br', 'Aluno'),
(2, 'João Santos', 'Rua B, 234', '85 9 2345-6789', 'joao.santos@alu.ufc.br', 'Aluno'),
(3, 'Maria Oliveira', 'Rua C, 345', '85 9 3456-7890', 'maria.oliveira@alu.ufc.br', 'Aluno'),
(4, 'Carlos Lima', 'Rua D, 456', '85 9 4567-8901', 'carlos.lima@alu.ufc.br', 'Aluno'),
(5, 'Patrícia Souza', 'Rua E, 567', '85 9 5678-9012', 'patricia.souza@alu.ufc.br', 'Aluno'),
(6, 'Fernanda Costa', 'Rua F, 678', '85 9 6789-0123', 'fernanda.costa@ufc.br', 'Professor'),
(7, 'Roberto Almeida', 'Rua G, 789', '85 9 7890-1234', 'roberto.almeida@ufc.br', 'Professor'),
(8, 'Juliana Martins', 'Rua H, 890', '85 9 8901-2345', 'juliana.martins@ufc.br', 'Professor'),
(9, 'Ricardo Pinto', 'Rua I, 901', '85 9 9012-3456', 'ricardo.pinto@ufc.br', 'Professor'),
(10, 'Claudia Pereira', 'Rua J, 101', '85 9 0123-4567', 'claudia.pereira@ufc.br', 'Professor');

-- Dados da tabela Aluno
INSERT INTO Aluno (ID_Aluno, Curso, Ano_Entrada) VALUES
(1, 'Ciência da Computação', 2022),
(2, 'Engenharia de Software', 2023),
(3, 'Matemática', 2022),
(4, 'Design Gráfico', 2021),
(5, 'Sistemas de Informação', 2024),
(6, 'Engenharia de Computação', 2020),
(7, 'Análise de Sistemas', 2019),
(8, 'Tecnologia da Informação', 2021),
(9, 'Arquitetura e Urbanismo', 2022),
(10, 'Engenharia Eletrônica', 2023);

-- Dados da tabela Professor
INSERT INTO Professor (ID_Professor, Departamento, Especialidade) VALUES
(6, 'Matemática', 'Matemática Discreta'),
(7, 'Computação', 'Programação Avançada'),
(8, 'Design', 'Design Gráfico'),
(9, 'Física', 'Mecânica Quântica'),
(10, 'Engenharia', 'Circuitos Elétricos'),
(11, 'Matemática', 'Álgebra Linear'),
(12, 'Computação', 'Redes de Computadores'),
(13, 'Design', 'Design de Interação'),
(14, 'Física', 'Termodinâmica'),
(15, 'Engenharia', 'Matemática Aplicada');

-- Dados da tabela Livro
INSERT INTO Livro (ID_Livro, Titulo, Autor, Ano_Publicacao, Editora, Categoria, Nivel_Acesso) VALUES
(1, 'Introdução à Programação', 'João da Silva', 2020, 'Editora X', 'Programação', 'Geral'),
(2, 'Matemática Básica', 'Ana Souza', 2019, 'Editora Y', 'Matemática', 'Geral'),
(3, 'Design Gráfico para Iniciantes', 'Carlos Mendes', 2021, 'Editora Z', 'Design', 'Geral'),
(4, 'Matemática Discreta', 'Roberto Almeida', 2022, 'Editora W', 'Matemática', 'Professor'),
(5, 'Algoritmos Avançados', 'Juliana Martins', 2021, 'Editora X', 'Programação', 'Professor'),
(6, 'Redes de Computadores', 'Claudia Pereira', 2020, 'Editora Y', 'Computação', 'Professor'),
(7, 'Design de Interação', 'Fernanda Costa', 2022, 'Editora Z', 'Design', 'Geral'),
(8, 'Cálculo I', 'Ricardo Pinto', 2018, 'Editora X', 'Matemática', 'Geral'),
(9, 'Física para Computação', 'Ana Oliveira', 2023, 'Editora Y', 'Física', 'Professor'),
(10, 'Introdução aos Algoritmos', 'João Santos', 2021, 'Editora Z', 'Programação', 'Geral');

-- Dados da tabela Bibliotecario
INSERT INTO Bibliotecario (ID_Bibliotecario, Nome, Email, Telefone) VALUES
(1, 'Lucia Andrade', 'lucia.andrade@biblioteca.com', '85 9 1111-2222'),
(2, 'Miguel Costa', 'miguel.costa@biblioteca.com', '85 9 2222-3333'),
(3, 'Laura Silva', 'laura.silva@biblioteca.com', '85 9 3333-4444'),
(4, 'Pedro Oliveira', 'pedro.oliveira@biblioteca.com', '85 9 4444-5555'),
(5, 'Gabriela Martins', 'gabriela.martins@biblioteca.com', '85 9 5555-6666'),
(6, 'Felipe Souza', 'felipe.souza@biblioteca.com', '85 9 6666-7777'),
(7, 'Mariana Lima', 'mariana.lima@biblioteca.com', '85 9 7777-8888'),
(8, 'Ricardo Alves', 'ricardo.alves@biblioteca.com', '85 9 8888-9999'),
(9, 'Daniela Costa', 'daniela.costa@biblioteca.com', '85 9 9999-0000'),
(10, 'Rafael Santos', 'rafael.santos@biblioteca.com', '85 9 0000-1111');

-- Dados da tabela Emprestimo
INSERT INTO Emprestimo (ID_Emprestimo, ID_Usuario, ID_Bibliotecario, Data_Emprestimo, Data_Devolucao, Status) VALUES
(1, 1, 1, '2024-08-01', '2024-08-15', 'Ativo'),
(2, 2, 2, '2024-08-03', '2024-08-17', 'Ativo'),
(3, 3, 3, '2024-08-05', '2024-08-19', 'Ativo'),
(4, 4, 4, '2024-08-07', '2024-08-21', 'Ativo'),
(5, 5, 5, '2024-08-09', '2024-08-23', 'Ativo'),
(6, 6, 6, '2024-08-01', '2024-08-15', 'Concluído'),
(7, 7, 7, '2024-08-02', '2024-08-16', 'Concluído'),
(8, 8, 8, '2024-08-04', '2024-08-18', 'Concluído'),
(9, 9, 9, '2024-08-06', '2024-08-20', 'Concluído'),
(10, 10, 10, '2024-08-08', '2024-08-22', 'Concluído');

-- Dados da tabela Reserva
INSERT INTO Reserva (ID_Reserva, ID_Livro, ID_Usuario, Data_Reserva, Status) VALUES
(1, 1, 1, '2024-08-01', 'Ativa'),
(2, 2, 2, '2024-08-02', 'Ativa'),
(3, 3, 3, '2024-08-03', 'Ativa'),
(4, 4, 4, '2024-08-04', 'Ativa'),
(5, 5, 5, '2024-08-05', 'Ativa'),
(6, 6, 6, '2024-08-06', 'Ativa'),
(7, 7, 7, '2024-08-07', 'Ativa'),
(8, 8, 8, '2024-08-08', 'Ativa'),
(9, 9, 9, '2024-08-09', 'Ativa'),
(10, 10, 10, '2024-08-10', 'Ativa');

-- Dados da tabela Multa
INSERT INTO Multa (ID_Multa, ID_Emprestimo, Valor) VALUES
(1, 1, 5.00),
(2, 2, 7.50),
(3, 3, 10.00),
(4, 4, 2.50),
(5, 5, 12.00),
(6, 6, 4.00),
(7, 7, 6.00),
(8, 8, 3.00),
(9, 9, 8.00),
(10, 10, 5.50);
