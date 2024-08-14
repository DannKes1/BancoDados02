create database SistemaFinanceiro;
Use SistemaFinanceiro;
 -- drop database SistemaFinanceiro;


create table Servicos(
Id_Servicos int primary key auto_increment,
Valor double not null,
Descricao varchar (100) not null,
Tempo time not null
);


create table Cliente(
Id_Cliente int primary key auto_increment,
Nome_Cliente varchar (100) not null,
CPF_Cliente varchar (15) not null,
Email_Cliente varchar (50),
Telefone_Cliente varchar (20) not null,
Data_Nascimento_Cliente datetime not null
);


create table Venda (
Id_Venda int primary key auto_increment, 
Data_Venda datetime not null,
Hora_Venda time not null,
Valor_Total double not null,
Desconto double,
Valor_Final double not null,
Tipo_Venda varchar (30) not null,
FK_Cliente int,
foreign key (FK_Cliente) references Cliente (Id_Cliente)
);


Create table Venda_Servicos(
Id_VendaServicos int primary key auto_increment,
FK_Servicos int not null,
foreign key (FK_Servicos) references Servicos (Id_Servicos),
FK_Venda int not null,
foreign key (FK_Venda) references Venda (Id_Venda) on delete cascade 
);


-- vou ter que fazer um crude nessa tabela
create table Funcionario (
Id_Funcionario int primary key auto_increment,
Nome_Funcionario Varchar (100) not null,
CPF_Funcionario Varchar (15) not null
);


create table Caixa(
Id_Caixa int primary key auto_increment,
Saldo_Inicial double,
Total_Entradas double not null, 
Total_Saidas double not null,
Status_Caixa varchar (100),
FK_Funcionario int,
foreign key (FK_Funcionario) references Funcionario (Id_Funcionario)
);
alter table Caixa add column Saldo_Final double;


create table Recebimento(
Id_Recebimento int primary key auto_increment,
Valor_Recebimento double ,
Data_Vencimento datetime not null,
Data_Pagamento datetime not null, 
Status_Recebimento varchar (50),
FK_Caixa int not null,
foreign key (FK_Caixa) references Caixa (Id_Caixa)
);



create table Fornecedor(
Id_Fornecedor int primary key auto_increment,
Razao_Social varchar(100),
Nome varchar(100),
CNPJ varchar(100),
Ativo varchar(15),
Atividade_Economica varchar (100),
Telefone varchar(25),
Email varchar (100)
);
alter table fornecedor add column FK_Despesa int not null;

insert into fornecedor (Razao_Social, Nome, CNPJ, Ativo, Atividade_Economica, Telefone, Email)
values ("H.S Calçados", "Casa da Sogra", "444.444.0001-02","Sim","Empresa de Calcados", "66-99999-4444", "hscalcados@gmail.com");

select *from fornecedor;



create table Despesa (
Id_Despesa int primary key auto_increment,
Valor double not null,
Data_Vencimento datetime not null,
Data_Pagamento datetime not null, 
Status_Despesa varchar (50) not null,
FK_Caixa int not null,
foreign key (FK_Caixa) references Caixa (Id_Caixa)
);
alter table despesa add column FK_Fornecedor int not null;

update despesa
set FK_Fornecedor = 1
where id_despesa = "1";

select * from despesa;


create table Dispositivo (
Id_Dispositivo int primary key auto_increment,
Aliquota double,
Descricao_Dispositivo varchar (100) not null,
Status_Dispositivo varchar (30) not null
);


-- fk recebimento fica nessa tabela
create table Encargo(
Id_Encargo int primary key auto_increment,
Valor double not null,
Descricao varchar (50),
FK_Dispositivo int, 
foreign key (FK_Dispositivo) references Dispositivo (Id_Dispositivo),
FK_Recebimento int not null,
foreign key (FK_Recebimento) references Recebimento (Id_Recebimento) on delete cascade
);





insert into Servicos (Valor, Descricao, Tempo) values ("400", "manutencao monitor", "10:30");
insert into Servicos (Valor, Descricao, Tempo) values ("50", "manutencao teclado", "14:30");
insert into Servicos (Valor, Descricao, Tempo) values ("60", "manutencao mouse", "10:00");
insert into Servicos (Valor, Descricao, Tempo) values ("200", "manutencao roteador", "11:30");
insert into Servicos (Valor, Descricao, Tempo) values ("150", "manutencao CPU", "10:30");
insert into Servicos (Valor, Descricao, Tempo) values ("300", "troca memoria ram", "16:30");
insert into Servicos (Valor, Descricao, Tempo) values ("450", "manutencao placa mae", "15:30");
insert into Servicos (Valor, Descricao, Tempo) values ("120", "limpeza", "00:00:30");




update Servicos set Descricao = "manutencao monitor e placa da tela" where Id_Servicos = 1;

alter table Venda_Servicos add column Valor_Unitario double;
alter table Venda_Servicos add column Quantidade int;

select * from Cliente order by Id_Cliente desc;


update Venda_Servicos set Valor_Unitario = 400 where Id_VendaServicos = 1;
update Venda_Servicos set Quantidade = 1 where Id_VendaServicos = 1;

select * from Venda_Servicos;
select * from caixa;

insert into Funcionario (Nome_Funcionario, CPF_Funcionario) values ("Pedrinho mecanico", "032.313.222-00");
insert into Funcionario (Nome_Funcionario, CPF_Funcionario) values ("Zezinho", "011.111.222-00");
insert into Funcionario (Nome_Funcionario, CPF_Funcionario) values ("Joazinho do lavador", "123.456.777-11");

insert into Cliente (Nome_Cliente, CPF_Cliente, Email_Cliente, Telefone_Cliente, Data_Nascimento_Cliente) values ("Jose","042.313.313-43", "Jose@gmail.com","69 99326 - 4777", "2004-07-20");
insert into Cliente (Nome_Cliente, CPF_Cliente, Email_Cliente, Telefone_Cliente, Data_Nascimento_Cliente) values ("Dieguin Lacoeste","111.333.222.54", "dieguin@gmail.com","69 11111 - 2222", "2004-02-11");
insert into Cliente (Nome_Cliente, CPF_Cliente, Email_Cliente, Telefone_Cliente, Data_Nascimento_Cliente) values ("Pedro Jacaré","333.222.111.-05", "pedro@gmail.com","69 99991 - 7776", "2001-03-11");
insert into Cliente (Nome_Cliente, CPF_Cliente, Email_Cliente, Telefone_Cliente, Data_Nascimento_Cliente) values ("Diego Crocodilo","333.785.222.-05", "diego@gmail.com","69 11111 - 7776", "2001-03-20");
insert into Cliente (Nome_Cliente, CPF_Cliente, Email_Cliente, Telefone_Cliente, Data_Nascimento_Cliente) values ("Juca Flux","333.555.654.-05", "jucaflux@gmail.com","69 15314 - 7776", "2004-05-21");


insert into Venda (Data_Venda, Hora_Venda, Valor_Total, Desconto, Valor_Final, Tipo_Venda) values ("2023-02-24", "10:30", "300", "0","300", "debito");
insert into Venda (Data_Venda, Hora_Venda, Valor_Total, Desconto, Valor_Final, Tipo_Venda) values ("2020-01-22", "11:30", "50", "0","50", "debito");
insert into Venda (Data_Venda, Hora_Venda, Valor_Total, Desconto, Valor_Final, Tipo_Venda) values ("2023-05-30", "09:30", "100", "0","100", "debito" );
insert into Venda (Data_Venda, Hora_Venda, Valor_Total, Desconto, Valor_Final, Tipo_Venda, FK_Cliente) values ("2022-04-11", "12:30", "400", "0","400", "debito", 3);
insert into Venda (Data_Venda, Hora_Venda, Valor_Total, Desconto, Valor_Final, Tipo_Venda, FK_Cliente) values ("2022-06-20", "07:30", "100", "0","100", "debito", 1);
insert into Venda (Data_Venda, Hora_Venda, Valor_Total, Desconto, Valor_Final, Tipo_Venda, FK_Cliente) values ("2022-04-15", "16:30", "50", "0","400", "debito", 2);

select * from venda;

insert into caixa (Id_Caixa, Saldo_Inicial, Total_Entradas, Total_Saidas, Status_Caixa, FK_Funcionario) values ("1", "0", "0", "0", "Aberto", "1");

insert into recebimento (Valor_Recebimento, Data_Vencimento, Data_Pagamento, Status_Recebimento, FK_Caixa) values ("300", "2024-01-01", "2023-12-20", "Pago", 1);
insert into recebimento (Valor_Recebimento, Data_Vencimento, Data_Pagamento, Status_Recebimento, FK_Caixa) values ("50", "2024-01-05", "2023-12-26", "Pago", 1);
insert into recebimento (Valor_Recebimento, Data_Vencimento, Data_Pagamento, Status_Recebimento, FK_Caixa) values ("100", "2024-01-10", "2023-01-01", "Pago", 1);

insert into despesa (Valor, Data_Vencimento, Data_Pagamento, Status_Despesa, FK_Caixa) values ("250", "2024-01-10", "2024-01-10", "Pago", 1);

insert into dispositivo (Aliquota, Descricao_Dispositivo, Status_Dispositivo) values ("0", "que?","inativo");

insert into encargo (Valor, Descricao, FK_Dispositivo, FK_Recebimento) values ("300", "NAO SEI", 1, 1);
select * from venda_servicos;

insert into Venda_Servicos (FK_Servicos, FK_Venda) values (1, 1); 
insert into Venda_Servicos (FK_Servicos, FK_Venda) values (1, 1); 
select * from venda_servicos;
insert into Venda_Servicos (FK_Servicos, FK_Venda,Valor_Unitario, Quantidade) values (2, 2, 300, 1); 
insert into Venda_Servicos (FK_Servicos, FK_Venda,Valor_Unitario, Quantidade) values (3, 1, 250, 2); 
insert into Venda_Servicos (FK_Servicos, FK_Venda,Valor_Unitario, Quantidade) values (3, 1, 250, 2);



select * from venda inner join cliente on cliente.Id_Cliente = venda.FK_Cliente; -- pega onde tem as duas informações
select * from venda left join cliente on cliente.Id_Cliente = venda.FK_Cliente; -- pega as informacoes da tabela da esquerda "primeira tabela"

select * from servicos order by valor desc;
select max(valor) from servicos;
select min(valor) from servicos;

select * from servicos where valor >100 and tempo = '00:00:30';
select * from servicos where descricao like "l%";

select Nome_Cliente, Cpf_Cliente from cliente;

select * from venda where fk_cliente is not null;
-- inner join
select * from venda inner join cliente on FK_Cliente = cliente.Id_Cliente where FK_Cliente is not null;
-- left join 
select * from venda left join cliente on FK_Cliente = cliente.Id_Cliente;
-- right join
select * from venda right join cliente on FK_Cliente = cliente.Id_Cliente;
-- full join
select * from venda full join cliente on FK_Cliente = cliente.Id_Cliente;
-- union
select Nome_Funcionario, CPF_Funcionario from funcionario
union 
Select Nome_Cliente, CPF_Cliente from cliente;


 select max(valor) from servicos;
-- duas formas de fazer
select * from servicos where valor in (select max(valor) from servicos);
select * from servicos where valor = (select max(valor) from servicos);


-- todo seervico que tem o valor maior que a media do valor servico
select * from servicos where valor > (select avg(valor) from servicos); 

select * from recebimento inner join caixa on caixa.id_caixa = Recebimento.fk_caixa
inner join funcionario on id_funcionario = caixa.fk_funcionario;



select * from servicos;

update servicos
set valor = "50"
where id_servicos = 1; 

select Id_vendaServicos, FK_Servicos, Descricao from Venda_Servicos inner join Servicos 
on FK_Servicos = Servicos.Id_Servicos;

-- id vendar, valor venda, nome cliente
select * from venda;
select * from cliente;

select Id_venda, valor_final, nome_cliente  from venda left join cliente 
on fk_cliente = cliente.Id_Cliente;

-- todos os dados da despesa e fornecedor
select * from despesa;
select * from fornecedor;

select * from despesa inner join fornecedor 
on fk_fornecedor = fornecedor.id_fornecedor;


-- todos os caixas com nome e cpf funcionario
select * from caixa;
select * from funcionario; 
select id_Caixa, saldo_inicial, total_entradas, total_saidas, status_caixa, fk_funcionario, saldo_final, nome_funcionario, cpf_funcionario from caixa inner join funcionario
on fk_funcionario = funcionario.id_funcionario;
-- outra maneira de fazer o codigo de cima.
select caixa.*, funcionario.nome_funcionario from caixa inner join funcionario
on fk_funcionario = funcionario.id_funcionario;

-- servicos e quantas vezes ele foi vendido na tabela venda_Servicos
select * from venda_servicos;
select * from servicos;
select * from servicos where 
(select  count(id_vendaservicos) from venda_servicos where fk_Servicos = id_Servicos ) > 1;

