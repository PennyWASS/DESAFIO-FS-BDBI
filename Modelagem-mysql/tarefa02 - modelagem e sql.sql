CREATE DATABASE hoteis;
USE hoteis;

CREATE TABLE Cliente (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(30),
    genero VARCHAR(30),
    telefone VARCHAR(30),
    idade INTEGER
);

CREATE TABLE Quarto (
    id_apartamento VARCHAR(10) PRIMARY KEY,
    tipo_apartamento VARCHAR(30),
    preco FLOAT,
    avaliacao FLOAT,
    data_reserva DATE,
    check_in DATE,
    check_out DATE,
    diponibilidade BOOLEAN
);

CREATE TABLE Endereco (
    id_endereco VARCHAR(10) PRIMARY KEY,
    estado VARCHAR(30),
    bairro VARCHAR(30),
    rua VARCHAR(30),
    cep VARCHAR(30),
    cidade VARCHAR(30),
    numero INTEGER
);

CREATE TABLE Pagamento (
    id_pagamento VARCHAR(10) PRIMARY KEY,
    forma_de_pagamento VARCHAR(30),
    quantidade_parcelas INTEGER,
    data_pagamento DATE
);

CREATE TABLE Hotel (
    id_hotel VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(30),
    quantidade_de_quartos INTEGER,
    avaliacao FLOAT
);

CREATE TABLE Procura (
    fk_Cliente_cpf VARCHAR(14),
    fk_Quarto_id_apartamento VARCHAR(10)
);

CREATE TABLE Dispoe (
    fk_Hotel_id_hotel VARCHAR(10),
    fk_Quarto_id_apartamento VARCHAR(10)
);

CREATE TABLE Fornece (
    fk_Endereco_id_endereco VARCHAR(10),
    fk_Cliente_cpf VARCHAR(14)
);

CREATE TABLE Informa_Cliente_Hotel_Pagamento (
    fk_Cliente_cpf VARCHAR(14),
    fk_Hotel_id_hotel VARCHAR(10),
    fk_Pagamento_id_pagamento VARCHAR(10)
);

#Adicinando a coluna telefone à tabela Hotel
ALTER TABLE Hotel ADD COLUMN telefone VARCHAR(30) NOT NULL;

#Inserindo os dados nas tabelas:
INSERT INTO Cliente VALUES('278.089.756-21', 'João', 'M', '(83) 98851-2344', '24'),
('131.537.214-24', 'Maria', 'F', '(83) 99577-5078', '30'),
('894.189.461-14', 'Ana', 'F', '(83) 99693-3933', '25'),
('822.253.401-70', 'Pedro', 'M', '(83) 98254-7610', '38');

INSERT INTO Quarto VALUES('1', 'Luxo', 5000, 4.2, '2024-01-20', '2024-01-25', '2024-02-05', TRUE),
('2', 'Delux', 10000, 5, '2024-01-27', '2024-01-30', '2024-02-06', TRUE),
('3', 'Kitnet', 400, 3.8, '2023-12-28', '2024-01-04','2024-01-12', TRUE),
('4', 'Luxo', 5000, 4.2, '2024-02-05','2024-02-26','2024-03-20', FALSE);
    
INSERT INTO Endereco VALUES('1', 'PB', 'Centro', 'Antonio Dutra', '58890-000', 'Brejo do Cruz', 123),
('2', 'PB', 'Água Fria', 'Eilzo Afonso', '58053-018', 'João Pessoa', 456),
('3', 'PB', 'Centro', 'Antonio Dutra', '58890-000', 'Brejo do Cruz', 987),
('4', 'PB', 'Água Fria', 'Antonio Dutra', '58890-000', 'Brejo do Cruz', 294);

INSERT INTO Pagamento VALUES('1', 'Crédito', 12, '2024-02-05'),
('2', 'Débito', 1, '2024-01-24'),
('3', 'Cartão', 6, '2024-03-04'),
('4', 'Cartão', 12, '2024-01-04');

INSERT INTO Hotel VALUES('1', 'Ocean Palace', 5, 4.8, '(83) 98293-1460'),
('2', 'Aquaria', 2, 4.3, '(83) 98623-2453'),
('3', 'Thermas', 10, 4.7, '(83) 99989-5040'),
('4', 'Rifoles', 5, 3.9, '(83) 98362-4025');


#Apresentando as informações:
SELECT * FROM Cliente;
SELECT * FROM Quarto;
SELECT * FROM Endereco;
SELECT * FROM Pagamento;
SELECT * FROM Hotel;

ALTER TABLE Procura ADD CONSTRAINT FK_Procura_1
    FOREIGN KEY (fk_Cliente_cpf)
    REFERENCES Cliente (cpf)
    ON DELETE SET NULL;
 
ALTER TABLE Procura ADD CONSTRAINT FK_Procura_2
    FOREIGN KEY (fk_Quarto_id_apartamento)
    REFERENCES Quarto (id_apartamento)
    ON DELETE SET NULL;
 
ALTER TABLE Dispoe ADD CONSTRAINT FK_Dispoe_1
    FOREIGN KEY (fk_Hotel_id_hotel)
    REFERENCES Hotel (id_hotel)
    ON DELETE SET NULL;
 
ALTER TABLE Dispoe ADD CONSTRAINT FK_Dispoe_2
    FOREIGN KEY (fk_Quarto_id_apartamento)
    REFERENCES Quarto (id_apartamento)
    ON DELETE SET NULL;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_1
    FOREIGN KEY (fk_Endereco_id_endereco)
    REFERENCES Endereco (id_endereco)
    ON DELETE SET NULL;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_2
    FOREIGN KEY (fk_Cliente_cpf)
    REFERENCES Cliente (cpf)
    ON DELETE SET NULL;
 
ALTER TABLE Informa_Cliente_Hotel_Pagamento ADD CONSTRAINT FK_Informa_Cliente_Hotel_Pagamento_1
    FOREIGN KEY (fk_Cliente_cpf)
    REFERENCES Cliente (cpf)
    ON DELETE NO ACTION;
 
ALTER TABLE Informa_Cliente_Hotel_Pagamento ADD CONSTRAINT FK_Informa_Cliente_Hotel_Pagamento_2
    FOREIGN KEY (fk_Hotel_id_hotel)
    REFERENCES Hotel (id_hotel)
    ON DELETE NO ACTION;
 
ALTER TABLE Informa_Cliente_Hotel_Pagamento ADD CONSTRAINT FK_Informa_Cliente_Hotel_Pagamento_3
    FOREIGN KEY (fk_Pagamento_id_pagamento)
    REFERENCES Pagamento (id_pagamento)
    ON DELETE NO ACTION;