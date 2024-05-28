drop database if exists escola;

CREATE DATABASE IF NOT EXISTS escola;

USE escola; 

CREATE TABLE IF NOT EXISTS alunos ( 
	id INT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(100), 
	data_nascimento DATE, 
	endereco VARCHAR(255) 
); 

CREATE TABLE IF NOT EXISTS professores ( 
	id INT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(100), 
	especialidade VARCHAR(100) 
); 

CREATE TABLE IF NOT EXISTS notas ( 
	id INT AUTO_INCREMENT PRIMARY KEY, 
	aluno_id INT, 
	materia VARCHAR(50), 
	nota DECIMAL(5, 2), 
	FOREIGN KEY (aluno_id) REFERENCES alunos(id) 
);
	

select user, host from mysql.user;


-- Ex.1	
create user 'aluno1'@'localhost' identified by 'senha123';
	
grant select on escola.alunos to 'aluno1'@'localhost';	
show grants for 'aluno1'@'localhost';
	

-- Ex.2
create user 'professor1'@'%' identified by 'senha456';
	
grant insert on escola.notas to 'professor1'@'%';
show grants for 'professor1'@'%';


-- Ex.3
create user 'admin1'@'localhost' identified by 'senha789';
	
grant all privileges on escola.* to 'admin1'@'localhost';
show grants for 'admin1'@'localhost';


-- Ex.4
revoke select on escola.alunos from 'aluno1'@'localhost';
show grants for 'aluno1'@'localhost';


-- Ex.5
create user 'aluno2'@'localhost' identified by 'senha321';
	
grant select on escola.professores to 'aluno2'@'localhost';
show grants for 'aluno2'@'localhost';


-- Ex.6
revoke all privileges on escola.* from 'admin1'@'localhost';
show grants for 'admin1'@'localhost';

-- Ex.7
create user 'professor2'@'%' identified by 'senha654';
	
grant update on escola.notas to 'professor2'@'%';
show grants for 'professor2'@'%';


-- Ex.8
revoke insert on escola.notas from 'professor1'@'%';
show grants for 'professor1'@'%';


-- Ex.9
create user 'aluno3'@'localhost' identified by 'senha987';
	
grant select on escola.notas to 'aluno3'@'localhost';
show grants for 'aluno3'@'localhost';


-- Ex.10
revoke all privileges on escola.notas from 'professor2'@'%';
show grants for 'professor2'@'%';

	
	
	
	
	
	
	