-- Script de Migração de Dados - NoMoney 1.0 para NoMoney 2.0
-- Este script exemplifica o processo de migração do banco Firebird para PostgreSQL

-- Criação das tabelas no PostgreSQL

-- Tabela de usuários
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

-- Tabela de dados pessoais
CREATE TABLE personal_data (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    birth_date DATE,
    gender CHAR(1),
    job_title VARCHAR(100),
    salary DECIMAL(15,2),
    payment_day INTEGER,
    currency_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de categorias
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de tipos de conta
CREATE TABLE account_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200),
    transaction_type CHAR(1) NOT NULL, -- 'C' para crédito, 'D' para débito
    category_id INTEGER REFERENCES categories(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de moedas
CREATE TABLE currencies (
    id SERIAL PRIMARY KEY,
    code VARCHAR(3) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    symbol VARCHAR(5),
    conversion_rate DECIMAL(15,6) DEFAULT 1.0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de bancos
CREATE TABLE banks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de contas financeiras
CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    account_type_id INTEGER NOT NULL REFERENCES account_types(id),
    currency_id INTEGER NOT NULL REFERENCES currencies(id),
    amount DECIMAL(15,2) NOT NULL,
    due_date DATE NOT NULL,
    description VARCHAR(200),
    status INTEGER NOT NULL DEFAULT 0, -- 0: aberta, 1: paga
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de cheques
CREATE TABLE checks (
    id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL REFERENCES accounts(id),
    number VARCHAR(20) NOT NULL,
    bank_id INTEGER NOT NULL REFERENCES banks(id),
    branch VARCHAR(10),
    account_number VARCHAR(20),
    amount DECIMAL(15,2) NOT NULL,
    reason VARCHAR(200),
    date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de países
CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(2) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de estados
CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(2) NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(code, country_id)
);

-- Tabela de tipos de endereço
CREATE TABLE address_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de endereços
CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    address_type_id INTEGER NOT NULL REFERENCES address_types(id),
    street VARCHAR(200) NOT NULL,
    number VARCHAR(10),
    district VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    state_id INTEGER NOT NULL REFERENCES states(id),
    zip_code VARCHAR(10),
    country_id INTEGER NOT NULL REFERENCES countries(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de telefones
CREATE TABLE phones (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    area_code VARCHAR(5),
    number VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de dados mensais
CREATE TABLE monthly_data (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    month INTEGER NOT NULL,
    year INTEGER NOT NULL,
    balance DECIMAL(15,2) NOT NULL,
    type VARCHAR(1) NOT NULL, -- 'C' para crédito, 'D' para débito
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, month, year, type)
);

-- Inserção de dados iniciais

-- Inserção de categorias
INSERT INTO categories (name, description) VALUES
('Moradia', 'Despesas relacionadas à moradia'),
('Transporte', 'Despesas com transporte'),
('Alimentação', 'Despesas com alimentação'),
('Saúde', 'Despesas com saúde'),
('Educação', 'Despesas com educação'),
('Lazer', 'Despesas com lazer'),
('Financeiro', 'Despesas e receitas financeiras'),
('Receitas', 'Entradas de dinheiro');

-- Inserção de moedas
INSERT INTO currencies (code, name, symbol, conversion_rate) VALUES
('BRL', 'Real Brasileiro', 'R$', 1.0),
('USD', 'Dólar Americano', '$', 5.0),
('EUR', 'Euro', '€', 6.0);

-- Inserção de países
INSERT INTO countries (name, code) VALUES
('Brasil', 'BR'),
('Estados Unidos', 'US'),
('Portugal', 'PT');

-- Inserção de estados brasileiros
INSERT INTO states (name, code, country_id) VALUES
('São Paulo', 'SP', 1),
('Rio de Janeiro', 'RJ', 1),
('Minas Gerais', 'MG', 1);

-- Inserção de tipos de endereço
INSERT INTO address_types (name, code) VALUES
('Residencial', 'RES'),
('Comercial', 'COM'),
('Outro', 'OUT');

-- Inserção de bancos
INSERT INTO banks (name, code) VALUES
('Banco do Brasil', '001'),
('Caixa Econômica Federal', '104'),
('Itaú', '341'),
('Bradesco', '237'),
('Santander', '033');

-- Migração de dados do Firebird para PostgreSQL

-- Migração de usuários
INSERT INTO users (id, username, password, email, first_name, last_name, role, enabled)
SELECT 
    l.ID,
    l.LOGIN as username,
    -- Senhas serão migradas com hash bcrypt
    -- Na migração real, cada senha seria processada individualmente
    '$2a$10$hKDVYxLefVHV/vtuPhWD3OigtRyOykRLDdUAp80Z1crSoS1lFqaFS' as password, 
    p.EMAIL as email,
    p.PRIMEIRO_NOME as first_name,
    p.SOBRENOME as last_name,
    'USER' as role,
    TRUE as enabled
FROM LOGIN l
JOIN PESSOA p ON l.ID = p.ID;

-- Migração de administradores
INSERT INTO users (username, password, first_name, last_name, role, enabled)
SELECT 
    a.LOGIN as username,
    -- Senhas serão migradas com hash bcrypt
    '$2a$10$hKDVYxLefVHV/vtuPhWD3OigtRyOykRLDdUAp80Z1crSoS1lFqaFS' as password,
    a.NOME as first_name,
    '' as last_name,
    'ADMIN' as role,
    TRUE as enabled
FROM ADMINISTRADOR a
WHERE NOT EXISTS (SELECT 1 FROM users u WHERE u.username = a.LOGIN);

-- Migração de dados pessoais
INSERT INTO personal_data (user_id, birth_date, gender, job_title, salary, payment_day, currency_id)
SELECT 
    p.ID as user_id,
    p.NASCIMENTO as birth_date,
    p.SEXO as gender,
    p.CARGO as job_title,
    p.SALARIO as salary,
    p.DIA_PAGTO as payment_day,
    -- Mapeamento de moedas
    CASE 
        WHEN p.MOEDA = 1 THEN 1 -- Real
        WHEN p.MOEDA = 2 THEN 2 -- Dólar
        ELSE 1 -- Default para Real
    END as currency_id
FROM PESSOA p;

-- Migração de tipos de conta
INSERT INTO account_types (id, name, description, transaction_type, category_id)
SELECT 
    t.CODIGO as id,
    t.TIPO as name,
    t.DESCRICAO as description,
    t.SITUACAO as transaction_type,
    -- Mapeamento de categorias baseado na descrição
    CASE 
        WHEN t.DESCRICAO LIKE '%moradia%' OR t.DESCRICAO LIKE '%aluguel%' THEN 1
        WHEN t.DESCRICAO LIKE '%transporte%' OR t.DESCRICAO LIKE '%carro%' THEN 2
        WHEN t.DESCRICAO LIKE '%alimentação%' OR t.DESCRICAO LIKE '%comida%' THEN 3
        WHEN t.DESCRICAO LIKE '%saúde%' OR t.DESCRICAO LIKE '%médico%' THEN 4
        WHEN t.DESCRICAO LIKE '%educação%' OR t.DESCRICAO LIKE '%escola%' THEN 5
        WHEN t.DESCRICAO LIKE '%lazer%' THEN 6
        WHEN t.DESCRICAO LIKE '%banco%' OR t.TIPO = 'CHEQUE' THEN 7
        WHEN t.SITUACAO = 'C' THEN 8 -- Receitas
        ELSE 1 -- Default para Moradia
    END as category_id
FROM TIPOCONTA t;

-- Migração de contas
INSERT INTO accounts (id, user_id, account_type_id, currency_id, amount, due_date, description, status)
SELECT 
    c.CODIGO as id,
    c.ID as user_id,
    c.TIPOCONTA as account_type_id,
    c.MOEDA as currency_id,
    c.VALOR as amount,
    c.VENCIMENTO as due_date,
    c.DESCRICAO as description,
    c.SITUACAO as status
FROM CONTA c;

-- Migração de cheques
INSERT INTO checks (account_id, number, bank_id, branch, account_number, amount, reason, date)
SELECT 
    c.CODCONTA as account_id,
    c.NUMERO as number,
    c.BANCO as bank_id,
    c.AGENCIA as branch,
    c.CONTA as account_number,
    a.VALOR as amount,
    a.DESCRICAO as reason,
    a.VENCIMENTO as date
FROM CHEQUE c
JOIN CONTA a ON c.CODCONTA = a.CODIGO;

-- Migração de endereços
INSERT INTO addresses (user_id, address_type_id, street, number, district, city, state_id, zip_code, country_id)
SELECT 
    e.ID as user_id,
    1 as address_type_id, -- Default para Residencial
    e.ENDERECO as street,
    e.NUMERO as number,
    e.BAIRRO as district,
    e.CIDADE as city,
    -- Mapeamento de estados
    CASE 
        WHEN e.SIGLAESTADO = 'SP' THEN 1
        WHEN e.SIGLAESTADO = 'RJ' THEN 2
        WHEN e.SIGLAESTADO = 'MG' THEN 3
        ELSE 1 -- Default para SP
    END as state_id,
    e.CEP as zip_code,
    1 as country_id -- Default para Brasil
FROM ENDERECO e;

-- Migração de telefones
INSERT INTO phones (user_id, area_code, number)
SELECT 
    t.ID as user_id,
    t.DDD as area_code,
    t.TELEFONE as number
FROM TELEFONE t;

-- Criação de índices para otimização

-- Índices para contas
CREATE INDEX idx_accounts_user_id ON accounts(user_id);
CREATE INDEX idx_accounts_due_date ON accounts(due_date);
CREATE INDEX idx_accounts_status ON accounts(status);
CREATE INDEX idx_accounts_account_type_id ON accounts(account_type_id);

-- Índices para usuários
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_role ON users(role);

-- Índices para endereços
CREATE INDEX idx_addresses_user_id ON addresses(user_id);
CREATE INDEX idx_addresses_city ON addresses(city);
CREATE INDEX idx_addresses_state_id ON addresses(state_id);

-- Índices para telefones
CREATE INDEX idx_phones_user_id ON phones(user_id);

-- Índices para cheques
CREATE INDEX idx_checks_account_id ON checks(account_id);
CREATE INDEX idx_checks_bank_id ON checks(bank_id);
CREATE INDEX idx_checks_date ON checks(date);

-- Atualização de sequências após importação
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('personal_data_id_seq', (SELECT MAX(id) FROM personal_data));
SELECT setval('accounts_id_seq', (SELECT MAX(id) FROM accounts));
SELECT setval('account_types_id_seq', (SELECT MAX(id) FROM account_types));
SELECT setval('categories_id_seq', (SELECT MAX(id) FROM categories));
SELECT setval('currencies_id_seq', (SELECT MAX(id) FROM currencies));
SELECT setval('banks_id_seq', (SELECT MAX(id) FROM banks));
SELECT setval('checks_id_seq', (SELECT MAX(id) FROM checks));
SELECT setval('addresses_id_seq', (SELECT MAX(id) FROM addresses));
SELECT setval('phones_id_seq', (SELECT MAX(id) FROM phones));