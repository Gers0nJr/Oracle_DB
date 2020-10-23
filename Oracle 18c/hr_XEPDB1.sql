--select * from employees;
--------------------------------------------------------
--Bloco An�nimo
SET SERVEROUTPUT ON
DECLARE
    vTexto VARCHAR2(100) := 'Seja bem vindo ao PL/SQL';
BEGIN
  DBMS_OUTPUT.PUT_LINE(vTexto);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------

--Bloco An�nimo 2 - M�dia
SET SERVEROUTPUT ON
DECLARE
    vNumero Number(11,2) := 500;
    vNumero2 Number(11,2) := 400;
    vMedia Number(11,2);
BEGIN
  vMedia := (vNumero + vNumero2) / 2;
  DBMS_OUTPUT.PUT_LINE('M�dia = ' || vMedia);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------
