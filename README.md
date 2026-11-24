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

- `01_criar_tabelas.sql` — Estrutura da base de dados
- `02_inserir_dados.sql` — Dados iniciais de exemplo
- `03_consultas.sql` — Dez consultas SQL
- `04_funcoes_triggers.sql` — Funções e triggers
- `05_procedimentos.sql` — Três procedimentos armazenados
- `06_testes.sql` — Consultas e documentação dos testes

## 6. Estado do Desenvolvimento

A estrutura principal da base de dados foi implementada e
reconstruída com sucesso numa base de dados independente.

Foram realizados testes de:
- Criação e cancelamento de reservas
- Prevenção de conflitos de horários
- Validação de datas e utilizadores
- Rejeição de recursos indisponíveis
- Alteração e reativação de reservas
- Bloqueios em operações simultâneas

A base de dados permanece em fase de validação final.
Falta consolidar os testes e rever casos adicionais
de concorrência e integridade dos dados.

## 7. Entrega

**Data prevista:** 14 de dezembro de 2026.