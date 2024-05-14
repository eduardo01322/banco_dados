-- apagar database caso exista
DROP DATABASE IF EXISTS pizzaria;

-- criar databaes senão existir
CREATE DATABASE IF NOT EXISTS pizzaria;

USE pizzaria;

-- Tabela CLIENTE
 CREATE TABLE IF NOT EXISTS Cliente (
 cliente_id INTEGER AUTO_INCREMENT,
 telefone VARCHAR(14),
 nome VARCHAR(30),
 logradouro VARCHAR(30),
 numero DECIMAL(5,0),
 complemento VARCHAR(30),
 bairro VARCHAR(30),
 referencia VARCHAR(30),
 PRIMARY KEY (cliente_id)
 );
 
 -- Tabela PIZZA
 CREATE TABLE IF NOT EXISTS pizza (
    pizza_id INTEGER AUTO_INCREMENT,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(4 , 2 ),
    PRIMARY KEY (pizza_id)
 );
 
 -- Tabela PEDIDO
 CREATE TABLE IF NOT EXISTS pedido (
    pedido_id INTEGER AUTO_INCREMENT,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 ),
        PRIMARY KEY (pedido_id),
    FOREIGN KEY (cliente_id)
        REFERENCES Cliente (cliente_id)
 );
 
 -- Tabela ITEM_PEDIDO
 CREATE TABLE IF NOT EXISTS item_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade DECIMAL(2 , 0 ),
    valor DECIMAL(5 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizza (pizza_id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedido (pedido_id)
 );
 
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- inserir pizza
INSERT INTO pizza (nome, valor) VALUES ('Portuguesa', 15);
INSERT INTO pizza (nome, valor) VALUES ('Provolone', 17);
INSERT INTO pizza (nome, valor) VALUES ('4 Queijos', 20);
INSERT INTO pizza (nome, valor) VALUES ('Calabresa', 17);
INSERT INTO pizza (nome) VALUES ('Escarola');

-- inserir pedido;
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);

-- inserir item_pedido ;
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 4, 1, 17.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (2, 3, 2, 40.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (3, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (5, 1, 3, 45.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (6, 5, 2, 44.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 1, 2, 30.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (8, 4, 2, 34.00);



-- EX: 1
create view todos_cliente as
select * from cliente c;


-- EX: 2
DELIMITER //
create function total_gasto_cliente(id int)
returns int
begin
	declare total_gasto int;
	select  sum(valor) into total_gasto from pedido p 
	where p.cliente_id = id;
	return total_gasto;
end //
DELIMITER ;


select total_gasto_cliente(1) as total_gasto;


-- EX: 3
delimiter //
create trigger pedidos_inc after insert on item_pedido for each row
begin
	update pedido p
	set p.valor = (select sum(ip.valor * ip.quantidade)
		from item_pedido ip 
		where ip.pedido_id = p.pedido_id)
	where pedido_id = new.pedido_id;
end //
delimiter ;

INSERT INTO pizzaria.pedido (cliente_id, `data`, valor) VALUES(6,curdate(),0);
INSERT INTO pizzaria.item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES(9, 1, 3, 15);
INSERT INTO pizzaria.item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES(9, 3, 1, 20);
select * from pedido p ;
select * from item_pedido where pedido_id  = 9


-- EX: 4
delimiter //
create trigger pedidos_alt after update on item_pedido for each row
begin
	update pedido p
	set p.valor = (select sum(ip.valor * ip.quantidade)
		from item_pedido ip 
		where ip.pedido_id = p.pedido_id)
	where pedido_id = old.pedido_id;

update pedido p
	set p.valor = (select sum(ip.valor * ip.quantidade)
		from item_pedido ip 
		where ip.pedido_id = p.pedido_id)
	where pedido_id = new.pedido_id;
end //
delimiter ;


UPDATE pizzaria.item_pedido
SET  quantidade= 4 , valor=valor 
where pedido_id=9;

select * from pedido p ;
select * from item_pedido where pedido_id  = 9


-- EX: 5
delimiter //
create trigger pedidos_del after delete on item_pedido for each row
begin
	update pedido p
	set p.valor = (select sum(ip.valor * ip.quantidade)
		from item_pedido ip 
		where ip.pedido_id = p.pedido_id)
	where pedido_id = pedido_id;
end //
delimiter ;


DELETE FROM pizzaria.item_pedido
WHERE pizza_id=1;

select * from pedido p ;
select * from item_pedido where pedido_id  = 9;


-- EX: 6
create view todas_pizzas as
select * from pizza p
where valor is not null
order by valor;

select * from todas_pizzas tp;


-- EX: 7
DELIMITER //
create function media_pedido(id int)
returns decimal(15,2)
begin
declare media decimal(15,2);
select avg(valor) into media from pedido where pedido_id= id   ;
return media;
end //
DELIMITER ;

select media_pedido(3);
select pedido_id, media_pedido(pedido_id)  from pedido;


-- EX: 8
create view maiores_gastos as
select cliente_id, sum(valor) as Valor_total from pedido p 
group by cliente_id 
order by Valor_total 
desc limit 10 ;

select * from maiores_gastos;


-- EX: 9
DELIMITER //
create function vendidas_periodo()
returns int
	begin
		declare total int;
		select sum(quantidade) into total 
		from item_pedido ip ;
	return total;
end //
DELIMITER ;


select vendidas_periodo() 
from pedido p
inner join item_pedido ip on ip.pedido_id = p.pedido_id 
where data > '2016-12-15' and  `data` < '2018-01-01'
group by vendidas_periodo();


-- EX: 10
DELIMITER //
create function pizza_pedido(id int)
returns decimal(15,2)
begin
declare total decimal(15,2);
select sum(quantidade) into total from item_pedido ip  where pedido_id= id   ;
return total;
end //
DELIMITER ;

select pizza_pedido(7) as pizza_pedido;





















