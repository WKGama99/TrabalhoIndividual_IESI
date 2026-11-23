
-- ========================================
-- LABRESERVE
-- Consultas SQL
-- Trabalho E3 - IESI
-- ========================================

-- CONSULTA 1: Listar utilizadores ativos

SELECT id_utilizador, nome, email, perfil
FROM utilizador
WHERE ativo = TRUE
ORDER BY nome;


-- CONSULTA 2: Contar recursos por tipo

SELECT tipo, COUNT(*) AS quantidade
FROM recurso
GROUP BY tipo
ORDER BY tipo;


-- CONSULTA 3: Consultar reservas completas

SELECT
    r.id_reserva,
    u.nome AS colaborador,
    p.nome AS projeto,
    rec.nome AS recurso,
    r.data_inicio,
    r.data_fim,
    r.estado
FROM reserva AS r
JOIN utilizador AS u
    ON r.id_utilizador = u.id_utilizador
JOIN projeto AS p
    ON r.id_projeto = p.id_projeto
JOIN reservarecurso AS rr
    ON r.id_reserva = rr.id_reserva
JOIN recurso AS rec
    ON rr.id_recurso = rec.id_recurso
ORDER BY r.id_reserva, rec.nome;


-- CONSULTA 4: Contar recursos por reserva

SELECT
    r.id_reserva,
    u.nome AS colaborador,
    p.nome AS projeto,
    COUNT(rr.id_recurso) AS total_recursos
FROM reserva AS r
JOIN utilizador AS u
    ON r.id_utilizador = u.id_utilizador
JOIN projeto AS p
    ON r.id_projeto = p.id_projeto
LEFT JOIN reservarecurso AS rr
    ON r.id_reserva = rr.id_reserva
GROUP BY r.id_reserva, u.nome, p.nome
ORDER BY r.id_reserva;
