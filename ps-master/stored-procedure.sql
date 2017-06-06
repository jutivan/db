-- STORED PROCEDURES e FUNCTIO

/*
  IN = final (imutavel) apenas de entrada, não pode ser colocado no return
  OUT = recebe um valor dentro e retorna para fora
  IN OUT = mutável, traz um valor de fora e pode ser colocado no return
*/

-- tabela para testes
create table agenda2017(
  nome varchar2(100) primary key,
  telefone varchar2(100)
);

-- criando uma procedure
create or replace procedure prc_agenda (
  p_nome in agenda2017.nome%type, 
  p_telefone varchar2
) is
begin
  insert 
    into agenda2017 (nome, telefone)
    values (p_nome, p_telefone);
  commit;
  
  exception
    when dup_val_on_index then
      raise_application_error (-20001, 'Erro no insert. Codigo Duplicado');
    when others then
      raise_application_error (-20002, 'Erro no insert: '  || sqlcode || ' ' || sqlerrm);
end;

-- descrevendo uma procedure
desc prc_agenda;

-- executando a procedure
begin
  prc_agenda('Thiago', '12345');
end;



