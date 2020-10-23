select * from lancamento;

SELECT SEQ_LANCAMENTO.NEXTVAL FROM DUAL; 

INSERT INTO LANCAMENTO (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo) 
values (null, 'Salário mensal', '18/07/2020', null, 6500.00, 'Distribuição de lucros', 'RECEITA');