
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



-- ======================================
-- PROCEDIMENTO 2: Criar reserva
-- ======================================

CREATE OR REPLACE PROCEDURE criar_reserva(
    p_id_utilizador INTEGER,
    p_id_projeto INTEGER,
    p_id_recurso INTEGER,
    p_data_inicio TIMESTAMP,
    p_data_fim TIMESTAMP
)

LANGUAGE plpgsql
AS $$
DECLARE
    v_id_reserva INTEGER;
    v_estado VARCHAR(20);
BEGIN


    -- 1. Validar as datas
    IF p_data_inicio IS NULL
       OR p_data_fim IS NULL
       OR p_data_fim <= p_data_inicio THEN
        RAISE EXCEPTION
            'Datas da reserva invalidas';
    END IF;

    -- 2. Verificar o utilizador
    IF NOT EXISTS (
        SELECT 1 FROM utilizador
        WHERE id_utilizador = p_id_utilizador
          AND ativo = TRUE
    ) THEN
        RAISE EXCEPTION
            'Utilizador inexistente ou inativo';
    END IF;

    -- 3. Verificar o projeto
    IF NOT EXISTS (
        SELECT 1 FROM projeto
        WHERE id_projeto = p_id_projeto
    ) THEN
        RAISE EXCEPTION
            'Projeto inexistente';
    END IF;

    -- 4. Bloquear e verificar o recurso
    SELECT estado INTO v_estado
    FROM recurso
    WHERE id_recurso = p_id_recurso
    FOR UPDATE;

    IF NOT FOUND THEN
        RAISE EXCEPTION
            'Recurso inexistente';
    END IF;

    IF v_estado <> 'disponivel' THEN
        RAISE EXCEPTION
            'Recurso indisponivel';
    END IF;

    -- 5. Verificar conflitos de horario
    IF EXISTS (
        SELECT 1
        FROM reservarecurso AS rr
        JOIN reserva AS r
            ON rr.id_reserva = r.id_reserva
        WHERE rr.id_recurso = p_id_recurso
          AND r.estado = 'ativa'
          AND r.data_inicio < p_data_fim
          AND r.data_fim > p_data_inicio
    ) THEN
        RAISE EXCEPTION
            'O recurso ja esta reservado neste horario';
    END IF;

    -- 6. Criar a reserva
    INSERT INTO reserva (
        id_utilizador,
        id_projeto,
        data_inicio,
        data_fim
    )
    VALUES (
        p_id_utilizador,
        p_id_projeto,
        p_data_inicio,
        p_data_fim
    )
    RETURNING id_reserva INTO v_id_reserva;

    -- 7. Associar o recurso
    INSERT INTO reservarecurso (
        id_reserva,
        id_recurso
    )
    VALUES (
        v_id_reserva,
        p_id_recurso
    );

    RAISE NOTICE
        'Reserva % criada com sucesso',
        v_id_reserva;

END;
$$;



-- ======================================
-- PROCEDIMENTO 3: Cancelar reserva
-- ======================================

CREATE OR REPLACE PROCEDURE cancelar_reserva(
    p_id_reserva INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_estado VARCHAR(20);
BEGIN

    -- 1. Procurar a reserva
    SELECT estado INTO v_estado
    FROM reserva
    WHERE id_reserva = p_id_reserva
    FOR UPDATE;

    -- 2. Verificar se existe
    IF NOT FOUND THEN
        RAISE EXCEPTION
            'A reserva % nao existe',
            p_id_reserva;
    END IF;

    -- 3. Verificar se ja esta cancelada
    IF v_estado = 'cancelada' THEN
        RAISE EXCEPTION
            'A reserva % ja esta cancelada',
            p_id_reserva;
    END IF;

    -- 4. Cancelar a reserva
    UPDATE reserva
    SET estado = 'cancelada'
    WHERE id_reserva = p_id_reserva;

    -- 5. Confirmar a operacao
    RAISE NOTICE
        'Reserva % cancelada com sucesso',
        p_id_reserva;

END;
$$;


