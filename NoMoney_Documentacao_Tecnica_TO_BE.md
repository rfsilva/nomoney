# Documentação Técnica - NoMoney 2.0 (TO BE)

## Sumário

1. [Visão Geral](#1-visão-geral)
2. [Arquitetura do Sistema](#2-arquitetura-do-sistema)
3. [Front-end (Angular)](#3-front-end-angular)
4. [Back-end (Java Spring Boot)](#4-back-end-java-spring-boot)
5. [Banco de Dados (PostgreSQL)](#5-banco-de-dados-postgresql)
6. [Processo de Migração](#6-processo-de-migração)
7. [Segurança](#7-segurança)
8. [Integração e APIs](#8-integração-e-apis)
9. [Implantação e DevOps](#9-implantação-e-devops)
10. [Diagrama de Entidade-Relacionamento](#10-diagrama-de-entidade-relacionamento)
11. [Roadmap de Implementação](#11-roadmap-de-implementação)

## 1. Visão Geral

O NoMoney 2.0 representa uma reescrita completa do sistema NoMoney 1.0, mantendo todas as funcionalidades existentes enquanto moderniza a arquitetura, melhora a segurança, a usabilidade e adiciona novas capacidades. A nova versão será desenvolvida utilizando tecnologias modernas e seguindo as melhores práticas de desenvolvimento de software.

### 1.1. Objetivos da Nova Arquitetura

- **Modernização Tecnológica**: Substituir a tecnologia legada (C++ Builder) por tecnologias modernas e amplamente adotadas
- **Arquitetura Escalável**: Implementar uma arquitetura em camadas que permita escalabilidade horizontal e vertical
- **Segurança Aprimorada**: Implementar mecanismos modernos de autenticação e autorização
- **Experiência do Usuário Melhorada**: Criar uma interface responsiva e intuitiva
- **Manutenibilidade**: Facilitar a manutenção e evolução do sistema através de código bem estruturado e documentado
- **Extensibilidade**: Permitir a adição de novas funcionalidades de forma simples e sem impactar as existentes

### 1.2. Principais Mudanças

| Aspecto | NoMoney 1.0 (AS IS) | NoMoney 2.0 (TO BE) |
|---------|---------------------|---------------------|
| Front-end | C++ Builder Forms | Angular 17+ |
| Back-end | C++ Builder | Java 21 + Spring Boot 3.2+ |
| Banco de Dados | Firebird/InterBase | PostgreSQL 16+ |
| Autenticação | Básica (texto plano) | JWT + OAuth 2.0 |
| Arquitetura | Monolítica | API RESTful + SPA |
| Implantação | Desktop | Web + Responsivo |
| Segurança | Básica | Avançada (HTTPS, criptografia, etc.) |

## 2. Arquitetura do Sistema

### 2.1. Visão Geral da Arquitetura

O NoMoney 2.0 será implementado como uma aplicação web moderna seguindo o padrão de arquitetura em camadas, com separação clara entre front-end e back-end:

```
[Cliente Web] <--HTTPS--> [API Gateway] <---> [Serviços Backend] <---> [Banco de Dados]
   Angular                  Spring Cloud           Spring Boot           PostgreSQL
```

### 2.2. Componentes Principais

- **Cliente Web (Angular)**: Interface de usuário responsiva e intuitiva
- **API Gateway**: Ponto de entrada único para todas as requisições, responsável por roteamento, autenticação e autorização
- **Serviços Backend**: Implementação das regras de negócio e lógica da aplicação
- **Banco de Dados**: Armazenamento persistente dos dados

### 2.3. Padrões Arquiteturais

- **Arquitetura em Camadas**: Separação clara entre apresentação, lógica de negócio e acesso a dados
- **API RESTful**: Comunicação entre front-end e back-end através de APIs REST
- **Microserviços**: Divisão do back-end em serviços independentes e especializados
- **Domain-Driven Design (DDD)**: Modelagem do domínio de negócio de forma clara e expressiva
- **Repository Pattern**: Abstração do acesso a dados
- **CQRS (Command Query Responsibility Segregation)**: Separação entre operações de leitura e escrita

## 3. Front-end (Angular)

### 3.1. Estrutura do Projeto

```
src/
├── app/
│   ├── core/                 # Serviços singleton, modelos universais, etc.
│   │   ├── auth/             # Autenticação e autorização
│   │   ├── http/             # Interceptores HTTP
│   │   ├── services/         # Serviços core
│   │   └── models/           # Modelos de dados
│   ├── shared/               # Componentes, diretivas e pipes compartilhados
│   │   ├── components/       # Componentes reutilizáveis
│   │   ├── directives/       # Diretivas personalizadas
│   │   └── pipes/            # Pipes personalizados
│   ├── features/             # Módulos de funcionalidades
│   │   ├── dashboard/        # Dashboard financeiro
│   │   ├── accounts/         # Gerenciamento de contas
│   │   ├── reports/          # Relatórios financeiros
│   │   ├── checks/           # Gerenciamento de cheques
│   │   ├── profile/          # Perfil do usuário
│   │   └── admin/            # Funcionalidades administrativas
│   ├── layouts/              # Layouts da aplicação
│   └── app.module.ts         # Módulo raiz
├── assets/                   # Recursos estáticos
├── environments/             # Configurações de ambiente
└── index.html                # Página HTML principal
```

### 3.2. Tecnologias e Bibliotecas

- **Angular 17+**: Framework para desenvolvimento do front-end
- **Angular Material**: Biblioteca de componentes de UI
- **NgRx**: Gerenciamento de estado da aplicação
- **RxJS**: Programação reativa
- **Chart.js**: Visualização de dados em gráficos
- **Angular Flex Layout**: Layout responsivo
- **Angular JWT**: Manipulação de tokens JWT
- **Jasmine/Karma**: Testes unitários
- **Cypress**: Testes end-to-end

### 3.3. Principais Módulos e Componentes

#### 3.3.1. Módulo de Autenticação

- Login
- Registro
- Recuperação de senha
- Perfil de usuário

#### 3.3.2. Módulo de Dashboard

- Visão geral financeira
- Indicadores de saldo
- Gráficos de receitas e despesas
- Alertas de contas vencidas

#### 3.3.3. Módulo de Gerenciamento de Contas

- Listagem de contas
- Adição/edição de contas
- Marcação de pagamento
- Parcelamento de contas
- Filtros e pesquisa

#### 3.3.4. Módulo de Relatórios

- Geração de relatórios
- Exportação para PDF/Excel
- Visualização de relatórios

#### 3.3.5. Módulo de Administração

- Gerenciamento de tipos de conta
- Configurações do sistema
- Gerenciamento de usuários (para administradores)

### 3.4. Estratégia de Responsividade

O front-end será desenvolvido seguindo a abordagem "mobile-first", garantindo uma experiência de usuário adequada em dispositivos de diferentes tamanhos:

- **Layout Fluido**: Adaptação automática ao tamanho da tela
- **Media Queries**: Ajustes específicos para diferentes breakpoints
- **Componentes Responsivos**: Componentes que se adaptam ao espaço disponível
- **Touch-Friendly**: Interface otimizada para interação por toque

## 4. Back-end (Java Spring Boot)

### 4.1. Estrutura do Projeto

```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── nomoney/
│   │           ├── api/                  # Controladores REST
│   │           │   ├── AccountController.java
│   │           │   ├── AuthController.java
│   │           │   ├── ReportController.java
│   │           │   └── ...
│   │           ├── config/               # Configurações
│   │           │   ├── SecurityConfig.java
│   │           │   ├── JwtConfig.java
│   │           │   └── ...
│   │           ├── domain/               # Entidades e modelos de domínio
│   │           │   ├── Account.java
│   │           │   ├── User.java
│   │           │   └── ...
│   │           ├── dto/                  # Objetos de transferência de dados
│   │           │   ├── AccountDTO.java
│   │           │   ├── UserDTO.java
│   │           │   └── ...
│   │           ├── exception/            # Exceções personalizadas
│   │           ├── repository/           # Repositórios JPA
│   │           │   ├── AccountRepository.java
│   │           │   ├── UserRepository.java
│   │           │   └── ...
│   │           ├── service/              # Serviços de negócio
│   │           │   ├── AccountService.java
│   │           │   ├── AuthService.java
│   │           │   └── ...
│   │           └── NoMoneyApplication.java
│   └── resources/
│       ├── application.yml               # Configurações da aplicação
│       ├── db/
│       │   └── migration/                # Scripts de migração Flyway
│       └── ...
└── test/                                 # Testes automatizados
```

### 4.2. Tecnologias e Bibliotecas

- **Java 21**: Linguagem de programação
- **Spring Boot 3.2+**: Framework para desenvolvimento de aplicações Java
- **Spring Security**: Segurança e autenticação
- **Spring Data JPA**: Acesso a dados
- **Hibernate**: ORM (Object-Relational Mapping)
- **Flyway**: Migração de banco de dados
- **Lombok**: Redução de código boilerplate
- **MapStruct**: Mapeamento entre objetos
- **JWT**: Autenticação baseada em tokens
- **Swagger/OpenAPI**: Documentação de API
- **JUnit 5**: Testes unitários
- **Mockito**: Mocking para testes
- **Testcontainers**: Testes de integração

### 4.3. Principais Módulos e Serviços

#### 4.3.1. Módulo de Autenticação e Autorização

- Autenticação de usuários
- Geração e validação de tokens JWT
- Controle de acesso baseado em perfis
- Gerenciamento de sessões

#### 4.3.2. Módulo de Gerenciamento de Contas

- CRUD de contas financeiras
- Cálculo de saldos
- Parcelamento de contas
- Marcação de pagamento

#### 4.3.3. Módulo de Relatórios

- Geração de relatórios financeiros
- Exportação para diferentes formatos
- Cálculos e agregações financeiras

#### 4.3.4. Módulo de Gerenciamento de Usuários

- CRUD de usuários
- Gerenciamento de perfis
- Dados pessoais e preferências

#### 4.3.5. Módulo de Administração

- Configurações do sistema
- Gerenciamento de tipos de conta
- Monitoramento e logs

### 4.4. APIs RESTful

O back-end exposará APIs RESTful seguindo as melhores práticas:

- **Versionamento**: APIs versionadas (ex: `/api/v1/accounts`)
- **Recursos**: Nomes de recursos no plural (ex: `/accounts`, `/users`)
- **Métodos HTTP**: Uso apropriado dos métodos HTTP (GET, POST, PUT, DELETE)
- **Status Codes**: Uso correto dos códigos de status HTTP
- **Paginação**: Suporte a paginação para listas grandes
- **Filtros**: Suporte a filtros e ordenação
- **HATEOAS**: Links para recursos relacionados

## 5. Banco de Dados (PostgreSQL)

### 5.1. Modelo de Dados

O modelo de dados do NoMoney 2.0 será uma versão normalizada e otimizada do modelo atual, mantendo a mesma estrutura lógica mas com melhorias na integridade referencial e performance.

#### 5.1.1. Principais Entidades

- **users**: Usuários do sistema
- **accounts**: Contas financeiras (receitas e despesas)
- **account_types**: Tipos de conta (água, luz, telefone, etc.)
- **currencies**: Moedas utilizadas
- **checks**: Cheques emitidos
- **banks**: Instituições bancárias
- **addresses**: Endereços dos usuários
- **phones**: Telefones dos usuários
- **personal_data**: Dados pessoais dos usuários

### 5.2. Estratégia de Persistência

- **JPA/Hibernate**: Mapeamento objeto-relacional
- **Spring Data JPA**: Repositórios para acesso a dados
- **Transações**: Gerenciamento transacional declarativo
- **Auditoria**: Registro de criação e modificação de entidades
- **Soft Delete**: Exclusão lógica de registros

### 5.3. Otimizações

- **Índices**: Índices apropriados para campos frequentemente consultados
- **Constraints**: Constraints de integridade referencial
- **Particionamento**: Particionamento de tabelas grandes (ex: contas por ano)
- **Caching**: Cache de segundo nível para dados frequentemente acessados

### 5.4. Configuração do PostgreSQL

```yaml
# application.yml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/nomoney
    username: ${DB_USERNAME}
    password: ${DB_PASSWORD}
    driver-class-name: org.postgresql.Driver
  jpa:
    hibernate:
      ddl-auto: validate
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQLDialect
        format_sql: true
        jdbc:
          batch_size: 50
        order_inserts: true
        order_updates: true
  flyway:
    enabled: true
    baseline-on-migrate: true
```

## 6. Processo de Migração

### 6.1. Estratégia de Migração

A migração do NoMoney 1.0 para o NoMoney 2.0 seguirá uma abordagem em fases:

1. **Análise do Esquema Atual**: Mapeamento completo do esquema do banco de dados Firebird
2. **Definição do Novo Esquema**: Design do esquema PostgreSQL otimizado
3. **Desenvolvimento de Scripts de Migração**: Scripts para extração, transformação e carga (ETL)
4. **Migração de Dados**: Execução dos scripts de migração
5. **Validação**: Verificação da integridade e consistência dos dados migrados
6. **Testes**: Testes funcionais com os dados migrados
7. **Implantação**: Implantação da nova aplicação com os dados migrados

### 6.2. Ferramentas de Migração

- **Flyway**: Gerenciamento de migrações de banco de dados
- **Scripts SQL**: Scripts personalizados para extração e transformação de dados
- **Spring Batch**: Processamento em lote para migração de grandes volumes de dados
- **Ferramentas ETL**: Talend ou Pentaho Data Integration para casos complexos

### 6.3. Mapeamento de Dados

| Tabela Firebird | Tabela PostgreSQL | Observações |
|----------------|-------------------|-------------|
| LOGIN | users | Senhas serão migradas com hash bcrypt |
| ADMINISTRADOR | users (com role admin) | Administradores serão usuários com perfil especial |
| PESSOA | personal_data | Dados pessoais dos usuários |
| CONTA | accounts | Contas financeiras |
| TIPOCONTA | account_types | Tipos de conta |
| MOEDA | currencies | Moedas |
| CHEQUE | checks | Cheques |
| BANCO | banks | Bancos |
| ENDERECO | addresses | Endereços |
| TELEFONE | phones | Telefones |

### 6.4. Script de Migração (Exemplo)

```sql
-- Exemplo de script de migração para a tabela de usuários
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(20) NOT NULL,
    enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Migração de usuários comuns
INSERT INTO users (username, password, email, first_name, last_name, role, enabled)
SELECT 
    l.LOGIN as username,
    '$2a$10$encrypted_password' as password, -- Senha será atualizada posteriormente
    p.EMAIL as email,
    p.PRIMEIRO_NOME as first_name,
    p.SOBRENOME as last_name,
    'USER' as role,
    TRUE as enabled
FROM LOGIN l
JOIN PESSOA p ON l.ID = p.ID;

-- Migração de administradores
INSERT INTO users (username, password, email, first_name, last_name, role, enabled)
SELECT 
    a.LOGIN as username,
    '$2a$10$encrypted_password' as password, -- Senha será atualizada posteriormente
    NULL as email,
    a.NOME as first_name,
    '' as last_name,
    'ADMIN' as role,
    TRUE as enabled
FROM ADMINISTRADOR a
WHERE NOT EXISTS (SELECT 1 FROM users u WHERE u.username = a.LOGIN);
```

### 6.5. Considerações de Segurança na Migração

- **Senhas**: As senhas serão migradas utilizando algoritmos de hash seguros (bcrypt)
- **Dados Sensíveis**: Dados sensíveis serão criptografados durante a migração
- **Backup**: Backup completo dos dados antes da migração
- **Rollback**: Plano de rollback em caso de falhas
- **Auditoria**: Registro de todas as operações de migração

## 7. Segurança

### 7.1. Autenticação e Autorização

- **JWT (JSON Web Tokens)**: Autenticação stateless baseada em tokens
- **OAuth 2.0**: Suporte a autenticação via provedores externos
- **RBAC (Role-Based Access Control)**: Controle de acesso baseado em perfis
- **2FA (Two-Factor Authentication)**: Autenticação em dois fatores (opcional)

### 7.2. Segurança de Dados

- **Criptografia**: Criptografia de dados sensíveis em repouso
- **HTTPS**: Comunicação segura via TLS/SSL
- **Sanitização de Entrada**: Validação e sanitização de todas as entradas de usuário
- **Proteção contra Injeção SQL**: Uso de prepared statements e ORM
- **Proteção contra XSS**: Escape de saída e Content Security Policy

### 7.3. Configuração de Segurança

```java
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/api/v1/auth/**").permitAll()
                .requestMatchers("/api/v1/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated()
            )
            .sessionManagement(session -> session
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            )
            .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
        
        return http.build();
    }
    
    // Outros beans de segurança...
}
```

## 8. Integração e APIs

### 8.1. APIs Internas

O sistema será estruturado em torno de APIs RESTful bem definidas:

- **/api/v1/auth**: Autenticação e gerenciamento de usuários
- **/api/v1/accounts**: Gerenciamento de contas financeiras
- **/api/v1/reports**: Geração e acesso a relatórios
- **/api/v1/checks**: Gerenciamento de cheques
- **/api/v1/admin**: Funcionalidades administrativas

### 8.2. Documentação de API

Todas as APIs serão documentadas utilizando Swagger/OpenAPI:

```java
@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("NoMoney API")
                        .version("2.0")
                        .description("API do sistema NoMoney 2.0")
                        .contact(new Contact()
                                .name("Equipe NoMoney")
                                .email("contato@nomoney.com")));
    }
}
```

### 8.3. Integrações Futuras

O sistema será projetado para permitir integrações futuras com:

- **APIs Bancárias**: Integração com bancos para atualização automática de transações
- **Serviços de Pagamento**: Integração com gateways de pagamento
- **Serviços Fiscais**: Integração com serviços de emissão de notas fiscais
- **Exportação/Importação**: Suporte a formatos padrão como OFX, CSV, etc.

## 9. Implantação e DevOps

### 9.1. Estratégia de Implantação

- **Containerização**: Aplicação empacotada em containers Docker
- **Orquestração**: Kubernetes para orquestração de containers
- **CI/CD**: Pipeline automatizado para build, teste e deploy
- **Ambientes**: Desenvolvimento, Teste, Homologação e Produção

### 9.2. Monitoramento e Logging

- **Logging**: Centralizado com ELK Stack (Elasticsearch, Logstash, Kibana)
- **Métricas**: Monitoramento com Prometheus e Grafana
- **Tracing**: Rastreamento distribuído com Jaeger
- **Alertas**: Alertas automáticos para problemas críticos

### 9.3. Configuração Docker

```dockerfile
# Dockerfile para o backend
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY target/nomoney-backend.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
```

```dockerfile
# Dockerfile para o frontend
FROM node:18-alpine as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build -- --configuration production

FROM nginx:alpine
COPY --from=build /app/dist/nomoney /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

### 9.4. Configuração Kubernetes (Exemplo)

```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nomoney-backend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nomoney-backend
  template:
    metadata:
      labels:
        app: nomoney-backend
    spec:
      containers:
      - name: nomoney-backend
        image: nomoney/backend:latest
        ports:
        - containerPort: 8080
        env:
        - name: SPRING_PROFILES_ACTIVE
          value: "prod"
        - name: DB_USERNAME
          valueFrom:
            secretKeyRef:
              name: db-credentials
              key: username
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-credentials
              key: password
```

## 10. Diagrama de Entidade-Relacionamento

```
+----------------+       +----------------+       +----------------+
|     users      |       |    accounts    |       | account_types  |
+----------------+       +----------------+       +----------------+
| id             |<----->| id             |       | id             |
| username       |       | user_id        |<----->| name           |
| password       |       | account_type_id|       | description    |
| email          |       | currency_id    |       | transaction_type|
| first_name     |       | amount         |       | category_id    |
| last_name      |       | due_date       |       +----------------+
| role           |       | description    |              ^
| enabled        |       | status         |              |
+----------------+       | created_at     |       +----------------+
       ^                 | updated_at     |       |   categories   |
       |                 +----------------+       +----------------+
       |                        ^                 | id             |
       |                        |                 | name           |
+----------------+       +----------------+       | description    |
| personal_data  |       |     checks     |       +----------------+
+----------------+       +----------------+
| id             |       | id             |       +----------------+
| user_id        |       | account_id     |       |  currencies    |
| birth_date     |       | number         |       +----------------+
| gender         |       | bank_id        |       | id             |
| job_title      |       | branch         |       | code           |
| salary         |       | account_number |       | name           |
| payment_day    |       | amount         |       | symbol         |
+----------------+       | reason         |       | conversion_rate|
                         | date           |       +----------------+
+----------------+       +----------------+              ^
|   addresses    |              ^                        |
+----------------+              |                 +----------------+
| id             |       +----------------+       |     banks      |
| user_id        |       |  monthly_data  |       +----------------+
| address_type_id|       +----------------+       | id             |
| street         |       | id             |       | name           |
| number         |       | user_id        |       | code           |
| district       |       | month          |       +----------------+
| city           |       | year           |
| state_id       |       | balance        |       +----------------+
| zip_code       |       | type           |       |     phones     |
| country_id     |       +----------------+       +----------------+
+----------------+                                | id             |
                                                  | user_id        |
                                                  | area_code      |
                                                  | number         |
                                                  +----------------+
```

### 10.1. Descrição das Entidades

#### users
Armazena informações de autenticação e identificação básica dos usuários.

#### personal_data
Armazena dados pessoais detalhados dos usuários.

#### accounts
Registra todas as contas financeiras (receitas e despesas).

#### account_types
Categoriza os tipos de contas (água, luz, telefone, etc.).

#### categories
Agrupa tipos de conta em categorias mais amplas (ex: Utilidades, Lazer, etc.).

#### currencies
Registra as moedas utilizadas no sistema.

#### checks
Armazena informações sobre cheques emitidos.

#### banks
Cadastro de instituições bancárias.

#### addresses
Armazena endereços dos usuários.

#### phones
Armazena telefones dos usuários.

#### monthly_data
Armazena dados consolidados por mês para cada usuário.

## 11. Roadmap de Implementação

### 11.1. Fase 1: Fundação (Mês 1-2)

- Configuração do ambiente de desenvolvimento
- Definição da arquitetura detalhada
- Implementação do esquema de banco de dados
- Desenvolvimento da estrutura básica do back-end
- Configuração da estrutura básica do front-end
- Implementação do sistema de autenticação

### 11.2. Fase 2: Funcionalidades Core (Mês 3-4)

- Implementação do gerenciamento de contas
- Implementação da visualização financeira
- Desenvolvimento da dashboard
- Implementação do gerenciamento de cheques
- Desenvolvimento dos relatórios básicos

### 11.3. Fase 3: Migração e Testes (Mês 5)

- Desenvolvimento dos scripts de migração
- Testes de migração com dados reais
- Testes de integração
- Testes de usabilidade
- Correções e ajustes

### 11.4. Fase 4: Implantação e Estabilização (Mês 6)

- Implantação em ambiente de produção
- Migração final dos dados
- Treinamento dos usuários
- Monitoramento e ajustes de performance
- Correção de bugs

### 11.5. Fase 5: Melhorias e Novas Funcionalidades (Pós-lançamento)

- Implementação de gráficos e dashboards avançados
- Integração com serviços bancários
- Aplicativo móvel
- Notificações por email/push
- Orçamentos e metas financeiras