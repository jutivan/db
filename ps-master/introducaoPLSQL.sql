-- desenvolver um bloco anonimo de pl/sql que receba 2 numeros e exiba a soma, multiplicacao e divisao 
declare
	n1 number(8,2) := 2.5;
	n2 number(8,2) := 2.5;
  soma integer;
  mult integer;
  div integer;
begin
	soma := n1 + n2;
  mult := n1 * n2;
  div := n1 / n2;
  SYS.DBMS_OUTPUT.PUT_LINE('soma = ' || soma || ' multiplicacao = ' || mult || ' divisao = ' || div);
end;

-- desenvolver um bloco anonimo pl/sql que receba um nome completo em uma variavel e exiba somente o primeiro, depois o segundo e etc..
declare
  nome varchar(100) := 'Alfredo G. Delamara Junior';
  primeiro varchar(100);
  segundo varchar(100);
  terceiro varchar(100);
  quarto varchar(100);
begin
  primeiro := substr(nome, 1, instr(nome, ' ')-1);
  segundo := substr(nome, instr(nome, ' ', 1, 1)+1, instr(nome, ' ')+1);
  terceiro := substr(nome, instr(nome, ' ', 1, 2)+1, instr(nome, ' ')+1);
  quarto := substr(nome, instr(nome, ' ', 1, 3)+1);
  DBMS_OUTPUT.put_line(primeiro);
  DBMS_OUTPUT.put_line(segundo);
  DBMS_OUTPUT.put_line(terceiro);
  DBMS_OUTPUT.put_line(quarto);
end;

-- desenvolver um bloco anonimo em PL/SQL, que receba uma data no formato DD/MM/YYYY e exiba mes, dia e ano por extenso.
declare
  minhaData date := to_date('03/08/2017', 'DD/MM/YYYY');
  mes varchar(20);
  dia varchar(20);
  ano varchar(20);
begin
  mes := to_char(minhaData, 'month');
  dia := to_char(minhaData, 'day');
  ano := to_char(minhaData, 'year');
  dbms_output.put_line(mes);
  dbms_output.put_line(dia);
  dbms_output.put_line(ano);
end; 