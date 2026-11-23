# LabReserve

**Sistema de Gestão de Reservas de Laboratórios e Equipamentos**

Projeto académico individual desenvolvido no âmbito da unidade curricular de Introdução à Engenharia de Software Industrial, da Escola Superior Aveiro Norte, Universidade de Aveiro.

## 1. Descrição do Projeto

O LabReserve é um sistema destinado à gestão de reservas de laboratórios e equipamentos associados a projetos industriais.

O objetivo é facilitar a organização dos recursos disponíveis, permitindo gerir utilizadores, projetos, reservas e incidentes.

## 2. Tecnologias Utilizadas

- PostgreSQL 18 — Sistema de gestão de base de dados
- pgAdmin 4 — Administração da base de dados
- Visual Studio Code — Desenvolvimento e organização do código SQL
- draw.io — Modelação dos diagramas UML
- Git e GitHub — Controlo de versões

## 3. Estrutura da Base de Dados

A base de dados é composta por seis tabelas:

- `utilizador` — Gestão dos utilizadores do sistema
- `recurso` — Gestão de laboratórios e equipamentos
- `projeto` — Registo dos projetos industriais
- `reserva` — Gestão das reservas
- `reservarecurso` — Associação de recursos a reservas
- `incidente` — Registo de problemas nos recursos

## 4. Funcionalidades Desenvolvidas

- Criação da estrutura relacional da base de dados
- Inserção e consulta de dados
- Associação de reservas a utilizadores, projetos e recursos
- Consultas SQL com JOIN, COUNT e GROUP BY
- Implementação inicial de um trigger de prevenção de reservas sobrepostas
- Testes de horários sobrepostos e consecutivos

## 5. Ficheiros SQL

Na pasta `Base de Dados` encontram-se:

- `01_criar_tabelas.sql` — Criação das tabelas
- `02_inserir_dados.sql` — Dados de exemplo exportados do PostgreSQL
- `03_consultas.sql` — Consultas SQL
- `04_funcoes_triggers.sql` — Função e trigger de validação de reservas

## 6. Estado do Desenvolvimento

O projeto encontra-se em desenvolvimento.

As próximas etapas incluem completar os dados de teste, desenvolver as restantes consultas SQL, implementar os procedimentos armazenados e reforçar as validações de reservas.

## 7. Entrega

**Data prevista:** 14 de dezembro de 2026.