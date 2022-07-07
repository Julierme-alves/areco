create database areco_teste;
use areco_teste;

create table tproduto(
	codigo int identity(1,1) primary key,
	descricao varchar(100),
	valor float,
	data_venc date,
	marca varchar(50),
	ativo int
);

select * from tproduto
insert into tproduto values
    ('produto teste 1',10,'2022-07-06','teste',1),
	('produto teste 2',20,'2022-07-06','teste 2',1),
	('produto teste 3',10,'2022-07-06','teste',1),
	('produto teste 4',20,'2022-07-06','teste 2',1),
    ('produto teste 5',30,'2022-07-06','teste',1),
	('produto teste 6',40,'2022-07-06','teste 2',1),
	('produto teste 7',50.8,'2022-07-06','teste',1),
	('produto teste 8',60,'2022-07-06','teste 2',1),
	('produto teste 9',70,'2022-07-06','teste',1),
	('produto teste 10',80,'2022-07-06','teste 2',1)
