drop database if exists tipos_joins;

create database tipos_joins;

use tipos_joins;

create table cores (
	id int auto_increment,
	cor varchar(50),
	primary key (id)
);

create table frutas (
	id int auto_increment primary key,
	fruta varchar (50)
);

create table cores_frutas (
 	frutas_id int not null,
 	cores_id int not null,
 	primary key (frutas_id, cores_id),
 	constraint fk_cores_frutas_cores
 		foreign key (cores_id)
 		references cores(id),
 	constraint fk_cores_frutas_frutas
 		foreign key (frutas_id)
 		references frutas(id)
);

/*cadastra mais de um sem ter varios inserts*/
INSERT INTO tipos_joins.cores (cor) values
('vermelho'), ('amarelo'), ('verde');

select id, cor from cores;

insert into frutas (fruta) values
('maça'), ('banana'), ('maracuja'), ('jaca'), ('limao'), ('goiaba');

select id, fruta from frutas f;

/*cross join é uma função em que uni cada linha de uma tabela com cada linha 
 *de outra tabela (são produzidas todas as combinações possiveis)*/

select c.id, c.cor, f.id, f.fruta from cores c cross join frutas f;


insert into cores_frutas (cores_id, frutas_id)
select c.id as cores_id, f.id as frutas_id from cores c cross join frutas f;

select cores_id, frutas_id from cores_frutas cf;



create table clientes (
	id int,
	nome varchar(50),
	primary key(id)
);

CREATE TABLE pedidos (
	id int,
	clientes_id int,
	data_pedido date,
	primary key(id),
	constraint fk_pedidos_clientes
		FOREIGN key(clientes_id)
		REFERENCES clientes(id)
);





