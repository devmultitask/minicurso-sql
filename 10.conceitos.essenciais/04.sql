-- DML: insert,update,delete e DDL-create,alter,drop
 
insert into genero values (666,'Infantil');

UPDATE genero SET NM_GENERO ='Infanto-Juvenil' WHERE ID_GENERO =666

DELETE FROM GENERO WHERE ID_GENERO =666

CREATE TABLE teste(id NUMBER, nome varchar2(200),DATA DATE)

ALTER TABLE teste ADD  valor NUMBER;

SELECT * FROM  teste

DROP TABLE teste

DROP TABLE pessoa
