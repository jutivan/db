set serveroutput on

-- if/then      if/else       if/then/elsif     end if;
declare
  v_idade number;
begin
  v_idade := 10;
  if v_idade >= 18 and v_idade <=65 then
    dbms_output.put_line('Maior');
  elsif v_idade > 65 then
    dbms_output.put_line('Idoso');
  else 
    dbms_output.put_line('Menor');
  end if;
end;

-- loop     while/end     for/loop      end loop;
declare
  v_cnt number;
begin
  v_cnt := 0;
  loop
    v_cnt := v_cnt + 1;
    dbms_output.put_line (v_cnt);
    exit when v_cnt=100;
  end loop;
end;


begin
  for x in 1..100 loop
    dbms_output.put_line(x);
  end loop;
end;
