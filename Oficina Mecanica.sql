-- CRIANDO TABELAS

create database OficinaMecanica;
use OficinaMecanica;

-- Criar tabela Clientes
create table Clientes(
    cliente_id int auto_increment primary key,
    nome varchar(100),
    endereço varchar(255),
    telefone varchar(20)
);

-- Criar tabela Veículos
create table Veículos(
    veiculo_id int auto_increment primary key,
    cliente_id int,
    marca varchar(50),
    modelo varchar(50),
    ano int,
    placa varchar(20),
    foreign key (cliente_id) references Clientes(cliente_id)
);


-- Criar tabela Mecânicos
create table Mecânicos(
    mecanico_id int auto_increment primary key,
    nome varchar(100),
    endereço varchar(255),
    especialidade varchar(50)
);

-- Criar tabela Equipes
create table Equipes(
    equipe_id int auto_increment primary key,
    nome varchar(100)
);

-- Criar tabela Mecanico Equipes
create table Mecânicos_Equipes(
    mecanico_id int,
    equipe_id int,
    primary key (mecanico_id, equipe_id),
    foreign key (mecanico_id) references Mecânicos(mecanico_id),
    foreign key (equipe_id) references Equipes(equipe_id)
);

-- Criar tabela Ordens de Serviço
create table Ordens_de_Serviço(
    os_id int auto_increment primary key,
    veiculo_id int,
    equipe_id int,
    data_emissao date,
    data_conclusao date,
    valor_total decimal(10, 2),
    status varchar(50),
    foreign key (veiculo_id) references Veículos(veiculo_id),
    foreign key (equipe_id) references Equipes(equipe_id)
);

-- Criar tabela Serviços
create table Serviços(
    servico_id int auto_increment primary key,
    descricao varchar(255),
    valor_mao_de_obra decimal(10, 2)
);

-- Criar tabela Peças
create table Peças(
    peca_id int auto_increment primary key,
    descricao varchar(255),
    valor decimal(10, 2)
);

-- Criar tabela Estoque
create table Estoque(
    peca_id int,
    quantidade_disponivel int,
    primary key (peca_id),
    foreign key (peca_id) references Peças(peca_id)
);

-- Criar tabela OS Serviços
create table OS_Serviços(
    os_id int,
    servico_id int,
    quantidade int,
    valor_total decimal(10, 2),
    primary key (os_id, servico_id),
    foreign key (os_id) references Ordens_de_Serviço(os_id),
    foreign key (servico_id) references Serviços(servico_id)
);

-- Criar tabela OS Peças
create table OS_Peças(
    os_id int,
    peca_id int,
    quantidade int,
    valor_total decimal(10, 2),
    primary key (os_id, peca_id),
    foreign key (os_id) references Ordens_de_Serviço(os_id),
    foreign key (peca_id) references Peças(peca_id)
);

-- TESTANDO
show tables;

-- INSERINDO DADOS
-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (cliente_id, nome, endereço, telefone) VALUES
(1, 'Maria Silva', 'Endereço 1', '(11) 901000-0000'),
(2, 'João Souza', 'Endereço 2', '(11) 902000-0000'),
(3, 'Ana Oliveira', 'Endereço 3', '(11) 903000-0000'),
(4, 'Pedro Santos', 'Endereço 4', '(11) 904000-0000'),
(5, 'Lucas Pereira', 'Endereço 5', '(11) 905000-0000'),
(6, 'Mariana Costa', 'Endereço 6', '(11) 906000-0000'),
(7, 'Gabriel Almeida', 'Endereço 7', '(11) 907000-0000'),
(8, 'Juliana Lima', 'Endereço 8', '(11) 908000-0000'),
(9, 'Rafael Rodrigues', 'Endereço 9', '(11) 909000-0000'),
(10, 'Fernanda Martins', 'Endereço 10', '(11) 910000-0000');

-- Inserindo dados na tabela Veículos
INSERT INTO Veículos (veiculo_id, cliente_id, marca, modelo, ano, placa) VALUES
(1, 4, 'Toyota', 'Corolla', 2011, 'ABC0001'),
(2, 10, 'Honda', 'Civic', 2010, 'ABC0002'),
(3, 10, 'Ford', 'Focus', 2014, 'ABC0003'),
(4, 4, 'Chevrolet', 'Onix', 2010, 'ABC0004'),
(5, 8, 'Volkswagen', 'Gol', 2013, 'ABC0005'),
(6, 2, 'Fiat', 'Palio', 2015, 'ABC0006'),
(7, 3, 'Hyundai', 'HB20', 2012, 'ABC0007'),
(8, 6, 'Renault', 'Sandero', 2018, 'ABC0008'),
(9, 5, 'Nissan', 'March', 2017, 'ABC0009'),
(10, 1, 'Jeep', 'Renegade', 2020, 'ABC0010');

-- Inserindo dados na tabela Mecanicos
INSERT INTO Mecânicos (mecanico_id, nome, endereço, especialidade) VALUES
(1, 'Carlos Mendes', 'Endereço 1', 'Motor'),
(2, 'Roberto Lima', 'Endereço 2', 'Suspensão'),
(3, 'Paulo Ferreira', 'Endereço 3', 'Freios'),
(4, 'Ricardo Alves', 'Endereço 4', 'Elétrica'),
(5, 'José Barbosa', 'Endereço 5', 'Transmissão'),
(6, 'André Ribeiro', 'Endereço 6', 'Pintura'),
(7, 'Marcos Silva', 'Endereço 7', 'Lataria'),
(8, 'Eduardo Costa', 'Endereço 8', 'Diagnóstico'),
(9, 'Fernando Souza', 'Endereço 9', 'Ar Condicionado'),
(10, 'Luiz Oliveira', 'Endereço 10', 'Escapamento');

-- Inserindo dados na tabela Equipes
INSERT INTO Equipes (equipe_id, nome) VALUES
(1, 'Equipe Alfa'),
(2, 'Equipe Beta'),
(3, 'Equipe Gama'),
(4, 'Equipe Delta'),
(5, 'Equipe Épsilon'),
(6, 'Equipe Zeta'),
(7, 'Equipe Eta'),
(8, 'Equipe Teta'),
(9, 'Equipe Iota'),
(10, 'Equipe Kappa');

-- Inserindo dados na tabela Mecanico Equipes
INSERT INTO Mecânicos_Equipes (mecanico_id, equipe_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- Inserindo dados na tabela Ordens de Serviço
INSERT INTO Ordens_de_Serviço (os_id, veiculo_id, equipe_id, data_emissao, data_conclusao, valor_total, status) VALUES
(1, 4, 2, '2023-01-15', '2023-01-20', 500.75, 'Em andamento'),
(2, 10, 3, '2023-02-10', '2023-02-15', 300.50, 'Em andamento'),
(3, 10, 4, '2023-03-05', '2023-03-10', 450.25, 'Em andamento'),
(4, 4, 5, '2023-04-01', '2023-04-05', 600.00, 'Em andamento'),
(5, 8, 6, '2023-05-20', '2023-05-25', 700.80, 'Em andamento'),
(6, 2, 7, '2023-06-15', '2023-06-20', 800.90, 'Em andamento'),
(7, 3, 8, '2023-07-10', '2023-07-15', 900.60, 'Em andamento'),
(8, 6, 9, '2023-08-05', '2023-08-10', 1000.40, 'Em andamento'),
(9, 5, 10, '2023-09-01', '2023-09-05', 1100.30, 'Em andamento'),
(10, 1, 1, '2023-10-20', '2023-10-25', 1200.20, 'Em andamento');

-- Inserindo dados na tabela Serviços
INSERT INTO Serviços (servico_id, descricao, valor_mao_de_obra) VALUES
(1, 'Troca de óleo', 100.50),
(2, 'Alinhamento e balanceamento', 200.75),
(3, 'Revisão completa', 300.25),
(4, 'Troca de pastilhas de freio', 400.00),
(5, 'Troca de correia dentada', 500.80),
(6, 'Pintura completa', 600.90),
(7, 'Reparo de suspensão', 700.60),
(8, 'Diagnóstico eletrônico', 800.40),
(9, 'Reparo de ar condicionado', 900.30),
(10, 'Troca de escapamento', 1000.20);

-- Inserindo dados na tabela Peças
INSERT INTO Peças (peca_id, descricao, valor) VALUES
(1, 'Filtro de óleo', 50.75),
(2, 'Pneu', 60.50),
(3, 'Pastilha de freio', 70.25),
(4, 'Correia dentada', 80.00),
(5, 'Velas de ignição', 90.80),
(6, 'Bateria', 100.90),
(7, 'Amortecedor', 110.60),
(8, 'Radiador', 120.40),
(9, 'Compressor de ar condicionado', 130.30),
(10, 'Escapamento', 140.20);

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (peca_id, quantidade_disponivel) VALUES
(1, 33),
(2, 72),
(3, 34),
(4, 58),
(5, 62),
(6, 9),
(7, 62),
(8, 92),
(9, 67),
(10, 42);

-- Inserindo dados na tabela OS Serviços
INSERT INTO OS_Serviços (os_id, servico_id, quantidade, valor_total) VALUES
(1, 2, 3, 434.25),
(2, 8, 4, 428.51),
(3, 7, 3, 268.10),
(4, 9, 4, 461.64),
(5, 1, 3, 383.48),
(6, 8, 2, 84.91),
(7, 1, 4, 205.37),
(8, 2, 3, 338.35),
(9, 4, 1, 351.25),
(10, 5, 5, 241.03);

-- Inserindo dados na tabela OS Peças
INSERT INTO OS_Peças (os_id, peca_id, quantidade, valor_total) VALUES
(1, 8, 1, 186.55),
(2, 3, 5, 142.67),
(3, 4, 3, 210.75),
(4, 5, 2, 181.60),
(5, 6, 4, 403.60),
(6, 7, 1, 110.60),
(7, 1, 2, 101.50),
(8, 2, 3, 181.50),
(9, 9, 1, 130.30),
(10, 10, 2, 280.40);

-- TESTANTO
select * from OS_Serviços;
select * from Clientes;

-- QUERIES
-- Recuperações simples com SELECT Statement
-- Quais são os nomes de todos os clientes?
   SELECT nome FROM Clientes;
   
-- Quais são os modelos de todos os veículos?
   SELECT modelo FROM Veículos;
   
-- Filtros com WHERE Statement
-- Quais são os veículos do ano 2015?
   SELECT marca, modelo FROM Veículos WHERE ano = 2015;

-- Quais mecânicos têm especialidade em 'Motor'?
   SELECT nome FROM Mecânicos WHERE especialidade = 'Motor';

-- Crie expressões para gerar atributos derivados
-- Qual é o valor total das ordens de serviço, incluindo um imposto de 10%?
   SELECT os_id, valor_total, valor_total * 1.10 AS valor_com_imposto FROM Ordens_de_Serviço;

-- Defina ordenações dos dados com ORDER BY
-- Quais são os clientes ordenados pelo nome?
   SELECT nome FROM Clientes ORDER BY nome;

-- Quais são as ordens de serviço ordenadas pela data de emissão?
   SELECT os_id, data_emissao FROM Ordens_de_Serviço ORDER BY data_emissao;

-- Condições de filtros aos grupos – HAVING Statement
-- Quais ordens de serviço têm valor total maior que 1000?
   SELECT equipe_id, SUM(valor_total) AS valor_total FROM Ordens_de_Serviço GROUP BY equipe_id HAVING SUM(valor_total) > 1000;
 
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Quais são os nomes dos clientes e os modelos dos veículos que possuem?
   SELECT Clientes.nome, Veículos.modelo FROM Clientes JOIN Veículos ON Clientes.cliente_id = Veículos.cliente_id;
 
-- Quais são os nomes dos mecânicos e as equipes às quais pertencem?
   SELECT Mecânicos.nome, Equipes.nome AS equipe_nome FROM Mecânicos JOIN Mecânicos_Equipes ON Mecânicos.mecanico_id = Mecânicos_Equipes.mecanico_id JOIN Equipes ON Mecânicos_Equipes.equipe_id = Equipes.equipe_id;