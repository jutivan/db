set serveroutput on

declare 
  vIdade number;
begin
  vIdade := 'zzzzzz';
exception
  when others then
    raise_application_error(-20001, 'Erro desconhecido => ' || sqlerrm);
end;


declare
  v_numero_par        number;
  v_erro_numero_par   exception;
begin
  for x in 1..10 loop
    begin
      if mod(x,2) = 0 then 
        raise v_erro_numero_par;
      end if;
      exception
        when v_erro_numero_par then
          dbms_output.put_line (x || ' eh par');
    end;      
  end loop;
exception
  when others then
    raise_application_error(-20001, 'abortou o programa pelo erro: ' || sqlcode || ' ' || sqlerrm);
end;

--  transferir de PF0064.LOC_GRUPO
create table LOC_GRUPO_EXCEPTION (
  cd_grupo              number(3) primary key,
  ds_grupo              varchar2(100),
  vl_locacao_diaria     number(8,2)
);

declare
  cursor c_item is
    select * from pf0064.LOC_GRUPO;
  v_item c_item%rowtype;
begin
  open c_item;
  loop
    fetch c_item into v_item;
    exit when c_item%notfound;
    
    begin
    insert into LOC_GRUPO_EXCEPTION (
      CD_GRUPO, 
      DS_GRUPO, 
      VL_LOCACAO_DIARIA
    ) values (
      v_item.CD_GRUPO, 
      v_item.DS_GRUPO, 
      v_item.VL_LOCACAO_DIARIA
    );
    
    exception
      when dup_val_on_index then
        update LOC_GRUPO_EXCEPTION e 
          set e.ds_grupo = v_item.ds_grupo,
              e.vl_locacao_diaria = v_item.vl_locacao_diaria
        where e.cd_grupo = v_item.cd_grupo;
    end;
  end loop;
  close c_item;
  commit;
end;