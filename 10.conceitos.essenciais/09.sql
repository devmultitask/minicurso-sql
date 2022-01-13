-- usar views


SELECT p.NM_PESSOA nome,
 s.NM_SERIE serie,
 g.NM_GENERO genero,
 s.ANO 
FROM PESSOA p, SERIE s, GENERO g, AVALIACAO_SERIE av
WHERE p.ID_PESSOA = av.PESSOA_ID AND s.ID_SERIE = av.SERIE_ID 
 AND s.GENERO_ID = g.ID_GENERO 

CREATE VIEW pessoa_serie
AS
SELECT p.NM_PESSOA nome,
 s.NM_SERIE serie,
 g.NM_GENERO genero,
 s.ANO 
FROM PESSOA p, SERIE s, GENERO g, AVALIACAO_SERIE av
WHERE p.ID_PESSOA = av.PESSOA_ID AND s.ID_SERIE = av.SERIE_ID 
 AND s.GENERO_ID = g.ID_GENERO 

SELECT *
FROM pessoa_serie
WHERE nome='Boaglio'