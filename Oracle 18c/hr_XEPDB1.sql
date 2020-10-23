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

--Bloco Variáveil Bind

SET SERVEROUTPUT ON
VARIABLE gmedia NUMBER
DECLARE
    vnumero1 NUMBER(11,2) := 2000;
    vnumero2 NUMBER(11,2) := 5000;
BEGIN
  :gmedia := (vnumero1 + vnumero2) / 2;
  DBMS_OUTPUT.PUT_LINE('Média = ' || TO_CHAR(:gmedia));
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;

--------------------------------------------------------

--Bloco Funções

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declaração de variável para o Primeiro número
  vNumero2  NUMBER(13,2);  -- Declaração de variável para o Segundo número
  vMedia    NUMBER(13,2);  -- Declaração de variável para a Média
BEGIN
  /* Cálculo do valor da média entre dois números
     Autor: Emílio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  5000.8888;
  vNumero2  :=  3000.4444;
  vMedia    :=  ROUND((vNumero1 + vNumero2) / 2, 2);
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vnumero1);  -- Impressão do Primeiro Número
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vnumero2);  -- Impressão do Segundo Número
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(vMedia,'99G999G999D99'));     -- Impressão da Média calculada 
END;

--------------------------------------------------------

--Bloco Utilizando SQL com PLSQL - Select

SET SERVEROUTPUT ON
DECLARE
  vFirst_name employees.first_name%Type;
  vLast_name employees.last_name%Type;
  vSalary employees.salary%Type;
  vEmployees_id employees.employee_id%Type := 121;
BEGIN
  SELECT 
    first_name, 
    last_name, 
    salary
  INTO 
    vFirst_name, 
    vLast_name, 
    vSalary 
  FROM employees 
  WHERE employee_id = vEmployees_id;
  DBMS_OUTPUT.PUT_LINE('Employees id = ' || vEmployees_id);
  DBMS_OUTPUT.PUT_LINE('First Name = ' || vFirst_name);
  DBMS_OUTPUT.PUT_LINE('Last Name = ' || vLast_name);
  DBMS_OUTPUT.PUT_LINE('Salary = ' || vSalary);
  EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE('Erro Oracle' || SQLCODE || SQLERRM);
END;
--------------------------------------------------------

--Bloco Utilizando SQL com PLSQL - Insert

SET SERVEROUTPUT ON
DECLARE
   vfirst_name  employees.first_name%type;
   vlast_name   employees.last_name%type;
   vsalary      employees.salary%type;
BEGIN
   INSERT INTO employees 
   (employee_id, first_name, last_name, email, phone_number, hire_date,
    job_id, salary, commission_pct, manager_id, department_id)
    VALUES 
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
     'IT_PROG', 15000, 0.4, 103, 60);
   COMMIT;  
END;

--------------------------------------------------------

--Bloco Utilizando SQL com PLSQL - Update

SET SERVEROUTPUT ON
DECLARE
   vEmployee_id    employees.employee_id%type := 207;
   vPercentual     NUMBER(3) := 10;
BEGIN
   UPDATE employees 
   SET    salary = salary * (1 + vPercentual / 100)
   WHERE  employee_id =  vEmployee_id;
   COMMIT;  
END;

--------------------------------------------------------

--Bloco Utilizando SQL com PLSQL - Delete

SET SERVEROUTPUT ON
DECLARE
   vEmployee_id    employees.employee_id%type := 207;
BEGIN
   DELETE FROM employees
   WHERE  employee_id =  vEmployee_id;
   COMMIT;  
END;

----------------------------------------------------------

--Bloco Savepoint

SET SERVEROUTPUT ON
DECLARE
   vEmployee_id    employees.employee_id%type := 150;
BEGIN
   UPDATE employees 
   SET    salary = 15000
   WHERE  employee_id =  vEmployee_id;
   COMMIT;  
END;

SET SERVEROUTPUT ON
DECLARE
   vEmployee_id    employees.employee_id%type := 150;
BEGIN
   UPDATE employees 
   SET    salary = 20000
   WHERE  employee_id =  vEmployee_id;
   ROLLBACK;  
END;

BEGIN
    INSERT INTO employees 
    (employee_id, first_name, last_name, email, phone_number, hire_date,
    job_id, salary, commission_pct, manager_id, department_id)
    VALUES 
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
    'IT_PROG', 15000, 0.4, 103, 60);
    
    SAVEPOINT INSERTOK;
    
    UPDATE employees 
    SET    salary = 30000
    WHERE  job_id = 'IT_PROG';
    
    ROLLBACK TO INSERTOK;
    COMMIT;
END;

----------------------------------------------------------

--Bloco Cursor Implícito

SET SERVEROUTPUT ON
DECLARE
   vdepartment_id  employees.department_id%type := 60;
   vpercentual     NUMBER(3) := 10;
BEGIN
   UPDATE employees 
   SET salary = salary * (1 + vpercentual / 100)
   WHERE department_id =  vdepartment_id;
   DBMS_OUTPUT.PUT_LINE('Número de linhas afetadas: ' || SQL%ROWCOUNT);
   --DBMS_OUTPUT.PUT_LINE('Retorna True se o cursor afetou uma ou mais linhas: ' || SQL%FOUND);
   --DBMS_OUTPUT.PUT_LINE('Retorna True se o cursor não afetou nenhuma linha: ' || SQL%NOTFOUND);
   --DBMS_OUTPUT.PUT_LINE('Retorna false, porque o Oracle controla o cursor implicito automaticamente, fechando o cursor: ' || SQL%ISOPEN);
   -- COMMIT;  
END;

ROLLBACK;
