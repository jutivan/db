set serveroutput on

-- exibir o nome e idade armazenados em variaveis
declare
  v_nome varchar(100); 
  v_idade number;
begin
  v_nome := 'Thiago Schetini Basso';
  v_idade := 32;
  dbms_output.put_line('O nome eh ' || v_nome || ' e a idade eh ' || v_idade);
end;


/* 
    exibir o nome, idade e email armazenados em variaveis validando
      - idade < 18 'Nao permitida'
      - email deve ter o caractere @
      - nome deve ter no minimo 2 nomes
      - se tudo estiver ok
*/
declare
  v_nome varchar(100);
  v_email varchar(100);
  v_idade number;
begin
  v_nome := 'Thiago Schetini Basso';
  v_idade := 18;
  v_email := 'thiago@gmail.com';
  
  if v_idade < 18 then
    dbms_output.put_line('Idade nao permitida');
  elsif v_email not like '%@%' then -- ou instr(v_email, '@') = 0 then
    dbms_output.put_line('Email invalido!');
  elsif regexp_substr(v_nome, '\S{2}\s\S{2}') is null then
    dbms_output.put_line('Digite nome e sobrenome');
  else
    dbms_output.put_line('O nome eh ' || v_nome || ' e a idade eh ' || v_idade || ' e o email eh ' || v_email);
  end if;
end;

-- receber e armazenar 5 valores e mostrar a media arredondando para inteiro
declare
  v_valor1 number;
  v_valor2 number;
  v_valor3 number;
  v_valor4 number;
  v_valor5 number;
  v_media number;
begin
  v_valor1 := 5;
  v_valor2 := 45;
  v_valor3 := 50;
  v_valor4 := 33;
  v_valor5 := 15;
  v_media := trunc((v_valor1 + v_valor2 + v_valor3 + v_valor4 + v_valor5) / 5);
  dbms_output.put_line('O valor da media eh: ' || v_media);
end;


-- exibir se os proximos 100 numeros de um numero sao pares ou impares
declare
  v_inicio number;
begin
  v_inicio := 100;
  for x in v_inicio..v_inicio+100 loop -- for x in 100..200 loop
    if mod(v_inicio, 2) = 0 then
      dbms_output.put_line(v_inicio || ' par');
    else
      dbms_output.put_line(v_inicio || ' impar');
    end if;
    v_inicio := v_inicio + 1;
  end loop;
end;


-- validar um nome com mais de 30 caracteres e exibir apenas o ultimo sobrenome
declare
  v_nome varchar(100);
  v_sobrenome varchar(100);
begin
  v_nome := 'Pedrolino Soares Schetini Basso';
  if length(v_nome) > 30 then
    -- instr(variavel, o que procura, -1 (significa iniciar de tras para frente) ) +1(significa avancar o espaco)
    v_sobrenome := substr(v_nome, instr(v_nome, ' ', -1)+1, length(v_nome));
    dbms_output.put_line(v_sobrenome);
  else
    dbms_output.put_line(v_nome);
  end if;
end;


-- exibir 'Hoje' || <sysdate> || ', estamos no seguinte dia da semana:' || <dia da semana>
declare
  v_dia varchar(30);
  v_hoje date;
begin
  v_hoje := sysdate;
  v_dia := to_char(v_hoje, 'day');
  dbms_output.put_line('Hoje ' || v_hoje || ' estamos no dia: ' || v_dia);
  --dbms_output.put_line('Hoje ' || sysdate || ' estamos no dia: ' || to_char(sysdate, 'day'));
end;


-- a partir de uma data, exibir durante os proximos 365 dias apenas as datas que caem no sab e dom
declare 
  v_data date;
begin
  v_data := to_date('28/03/2017', 'dd/mm/yyyy');
  
  for x in 1..365 loop
    if to_char(v_data, 'd') = 7 or to_char(v_data, 'd') = 1 then
      dbms_output.put_line(v_data || ' ' || to_char(v_data, 'day'));
    end if;
    v_data := v_data + 1;
  end loop;
end;