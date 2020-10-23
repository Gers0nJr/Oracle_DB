--select * from employees;
--------------------------------------------------------
--Bloco Anônimo
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

--Bloco Anônimo 2 - Média
SET SERVEROUTPUT ON
DECLARE
    vNumero Number(11,2) := 500;
    vNumero2 Number(11,2) := 400;
    vMedia Number(11,2);
BEGIN
  vMedia := (vNumero + vNumero2) / 2;
  DBMS_OUTPUT.PUT_LINE('Média = ' || vMedia);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------

--Bloco Variveis - Number
SET SERVEROUTPUT ON
DECLARE
    vNumero Number(11,2) := 1200.50;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------

--Bloco Variveis - Char e VARCHAR2
SET SERVEROUTPUT ON
DECLARE
    vCaracterTamFixo CHAR(2) := 'RS';
    vCaracterTamVariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
  DBMS_OUTPUT.PUT_LINE('String Caracter Tam Fixo = ' || vCaracterTamFixo);
  DBMS_OUTPUT.PUT_LINE('String Caracter Tam Variável = ' || vCaracterTamVariavel);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------

--Bloco Variveis - Datas
SET SERVEROUTPUT ON
DECLARE
    vData1 DATE := '29/04/20';
    vData2 DATE := '29/04/2020';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Data1 = ' || vData1);
  DBMS_OUTPUT.PUT_LINE('Data2 = ' || vData2);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------

--Bloco Constante - PI
SET SERVEROUTPUT ON
DECLARE
    vPi CONSTANT NUMBER(38,15) := 3.141592653589793;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Pi = ' || vPi);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------

--Bloco Datatypes - 

--Caractere.: 
--NCHAR() ou CHAR(2); 
--NVARCHAR2(20) ou VARCHAR2(100);

--Numerico.: 
--NUMBER(precisao,escala) - NUMBER(11,2) ou NUMBER(11); 
--LONG - String e LONG RAW - armazena Binários; 
--ROWID armazena endereço logico de uma linha da tabela;
--BINARY_INTEGER := 14;
--BINARY_DOUBLE := 14; (64bits)
--BINARY_FLOAT := 24; (32bits)

--Data.: 
--DATE := SYSDATE ou '28/01/20'; 
--TIMESTAMP ou TIMESTAMP(3) := SYSTIMESTAMP; 
--TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP; 
--TIMESTAMP WITH LOCAL TIME ZONE := SYSTIMESTAMP;

--Booleano.: 
--BOOLEAN - default null - true/false

--Regras de nomenclatura para variáveis
--vNomeDaVariavel
--Obs.:Não pode usar o mesmo nome de uma coluna de tabela em variavel
--Atribuir valores a variavel - :=

-- Declarar variavel por referencia - %TYPE
--vfirst_name employees.first_name%TYPE;
--vlast_name employees.last_name%TYPE;

--Verificar tipo campos da tabela
DESC employees;

--Exemplo Datatype
SET SERVEROUTPUT ON
DECLARE
  vNumero              NUMBER(11,2) := 1200.50;
  vCaracterTamFixo     CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
  vCaracterTamVariavel VARCHAR2(100) := 'Texto Tamanho variável de até 32767 bytes';
  vBooleano            BOOLEAN := TRUE;
  vData                DATE := sysdate;
  vLong                LONG := 'Texto Tamanho variável de até 32760 bytes';
  vRowid               ROWID;
  vTimestamp           TIMESTAMP := systimestamp;
  vTimestamptz         TIMESTAMP WITH TIME ZONE := systimestamp;
  vCaracterTamFixoUniversal     NCHAR(100) := 'Texto de Tamanho Fixo Universal de até 32767 bytes';
  vCaracterTamVariavelUniversal NVARCHAR2(100) := 'Texto Tamanho variável Universal de até 32767 bytes';
  vNumeroInteiro       BINARY_INTEGER := 1200;
  vNumeroFloat         BINARY_FLOAT := 15000000;
  vNumeroDouble        BINARY_DOUBLE := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' ||   vNumero);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavel );
  IF  vBooleano = TRUE
  THEN 
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
  DBMS_OUTPUT.PUT_LINE('Long = ' || vLong );
  SELECT rowid
  INTO   vRowid
  FROM   employees
  WHERE  first_name = 'Steven' AND last_name = 'King';
  DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid );
  DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp with time zone= ' || vTimestamptz);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixoUniversal );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavelUniversal );
  DBMS_OUTPUT.PUT_LINE('Numero Inteiro = ' || vNumeroInteiro);
  DBMS_OUTPUT.PUT_LINE('Numero Float = ' || vNumeroFloat);
  DBMS_OUTPUT.PUT_LINE('Numero Double = ' || vNumeroDouble);
END;

--------------------------------------------------------
