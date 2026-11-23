
-- ==========================================
-- LABRESERVE
-- Sistema de Gestao de Reservas
-- Trabalho E3 - IESI
-- Criacao das tabelas PostgreSQL
-- ==========================================

-- 1. TABELA UTILIZADOR

CREATE TABLE utilizador (
    id_utilizador INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    palavra_passe_hash TEXT NOT NULL,
    perfil VARCHAR(20) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);


-- 2. TABELA RECURSO

CREATE TABLE recurso (
    id_recurso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL
        CHECK (tipo IN ('laboratorio', 'equipamento')),
    descricao TEXT,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponivel'
        CHECK (estado IN ('disponivel', 'indisponivel'))
);


-- 3. TABELA PROJETO

CREATE TABLE projeto (
    id_projeto INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);


-- 4. TABELA RESERVA

CREATE TABLE reserva (
    id_reserva INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    id_utilizador INTEGER NOT NULL,
    id_projeto INTEGER NOT NULL,

    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP NOT NULL,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    estado VARCHAR(20) NOT NULL DEFAULT 'ativa',

    CONSTRAINT fk_reserva_utilizador
        FOREIGN KEY (id_utilizador)
        REFERENCES utilizador(id_utilizador),

    CONSTRAINT fk_reserva_projeto
        FOREIGN KEY (id_projeto)
        REFERENCES projeto(id_projeto),

    CONSTRAINT chk_reserva_datas
        CHECK (data_fim > data_inicio),

    CONSTRAINT chk_reserva_estado
        CHECK (estado IN ('ativa', 'cancelada'))
);


-- 5. TABELA RESERVARECURSO

CREATE TABLE reservarecurso (
    id_reserva INTEGER NOT NULL,
    id_recurso INTEGER NOT NULL,

    CONSTRAINT pk_reservarecurso
        PRIMARY KEY (id_reserva, id_recurso),

    CONSTRAINT fk_rr_reserva
        FOREIGN KEY (id_reserva)
        REFERENCES reserva(id_reserva),

    CONSTRAINT fk_rr_recurso
        FOREIGN KEY (id_recurso)
        REFERENCES recurso(id_recurso)
);


-- 6. TABELA INCIDENTE

CREATE TABLE incidente (
    id_incidente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    id_recurso INTEGER NOT NULL,
    id_utilizador INTEGER NOT NULL,

    descricao TEXT NOT NULL,
    data_registo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    estado VARCHAR(20) NOT NULL DEFAULT 'aberto',

    CONSTRAINT fk_incidente_recurso
        FOREIGN KEY (id_recurso)
        REFERENCES recurso(id_recurso),

    CONSTRAINT fk_incidente_utilizador
        FOREIGN KEY (id_utilizador)
        REFERENCES utilizador(id_utilizador),

    CONSTRAINT chk_incidente_estado
        CHECK (estado IN ('aberto', 'em_resolucao', 'resolvido'))
);
