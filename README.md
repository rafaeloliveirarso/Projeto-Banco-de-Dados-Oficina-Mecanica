# Projeto Conceitual de Banco de Dados - "Ofinica Mecânica"

### COMO ME ENCONTRAR?
[![LinkedIn](https://img.shields.io/badge/LinkedIn-000000?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rafaeloliveirarso/) 
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rafaeloliveirarso)
[![Gmail](https://img.shields.io/badge/Gmail-000000?style=for-the-badge&logo=gmail&logoColor=red)](mailto:rafael.silvaoliveira1992@gmail.com)


### REFINAMENTO DO MODELO RELACIONAL

Foram realizadas as alterações no esquema conceitual para que o mesmo refletisse o modelo relacional.

O scrip do BD e das Queries estarão aqui abaixo para uma rápida consulta, mas o arquivo final com todos os scripts também constará na pasta do trabalho, junto com todos os scripts de registros.

## SCRIPT BD
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

## QUERIES
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


