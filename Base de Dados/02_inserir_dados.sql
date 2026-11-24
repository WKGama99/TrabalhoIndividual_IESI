-- LABRESERVE: dados de exemplo com ordem corrigida
-- Executar apenas em labreserve_teste, com todas as tabelas vazias
-- Este ficheiro é uma alternativa ao 02_inserir_dados.sql durante a validação

BEGIN;

DO $$
BEGIN
 IF EXISTS (SELECT 1 FROM public.utilizador)
 OR EXISTS (SELECT 1 FROM public.projeto)
 OR EXISTS (SELECT 1 FROM public.recurso)
 OR EXISTS (SELECT 1 FROM public.reserva)
 OR EXISTS (SELECT 1 FROM public.reservarecurso)
 OR EXISTS (SELECT 1 FROM public.incidente) THEN
  RAISE EXCEPTION 'A base de testes nao esta vazia; insercao cancelada';
 END IF;
END;
$$;

-- utilizador
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (1, 'João Silva', 'joao@empresa.pt', 'hash_exemplo_nao_real', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (2, 'Ana Costa', 'ana@empresa.pt', 'hash_exemplo_ana', 'administrador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (3, 'Pedro Lopes', 'pedro@empresa.pt', 'hash_exemplo_pedro', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (4, 'Maria Santos', 'maria@empresa.pt', 'hash_exemplo_maria', 'colaborador', false);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (5, 'Miguel Ferreira', 'miguel@empresa.example', 'hash_teste_05', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (6, 'Sofia Almeida', 'sofia@empresa.example', 'hash_teste_06', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (7, 'Ricardo Oliveira', 'ricardo@empresa.example', 'hash_teste_07', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (8, 'Beatriz Martins', 'beatriz@empresa.example', 'hash_teste_08', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (9, 'Tiago Rodrigues', 'tiago@empresa.example', 'hash_teste_09', 'administrador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (10, 'Carolina Sousa', 'carolina@empresa.example', 'hash_teste_10', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (11, 'André Pereira', 'andre@empresa.example', 'hash_teste_11', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (12, 'Inês Carvalho', 'ines@empresa.example', 'hash_teste_12', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (13, 'Diogo Ribeiro', 'diogo@empresa.example', 'hash_teste_13', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (14, 'Mariana Gomes', 'mariana@empresa.example', 'hash_teste_14', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (15, 'Rafael Moreira', 'rafael@empresa.example', 'hash_teste_15', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (16, 'Leonor Fernandes', 'leonor@empresa.example', 'hash_teste_16', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (17, 'Francisco Neves', 'francisco@empresa.example', 'hash_teste_17', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (18, 'Matilde Correia', 'matilde@empresa.example', 'hash_teste_18', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (19, 'Gonçalo Teixeira', 'goncalo@empresa.example', 'hash_teste_19', 'colaborador', true);
INSERT INTO public.utilizador (id_utilizador, nome, email, palavra_passe_hash, perfil, ativo) OVERRIDING SYSTEM VALUE VALUES (20, 'Catarina Dias', 'catarina@empresa.example', 'hash_teste_20', 'colaborador', true);

-- projeto
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (1, 'PRJ-001', 'Desenvolvimento de Sensores', 'Projeto de desenvolvimento de sensores industriais');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (2, 'PRJ-002', 'Automação Industrial', 'Projeto de automatização de processos industriais');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (3, 'PRJ-003', 'Testes de Equipamentos', 'Projeto de realização de testes a equipamentos');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (4, 'PRJ-004', 'Sistema de Monitorização Industrial', 'Monitorização de equipamentos em tempo real');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (5, 'PRJ-005', 'Controlo de Qualidade', 'Implementação de sistemas de controlo de qualidade');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (6, 'PRJ-006', 'Robótica Colaborativa', 'Desenvolvimento de soluções com robôs colaborativos');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (7, 'PRJ-007', 'Manutenção Preditiva', 'Previsão de avarias em equipamentos industriais');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (8, 'PRJ-008', 'Gestão de Energia', 'Otimização do consumo energético industrial');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (9, 'PRJ-009', 'Internet das Coisas Industrial', 'Integração de sensores e dispositivos IoT');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (10, 'PRJ-010', 'Produção Automatizada', 'Automatização de linhas de produção');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (11, 'PRJ-011', 'Análise de Dados Industriais', 'Tratamento e análise de dados de produção');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (12, 'PRJ-012', 'Sistemas de Segurança Industrial', 'Desenvolvimento de sistemas de segurança');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (13, 'PRJ-013', 'Calibração de Equipamentos', 'Calibração de instrumentos de medição');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (14, 'PRJ-014', 'Prototipagem Rápida', 'Desenvolvimento de protótipos através de impressão 3D');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (15, 'PRJ-015', 'Visão Computacional', 'Inspeção automática com sistemas de visão');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (16, 'PRJ-016', 'Redes de Comunicação Industrial', 'Implementação de redes industriais');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (17, 'PRJ-017', 'Controlo de Temperatura', 'Desenvolvimento de sistemas de controlo térmico');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (18, 'PRJ-018', 'Otimização de Processos', 'Melhoria da eficiência dos processos industriais');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (19, 'PRJ-019', 'Sistemas Embebidos', 'Desenvolvimento de sistemas eletrónicos embebidos');
INSERT INTO public.projeto (id_projeto, codigo, nome, descricao) OVERRIDING SYSTEM VALUE VALUES (20, 'PRJ-020', 'Digitalização Industrial', 'Digitalização e integração de processos de produção');

-- recurso
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (1, 'LAB-001', 'Laboratório de Eletrónica', 'laboratorio', 'Laboratório destinado a testes eletrónicos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (2, 'EQ-001', 'Osciloscópio Digital', 'equipamento', 'Equipamento para análise de sinais elétricos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (3, 'LAB-002', 'Laboratório de Automação', 'laboratorio', 'Testes de sistemas automatizados', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (4, 'LAB-003', 'Laboratório de Robótica', 'laboratorio', 'Desenvolvimento de robôs industriais', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (5, 'LAB-004', 'Laboratório de Mecânica', 'laboratorio', 'Ensaios de componentes mecânicos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (6, 'LAB-005', 'Laboratório de Informática', 'laboratorio', 'Desenvolvimento e testes de software', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (7, 'EQ-002', 'Multímetro Digital', 'equipamento', 'Medição de grandezas elétricas', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (8, 'EQ-003', 'Gerador de Sinais', 'equipamento', 'Geração de sinais elétricos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (9, 'EQ-004', 'Fonte de Alimentação', 'equipamento', 'Alimentação de circuitos eletrónicos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (10, 'EQ-005', 'Impressora 3D', 'equipamento', 'Produção de protótipos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (11, 'EQ-006', 'Braço Robótico', 'equipamento', 'Automação de movimentos industriais', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (12, 'EQ-007', 'Controlador PLC', 'equipamento', 'Controlo de processos industriais', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (13, 'EQ-008', 'Sensor de Temperatura', 'equipamento', 'Medição de temperatura', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (14, 'EQ-009', 'Sensor de Pressão', 'equipamento', 'Medição de pressão industrial', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (15, 'EQ-010', 'Câmara Térmica', 'equipamento', 'Análise térmica de equipamentos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (16, 'EQ-011', 'Máquina CNC', 'equipamento', 'Maquinação de peças', 'indisponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (17, 'EQ-012', 'Computador Industrial', 'equipamento', 'Processamento de dados industriais', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (18, 'EQ-013', 'Analisador de Redes', 'equipamento', 'Análise de redes elétricas', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (19, 'EQ-014', 'Calibrador Digital', 'equipamento', 'Calibração de instrumentos', 'disponivel');
INSERT INTO public.recurso (id_recurso, codigo, nome, tipo, descricao, estado) OVERRIDING SYSTEM VALUE VALUES (20, 'EQ-015', 'Bancada de Ensaios', 'equipamento', 'Realização de ensaios industriais', 'indisponivel');

-- reserva
INSERT INTO public.reserva (id_reserva, id_utilizador, id_projeto, data_inicio, data_fim, data_criacao, estado) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, '2026-12-02 10:00:00', '2026-12-02 12:00:00', '2026-11-23 14:30:21.409603', 'ativa');
INSERT INTO public.reserva (id_reserva, id_utilizador, id_projeto, data_inicio, data_fim, data_criacao, estado) OVERRIDING SYSTEM VALUE VALUES (4, 3, 2, '2026-12-03 10:00:00', '2026-12-03 12:00:00', '2026-11-23 15:04:04.008401', 'ativa');
INSERT INTO public.reserva (id_reserva, id_utilizador, id_projeto, data_inicio, data_fim, data_criacao, estado) OVERRIDING SYSTEM VALUE VALUES (5, 3, 3, '2026-12-04 09:00:00', '2026-12-04 11:00:00', '2026-11-23 15:42:25.013694', 'ativa');
INSERT INTO public.reserva (id_reserva, id_utilizador, id_projeto, data_inicio, data_fim, data_criacao, estado) OVERRIDING SYSTEM VALUE VALUES (6, 1, 4, '2026-12-05 14:00:00', '2026-12-05 16:00:00', '2026-11-23 15:42:25.013694', 'ativa');

-- reservarecurso
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (1, 1);
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (1, 2);
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (4, 1);
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (4, 2);
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (5, 1);
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (5, 2);
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (6, 1);
INSERT INTO public.reservarecurso (id_reserva, id_recurso) VALUES (6, 2);

-- incidente
INSERT INTO public.incidente (id_incidente, id_recurso, id_utilizador, descricao, data_registo, estado) OVERRIDING SYSTEM VALUE VALUES (1, 2, 1, 'O osciloscópio apresenta problemas ao ligar.', '2026-11-23 14:23:37.177769', 'aberto');

SELECT pg_catalog.setval('public.incidente_id_incidente_seq', 1, true);
SELECT pg_catalog.setval('public.projeto_id_projeto_seq', 20, true);
SELECT pg_catalog.setval('public.recurso_id_recurso_seq', 20, true);
SELECT pg_catalog.setval('public.reserva_id_reserva_seq', 6, true);
SELECT pg_catalog.setval('public.utilizador_id_utilizador_seq', 20, true);

COMMIT;
