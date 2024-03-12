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

CREATE TABLE pedido (
	id int,
	clientes_id int,
	data_pedido date,
	primary key(id),
	constraint fk_pedido_clientes
		FOREIGN key(clientes_id)
		REFERENCES clientes(id)
);


insert into clientes (id, nome) values 
(1, 'joão'), (2, 'maria'), (3, 'pedro'), (4, 'juvenal'), (5, 'carlos'), (6, 'marcos');

insert into pedido (id, clientes_id, data_pedido) values
(101, 1, '2024-03-01'), (102, 1, '2024-03-05'), (103, 2, '2024-03-02'), (104, 3, '2024-03-03'),
(105, 3, '2024-03-07'), (106, 4, '2024-03-06'), (107, 2, '2024-03-08'), (108, 5, '2024-03-09'), 
(109, 5, '2024-03-10');

insert into pedido (id, data_pedido) values (110, '2024-03-11');

select id, nome from clientes c ;
select id, clientes_id, data_pedido from pedido p ;


/*inner join retorna registros quando ha pelo menos uma correspondencia em ambas as tabelas*/
select c.id, c.nome, p.id, p.data_pedido, p.clientes_id
from clientes c inner join pedido p on c.id = p.clientes_id;


/*left join retorna todos os registro da tabela A e os registro correspondente a ela da tabela B*/
select c.id, c.nome, p.id, p.data_pedido, p.clientes_id
from clientes c left join pedido p on c.id = p.clientes_id;


/*right join retorna todos os registro da tabela B e os registro correspondente a ela da tabela A*/
select c.id, c.nome, p.id, p.data_pedido, p.clientes_id
from clientes c right join pedido p on c.id = p.clientes_id;




