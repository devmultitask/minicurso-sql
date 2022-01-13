-- usar SubQuery


SELECT avg(nota)FROM AVALIACAO_filme

SELECT NM_FILME ,nota
FROM filme f,AVALIACAO_FILME af 
WHERE f.ID_FILME =af.FILME_ID 
 AND af.NOTA > 8
 
SELECT NM_FILME ,nota
FROM filme f,AVALIACAO_FILME af 
WHERE f.ID_FILME =af.FILME_ID 
 AND af.NOTA > (SELECT avg(nota)FROM AVALIACAO_filme)

SELECT nome
FROM (SELECT NM_FILME AS nome,nota
      FROM filme f,AVALIACAO_FILME af 
      WHERE f.ID_FILME =af.FILME_ID 
       AND af.NOTA > (SELECT avg(nota)FROM AVALIACAO_filme))