
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



-- CONSULTA 5: Listar incidentes com detalhes

SELECT
    i.id_incidente,
    r.nome AS recurso,
    u.nome AS comunicado_por,
    i.descricao,
    i.estado,
    i.data_registo
FROM incidente AS i
JOIN recurso AS r
    ON i.id_recurso = r.id_recurso
JOIN utilizador AS u
    ON i.id_utilizador = u.id_utilizador
ORDER BY i.data_registo DESC, i.id_incidente DESC;



-- CONSULTA 6: Recursos mais reservados

SELECT
    r.codigo,
    r.nome AS recurso,
    r.tipo,
    COUNT(rr.id_reserva) AS total_reservas
FROM recurso AS r
LEFT JOIN reservarecurso AS rr
    ON r.id_recurso = rr.id_recurso
GROUP BY r.id_recurso, r.codigo, r.nome, r.tipo
ORDER BY total_reservas DESC, r.nome ASC
LIMIT 10;



-- CONSULTA 7: Utilizadores com mais reservas

SELECT
    u.id_utilizador,
    u.nome AS colaborador,
    COUNT(r.id_reserva) AS total_reservas
FROM utilizador AS u
JOIN reserva AS r
    ON u.id_utilizador = r.id_utilizador
GROUP BY u.id_utilizador, u.nome
HAVING COUNT(r.id_reserva) >= 2
ORDER BY total_reservas DESC, u.nome ASC;



-- CONSULTA 8: Recursos disponiveis num horario

SELECT
    r.id_recurso,
    r.codigo,
    r.nome,
    r.tipo
FROM recurso AS r
WHERE r.estado = 'disponivel'
AND NOT EXISTS (
    SELECT 1
    FROM reservarecurso AS rr
    JOIN reserva AS res
        ON rr.id_reserva = res.id_reserva
    WHERE rr.id_recurso = r.id_recurso
      AND res.estado = 'ativa'
      AND res.data_inicio < '2026-12-03 13:00:00'
      AND res.data_fim > '2026-12-03 11:00:00'
)
ORDER BY r.tipo, r.nome;



-- CONSULTA 9: Incidentes por recurso

SELECT
    r.codigo,
    r.nome AS recurso,
    COUNT(i.id_incidente) AS total_incidentes,
    COUNT(i.id_incidente) FILTER (
        WHERE i.estado = 'aberto'
    ) AS incidentes_abertos
FROM recurso AS r
LEFT JOIN incidente AS i
    ON r.id_recurso = i.id_recurso
GROUP BY r.id_recurso, r.codigo, r.nome
ORDER BY total_incidentes DESC, r.nome ASC;



-- CONSULTA 10: Reservas e horas por projeto

SELECT
    p.codigo,
    p.nome AS projeto,

    COUNT(r.id_reserva) FILTER (
        WHERE r.estado = 'ativa'
    ) AS total_reservas,

    COALESCE(
        SUM(
            EXTRACT(EPOCH FROM
                (r.data_fim - r.data_inicio)
            ) / 3600
        ) FILTER (WHERE r.estado = 'ativa'),
        0
    ) AS total_horas

FROM projeto AS p

LEFT JOIN reserva AS r
    ON p.id_projeto = r.id_projeto

GROUP BY p.id_projeto, p.codigo, p.nome

ORDER BY total_reservas DESC, p.nome ASC;
