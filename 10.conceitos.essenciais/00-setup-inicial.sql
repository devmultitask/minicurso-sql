-- 
-- Sistema de filmes e séries
--
-- Script criado por Fernando Boaglio 
--
--  Twitter @devmultitask
--
--

-- limpando schema
drop sequence genero_seq;
drop sequence serie_seq;
drop sequence filme_seq;
drop sequence pessoa_seq;
drop sequence genero_pessoa_seq;
drop sequence avaliacao_filme_seq;
drop sequence avaliacao_serie_seq;
drop table genero cascade constraints;
drop table serie cascade constraints;
drop table filme cascade constraints;
drop table pessoa cascade constraints;
drop table genero_pessoa cascade constraints;
drop table avaliacao_filme cascade constraints;
drop table avaliacao_serie cascade constraints;

-- criando tabelas
create table genero
 (id_genero number constraint PK_GENERO PRIMARY KEY,
  nm_genero varchar2(200) constraint NN_NM_GENERO NOT NULL
);

create table pessoa
 (id_pessoa number constraint PK_PESSOA PRIMARY KEY,
  nm_pessoa varchar2(200) constraint NN_NM_PESSOA NOT NULL,
  dt_entrada date default sysdate
);

create table serie
 (id_serie number constraint PK_SERIE PRIMARY KEY,
  nm_serie varchar2(200) constraint NN_NM_SERIE NOT NULL,
  ano number(4) constraint NN_ANO_SERIE NOT NULL,
  genero_id NUMBER,
  constraint FK_SERIE_GENERO foreign KEY (genero_id) references genero(id_genero)
);

create table filme
 (id_filme number constraint PK_FILME PRIMARY KEY,
  nm_filme varchar2(200) constraint NN_NM_FILME NOT NULL,
  ano number(4) constraint NN_ANO_FILME NOT NULL,
  genero_id NUMBER,
  constraint FK_FILME_GENERO foreign KEY (genero_id) references genero(id_genero)
); 
 
create table genero_pessoa
 (id_genero_pessoa number constraint PK_GENERO_PESSOA PRIMARY KEY,
  genero_id NUMBER,
  pessoa_id NUMBER,
  constraint FK_GP_GENERO foreign KEY (genero_id) references genero(id_genero),
  constraint FK_GP_PESSOA foreign KEY (pessoa_id) references pessoa(id_pessoa)
); 

create table avaliacao_filme
 (id_avaliacao_filme number constraint PK_AVALIACAO_FILME PRIMARY KEY,
  pessoa_id NUMBER,
  filme_id NUMBER,
  nota number(2) constraint NN_AF_NOTA NOT NULL,
  dt_avaliacao date default sysdate,
  constraint FK_AF_PESSOA foreign KEY (pessoa_id) references pessoa(id_pessoa),
  constraint FK_AF_FILME foreign KEY (filme_id) references filme(id_filme)
); 

create table avaliacao_serie
 (id_avaliacao_serie number constraint PK_AVALIACAO_SERIE PRIMARY KEY,
  pessoa_id NUMBER,
  serie_id NUMBER,  
  nota number(2) constraint NN_AS_NOTA NOT NULL,
  viu_ate_o_fim char(1) constraint NN_VIU_ATE_O_FIM NOT NULL,
  dt_avaliacao date default sysdate,
  constraint FK_AS_PESSOA foreign KEY (pessoa_id) references pessoa(id_pessoa),
  constraint FK_AF_SERIE foreign KEY (serie_id) references serie(id_serie)
); 
 
-- criando sequences
create sequence genero_seq;
create sequence serie_seq;
create sequence filme_seq;
create sequence pessoa_seq;
create sequence genero_pessoa_seq;
create sequence avaliacao_filme_seq;
create sequence avaliacao_serie_seq;

-- cadastrando pessoas
INSERT INTO PESSOA VALUES(pessoa_seq.nextval,'Boaglio', to_date('2022-01-01','yyyy-MM-dd'));
INSERT INTO PESSOA VALUES(pessoa_seq.nextval,'Pessoa Aleatória 1', to_date('2021-11-01','yyyy-MM-dd'));
INSERT INTO PESSOA VALUES(pessoa_seq.nextval,'Pessoa Aleatória 2', to_date('2021-12-01','yyyy-MM-dd'));

-- cadastrando gêneros de filmes e séries
insert into genero values (genero_seq.nextval,'Documentário');
insert into genero values (genero_seq.nextval,'Horror');
insert into genero values (genero_seq.nextval,'Suspense');
insert into genero values (genero_seq.nextval,'Thriller');
insert into genero values (genero_seq.nextval,'Drama');
insert into genero values (genero_seq.nextval,'Crime');
insert into genero values (genero_seq.nextval,'Comédia');
insert into genero values (genero_seq.nextval,'Musical');
insert into genero values (genero_seq.nextval,'Romance');
insert into genero values (genero_seq.nextval,'Ação');
insert into genero values (genero_seq.nextval,'Sci-Fi'); 
insert into genero values (genero_seq.nextval,'Guerra');
insert into genero values (genero_seq.nextval,'Fantasia');
insert into genero values (genero_seq.nextval,'Animação');
insert into genero values (genero_seq.nextval,'Western');
 
-- cadastrando gêneros preferidos
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 1, 1);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 2, 1);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 3, 1);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 5, 1);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 6, 1);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 10, 1);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 11, 1);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 2, 2);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 3, 2);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 5, 2);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 14, 2);
INSERT INTO genero_pessoa VALUES(genero_pessoa_seq.nextval, 15, 3);

-- cadastrando filmes
INSERT INTO filme VALUES(filme_seq.nextval,'The Shawshank Redemption',1994,4);
INSERT INTO filme VALUES(filme_seq.nextval,'The Godfather',1972,6);
INSERT INTO filme VALUES(filme_seq.nextval,'The Dark Knight',2008,10);
INSERT INTO filme VALUES(filme_seq.nextval,'Pulp Fiction',1994,10);
INSERT INTO filme VALUES(filme_seq.nextval,'Forrest Gump',1994,7);
INSERT INTO filme VALUES(filme_seq.nextval,'Inception',2010,11);
INSERT INTO filme VALUES(filme_seq.nextval,'The Matrix',1999,11);
INSERT INTO filme VALUES(filme_seq.nextval,'Se7en',1995,3);
INSERT INTO filme VALUES(filme_seq.nextval,'The Silence of the Lambs',1991,3);
INSERT INTO filme VALUES(filme_seq.nextval,'City of God',2002,6);
INSERT INTO filme VALUES(filme_seq.nextval,'Interstellar',2014,11);
INSERT INTO filme VALUES(filme_seq.nextval,'Parasite',2019,5);
INSERT INTO filme VALUES(filme_seq.nextval,'Back to the Future',1985,10);
INSERT INTO filme VALUES(filme_seq.nextval,'Cinema Paradiso',1988,5);
INSERT INTO filme VALUES(filme_seq.nextval,'Apocalypse Now',1979,12);

-- cadastrando séries
INSERT INTO serie VALUES(serie_seq.nextval,'Gomorra',2014,6);
INSERT INTO serie VALUES(serie_seq.nextval,'Dexter',2006,6);
INSERT INTO serie VALUES(serie_seq.nextval,'The IT Crowd',2006,7);
INSERT INTO serie VALUES(serie_seq.nextval,'La Casa de Papel',2017,4);
INSERT INTO serie VALUES(serie_seq.nextval,'Black Mirror',2011,11);
INSERT INTO serie VALUES(serie_seq.nextval,'Arrow',2012,10);
INSERT INTO serie VALUES(serie_seq.nextval,'Westworld',2016,11);
INSERT INTO serie VALUES(serie_seq.nextval,'Lost in Space',2018,11);
INSERT INTO serie VALUES(serie_seq.nextval,'The Good Doctor',2017,5);
INSERT INTO serie VALUES(serie_seq.nextval,'Castlevania',2017,14);
INSERT INTO serie VALUES(serie_seq.nextval,'The Witcher',2019,10);
INSERT INTO serie VALUES(serie_seq.nextval,'Desalma',2020,3);

-- cadastrando avaliação de filmes
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,1,1,10,to_date('2021-10-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,1,2,10,to_date('2021-10-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,1,3,8,to_date('2021-11-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,1,5,10,to_date('2021-11-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,1,14,10,to_date('2021-01-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,2,1,6,to_date('2021-02-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,2,12,6,to_date('2021-02-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,3,10,7,to_date('2021-08-01','yyyy-MM-dd'));
INSERT INTO avaliacao_filme VALUES (avaliacao_filme_seq.nextval,3,12,7,to_date('2021-08-01','yyyy-MM-dd'));

-- cadastrando avaliação de séries
INSERT INTO avaliacao_serie VALUES (avaliacao_serie_seq.nextval,1,1,10,'S',to_date('2021-11-01','yyyy-MM-dd'));
INSERT INTO avaliacao_serie VALUES (avaliacao_serie_seq.nextval,1,2,10,'S',to_date('2021-11-01','yyyy-MM-dd'));
INSERT INTO avaliacao_serie VALUES (avaliacao_serie_seq.nextval,1,6,7,'N',to_date('2021-11-01','yyyy-MM-dd'));
INSERT INTO avaliacao_serie VALUES (avaliacao_serie_seq.nextval,2,9,9,'S',to_date('2021-06-01','yyyy-MM-dd'));
INSERT INTO avaliacao_serie VALUES (avaliacao_serie_seq.nextval,2,10,7,'N',to_date('2021-06-01','yyyy-MM-dd'));
INSERT INTO avaliacao_serie VALUES (avaliacao_serie_seq.nextval,3,10,10,'S',to_date('2021-07-01','yyyy-MM-dd'));

