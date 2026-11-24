
CREATE OR REPLACE FUNCTION public.verificar_conflito_reserva()
RETURNS trigger
LANGUAGE plpgsql
AS $function$
DECLARE
    inicio_novo TIMESTAMP;
    fim_novo TIMESTAMP;
    estado_novo VARCHAR(20);
    estado_recurso VARCHAR(20);
BEGIN

    -- Verificar e bloquear o recurso
    SELECT estado INTO estado_recurso
    FROM recurso
    WHERE id_recurso = NEW.id_recurso
    FOR UPDATE;

    IF NOT FOUND THEN
        RAISE EXCEPTION
            'Recurso % nao existe', NEW.id_recurso;
    END IF;

    -- Impedir recursos indisponiveis
    IF estado_recurso <> 'disponivel' THEN
        RAISE EXCEPTION
            'Recurso % indisponivel', NEW.id_recurso;
    END IF;

    -- Obter os dados da reserva
    SELECT data_inicio, data_fim, estado
    INTO inicio_novo, fim_novo, estado_novo
    FROM reserva
    WHERE id_reserva = NEW.id_reserva;

    -- Verificar conflitos de horario
    IF estado_novo = 'ativa' AND EXISTS (
        SELECT 1
        FROM reserva AS r
        JOIN reservarecurso AS rr
            ON r.id_reserva = rr.id_reserva
        WHERE rr.id_recurso = NEW.id_recurso
          AND r.id_reserva <> NEW.id_reserva
          AND r.estado = 'ativa'
          AND r.data_inicio < fim_novo
          AND r.data_fim > inicio_novo
    ) THEN
        RAISE EXCEPTION
            'Conflito de horario para o recurso %',
            NEW.id_recurso;
    END IF;

    RETURN NEW;
END;
$function$;



CREATE TRIGGER trg_impedir_sobreposicao BEFORE INSERT OR UPDATE ON public.reservarecurso FOR EACH ROW EXECUTE FUNCTION verificar_conflito_reserva();



-- ==========================================
-- VALIDAR ALTERACOES DE RESERVAS
-- ==========================================

CREATE OR REPLACE FUNCTION
public.verificar_atualizacao_reserva()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    -- Verificar conflitos se a reserva estiver ativa
    IF NEW.estado = 'ativa' AND EXISTS (

        SELECT 1
        FROM reservarecurso AS rr
        JOIN reservarecurso AS rr2
            ON rr.id_recurso = rr2.id_recurso
        JOIN reserva AS r
            ON rr2.id_reserva = r.id_reserva

        WHERE rr.id_reserva = NEW.id_reserva
          AND r.id_reserva <> NEW.id_reserva
          AND r.estado = 'ativa'
          AND r.data_inicio < NEW.data_fim
          AND r.data_fim > NEW.data_inicio

    ) THEN

        RAISE EXCEPTION
            'Alteracao invalida: conflito de horario';

    END IF;

    RETURN NEW;

END;
$$;


-- Criar o trigger na tabela reserva

CREATE TRIGGER trg_verificar_atualizacao_reserva
BEFORE UPDATE OF data_inicio, data_fim, estado
ON public.reserva
FOR EACH ROW
EXECUTE FUNCTION
public.verificar_atualizacao_reserva();
