set serveroutput on

select * from user_tables;

create table exemplo_cursor as
  select table_name, tablespace_name
  from user_tables
  where 1=2;

-- declarando o cursor para usar
declare
  cursor c_tabelas is
  select table_name, tablespace_name
    from user_tables
    where table_name like '%A';
  v_tabelas c_tabelas%rowtype;
begin
  open c_tabelas;
  loop
    fetch c_tabelas into v_tabelas;
    exit when c_tabelas%notfound;
    
    insert into exemplo_cursor (table_name, tablespace_name)
    values (v_tabelas.table_name, v_tabelas.tablespace_name);
    
  end loop;
  close c_tabelas;
commit;
end;