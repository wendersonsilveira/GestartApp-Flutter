# Gestart

A new Flutter project.


Flutter Modular + Clean Architecture + Repository Pattern

## Design System

### Espaçamentos:

Tela:

Padding vertical: 26.h
Padding horizontal: 26.w

Textos:

Espaçamento entre textos na vertical: 16.w
Espaçamento entre textos na horizontal: 36.h

Botoes:

## Camadas:

App
Domain
Data

## App:

Criação de toda a parte visual

## Domain

Camada de faz a comunicação do front com o back

## Data

Camada responsável por obter os dados, sejam eles remotos ou do database local (sharedpreferences)

### Passos para construção

1. Criar o Entity (/domain/entities)
2. Criar o Mapper (/data/mappers)
3. Criar o Data Source (/data/datasource)
4. Criar o Repositorio (/domain/repositories)
5. Criar a Implementacao do Repositorio (/data/repositories)
6. Criar o Use Case (domain/usecases)
7. Registrar o Use Case, Repository, DataSources no GetIt (/di/dio_config)
8. Fazer a chamada na view/pages
 