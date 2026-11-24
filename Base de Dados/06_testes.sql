
-- ==========================================
-- LABRESERVE
-- TESTES DE VALIDACAO DA BASE DE DADOS
-- Trabalho E3 - IESI
-- ==========================================

-- TESTES MANUAIS JA REALIZADOS:
--
-- 1. Criar reserva em horario livre: SUCESSO
-- 2. Impedir reservas sobrepostas: SUCESSO
-- 3. Cancelar reserva: SUCESSO
-- 4. Impedir alteracao para horario ocupado: SUCESSO
-- 5. Permitir horarios consecutivos: SUCESSO
-- 6. Rejeitar recurso indisponivel: SUCESSO
-- 7. Rejeitar datas invalidas: SUCESSO
-- 8. Rejeitar utilizador inativo: SUCESSO
--
-- Nos testes com alteracoes temporarias
-- foi utilizado ROLLBACK.


-- TESTE 9: Verificar utilizador ativo

SELECT
    id_utilizador,
    nome,
    ativo
FROM utilizador
WHERE id_utilizador = 1;


-- TESTE 10: Verificar recursos indisponiveis

SELECT
    id_recurso,
    nome,
    estado
FROM recurso
WHERE estado = 'indisponivel';


-- TESTE 11: Verificar reservas ativas

SELECT
    id_reserva,
    data_inicio,
    data_fim,
    estado
FROM reserva
WHERE estado = 'ativa'
ORDER BY id_reserva;


-- TESTE 12: Detetar conflitos existentes

SELECT
    a.id_reserva AS reserva_1,
    b.id_reserva AS reserva_2,
    ra.id_recurso
FROM reserva AS a
JOIN reservarecurso AS ra
    ON a.id_reserva = ra.id_reserva
JOIN reservarecurso AS rb
    ON ra.id_recurso = rb.id_recurso
JOIN reserva AS b
    ON rb.id_reserva = b.id_reserva
WHERE a.id_reserva < b.id_reserva
  AND a.estado = 'ativa'
  AND b.estado = 'ativa'
  AND a.data_inicio < b.data_fim
  AND a.data_fim > b.data_inicio;
