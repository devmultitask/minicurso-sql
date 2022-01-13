-- SELECT COM GROUP BY - sum, count, max , min

SELECT count(nota),sum(nota),min(nota),max(nota) FROM AVALIACAO_SERIE

SELECT count(*) FROM serie

SELECT ano,count(*) FROM serie GROUP BY ano

SELECT ano,count(*) FROM serie GROUP BY ano HAVING COUNT(*)>1

SELECT ano,count(*) FROM serie GROUP BY ano HAVING COUNT(*)>1 ORDER BY 2 desc

SELECT g.NM_GENERO , max(af.NOTA),min(af.NOTA),avg(af.NOTA)
FROM filme f, genero g, AVALIACAO_FILME af 
WHERE g.ID_GENERO = f.GENERO_ID AND f.ID_FILME =af.FILME_ID 
group by g.NM_GENERO