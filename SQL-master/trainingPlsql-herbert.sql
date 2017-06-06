set serveroutput on

--1) Desenvolver um bloco PL/SQL que exiba o nome e a idade armazenados em variáveis.
declare
  v_nome varchar2(100);
  v_idade varchar2(100);
begin
  v_nome := 'Herbert';
  v_idade := '21';
  dbms_output.put_line(CONCAT( 'O nome é ', v_nome ));
end;

--2) Desenvolver um script PL/SQL que receba em variáveis o nome, idade e email. Para todas as entradas, validar os casos abaixo:
--- Caso a idade seja menor que 18 anos, retornar somente a mensagem "Idade não permitida.
--- O endereço de e-mail obrigatóriamente deve ter o caractere "@".
--- O nome deve ter no mínimo 2 nomes.
--Caso todas as condições acima estejam validadas, exibir todos os dados recebidos nas variáveis.
declare
  v_nome varchar2(100);
  v_f_name varchar2(100);
  v_l_name varchar2(100);
  v_idade varchar2(100);
  v_email varchar2(100);
  v_tamanho integer;
  
begin
  v_nome := 'Herbert';
  v_idade := '21';
  v_email := 'herbert.aga@gmail.com';
  v_f_name := substr(v_nome,1,instr(v_nome,' ')-1);
  v_l_name := substr(v_nome,instr(v_nome,' ')+1,LENGTH(v_nome));
  --v_l_name := substr(v_nome,1,' ');
  
  IF v_l_name = v_nome  THEN
    v_l_name:='';
  END IF;
  
  IF NOT LENGTH(v_l_name) > 1 THEN
    dbms_output.put_line('nome só tem um invalido');
  IF v_idade < 18 then   
    dbms_output.put_line('idade invalida');
  IF instr(v_email,'@') > 0 then   
    dbms_output.put_line('email invalida');
  ELSE
    dbms_output.put_line(v_nome);
    dbms_output.put_line(v_email);
    dbms_output.put_line(v_idade);
  END IF;
  END IF;
  END IF;
  
  dbms_output.put_line(CONCAT( 'O nome é ', v_l_name ));
end;

--3) Desenvolver um bloco PL/SQL que receba 5 valores e armazene a média dos 5 valores. Armazenar somente números inteiros.
declare
  v_media int;
  begin
  v_media := 1+2+3+4+5/5;
 dbms_output.put_line(CONCAT('a média é',v_media));
 end;
 
 --4) Desenvolver um Bloco PL/SQL que receba um número em uma variável e exiba o resto da divisão dos próximos 100 números. Imprimir se é Par ou ímpar.
 declare
 v_num int;
 begin
 v_num:=10;
 FOR i IN 1..100 LOOP
   dbms_output.put_line(CONCAT('O resultado é ',MOD( i,10 )));
   IF MOD(i,10)=0 THEN
    dbms_output.put_line('É par');
  ELSE
    dbms_output.put_line('É impar');
  END IF;  
  END LOOP;
  end;
  
--5) Desenvolver um Bloco PL/SQL que receba um nome, caso o nome exceda 30 caracteres exiba somente o sobrenome.
declare
  v_nome varchar2(100);
  v_f_name varchar2(100);
  v_l_name varchar2(100);
  v_idade varchar2(100);
  v_email varchar2(100);
  v_tamanho integer;
  
begin
  v_nome := 'Herbert Santos';
  v_f_name := substr(v_nome,1,instr(v_nome,' ')-1);
  v_l_name := substr(v_nome,instr(v_nome,' ')+1,LENGTH(v_nome));
  
  IF length(v_nome)>30 then
    dbms_output.put_line(v_l_name);
  else
    dbms_output.put_line(v_nome);
  end if;  
  
  END;
  
--6) Desenvolver um Bloco PL/SQL que exiba a seguinte mensagem de texto:'Hoje' || <sysdate> || ', estamos no seguinte dia da semana:' || <dia da semana>
declare v_dt_t varchar2(100);
begin 
v_dt_t:= TO_CHAR(sysdate, 'Day');
dbms_output.put_line(CONCAT('Hoje : ',sysdate));
dbms_output.put_line(CONCAT('estamos no seguinte dia da semana:',v_dt_t));
end;


--7) Desenvolva um bloco anônimo que exiba durante 365 dias (1 ano) apenas as datas que caem no sábado e domingo, após a entrada de uma data. Após a solicitação da entrada do campo data, exiba sequencialmente a data e o dia da semana que representa essa data. Utilize o comando loop para realizar essa tarefa. Utilize o pacote DBMS_OUTPUT para exibir esses valores. Exiba os valores em ordem de data  
declare v_dt_t int(365);
begin 
v_dt_t := 1;
WHILE v_dt_t < 365 LOOP
 if TO_CHAR(sysdate+v_dt_t, 'Day') = 'Sábado' or TO_CHAR(sysdate+v_dt_t, 'Day') ='Domingo' THEN
  dbms_output.put_line(sysdate);
  dbms_output.put_line(CONCAT('O dia da semana é ',TO_CHAR(sysdate+v_dt_t, 'Day')));
 end if;  
v_dt_t := v_dt_t + 1;
END LOOP;
end;