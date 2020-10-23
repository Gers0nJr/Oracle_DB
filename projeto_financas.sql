select * from dual;
/
---TB Lancamento
CREATE TABLE lancamento (
	codigo INTEGER NOT NULL PRIMARY KEY,
	descricao VARCHAR2(50) NOT NULL,
	data_vencimento DATE NOT NULL,
	data_pagamento DATE,
	valor DECIMAL(10,2) NOT NULL,
	observacao VARCHAR2(100),
	tipo VARCHAR2(20) NOT NULL
);
/
ALTER TABLE lancamento ADD CODIGO_CATEGORIA INTEGER;
ALTER TABLE lancamento ADD FOREIGN KEY (CODIGO_CATEGORIA) REFERENCES CATEGORIA(CODIGO);
/
CREATE SEQUENCE SEQ_LANCAMENTO START WITH 0;
/
CREATE OR REPLACE TRIGGER TRG_LANCAMENTO_NEXTVAL 
BEFORE INSERT ON LANCAMENTO 
FOR EACH ROW  
    BEGIN 
    IF :NEW.codigo IS NULL THEN 
        SELECT SEQ_LANCAMENTO.NEXTVAL INTO :NEW.codigo FROM DUAL; 
    END IF; 
END; 
/
select 
l.descricao as descricao,
l.data_vencimento as dt_vencimento,
l.data_pagamento as dt_pagamento,
l.valor as valor,
l.observacao as observacao,
l.tipo as tipo,
c.nome as categoria
from LANCAMENTO L 
INNER JOIN 
CATEGORIA C ON l.codigo_categoria = c.codigo;
/
UPDATE LANCAMENTO SET CODIGO_CATEGORIA = 1;
/
SELECT SEQ_LANCAMENTO.NEXTVAL FROM DUAL; 
/    
ALTER TRIGGER TRG_LANCAMENTO_NEXTVAL DISABLE;
/
INSERT INTO LANCAMENTO (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo) 
values (null, 'Salário mensal', '18/07/2020', null, 6500.00, 'Distribuição de lucros', 'RECEITA');

--TB Categoria
CREATE TABLE categoria (
	codigo INTEGER NOT NULL PRIMARY KEY,
	nome VARCHAR2(50) NOT NULL
);
/
CREATE SEQUENCE SEQ_CATEGORIA START WITH 1;
/
CREATE OR REPLACE TRIGGER TRG_CATEGORIA_NEXTVAL 
BEFORE INSERT ON CATEGORIA 
FOR EACH ROW  
    BEGIN 
    IF :NEW.codigo IS NULL THEN 
        SELECT SEQ_CATEGORIA.NEXTVAL INTO :NEW.codigo FROM DUAL; 
    END IF; 
END; 
/
select * from CATEGORIA;
/
SELECT SEQ_CATEGORIA.NEXTVAL FROM DUAL; 
/    
ALTER TRIGGER TRG_CATEGORIA_NEXTVAL DISABLE;
/
INSERT INTO categoria (codigo, nome) values (null,'Lazer');
INSERT INTO categoria (codigo, nome) values (null,'Alimentação');
INSERT INTO categoria (codigo, nome) values (null,'Supermercado');
INSERT INTO categoria (codigo, nome) values (null,'Farmácia');
INSERT INTO categoria (codigo, nome) values (null,'Outros');