--set serveroutput on;

DECLARE
    x INTEGER;
    y INTEGER;
    c INTEGER;
BEGIN
    x := 10;
    y := 20;
    c := x + y;
    Dbms_Output.Put_Line('Resultado: ' || c);
END;

DECLARE
    vCodAluno taluno.cod_aluno%TYPE := &codAluno;
    vNome taluno.nome%TYPE;
BEGIN
    select a.nome
    into vNome
    from taluno a where a.cod_aluno = vCodAluno;
    dbms_output.put_line('Nome: ' || vNome );
END;

select * from taluno;