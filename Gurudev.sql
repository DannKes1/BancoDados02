create database Gurudev;
use Gurudev;


CREATE TABLE Marca (
Id_Marca INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(300) NOT NULL,
Observacoes VARCHAR (300),
Localidade VARCHAR (300)
);


CREATE TABLE Estado(
Id_Estado INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR (300) NOT NULL,
Sigla VARCHAR (4) NOT NULL,
Pais VARCHAR (30)
);


CREATE TABLE Cidade(
Id_Cidade INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR (100) NOT NULL,
IBGE VARCHAR (45) NOT NULL,
FK_Estado INT NOT NULL,
FOREIGN KEY (FK_Estado) REFERENCES Estado (Id_Estado)
);


CREATE TABLE ENDERECO (
Id_Endereco INT PRIMARY KEY AUTO_INCREMENT,
Cep VARCHAR(10) not null,
Logradouro VARCHAR(100) not null,
Bairro varchar(50) not null,
Numero INT NOT NULL,
FK_Cidade INT NOT NULL,
FOREIGN KEY (FK_Cidade) REFERENCES Cidade (Id_Cidade)
);


CREATE TABLE Proprietario(
Id_Proprietario INT PRIMARY KEY AUTO_INCREMENT,
Email VARCHAR (45) not null,
Telefone VARCHAR (45) not null,
FK_Endereco INT NOT NULL,
FOREIGN KEY (FK_Endereco) REFERENCES ENDERECO (Id_Endereco)
);


CREATE TABLE Modelo(
Id_Modelo INT PRIMARY KEY AUTO_INCREMENT,
descricao varchar(300) not null,
eixos int not null,
peso varchar(45) not null,
Quantidade_Passageiros varchar(45) not null,
cavalaria INT not null,
cilindradas INT not null,
FK_Marca INT NOT NULL,
FOREIGN KEY (FK_Marca) REFERENCES Marca (Id_Marca)
);

CREATE TABLE Veiculo(
Id_Veiculo INT PRIMARY KEY AUTO_INCREMENT,
Cor Varchar (45) NOT NULL,
Niv_Chassis VARCHAR (45) NOT NULL,
Placa VARCHAR(8) NOT NULL,
Num_Motor VARCHAR(45) not null,
Renavam VARCHAR (45) NOT NULL,
Ano_Fabricacao DATE NOT NULL,
Modelo_Fabricacao VARCHAR (60) NOT NULL,
FK_Modelo INT NOT NULL,
FOREIGN KEY (FK_Modelo) REFERENCES Modelo (Id_Modelo),
FK_Cidade INT NOT NULL,
FOREIGN KEY (FK_Cidade) REFERENCES Cidade (Id_Cidade),
FK_Proprietario INT NOT NULL,
FOREIGN KEY (FK_Proprietario) REFERENCES Proprietario (Id_Proprietario)
);

CREATE TABLE Multas(
Id_Multas iNT PRIMARY KEY AUTO_INCREMENT,
Descricao VARCHAR(200),
Grau VARCHAR (45),
VALOR DECIMAL,
PENALIDADE DECIMAL,
FATOR DECIMAL
);


Create table Infracoes (
Id_Infracoes  INT PRIMARY KEY AUTO_INCREMENT,
Data_ Datetime not null,
Longitude VARCHAR(45) NOT NULL,
LATITUDE VARCHAR (45) NOT NULL,
Horario DATETIME NOT NULL,
Valor_Aplicado DECIMAL,
FK_Veiculo INT NOT NULL,
FOREIGN KEY (FK_Veiculo) REFERENCES Veiculo (Id_Veiculo),
FK_Proprietario INT NOT NULL,
FOREIGN KEY (FK_Proprietario) REFERENCES Proprietario (Id_Proprietario),
FK_Multas INT NOT NULL,
FOREIGN KEY (FK_Multas) REFERENCES Multas (Id_Multas)
);


CREATE TABLE Proprietario_PF(
Id_Proprietario_PF  INT PRIMARY KEY AUTO_INCREMENT,
Email VARCHAR (50),
Telefone VARCHAR (20) NOT NULL,
CPF VARCHAR (11) NOT NULL,
RG VARCHAR (20) NOT NULL,
Data_Nascimento Datetime not null,
Sexo VARCHAR(20),
FK_Proprietario INT NOT NULL,
FOREIGN KEY (FK_Proprietario) REFERENCES Proprietario (Id_Proprietario)
);


CREATE TABLE PROPRIETARIO_PJ(
Id_Proprietario_PJ  INT PRIMARY KEY AUTO_INCREMENT,
CNPJ VARCHAR (15) NOT NULL,
Razao_Social VARCHAR(50),
Nome_Fantasia VARCHAR(50),
Situacao VARCHAR(20),
Atividade_Economica VARCHAR(100),
Inscricao_Estadual VARCHAR(45),
FK_Proprietario INT NOT NULL,
FOREIGN KEY (FK_Proprietario) REFERENCES Proprietario (Id_Proprietario)
);


CREATE TABLE CNH(
Id_CNH INT PRIMARY KEY AUTO_INCREMENT,
CNH_DataEmissao Datetime not null,
CNH_DataVencimento Datetime not null,
Categoria VARCHAR (10),
Pontuacao Int not null,
CNH_Num VARCHAR(45),
FK_Proprietario_PF INT NOT NULL,
FOREIGN KEY (FK_Proprietario_PF) REFERENCES Proprietario_PF (Id_Proprietario_PF)
);

INSERT INTO Estado (Nome, Sigla, Pais) VALUES
('Minas Gerais', 'MG', 'Brasil'),
('Rio Grande do Sul', 'RS', 'Brasil'),
('Paraná', 'PR', 'Brasil'),
('Santa Catarina', 'SC', 'Brasil'),
('Goiás', 'GO', 'Brasil'),
('Bahia', 'BA', 'Brasil'),
('Ceará', 'CE', 'Brasil'),
('Pará', 'PA', 'Brasil'),
('Amazonas', 'AM', 'Brasil'),
('Espírito Santo', 'ES', 'Brasil'),
('Rio Grande do Norte', 'RN', 'Brasil'),
('Pernambuco', 'PE', 'Brasil'),
('Maranhão', 'MA', 'Brasil'),
('Mato Grosso', 'MT', 'Brasil'),
('Alagoas', 'AL', 'Brasil');


INSERT INTO Cidade (Nome, IBGE, FK_Estado) VALUES
('São Paulo', '3550308', 1),
('Rio de Janeiro', '3304557', 2),
('Belo Horizonte', '3106200', 3),
('Porto Alegre', '4314902', 4),
('Salvador', '2927408', 5),
('Curitiba', '4106902', 6),
('Brasília', '5300108', 7),
('Fortaleza', '2304400', 8),
('Recife', '2611606', 9),
('Manaus', '1302603', 10),
('Belém', '1501402', 11),
('Goiânia', '5208707', 12),
('Florianópolis', '4205407', 13),
('São Luís', '2111300', 14),
('Campo Grande', '5002704', 15);

INSERT INTO Marca (Nome, Observacoes, Localidade) VALUES
('Toyota', 'Marca japonesa conhecida por sua confiabilidade e inovação.', 'Japão'),
('Ford', 'Uma das marcas mais antigas e tradicionais da indústria automobilística.', 'Estados Unidos'),
('Volkswagen', 'Marca alemã famosa por sua variedade de modelos e qualidade de construção.', 'Alemanha'),
('Honda', 'Conhecida por sua engenharia de precisão e motores eficientes.', 'Japão'),
('Chevrolet', 'Uma das marcas mais populares nos Estados Unidos, com uma grande variedade de veículos.', 'Estados Unidos'),
('Hyundai', 'Marca sul-coreana que cresceu rapidamente e é reconhecida por seus veículos bem equipados e acessíveis.', 'Coreia do Sul'),
('Renault', 'Fabricante francesa conhecida por seu design moderno e inovações tecnológicas.', 'França'),
('Fiat', 'Marca italiana famosa por seus carros compactos e de estilo peculiar.', 'Itália'),
('Mercedes-Benz', 'Uma das marcas de luxo mais renomadas do mundo, conhecida por sua qualidade e prestígio.', 'Alemanha'),
('BMW', 'Outra marca de luxo alemã, famosa por seus carros esportivos e de alto desempenho.', 'Alemanha'),
('Audi', 'Marca premium alemã que combina desempenho e elegância em seus veículos.', 'Alemanha'),
('Nissan', 'Marca japonesa que produz uma ampla gama de veículos, incluindo carros elétricos.', 'Japão'),
('Jeep', 'Marca americana especializada em veículos todo-terreno e SUVs robustos.', 'Estados Unidos'),
('Peugeot', 'Fabricante francesa com uma longa história na produção de carros de passeio e comerciais.', 'França'),
('Kia', 'Marca sul-coreana que se destaca por seu design arrojado e garantia de longa duração.', 'Coreia do Sul');

INSERT INTO ENDERECO (Cep, Logradouro, Bairro, Numero, FK_Cidade) VALUES
('12345-678', 'Rua A', 'Centro', 100, 1),
('23456-789', 'Avenida B', 'Bairro X', 200, 2),
('34567-890', 'Rua C', 'Bairro Y', 300, 3),
('45678-901', 'Avenida D', 'Bairro Z', 400, 4),
('56789-012', 'Rua E', 'Centro', 500, 5),
('67890-123', 'Avenida F', 'Bairro W', 600, 6),
('78901-234', 'Rua G', 'Bairro V', 700, 7),
('89012-345', 'Avenida H', 'Centro', 800, 8),
('90123-456', 'Rua I', 'Bairro U', 900, 9),
('01234-567', 'Avenida J', 'Bairro T', 1000, 10),
('12345-678', 'Rua K', 'Centro', 1100, 11),
('23456-789', 'Avenida L', 'Bairro S', 1200, 12),
('34567-890', 'Rua M', 'Bairro R', 1300, 13),
('45678-901', 'Avenida N', 'Centro', 1400, 14),
('56789-012', 'Rua O', 'Bairro Q', 1500, 15);


INSERT INTO Proprietario (Email, Telefone, FK_Endereco) VALUES
('proprietario1@example.com', '(11) 1234-5678', 1),
('proprietario2@example.com', '(22) 2345-6789', 2),
('proprietario3@example.com', '(33) 3456-7890', 3),
('proprietario4@example.com', '(44) 4567-8901', 4),
('proprietario5@example.com', '(55) 5678-9012', 5),
('proprietario6@example.com', '(66) 6789-0123', 6),
('proprietario7@example.com', '(77) 7890-1234', 7),
('proprietario8@example.com', '(88) 8901-2345', 8),
('proprietario9@example.com', '(99) 9012-3456', 9),
('proprietario10@example.com', '(10) 0123-4567', 10),
('proprietario11@example.com', '(11) 1234-5678', 11),
('proprietario12@example.com', '(22) 2345-6789', 12),
('proprietario13@example.com', '(33) 3456-7890', 13),
('proprietario14@example.com', '(44) 4567-8901', 14),
('proprietario15@example.com', '(55) 5678-9012', 15);


INSERT INTO Modelo (descricao, eixos, peso, Quantidade_Passageiros, cavalaria, cilindradas, FK_Marca) VALUES
('Sedan', 2, '1300 kg', '5', 130, 2000, 2),
('Hatch', 2, '1200 kg', '5', 120, 1800, 1),
('SUV', 2, '1500 kg', '7', 150, 2200, 3),
('Picape', 2, '1800 kg', '3', 160, 2500, 4),
('Crossover', 2, '1400 kg', '5', 140, 2100, 5),
('Coupé', 2, '1350 kg', '4', 170, 2300, 6),
('Furgão', 2, '1700 kg', '2', 180, 2700, 7),
('Utilitário', 2, '1600 kg', '9', 190, 2400, 8),
('Minivan', 2, '1550 kg', '8', 200, 2600, 9),
('Conversível', 2, '1250 kg', '2', 210, 2800, 10),
('Compacto', 2, '1100 kg', '5', 220, 1900, 11),
('Esportivo', 2, '1400 kg', '2', 230, 3000, 12),
('Caminhonete', 2, '1750 kg', '6', 240, 3100, 13),
('Van', 2, '1650 kg', '10', 250, 3200, 14),
('Microcarro', 2, '1000 kg', '2', 260, 1700, 15);

select * from veiculo;
INSERT INTO Veiculo(Cor, Niv_Chassis, Placa, Num_Motor, Renavam, Ano_Fabricacao, Modelo_Fabricacao, FK_Modelo, FK_Proprietario, FK_Cidade)
VALUES 
('Azul', '123456789', 'ABC1234', '987654', '12345678901', '2020-01-01', 'Fusca', 1, 1, 1),
('Vermelho', '987654321', 'DEF5678', '456789', '23456789012', '2019-02-01', 'Civic', 2, 2, 2),
('Preto', '456123789', 'GHI9012', '654321', '34567890123', '2021-03-01', 'Corolla', 3, 3, 3),
('Branco', '789456123', 'JKL3456', '321654', '45678901234', '2018-04-01', 'Gol', 4, 4, 4),
('Prata', '987123654', 'MNO7890', '789123', '56789012345', '2022-05-01', 'Onix', 5, 5, 5),
('Verde', '654789321', 'PQR1234', '987456', '67890123456', '2020-06-01', 'HB20', 6, 6, 6),
('Amarelo', '321987654', 'STU5678', '654987', '78901234567', '2019-07-01', 'Uno', 7, 7, 7),
('Cinza', '654321987', 'VWX9012', '123789', '89012345678', '2021-08-01', 'Tucson', 8, 8, 8),
('Laranja', '987654321', 'YZA3456', '987654', '90123456789', '2018-09-01', 'Siena', 9, 9, 9),
('Roxo', '123456789', 'BCD7890', '321987', '01234567890', '2022-10-01', 'Fiesta', 10, 10, 10),
('Marrom', '789123456', 'EFG1234', '789321', '12345678901', '2020-11-01', 'Fit', 11, 11, 11),
('Dourado', '456789123', 'HIJ5678', '456123', '23456789012', '2019-12-01', 'EcoSport', 12, 12, 12),
('Prata', '654321987', 'KLM9012', '987456', '34567890123', '2021-01-01', 'Logan', 13, 13, 13),
('Vermelho', '987654321', 'NOP3456', '654987', '45678901234', '2018-02-01', 'Cruze', 14, 14, 14),
('Azul', '321987654', 'QRS7890', '123789', '56789012345', '2022-03-01', 'HR-V', 15, 15, 15);



