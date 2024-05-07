drop database if exists escola;

create database if not exists escola;

use escola;


create table alunos (
	id int not null auto_increment,
	nome varchar(50) not null,
	idade int,
	primary key(id)
);

insert into alunos (nome, idade) values ('joão', 20);
insert into alunos (nome, idade) values ('maria', 22);
insert into alunos (nome, idade) values ('carlos', 19);

/* VIEW 
 *  View é uma representação virtual de uma tabela baseada em uma consulta sql
 * ela permite simplificar consultas complexas e reutilizar a lógica de consulta
 * create view <nome> as <pesquisa> */

create view alunosMaioresDe20 as 
select nome, idade from alunos where idade > 20;

alter view alunosmaioresde20 as 
select nome, idade, year(now()) - idade as ano_nascimento from alunos where idade > 20;

select * from alunosMaioresDe20;

/* FUNCTION
 * São blocos de códigos reutilizaveis que realizam uma tarefa específica
 * pode se usa-las para simplificar consultas, calculos ou manipulação de dados */

DELIMITER //
create function calculaMediaIdade()
returns decimal(5,2)
begin
	declare media decimal(5,2);
	select avg(idade) into media from alunos;
	return media;
end //
DELIMITER ;


select calculaMediaIdade() as mediaIdade;
select *, calculaMediaIdade() as mediaIdade from alunos; 


delimiter //
create function calcular_idade(data_nascimento date)
returns int
begin
	declare idade int;
	declare data_atual date;
	set data_atual = curdate();
	set idade = year(data_atual) - year(data_nascimento);
	if month(data_atual) < month(data_nascimento) or 
	(month(data_atual) = month(data_nascimento) and 
	day(data_atual) < day(data_nascimento)
	) then
	set idade = idade - 1;
	end if;
	return idade;
end //
delimiter ;

select calcular_idade('2007-09-09');

/* PROCEDURE
 *  Procedimentos são conjuntos de instruções sql armazenados no banco de dados
 * eles podem aceitar parâmetros e executar uma serie de comandos*/

delimiter //
create procedure adicionaAluno(x_nome varchar(50), x_idade int)
begin
	insert into alunos (nome, idade) values (x_nome, x_idade);
end //
delimiter ;

call adicionaAluno('Ana', 30);

/* Diferença entre Function e Procedure
 * Function -> retorna um valor. pode ser usado em expressão sql. exemplo Select calcularMedia();
 * Procedure -> não retorna um valor diretamente. Pode ter efeitos colaterais, como modificar 
 * dados no banco de dados. exemplo: Call adicionaAluno('Ana', 30) */

select * from alunos a;















