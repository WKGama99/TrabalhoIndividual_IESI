
-- ======================================
-- LABRESERVE
-- PROCEDIMENTO 1: Registar incidente
-- ======================================

CREATE OR REPLACE PROCEDURE registar_incidente(
    p_id_recurso INTEGER,
    p_id_utilizador INTEGER,
    p_descricao TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Verificar se a descricao foi preenchida
    IF p_descricao IS NULL OR
       BTRIM(p_descricao) = '' THEN

        RAISE EXCEPTION
            'A descricao nao pode estar vazia';

    END IF;

    -- Registar o incidente
    INSERT INTO incidente
        (id_recurso, id_utilizador, descricao)
    VALUES
        (p_id_recurso, p_id_utilizador, p_descricao);

END;
$$;
