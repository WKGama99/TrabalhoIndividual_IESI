CREATE OR REPLACE FUNCTION public.verificar_conflito_reserva()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    inicio_novo TIMESTAMP;
    fim_novo TIMESTAMP;
    estado_novo VARCHAR(20);
BEGIN
    -- Obter os dados da nova reserva
    SELECT data_inicio, data_fim, estado
    INTO inicio_novo, fim_novo, estado_novo
    FROM reserva
    WHERE id_reserva = NEW.id_reserva;

    -- Verificar se existe conflito
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
            'Conflito de horário para o recurso %',
            NEW.id_recurso;
    END IF;

    RETURN NEW;
END;
$function$;


CREATE TRIGGER trg_impedir_sobreposicao BEFORE INSERT OR UPDATE ON public.reservarecurso FOR EACH ROW EXECUTE FUNCTION verificar_conflito_reserva();