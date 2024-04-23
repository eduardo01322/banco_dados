drop database if exists escola2;

create database escola2;

use escola2;


create table alunos (
	id_aluno int not null auto_increment,
	nome varchar(100) not null,
	dt_nascimento date,
	endereco varchar(255) not null,
	RM int not null unique,
	primary key(id_aluno)
);

create table professores (
	id_professor int not null auto_increment,
	nome varchar(100) not null,
	especialidade varchar(100),
	grau_academico varchar(100),
	primary key(id_professor)
);

create table disciplinas (
	id_disciplina int not null auto_increment,
	nome varchar(100) not null,
	id_professor int ,
	primary key (id_disciplina),
		foreign key (id_professor)
		references professores (id_professor)
);

create table notas (
	id_nota int not null auto_increment,
	id_aluno int not null,
	id_disciplina int not null,
	nota decimal(4,2) not null,
	primary key (id_nota),
	foreign key (id_aluno)
		references alunos (id_aluno),
	foreign key (id_disciplina)
		references disciplinas (id_disciplina)
);

create table matriculas (
	ano int not null,
	id_aluno int not null,
	id_disciplina int,
	primary key (ano, id_aluno, id_disciplina),
	foreign key (id_aluno)
		references alunos (id_aluno),
	foreign key (id_disciplina)
		references disciplinas (id_disciplina)
);






-