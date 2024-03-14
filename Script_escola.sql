drop database if exists escola;

create database escola;

use escola;

create table alunos (
	id int not null auto_increment,
	nome varchar(255) not null,
	endereco varchar(255) not null,
	dt_nascimento date not null,
	RM int not null unique,
	primary key(id)
);

create table professores (
	id int not null auto_increment,
	nome varchar(255) not null,
	especialidade varchar(255) not null,
	grau_academico varchar(255) not null,
	primary key(id)
);

create table disciplinas (
	id int not null auto_increment,
	nome varchar(255) not null,
	professores_id int ,
	primary key (id),
	constraint fk_professores_disciplinas
		foreign key (professores_id)
		references professores (id)
);

create table notas (
	id int not null auto_increment,
	nota decimal(15,2) not null,
	disciplinas_id int not null,
	alunos_id int not null,
	primary key (id),
	constraint fk_disciplinas_notas
		foreign key (disciplinas_id)
		references disciplinas (id),
	constraint fk_alunos_id_notas
		foreign key (alunos_id)
		references alunos (id)
);
	
create table alunos_disciplinas (
	alunos_id int not null,
	disciplinas_id int not null,
	primary key (alunos_id, disciplinas_id),
	constraint fk_alunos_disciplinas
		foreign key (alunos_id)
		references alunos (id),
	constraint fk_disciplinas_alunos
		foreign key (disciplinas_id)
		references disciplinas (id)
);
	

INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 1', 'rua 1', '2000-03-04', 1);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 2', 'rua 2', '2000-03-04', 2);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 3', 'rua 3', '2000-03-04', 3);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 4', 'rua 4', '2000-03-04', 4);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 5', 'rua 5', '2000-03-04', 5);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 6', 'rua 6', '2000-03-04', 6);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 7', 'rua 7', '2000-03-04', 7);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 8', 'rua 8', '2000-03-04', 8);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 9', 'rua 9', '2000-03-04', 9);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 10', 'rua 10', '2000-03-04', 10);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 11', 'rua 11', '2000-03-04', 11);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 12', 'rua 12', '2000-03-04', 12);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 13', 'rua 13', '2000-03-04', 13);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 14', 'rua 14', '2000-03-04', 14);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 15', 'rua 15', '2000-03-04', 15);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 16', 'rua 16', '2000-03-04', 16);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 17', 'rua 17', '2000-03-04', 17);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 18', 'rua 18', '2000-03-04', 18);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 19', 'rua 19', '2000-03-04', 19);
INSERT INTO alunos (nome, endereco, dt_nascimento, RM) 
	VALUES ('aluno 20', 'rua 20', '2000-03-05', 20);

select id, nome, endereco, dt_nascimento, RM from alunos a;

update alunos set nome = 'novo', endereco = 'rua nova'
	where id  = 1;
	
/*delete from alunos where id = 2;*/
	

INSERT INTO professores (nome, especialidade, grau_academico) 
	VALUES ('professor 1', 'matematica', 'ensino superior completo');
INSERT INTO professores (nome, especialidade, grau_academico) 
	VALUES ('professor 2', 'portugues', 'ensino superior completo');
INSERT INTO professores (nome, especialidade, grau_academico) 
	VALUES ('professor 3', 'historia', 'ensino superior completo');
INSERT INTO professores (nome, especialidade, grau_academico) 
	VALUES ('professor 4', 'ciencias', 'ensino superior completo');
INSERT INTO professores (nome, especialidade, grau_academico) 
	VALUES ('professor 5', 'humanas', 'ensino superior completo');

select id, nome, especialidade, grau_academico from professores p;

update professores set nome = 'novo professor', grau_academico = 'doutorado'
	where id  = 1;
	
/*delete from professores where id = 2;*/


INSERT INTO disciplinas (nome, professores_id) 
	VALUES ('matematica', 1);
INSERT INTO disciplinas (nome, professores_id) 
	VALUES ('portugues', 2);
INSERT INTO disciplinas (nome, professores_id) 
	VALUES ('historia', 3);
INSERT INTO disciplinas (nome, professores_id) 
	VALUES ('ciencias', 4);
INSERT INTO disciplinas (nome, professores_id) 
	VALUES ('geografia', 5);
INSERT INTO disciplinas (nome) 
	VALUES ('senai');
	
select id, nome, professores_id from  disciplinas d;

update disciplinas  set nome = 'fisica', professores_id = 4
	where id  = 4;
	
/*delete from disciplinas where id = 3;*/


INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 1);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 2);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 3);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (8.22, 5, 4);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 5);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (9.22, 5, 6);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (10.00, 5, 7);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (7.00, 5, 8);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 9);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 10);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 11);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 12);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 13);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 14);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 15);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 16);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 17);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 18);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 19);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 5, 20);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 4, 1);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 3, 1);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 2, 1);
INSERT INTO notas (nota, disciplinas_id, alunos_id) 
	VALUES (2.22, 1, 1);

select id, nota, disciplinas_id, alunos_id from notas n;

update notas set nota = 4.22
	where id  = 1;
	
delete from notas where id = 1;
delete from notas where id = 22;


INSERT INTO alunos_disciplinas (disciplinas_id, alunos_id)
	select d.id as disciplinas_id, a.id as alunos_id from disciplinas d cross join alunos a;
	
select disciplinas_id, alunos_id from alunos_disciplinas ad;


/*EX:1 alunos selecionados em uma disciplina expecifica*/
select a.id, a.nome, a.RM, ad.alunos_id , d.nome 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	where d.nome = 'matematica';


/*EX:2 professores selecionados em uma disciplina expecifica*/
select p.id, p.nome, d.nome 
	from professores p  
	inner join disciplinas d on d.id = p.id
	where d.nome = 'matematica';

	
/*EX:3 alunos em cada disciplina*/
select a.id, a.nome, a.RM, ad.alunos_id , d.nome 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id;
	
	
/*EX:4 nota dos alunos em uma disciplina expecifica*/
select a.id, a.nome, a.RM, ad.alunos_id , d.nome, n.nota 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	inner join notas n on n.id = a.id 
	where d.nome = 'matematica';


/*EX:5 notas igual ou superior a 7*/
select a.id, a.nome, d.nome, n.nota 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	inner join notas n on n.id = a.id 
	where n.nota >= 7;


/*EX:6 notas igual ou superior a 7 em uma determinada disciplina*/
select a.id, a.nome, d.nome, n.nota 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	inner join notas n on n.id = a.id 
	where d.nome = 'matematica' and n.nota >= 7;


/*EX:7 notas superior a 7 em uma determinada disciplina*/
select a.id, a.nome, d.nome, n.nota 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	inner join notas n on n.id = a.id 
	where d.nome = 'matematica' and n.nota > 7;
	

/*EX:8 notas inferior a 7 em uma determinada disciplina*/
select a.id, a.nome, d.nome, n.nota 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	inner join notas n on n.id = a.id 
	where n.nota < 7;
	

/*EX:9 selecionar alunos por data de nascimento*/
select id, nome, endereco, dt_nascimento, RM from alunos a
	where dt_nascimento = '2000-03-04';
	

/*EX:10 Selecionar disciplinas que não têm notas registradas*/
select d.id, d.nome, n.nota  
	from  disciplinas d left join notas n on d.id = n.id 
	where n.nota is null ;


/*EX:11 Selecionar alunos com base na especialidade do professor que ministra a disciplina 
em que estão matriculados*/
select a.id, a.nome, d.nome, p.nome, p.especialidade  
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	inner join professores p on p.id = d.professores_id
	where p.especialidade = 'matematica';


/*EX:12 Selecionar alunos matriculados em disciplinas ministradas por professores com um 
determinado grau acadêmico*/
select a.id, a.nome, d.nome, p.nome, p.grau_academico 
	from alunos a 
	inner join alunos_disciplinas ad on a.id = ad.alunos_id  
	inner join disciplinas d on d.id = ad.disciplinas_id
	inner join professores p on p.id = d.professores_id
	where p.grau_academico = 'doutorado';


/*EX:13 Selecionar disciplinas que não têm professores registrados*/
select d.id, d.nome, p.nome   
	from  disciplinas d left join professores p on d.id = p.id 
	where d.professores_id is null;
