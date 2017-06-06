set serveroutput on

-- criar esta tabela
CREATE TABLE LOC_ITEM_LOCACAO_STG (
       DT_RETIRADA          DATE 			    NULL,
       NR_ITEM              NUMBER(5) 		NOT NULL,
       DT_ENTREGA           DATE 			    NULL,
       QT_DIAS              NUMBER(3) 		NULL,
       VL_LOCACAO           NUMBER(11,2) 	NULL,
       NR_PLACA             VARCHAR2(7) 	NOT NULL,
       VL_TOTAL             NUMBER(11,2) 	NULL,
       NR_PEDIDO            NUMBER(8) 		NOT NULL,
       DT_CARGA		          DATE		      NOT NULL
);

ALTER TABLE LOC_ITEM_LOCACAO_STG
       ADD CONSTRAINT PK_LOC_ITEM_LOCACAO2 PRIMARY KEY (NR_PEDIDO, NR_ITEM);
/*      
  bloco em PL/SQL que realize a transferência de todos os dados de outra tabela
  chamada pf0064.LOC_ITEM_LOCACAO
  Popular a coluna DT_CARGA com a data da execução do programa
*/
declare
  cursor cItem is
    select * from pf0064.LOC_ITEM_LOCACAO;
  vItem cItem%rowtype;
begin
  open cItem;
  loop
    fetch cItem into vItem;
    exit when cItem%notfound;
    insert into LOC_ITEM_LOCACAO_STG (
                          DT_RETIRADA,
                          NR_ITEM,
                          DT_ENTREGA,
                          QT_DIAS,
                          VL_LOCACAO,
                          NR_PLACA,
                          VL_TOTAL,
                          NR_PEDIDO,
                          DT_CARGA
                          ) values (
                          vItem.DT_RETIRADA,
                          vItem.NR_ITEM,
                          vItem.DT_ENTREGA,
                          vItem.QT_DIAS,
                          vItem.VL_LOCACAO,
                          vItem.NR_PLACA,
                          vItem.VL_TOTAL,
                          vItem.NR_PEDIDO,
                          SYSDATE
    );
  end loop;
  close cItem;
  commit;
end;
