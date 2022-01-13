-- gerar comandos SQL com SELECT
   
CREATE TABLE ultimas_series (nome varchar2(100));

SELECT nm_serie 
FROM serie
WHERE rownum <=5
ORDER BY ano desc

SELECT nm_serie
FROM (SELECT nm_serie FROM serie ORDER BY ano DESC) 
WHERE rownum <=5

SELECT * FROM ultimas_series

INSERT INTO ultimas_series
SELECT nm_serie
FROM (SELECT nm_serie FROM serie ORDER BY ano DESC) 
WHERE rownum <=5

SELECT * FROM ultimas_series

TRUNCATE TABLE ultimas_series;

SELECT 'INSERT INTO ultimas_series VALUES('''||nm_serie||''');' AS sql
FROM (SELECT nm_serie FROM serie ORDER BY ano DESC) 
WHERE rownum <=5
 