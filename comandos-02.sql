SELECT cod_aluno, nome, cidade
FROM taluno;

SELECT cod_aluno AS codigo, nome AS "Nome do aluno"
FROM taluno;

-- distinct           retira linhas duplicadas
-- todas colunas tem que ser igual

SELECT cidade FROM taluno;

SELECT DISTINCT CIDADE FROM TALUNO;


-- NAO AGRUPA POIS COD_ALUNO DIFERENTE
--para cada linha
SELECT DISTINCT cidade, cod_aluno
FROM taluno
ORDER BY cidade;

--

SELECT nome AS curso,
valor,
valor/carga_horaria,
Round(valor/carga_horaria,2)AS valor_hora
FROM tcurso
ORDER BY valor_hora;

--apelido de coluna so funciona em order by

SELECT * FROM tcontrato;

UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato =4;


---calculo com coluna = null
--resultado = null

SELECT cod_contrato,
total,
desconto,
total+desconto
FROM tcontrato;

--

SELECT cod_contrato,
desconto,
Nvl(desconto,0),
total,
total+Nvl(desconto,0)AS total_mais_desconto
FROM tcontrato;

--
SELECT cod_aluno || ' - ' || nome || ' // ' || cidade AS aluno
FROM taluno
ORDER BY cod_aluno;

INTEGER - 1, 2 --numero inteiro - > number(38)

NUMBER(5,2)  - 999,99
NUMERIC(5,2) - 999,99

DATE - '10/03/2011' 00:00:00

VARCHAR(10) --sinonimo
VARCHAR2(10) - 'marcio'
CHAR(10) - 'marcio    '