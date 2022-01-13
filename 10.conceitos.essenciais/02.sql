-- SELECT COM JOIN (PK/FK) 

SELECT f.nm_filme, g.NM_GENERO FROM filme f, genero g WHERE g.ID_GENERO = f.GENERO_ID 

SELECT f.nm_filme, g.NM_GENERO , AF.nota FROM filme f, genero g, AVALIACAO_FILME af WHERE g.ID_GENERO = f.GENERO_ID AND F.ID_FILME = AF.FILME_ID


-- chave composta
CREATE TABLE filmes_preferidos
(pessoa_id NUMBER,
 filme_id NUMBER,
 FOREIGN KEY (pessoa_id) REFERENCES pessoa(id_pessoa),
 FOREIGN KEY (filme_id) REFERENCES filme(id_filme) );

ALTER TABLE filmes_preferidos
ADD PRIMARY KEY (pessoa_id,filme_id)
