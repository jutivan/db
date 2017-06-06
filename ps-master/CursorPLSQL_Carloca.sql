set serveroutput on

-- copiando rows do banco do professor para meu banco tabela loc_grupo
declare
  cursor cGrupo is
    select * from pf0064.loc_grupo;
    
  v_grupo   cGrupo%rowtype;
begin
  open cGrupo;
  loop
    fetch cGrupo into v_grupo;
    exit when cGrupo%notfound;
    insert into loc_grupo (cd_grupo, ds_grupo, vl_locacao_diaria)
      values(v_grupo.cd_grupo, v_grupo.ds_grupo, v_grupo.vl_locacao_diaria);
  end loop;
  close cGrupo;
  commit;  
end;

-- copiando rows do banco do professor para meu banco tabela loc_proprietario
declare
  cursor cProprietario is
    select * from pf0064.loc_proprietario;

  v_proprietario    cProprietario%rowtype;
begin
  open cProprietario;   
    loop
    fetch cProprietario into v_proprietario;
    exit when cProprietario%notfound;
      insert into loc_proprietario (
                                    cd_proprietario, 
                                    nome_proprietario, 
                                    tp_proprietario, 
                                    telefone,
                                    nr_cpf,
                                    nr_cgc,
                                    ds_email
                                    )
             values (
                    v_proprietario.cd_proprietario, 
                    v_proprietario.nome_proprietario, 
                    v_proprietario.tp_proprietario, 
                    v_proprietario.telefone,
                    v_proprietario.nr_cpf,
                    v_proprietario.nr_cgc,
                    v_proprietario.ds_email
                    );
    end loop;
  close cProprietario;
  commit;
end;

-- copiando rows do banco do professor para meu banco tabela loc_veiculo
declare
  cursor cVeiculo is
    select * from pf0064.loc_veiculo;

  v_veiculo         cVeiculo%rowtype;
begin
  open cVeiculo;   
    loop
      fetch cVeiculo into v_veiculo;
      exit when cVeiculo%notfound;
      insert into loc_veiculo (
                              nr_placa, 
                              cd_proprietario, 
                              nr_chassis, 
                              status,
                              tipo_automovel,
                              km_atual,
                              combustivel,
                              modelo,
                              cor,
                              cd_grupo
                              )
             values (
                    v_veiculo.nr_placa, 
                    v_veiculo.cd_proprietario, 
                    v_veiculo.nr_chassis, 
                    v_veiculo.status,
                    v_veiculo.tipo_automovel,
                    v_veiculo.km_atual,
                    v_veiculo.combustivel,
                    v_veiculo.modelo,
                    v_veiculo.cor,
                    v_veiculo.cd_grupo
                    );
    end loop;
  close cVeiculo;
  commit;
end;



    
    
    
    
    