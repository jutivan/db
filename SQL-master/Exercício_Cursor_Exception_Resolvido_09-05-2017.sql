--Utilizando o recurso de CURSORES EXPLÍCITOS e EXCEPTIONS, 
--transfira os novos registros e atualize os existentes. 
--Este programa NUNCA deve suspender sua execução por erros.

set serveroutput on;

DECLARE 
    CURSOR C_EXCEPTION IS
    SELECT * FROM PF0064.loc_grupo;
    V_EXCEPTION C_EXCEPTION%ROWTYPE;
    
BEGIN   
        OPEN C_EXCEPTION;
        LOOP
            FETCH  C_EXCEPTION INTO V_EXCEPTION; 
                EXIT WHEN C_EXCEPTION%NOTFOUND;
                    INSERT INTO  loc_grupo_exception( 
                    CD_GRUPO,  
                    DS_GRUPO,        
                    VL_LOCACAO_DIARIA
                    )  
                    VALUES (                   
                    V_EXCEPTION.CD_GRUPO,  
                    V_EXCEPTION.DS_GRUPO,        
                    V_EXCEPTION.VL_LOCACAO_DIARIA          
                    );
        END LOOP;
         exception
            when others then
            UPDATE loc_grupo_exception
            set DS_GRUPO = V_EXCEPTION.DS_GRUPO,
            VL_LOCACAO_DIARIA = V_EXCEPTION.VL_LOCACAO_DIARIA
            WHERE CD_GRUPO = V_EXCEPTION.CD_GRUPO;
        CLOSE C_EXCEPTION;
        
COMMIT;
END;
