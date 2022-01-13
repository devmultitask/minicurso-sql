-- SELECT simples com filtro WHERE

  SELECT * FROM GENERO;

  select * from filme where ano<2020;
  
  select * from serie where ano=2020;

  select * from filme WHERE NM_FILME LIKE 'The%';
  
  select * from filme ORDER BY ano;
  