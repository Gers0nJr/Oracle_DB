select * from lancamento;

SELECT SEQ_LANCAMENTO.NEXTVAL FROM DUAL; 

INSERT INTO LANCAMENTO (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo) 
values (null, 'Sal�rio mensal', '18/07/2020', null, 6500.00, 'Distribui��o de lucros', 'RECEITA');