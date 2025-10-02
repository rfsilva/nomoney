# Requisitos de Negócio - Sistema NoMoney 1.0

## Sumário

1. [Introdução](#1-introdução)
2. [Requisitos de Autenticação e Controle de Acesso](#2-requisitos-de-autenticação-e-controle-de-acesso)
3. [Requisitos de Gerenciamento de Contas](#3-requisitos-de-gerenciamento-de-contas)
4. [Requisitos de Visualização Financeira](#4-requisitos-de-visualização-financeira)
5. [Requisitos de Gerenciamento de Cheques](#5-requisitos-de-gerenciamento-de-cheques)
6. [Requisitos de Emissão de Relatórios](#6-requisitos-de-emissão-de-relatórios)
7. [Requisitos de Gerenciamento de Dados Pessoais](#7-requisitos-de-gerenciamento-de-dados-pessoais)
8. [Requisitos de Administração do Sistema](#8-requisitos-de-administração-do-sistema)
9. [Glossário](#9-glossário)

## 1. Introdução

Este documento detalha os requisitos de negócio do sistema NoMoney 1.0, um sistema de gerenciamento financeiro pessoal. Os requisitos foram extraídos a partir da análise do código-fonte e da documentação existente, e representam as regras de negócio implementadas no sistema atual.

## 2. Requisitos de Autenticação e Controle de Acesso

### 2.1. Autenticação de Usuários

#### RN-AUTH-001: Validação de Credenciais de Usuário Comum
- **Descrição**: O sistema deve validar as credenciais do usuário na tabela LOGIN para usuários comuns.
- **Implementação**: A validação é realizada pela função `ChecarLoginUser` no módulo `BancoDM_Unit`, que verifica se o login e senha fornecidos correspondem a um registro na tabela LOGIN.
- **Critérios de Aceitação**:
  - O sistema deve permitir acesso apenas se o login e senha corresponderem exatamente a um registro na tabela LOGIN.
  - As credenciais são case-sensitive.
  - Não há limite de tentativas de login.

#### RN-AUTH-002: Validação de Credenciais de Administrador
- **Descrição**: O sistema deve validar as credenciais do administrador na tabela ADMINISTRADOR.
- **Implementação**: A validação é realizada pela função `ChecarLoginAdmin` no módulo `BancoDM_Unit`, que verifica se o login e senha fornecidos correspondem a um registro na tabela ADMINISTRADOR.
- **Critérios de Aceitação**:
  - O sistema deve permitir acesso administrativo apenas se o login e senha corresponderem exatamente a um registro na tabela ADMINISTRADOR.
  - As credenciais são case-sensitive.
  - Não há limite de tentativas de login.

#### RN-AUTH-003: Armazenamento de Senhas
- **Descrição**: As senhas são armazenadas em texto plano no banco de dados.
- **Implementação**: As senhas são armazenadas nos campos SENHA das tabelas LOGIN e ADMINISTRADOR sem criptografia.
- **Critérios de Aceitação**:
  - As senhas devem ser armazenadas exatamente como fornecidas pelo usuário.
  - Não há requisitos de complexidade para senhas.

#### RN-AUTH-004: Persistência de Credenciais
- **Descrição**: O sistema deve armazenar as preferências de login no arquivo NoMoney.ini quando solicitado pelo usuário.
- **Implementação**: A função `ConfigurarIniFile` no módulo `Login_Unit` salva as credenciais no arquivo NoMoney.ini quando o usuário marca a opção "Lembrar senha".
- **Critérios de Aceitação**:
  - Se o usuário marcar a opção "Lembrar senha", o sistema deve salvar o login, senha e tipo de acesso no arquivo NoMoney.ini.
  - Se o usuário não marcar a opção, o sistema não deve salvar as credenciais.
  - Na próxima inicialização, o sistema deve carregar automaticamente as credenciais salvas.

#### RN-AUTH-005: Carregamento de Interface por Tipo de Usuário
- **Descrição**: O sistema deve carregar interfaces diferentes baseadas no tipo de usuário (comum ou administrador).
- **Implementação**: A função `SetLabel` no módulo `Principal_Unit` configura a interface com base no tipo de usuário.
- **Critérios de Aceitação**:
  - Para usuários comuns, o sistema deve exibir apenas as abas de Situação e Dados Pessoais.
  - Para administradores, o sistema deve exibir também a aba de Configuração Admin.
  - O menu deve ser ajustado de acordo com o tipo de usuário.

### 2.2. Controle de Sessão

#### RN-AUTH-006: Logoff de Usuário
- **Descrição**: O sistema deve permitir que o usuário encerre sua sessão sem fechar o aplicativo.
- **Implementação**: A função `Logoff1Click` no módulo `Principal_Unit` encerra a sessão do usuário atual.
- **Critérios de Aceitação**:
  - Ao fazer logoff, o sistema deve retornar à tela de login.
  - Todos os dados da sessão anterior devem ser limpos.
  - O usuário deve poder fazer login novamente com as mesmas ou outras credenciais.

## 3. Requisitos de Gerenciamento de Contas

### 3.1. Cadastro e Manutenção de Contas

#### RN-CONTA-001: Campos Obrigatórios para Contas
- **Descrição**: Uma conta deve ter obrigatoriamente: tipo, valor, moeda, vencimento e situação (paga ou não paga).
- **Implementação**: A validação é realizada na função `BitBtn1Click` do módulo `DetalhesConta_Unit`.
- **Critérios de Aceitação**:
  - O sistema não deve permitir salvar uma conta sem preencher todos os campos obrigatórios.
  - O sistema deve exibir uma mensagem de erro caso algum campo obrigatório não seja preenchido.
  - O campo descrição é opcional.

#### RN-CONTA-002: Exclusão de Contas
- **Descrição**: O sistema deve permitir a exclusão de contas, removendo também registros relacionados.
- **Implementação**: A função `ExcluirConta` no módulo `BancoDM_Unit` exclui a conta e registros relacionados.
- **Critérios de Aceitação**:
  - Ao excluir uma conta, o sistema deve remover o registro da tabela CONTA.
  - Se a conta for do tipo "CHEQUE", o sistema deve excluir também o registro correspondente na tabela CHEQUE.
  - O sistema deve solicitar confirmação antes de excluir uma conta.

#### RN-CONTA-003: Marcação de Pagamento
- **Descrição**: Ao marcar uma conta como paga, o sistema deve atualizar seu status para 1 (fechada).
- **Implementação**: A função `AtualizarStatusConta` no módulo `BancoDM_Unit` atualiza o status da conta.
- **Critérios de Aceitação**:
  - Ao marcar uma conta como paga, o sistema deve atualizar o campo SITUACAO para 1.
  - A conta deve ser exibida com a cor verde na lista de contas.
  - O saldo atual deve ser recalculado considerando a conta como paga.

#### RN-CONTA-004: Desmarcação de Pagamento
- **Descrição**: Ao marcar uma conta como não paga, o sistema deve atualizar seu status para 0 (aberta).
- **Implementação**: A função `AtualizarStatusConta` no módulo `BancoDM_Unit` atualiza o status da conta.
- **Critérios de Aceitação**:
  - Ao marcar uma conta como não paga, o sistema deve atualizar o campo SITUACAO para 0.
  - A conta deve ser exibida com a cor amarela ou vermelha na lista de contas, dependendo da data de vencimento.
  - O saldo atual deve ser recalculado considerando a conta como não paga.

#### RN-CONTA-005: Parcelamento de Contas
- **Descrição**: O parcelamento de contas deve criar registros individuais para cada parcela.
- **Implementação**: A função `EstenderAteOFimDoAno` no módulo `DetalhesConta_Unit` cria registros para cada parcela.
- **Critérios de Aceitação**:
  - Ao selecionar a opção "Estender até o fim do ano", o sistema deve criar uma conta para cada mês restante do ano atual.
  - Cada parcela deve ter os mesmos dados da conta original, exceto pela data de vencimento, que deve ser ajustada para o mês correspondente.
  - Todas as parcelas devem ser criadas com o status "aberta" (0).

#### RN-CONTA-006: Associação de Contas a Cheques
- **Descrição**: Contas do tipo "CHEQUE" devem ter um registro correspondente na tabela CHEQUE.
- **Implementação**: A função `BitBtn1Click` no módulo `CadCheque_Dialog` cria uma conta associada ao cheque.
- **Critérios de Aceitação**:
  - Ao cadastrar um cheque, o sistema deve criar automaticamente uma conta do tipo "CHEQUE".
  - A conta deve ter o mesmo valor e data do cheque.
  - A conta deve estar vinculada ao cheque através do campo CODCONTA na tabela CHEQUE.

### 3.2. Classificação e Status de Contas

#### RN-CONTA-007: Tipos de Transação
- **Descrição**: O sistema deve classificar as contas como Débito (D) ou Crédito (C).
- **Implementação**: O campo SITUACAO na tabela TIPOCONTA define se o tipo de conta é débito (D) ou crédito (C).
- **Critérios de Aceitação**:
  - Contas de tipo com SITUACAO = 'D' devem ser tratadas como saídas de dinheiro (despesas).
  - Contas de tipo com SITUACAO = 'C' devem ser tratadas como entradas de dinheiro (receitas).
  - Contas de crédito devem ser exibidas em azul na lista de contas.

#### RN-CONTA-008: Status de Contas
- **Descrição**: O sistema deve classificar as contas como Abertas, Atrasadas ou Fechadas.
- **Implementação**: A função `Situacao_DBGridDrawColumnCell` no módulo `Principal_Unit` aplica cores diferentes conforme o status.
- **Critérios de Aceitação**:
  - Contas com SITUACAO = 0 e data de vencimento futura devem ser classificadas como "Abertas" e exibidas em amarelo.
  - Contas com SITUACAO = 0 e data de vencimento passada devem ser classificadas como "Atrasadas" e exibidas em vermelho.
  - Contas com SITUACAO = 1 devem ser classificadas como "Fechadas" e exibidas em verde.
  - Contas de crédito devem ser exibidas em azul, independentemente do status.

#### RN-CONTA-009: Identificação de Contas Vencidas
- **Descrição**: O sistema deve considerar uma conta como vencida quando sua data de vencimento for anterior à data atual.
- **Implementação**: A comparação é realizada na função `Analise` no módulo `Principal_Unit`.
- **Critérios de Aceitação**:
  - Contas com data de vencimento anterior à data atual e não pagas devem ser consideradas vencidas.
  - O sistema deve exibir um alerta com a lista de contas vencidas ao iniciar.
  - Contas vencidas devem ser exibidas em vermelho na lista de contas.

## 4. Requisitos de Visualização Financeira

### 4.1. Cálculo de Saldos

#### RN-FIN-001: Cálculo do Saldo Atual
- **Descrição**: O sistema deve calcular o saldo atual como: Total de Créditos - Total de Débitos Pagos.
- **Implementação**: O cálculo é realizado na função `Analise` no módulo `Principal_Unit`.
- **Critérios de Aceitação**:
  - O saldo atual deve considerar apenas as contas do mês selecionado.
  - Para o cálculo, devem ser somados todos os créditos e subtraídos apenas os débitos com SITUACAO = 1 (pagos).
  - O saldo deve ser exibido em vermelho se for negativo e em azul se for positivo.

#### RN-FIN-002: Cálculo do Saldo do Mês
- **Descrição**: O sistema deve calcular o saldo do mês como: Total de Créditos - Total de Débitos (pagos e não pagos).
- **Implementação**: O cálculo é realizado na função `Analise` no módulo `Principal_Unit`.
- **Critérios de Aceitação**:
  - O saldo do mês deve considerar apenas as contas do mês selecionado.
  - Para o cálculo, devem ser somados todos os créditos e subtraídos todos os débitos, independentemente do status.
  - O saldo deve ser exibido em vermelho se for negativo e em azul se for positivo.

#### RN-FIN-003: Cálculo do Débito Restante
- **Descrição**: O sistema deve calcular o débito restante como: Total de Débitos Não Pagos.
- **Implementação**: O cálculo é realizado na função `Analise` no módulo `Principal_Unit`.
- **Critérios de Aceitação**:
  - O débito restante deve considerar apenas as contas do mês selecionado.
  - Para o cálculo, devem ser somados apenas os débitos com SITUACAO = 0 (não pagos).
  - O valor deve ser sempre exibido em vermelho.

### 4.2. Visualização por Período

#### RN-FIN-004: Visualização Mensal
- **Descrição**: O sistema deve exibir as contas agrupadas por mês.
- **Implementação**: A função `SetPeriodo` no módulo `Principal_Unit` configura a visualização para o mês selecionado.
- **Critérios de Aceitação**:
  - O sistema deve exibir apenas as contas do mês e ano selecionados.
  - O nome do mês e ano devem ser exibidos no cabeçalho da tela.
  - O sistema deve permitir navegar entre os meses através dos botões de navegação.

#### RN-FIN-005: Recálculo de Indicadores por Período
- **Descrição**: O sistema deve recalcular todos os indicadores financeiros ao mudar de período.
- **Implementação**: A função `Analise` no módulo `Principal_Unit` é chamada sempre que o período é alterado.
- **Critérios de Aceitação**:
  - Ao mudar de período, o sistema deve recalcular o saldo atual, saldo do mês e débito restante.
  - O sistema deve atualizar a lista de contas para exibir apenas as contas do novo período.
  - Os totalizadores de contas pagas e a pagar devem ser atualizados.

### 4.3. Alertas e Notificações

#### RN-FIN-006: Alerta de Contas Vencidas
- **Descrição**: O sistema deve exibir um alerta com a lista de contas vencidas ao iniciar.
- **Implementação**: A verificação é realizada na função `FormShow` no módulo `Principal_Unit`.
- **Critérios de Aceitação**:
  - O alerta deve ser exibido apenas uma vez por sessão.
  - O alerta deve listar todas as contas vencidas e não pagas, independentemente do mês.
  - O alerta deve exibir o valor total das contas vencidas.

## 5. Requisitos de Gerenciamento de Cheques

### 5.1. Cadastro e Manutenção de Cheques

#### RN-CHEQUE-001: Associação de Cheques a Contas
- **Descrição**: Todo cheque deve estar associado a uma conta do tipo "CHEQUE".
- **Implementação**: A função `BitBtn1Click` no módulo `CadCheque_Dialog` cria uma conta associada ao cheque.
- **Critérios de Aceitação**:
  - Ao cadastrar um cheque, o sistema deve criar automaticamente uma conta do tipo "CHEQUE".
  - A conta deve ter o mesmo valor e data do cheque.
  - A conta deve estar vinculada ao cheque através do campo CODCONTA na tabela CHEQUE.

#### RN-CHEQUE-002: Campos Obrigatórios para Cheques
- **Descrição**: Um cheque deve ter obrigatoriamente: número, banco, valor, moeda, motivo e data.
- **Implementação**: A validação é realizada na função `BitBtn1Click` do módulo `CadCheque_Dialog`.
- **Critérios de Aceitação**:
  - O sistema não deve permitir salvar um cheque sem preencher todos os campos obrigatórios.
  - O sistema deve exibir uma mensagem de erro caso algum campo obrigatório não seja preenchido.
  - Os campos agência e conta são opcionais.

#### RN-CHEQUE-003: Exclusão de Contas do Tipo Cheque
- **Descrição**: Ao excluir uma conta do tipo "CHEQUE", o sistema deve excluir também o registro do cheque associado.
- **Implementação**: A função `ExcluirConta` no módulo `BancoDM_Unit` verifica se a conta é do tipo "CHEQUE" e exclui o registro correspondente.
- **Critérios de Aceitação**:
  - Ao excluir uma conta do tipo "CHEQUE", o sistema deve verificar se existe um registro na tabela CHEQUE associado a essa conta.
  - Se existir, o sistema deve excluir o registro do cheque antes de excluir a conta.

#### RN-CHEQUE-004: Exclusão de Cheques
- **Descrição**: Ao excluir um cheque, o sistema deve excluir também a conta associada.
- **Implementação**: A função `BitBtn3Click` no módulo `CadCheque_Dialog` exclui o cheque e a conta associada.
- **Critérios de Aceitação**:
  - Ao excluir um cheque, o sistema deve identificar a conta associada através do campo CODCONTA.
  - O sistema deve excluir a conta associada ao cheque.
  - O sistema deve solicitar confirmação antes de excluir um cheque.

## 6. Requisitos de Emissão de Relatórios

### 6.1. Tipos de Relatórios

#### RN-REL-001: Relatório de Extrato
- **Descrição**: Relatório de Extrato deve incluir todas as contas do período selecionado.
- **Implementação**: A função `EmitirRelatorio` no módulo `RelatorioFinanceiro_DataModule` gera o relatório com base no tipo selecionado.
- **Critérios de Aceitação**:
  - O relatório deve incluir todas as contas do período selecionado, independentemente do status.
  - As contas devem ser ordenadas por data de vencimento.
  - O relatório deve incluir um totalizador com o valor total das contas listadas.

#### RN-REL-002: Relatório de Contas Abertas
- **Descrição**: Relatório de Contas Abertas deve incluir apenas contas não pagas do período selecionado.
- **Implementação**: A função `EmitirRelatorio` no módulo `RelatorioFinanceiro_DataModule` gera o relatório com base no tipo selecionado.
- **Critérios de Aceitação**:
  - O relatório deve incluir apenas contas com SITUACAO = 0 (não pagas) do período selecionado.
  - As contas devem ser ordenadas por data de vencimento.
  - O relatório deve incluir um totalizador com o valor total das contas listadas.

#### RN-REL-003: Relatório de Contas Atrasadas
- **Descrição**: Relatório de Contas Atrasadas deve incluir apenas contas vencidas e não pagas do período selecionado.
- **Implementação**: A função `EmitirRelatorio` no módulo `RelatorioFinanceiro_DataModule` gera o relatório com base no tipo selecionado.
- **Critérios de Aceitação**:
  - O relatório deve incluir apenas contas com SITUACAO = 0 (não pagas) e data de vencimento anterior à data atual.
  - As contas devem ser ordenadas por data de vencimento.
  - O relatório deve incluir um totalizador com o valor total das contas listadas.

#### RN-REL-004: Relatório de Contas Fechadas
- **Descrição**: Relatório de Contas Fechadas deve incluir apenas contas pagas do período selecionado.
- **Implementação**: A função `EmitirRelatorio` no módulo `RelatorioFinanceiro_DataModule` gera o relatório com base no tipo selecionado.
- **Critérios de Aceitação**:
  - O relatório deve incluir apenas contas com SITUACAO = 1 (pagas) do período selecionado.
  - As contas devem ser ordenadas por data de vencimento.
  - O relatório deve incluir um totalizador com o valor total das contas listadas.

### 6.2. Formatação de Relatórios

#### RN-REL-005: Cabeçalho de Relatórios
- **Descrição**: Todos os relatórios devem incluir um cabeçalho com identificação do usuário e período.
- **Implementação**: A função `Personalizar` no módulo `RelatorioFinanceiro_Form` configura o cabeçalho do relatório.
- **Critérios de Aceitação**:
  - O cabeçalho deve incluir o título do relatório.
  - O cabeçalho deve incluir o nome do usuário logado.
  - O cabeçalho deve incluir o período (mês/ano) do relatório.

#### RN-REL-006: Totalizadores de Relatórios
- **Descrição**: Todos os relatórios devem incluir totalizadores de valores.
- **Implementação**: A função `EmitirRelatorio` no módulo `RelatorioFinanceiro_DataModule` calcula os totalizadores.
- **Critérios de Aceitação**:
  - O relatório deve incluir um totalizador com o valor total das contas listadas.
  - O totalizador deve ser exibido ao final do relatório.
  - O valor deve ser formatado com o símbolo da moeda correspondente.

## 7. Requisitos de Gerenciamento de Dados Pessoais

### 7.1. Visualização de Dados Pessoais

#### RN-DADOS-001: Exibição de Dados Pessoais
- **Descrição**: O sistema deve exibir os dados pessoais do usuário logado.
- **Implementação**: A função `DadosPessoais_TabSheetShow` no módulo `Principal_Unit` carrega os dados pessoais.
- **Critérios de Aceitação**:
  - O sistema deve exibir os dados pessoais do usuário identificado pelo ID obtido no login.
  - Os dados devem incluir: nome completo, data de nascimento, sexo, cargo, salário e dia de pagamento.
  - Os dados devem ser exibidos em modo somente leitura.

#### RN-DADOS-002: Formatação de Telefones
- **Descrição**: O sistema deve formatar corretamente os telefones com DDD entre parênteses.
- **Implementação**: A função `QTelefone_ClientDataSetCalcFields` no módulo `BancoDM_Unit` formata os telefones.
- **Critérios de Aceitação**:
  - Os telefones devem ser exibidos no formato "(DDD) NÚMERO".
  - O campo calculado TELEFONE_STR deve ser utilizado para exibição.

#### RN-DADOS-003: Formatação de Endereços
- **Descrição**: O sistema deve formatar corretamente os endereços com o tipo de logradouro.
- **Implementação**: A função `QEndereco_ClientDataSetCalcFields` no módulo `BancoDM_Unit` formata os endereços.
- **Critérios de Aceitação**:
  - Os endereços devem ser exibidos no formato "TIPO ENDEREÇO, NÚMERO".
  - O campo calculado ENDERECO_STRING deve ser utilizado para exibição.
  - O estado deve ser exibido com a sigla entre parênteses.

### 7.2. Visualização de Endereços e Telefones

#### RN-DADOS-004: Exibição de Endereços
- **Descrição**: O sistema deve exibir os endereços cadastrados para o usuário.
- **Implementação**: A função `AtualizarEndereco` no módulo `BancoDM_Unit` carrega os endereços.
- **Critérios de Aceitação**:
  - O sistema deve exibir todos os endereços associados ao usuário logado.
  - Para cada endereço, devem ser exibidos: tipo de logradouro, endereço, número, bairro, cidade, estado, CEP e país.
  - Os endereços devem ser exibidos em uma grade de dados.

#### RN-DADOS-005: Exibição de Telefones
- **Descrição**: O sistema deve exibir os telefones cadastrados para o usuário.
- **Implementação**: A função `AtualizarTelefone` no módulo `BancoDM_Unit` carrega os telefones.
- **Critérios de Aceitação**:
  - O sistema deve exibir todos os telefones associados ao usuário logado.
  - Para cada telefone, devem ser exibidos: DDD e número.
  - Os telefones devem ser exibidos em uma grade de dados.

## 8. Requisitos de Administração do Sistema

### 8.1. Gerenciamento de Tipos de Conta

#### RN-ADMIN-001: Unicidade de Tipos de Conta
- **Descrição**: O sistema não deve permitir cadastrar tipos de conta com nomes duplicados.
- **Implementação**: A função `ExisteTipoConta` no módulo `BancoDM_Unit` verifica se já existe um tipo de conta com o mesmo nome.
- **Critérios de Aceitação**:
  - Antes de adicionar um novo tipo de conta, o sistema deve verificar se já existe um tipo com o mesmo nome.
  - Se existir, o sistema deve exibir uma mensagem de erro e não permitir o cadastro.
  - A verificação deve ser case-insensitive.

#### RN-ADMIN-002: Campos Obrigatórios para Tipos de Conta
- **Descrição**: Um tipo de conta deve ter obrigatoriamente: nome, descrição e situação.
- **Implementação**: A validação é realizada na função `Adicionar_BitBtnClick` do módulo `NovoTipoConta_Form`.
- **Critérios de Aceitação**:
  - O sistema não deve permitir salvar um tipo de conta sem preencher todos os campos obrigatórios.
  - O sistema deve exibir uma mensagem de erro caso algum campo obrigatório não seja preenchido.

#### RN-ADMIN-003: Situação de Tipos de Conta
- **Descrição**: A situação do tipo de conta deve ser "C" para crédito ou "D" para débito.
- **Implementação**: A validação é realizada na função `Adicionar_BitBtnClick` do módulo `NovoTipoConta_Form`.
- **Critérios de Aceitação**:
  - O sistema deve permitir apenas os valores "C" ou "D" para o campo situação.
  - O valor "C" indica que contas desse tipo são créditos (entradas).
  - O valor "D" indica que contas desse tipo são débitos (saídas).

### 8.2. Controle de Acesso Administrativo

#### RN-ADMIN-004: Acesso a Funcionalidades Administrativas
- **Descrição**: Apenas usuários com perfil de administrador podem acessar as funcionalidades administrativas.
- **Implementação**: A função `SetLabel` no módulo `Principal_Unit` configura a interface com base no tipo de usuário.
- **Critérios de Aceitação**:
  - A aba de Configuração Admin deve ser visível apenas para usuários com perfil de administrador.
  - Usuários comuns não devem ter acesso às funcionalidades administrativas.
  - O sistema deve verificar o tipo de usuário ao carregar a interface.

## 9. Glossário

- **Conta**: Registro de transação financeira (receita ou despesa)
- **TipoConta**: Categoria de conta (água, luz, telefone, etc.)
- **Moeda**: Tipo de moeda utilizada (Real, Dólar, etc.)
- **Crédito**: Entrada de dinheiro (receita)
- **Débito**: Saída de dinheiro (despesa)
- **Saldo Atual**: Diferença entre créditos e débitos pagos
- **Saldo do Mês**: Diferença entre créditos e todos os débitos do mês
- **Débito Restante**: Total de débitos não pagos
- **Conta Aberta**: Conta não paga e dentro do prazo
- **Conta Atrasada**: Conta não paga e vencida
- **Conta Fechada**: Conta já paga