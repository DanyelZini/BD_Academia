-- Active: 1718503894068@@127.0.0.1@3306@sistema_academia

----------------------------------------
-- Criando Tabelas ---------------------

CREATE TABLE plano (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_plano VARCHAR(55) NOT NULL,
    valor_plano FLOAT NOT NULL,
    descricao TEXT
);

CREATE TABLE personal (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(55) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(55) NOT NULL,
    especialidade VARCHAR(55) NOT NULL
);

CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_usuario INT NOT NULL,
    cidade VARCHAR(55) NOT NULL,
    bairro VARCHAR(55) NOT NULL,
    rua VARCHAR(55) NOT NULL,
    adicional VARCHAR(55),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(55) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    email VARCHAR(55) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    data_aniversario DATE NOT NULL,
    data_cadastro DATE NOT NULL,
    status_ativo BOOLEAN NOT NULL
);

CREATE TABLE assinatura (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    status BOOLEAN NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id),
    FOREIGN KEY(id_plano) REFERENCES plano(id)
);

CREATE TABLE pagamento (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    data_pagamento DATE NOT NULL,
    stats_pagamento BOOLEAN NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);

CREATE TABLE horarios (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_personal INT NOT NULL,
    data DATE NOT NULL,
    hora INT NOT NULL,
    FOREIGN KEY(id_personal) REFERENCES personal(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
);

----------------------------------------
-- Insert dados FICTICIOS --------------

INSERT INTO plano (nome_plano, valor_plano, descricao) VALUES
('Mensal', 100.00, 'Plano mensal com acesso completo à academia.'),
('Trimestral', 270.00, 'Plano trimestral com desconto.'),
('Semestral', 500.00, 'Plano semestral com desconto.'),
('Anual', 900.00, 'Plano anual com desconto maior.'),
('Premium', 1500.00, 'Plano Premium com acesso a personal trainer e área VIP.');

INSERT INTO personal (nome, CPF, telefone, email, especialidade) VALUES
('João Silva', '12345678901', '11999999999', 'joao@personal.com', 'Musculação'),
('Ana Souza', '98765432100', '21988888888', 'ana@personal.com', 'Cardio'),
('Carlos Lima', '11122233344', '31977777777', 'carlos@personal.com', 'Crossfit'),
('Mariana Torres', '44455566677', '41966666666', 'mariana@personal.com', 'Yoga'),
('Lucas Pereira', '88899900011', '51955555555', 'lucas@personal.com', 'Pilates');

INSERT INTO usuario (nome, CPF, email, telefone, data_aniversario, data_cadastro, status_ativo) VALUES
('Pedro Oliveira', '12312312312', 'pedro@email.com', '11987654321', '1990-01-15', '2024-01-01', TRUE),
('Maria Fernandes', '32132132132', 'maria@email.com', '21987654322', '1985-06-25', '2024-02-01', TRUE),
('José Costa', '45645645645', 'jose@email.com', '31987654323', '1995-03-10', '2024-03-01', TRUE),
('Ana Lima', '65465465465', 'ana@email.com', '41987654324', '1998-08-20', '2024-04-01', TRUE),
('Carlos Almeida', '78978978978', 'carlos@email.com', '51987654325', '1992-11-12', '2024-05-01', TRUE),
('Fernanda Santos', '98798798798', 'fernanda@email.com', '61987654326', '1991-12-30', '2024-06-01', TRUE),
('Lucas Ramos', '85285285285', 'lucas@email.com', '71987654327', '1987-09-15', '2024-07-01', TRUE),
('Camila Barros', '15915915915', 'camila@email.com', '81987654328', '1980-05-05', '2024-08-01', TRUE),
('Ricardo Moreira', '75375375375', 'ricardo@email.com', '91987654329', '1993-02-14', '2024-09-01', TRUE),
('Beatriz Silva', '95195195195', 'beatriz@email.com', '12987654330', '1996-04-18', '2024-10-01', TRUE);

INSERT INTO endereco (id_usuario, cidade, bairro, rua, adicional) VALUES
(1, 'São Paulo', 'Centro', 'Rua A', 'Apto 101'),
(2, 'Rio de Janeiro', 'Copacabana', 'Rua B', NULL),
(3, 'Belo Horizonte', 'Savassi', 'Rua C', 'Casa 2'),
(4, 'Curitiba', 'Batel', 'Rua D', 'Apto 302'),
(5, 'Porto Alegre', 'Moinhos de Vento', 'Rua E', NULL),
(6, 'Florianópolis', 'Centro', 'Rua F', NULL),
(7, 'Salvador', 'Pituba', 'Rua G', 'Apto 204'),
(8, 'Fortaleza', 'Meireles', 'Rua H', NULL),
(9, 'Brasília', 'Asa Sul', 'Rua I', 'Apto 405'),
(10, 'Recife', 'Boa Viagem', 'Rua J', NULL);

INSERT INTO assinatura (id_usuario, id_plano, data_inicio, status) VALUES
(1, 1, '2024-01-01', TRUE),
(2, 2, '2024-02-01', TRUE),
(3, 3, '2024-03-01', TRUE),
(4, 4, '2024-04-01', TRUE),
(5, 5, '2024-05-01', TRUE),
(6, 1, '2024-06-01', TRUE),
(7, 2, '2024-07-01', TRUE),
(8, 3, '2024-08-01', TRUE),
(9, 4, '2024-09-01', TRUE),
(10, 5, '2024-10-01', TRUE);

INSERT INTO pagamento (id_usuario, data_pagamento, stats_pagamento) VALUES
(1, '2024-01-01', TRUE),
(2, '2024-02-01', TRUE),
(3, '2024-03-01', TRUE),
(4, '2024-04-01', TRUE),
(5, '2024-05-01', TRUE),
(6, '2024-06-01', TRUE),
(7, '2024-07-01', TRUE),
(8, '2024-08-01', TRUE),
(9, '2024-09-01', TRUE),
(10, '2024-10-01', TRUE);

INSERT INTO horarios (id_usuario, id_personal, data, hora) VALUES
(1, 1, '2024-01-05', 10),
(2, 2, '2024-01-10', 11),
(3, 3, '2024-01-15', 12),
(4, 4, '2024-01-20', 13),
(5, 5, '2024-01-25', 14),
(6, 1, '2024-02-05', 10),
(7, 2, '2024-02-10', 11),
(8, 3, '2024-02-15', 12),
(9, 4, '2024-02-20', 13),
(10, 5, '2024-02-25', 14);

----------------------------------------
