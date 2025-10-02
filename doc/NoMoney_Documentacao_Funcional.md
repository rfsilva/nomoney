# Documentação Funcional - Sistema NoMoney 1.0

## 1. Visão Geral do Sistema

O NoMoney 1.0 é um sistema de gerenciamento financeiro pessoal desenvolvido em C++ Builder que permite aos usuários controlar suas finanças pessoais, incluindo receitas, despesas, contas a pagar e receber, além de gerar relatórios financeiros. O sistema foi projetado para auxiliar no controle orçamentário mensal, permitindo o acompanhamento de saldos, alertando sobre contas vencidas e fornecendo uma visão geral da situação financeira do usuário.

## 2. Arquitetura do Sistema

O sistema foi desenvolvido utilizando o padrão de arquitetura em camadas, com separação entre interface do usuário, regras de negócio e acesso a dados:

1. **Interface do Usuário**: Implementada através de formulários Borland C++ Builder (arquivos .dfm e .cpp)
2. **Acesso a Dados**: Implementado através de DataModules que encapsulam a comunicação com o banco de dados
3. **Banco de Dados**: Utiliza um banco de dados relacional (Firebird/InterBase) com extensão .GDB

## 3. Perfis de Usuário

O sistema possui dois perfis de acesso distintos:

1. **Usuário Comum**: Acesso às funcionalidades de gerenciamento financeiro pessoal
2. **Administrador**: Acesso às configurações administrativas do sistema

## 4. Modelo de Dados

### 4.1 Principais Entidades

1. **Pessoa**: Armazena dados pessoais dos usuários
2. **Conta**: Registra as contas a pagar e receber
3. **TipoConta**: Categoriza os tipos de contas (água, luz, telefone, etc.)
4. **Moeda**: Registra os tipos de moedas utilizadas (Real, Dólar, etc.)
5. **Cheque**: Registra informações sobre cheques emitidos
6. **Banco**: Cadastro de instituições bancárias
7. **Endereço**: Armazena endereços dos usuários
8. **Telefone**: Armazena telefones dos usuários
9. **Login**: Armazena credenciais de acesso ao sistema

### 4.2 Relacionamentos Principais

- Uma **Pessoa** pode ter múltiplas **Contas**
- Uma **Conta** está associada a um **TipoConta**
- Uma **Conta** está associada a uma **Moeda**
- Um **Cheque** está associado a um **Banco** e a uma **Pessoa**
- Uma **Pessoa** pode ter múltiplos **Endereços** e **Telefones**

### 4.3 Diagrama de Entidade-Relacionamento Simplificado

```
PESSOA (1) ---- (N) CONTA
PESSOA (1) ---- (N) TELEFONE
PESSOA (1) ---- (N) ENDERECO
PESSOA (1) ---- (N) CHEQUE
CONTA (N) ---- (1) TIPOCONTA
CONTA (N) ---- (1) MOEDA
CHEQUE (N) ---- (1) BANCO
CHEQUE (N) ---- (1) MOEDA
```

## 5. Funcionalidades Principais

### 5.1 Autenticação e Controle de Acesso

- **Login de Usuário**: Permite acesso ao sistema mediante credenciais válidas
- **Níveis de Acesso**: Diferencia entre usuário comum e administrador
- **Persistência de Credenciais**: Opção para salvar credenciais em arquivo .ini

### 5.2 Gerenciamento de Contas

- **Cadastro de Contas**: Permite adicionar novas contas a pagar ou receber
- **Edição de Contas**: Permite modificar informações de contas existentes
- **Exclusão de Contas**: Permite remover contas do sistema
- **Marcação de Pagamento**: Permite marcar contas como pagas ou não pagas
- **Parcelamento**: Suporte a contas parceladas ou recorrentes
- **Categorização**: Organiza contas por tipos (água, luz, telefone, etc.)

### 5.3 Visualização Financeira

- **Visão Mensal**: Exibe contas agrupadas por mês
- **Navegação por Período**: Permite navegar entre meses e anos
- **Saldo Atual**: Calcula o saldo financeiro atual (créditos - débitos pagos)
- **Saldo do Mês**: Calcula o saldo previsto para o mês (créditos - todos os débitos)
- **Indicadores Visuais**: Utiliza cores para diferenciar status das contas:
  - Verde: Contas pagas
  - Amarelo: Contas a vencer
  - Vermelho: Contas vencidas
  - Azul: Créditos

### 5.4 Alertas e Notificações

- **Contas Vencidas**: Alerta sobre contas vencidas e não pagas
- **Resumo de Pendências**: Exibe resumo de contas pendentes ao iniciar o sistema

### 5.5 Relatórios Financeiros

- **Extrato**: Relatório detalhado de movimentações financeiras
- **Contas Abertas**: Relatório de contas a pagar
- **Contas Atrasadas**: Relatório de contas vencidas
- **Contas Fechadas**: Relatório de contas pagas

### 5.6 Gerenciamento de Dados Pessoais

- **Cadastro de Dados Pessoais**: Permite manter informações pessoais do usuário
- **Cadastro de Endereços**: Permite manter endereços do usuário
- **Cadastro de Telefones**: Permite manter telefones do usuário

### 5.7 Funcionalidades Administrativas

- **Gerenciamento de Tipos de Conta**: Permite adicionar novos tipos de conta
- **Configurações do Sistema**: Acesso a configurações avançadas do sistema

## 6. Fluxos Principais

### 6.1 Fluxo de Login

1. O sistema exibe a tela de splash
2. O sistema apresenta a tela de login
3. O usuário informa suas credenciais (login, senha e tipo de acesso)
4. O sistema valida as credenciais
5. Se válidas, o sistema carrega a interface apropriada para o tipo de usuário
6. Se inválidas, o sistema exibe mensagem de erro

### 6.2 Fluxo de Gerenciamento de Contas

1. O usuário acessa a tela principal do sistema
2. O sistema exibe as contas do mês atual
3. O usuário pode:
   - Adicionar nova conta
   - Editar conta existente
   - Excluir conta
   - Marcar conta como paga/não paga
   - Navegar entre meses
   - Selecionar mês específico

### 6.3 Fluxo de Emissão de Relatórios

1. O usuário seleciona a opção de emitir relatório
2. O sistema apresenta as opções de relatório disponíveis
3. O usuário seleciona o tipo de relatório desejado
4. O sistema gera e exibe o relatório

## 7. Regras de Negócio

### 7.1 Cálculo de Saldos

- **Saldo Atual** = Total de Créditos - Total de Débitos Pagos
- **Saldo do Mês** = Total de Créditos - Total de Débitos (pagos e não pagos)
- **Débito Restante** = Total de Débitos Não Pagos

### 7.2 Status de Contas

- **Conta Aberta**: Conta não paga e dentro do prazo de vencimento
- **Conta Atrasada**: Conta não paga e com data de vencimento anterior à data atual
- **Conta Fechada**: Conta já paga

### 7.3 Tipos de Transação

- **Débito (D)**: Representa saída de dinheiro (despesa)
- **Crédito (C)**: Representa entrada de dinheiro (receita)

### 7.4 Controle de Cheques

- Cheques emitidos são registrados com número, banco, agência, conta, valor e motivo
- Cheques são associados a contas do tipo "CHEQUE"

### 7.5 Alertas Automáticos

- O sistema verifica automaticamente contas vencidas e não pagas
- Ao iniciar o sistema, exibe um alerta com a lista de contas vencidas
- O alerta inclui o valor total das contas vencidas

## 8. Interface do Usuário

### 8.1 Telas Principais

1. **Tela de Login**: Autenticação de usuários
2. **Tela Principal**: Visão geral das contas e saldos
3. **Tela de Detalhes de Conta**: Cadastro e edição de contas
4. **Tela de Dados Pessoais**: Gerenciamento de informações pessoais
5. **Tela de Emissão de Relatórios**: Seleção e geração de relatórios
6. **Tela de Cadastro de Cheques**: Registro de cheques emitidos
7. **Tela de Cadastro de Tipos de Conta**: Gerenciamento de categorias de contas

### 8.2 Elementos de Interface

- **Abas**: Organizam as diferentes seções do sistema
- **Grids**: Exibem listas de contas e outras informações tabulares
- **Formulários**: Permitem entrada e edição de dados
- **Botões de Navegação**: Permitem navegar entre períodos (meses/anos)
- **Indicadores Visuais**: Utilizam cores para indicar status das contas

### 8.3 Componentes Principais

- **PageControl**: Organiza as diferentes seções do sistema em abas
- **DBGrid**: Exibe dados tabulares como listas de contas
- **DataSource/DataSet**: Conecta a interface com os dados
- **BitBtn**: Botões para ações principais
- **ComboBox**: Seleção de opções em listas suspensas
- **DateTimePicker**: Seleção de datas

## 9. Integrações

- **Arquivo de Configuração**: Armazena preferências do usuário em arquivo .ini
- **Banco de Dados**: Integração com banco de dados Firebird/InterBase

## 10. Requisitos Não-Funcionais

### 10.1 Segurança

- Autenticação de usuários por login e senha
- Diferentes níveis de acesso (usuário comum e administrador)
- Opção de salvar credenciais localmente

### 10.2 Usabilidade

- Interface intuitiva com indicadores visuais de status
- Navegação simplificada entre períodos financeiros
- Alertas para contas vencidas

### 10.3 Desempenho

- Carregamento otimizado de dados por período
- Consultas SQL parametrizadas para melhor performance

## 11. Limitações Conhecidas

- Interface limitada ao idioma português
- Suporte apenas para plataforma Windows
- Dependência do Borland C++ Builder para manutenção do código
- Armazenamento local de dados (sem suporte a nuvem ou sincronização)

## 12. Considerações para Reescrita

### 12.1 Melhorias Técnicas Sugeridas

- Migração para uma plataforma de desenvolvimento mais moderna
- Implementação de arquitetura mais modular e escalável
- Adoção de padrões de projeto mais atuais
- Implementação de testes automatizados

### 12.2 Melhorias Funcionais Sugeridas

- Suporte a múltiplos idiomas
- Interface responsiva para diferentes dispositivos
- Sincronização com serviços de nuvem
- Implementação de gráficos e dashboards financeiros
- Importação/exportação de dados em formatos padrão (CSV, OFX)
- Integração com serviços bancários online
- Implementação de orçamentos e metas financeiras
- Suporte a múltiplas contas bancárias

### 12.3 Prioridades para Migração

1. Preservar o modelo de dados e regras de negócio existentes
2. Manter a experiência do usuário familiar para usuários atuais
3. Modernizar a interface mantendo a funcionalidade
4. Implementar melhorias incrementais após a migração básica

## 13. Glossário de Termos

- **Conta**: Registro de transação financeira (receita ou despesa)
- **TipoConta**: Categoria de conta (água, luz, telefone, etc.)
- **Moeda**: Tipo de moeda utilizada (Real, Dólar, etc.)
- **Crédito**: Entrada de dinheiro (receita)
- **Débito**: Saída de dinheiro (despesa)
- **Saldo Atual**: Diferença entre créditos e débitos pagos
- **Saldo do Mês**: Diferença entre créditos e todos os débitos do mês
- **Conta Aberta**: Conta não paga e dentro do prazo
- **Conta Atrasada**: Conta não paga e vencida
- **Conta Fechada**: Conta já paga

## 14. Apêndice: Estrutura do Código-Fonte

### 14.1 Arquivos Principais

- **NoMoney.cpp**: Ponto de entrada da aplicação
- **Principal_Unit.cpp/.h/.dfm**: Formulário principal do sistema
- **Login_Unit.cpp/.h/.dfm**: Formulário de login
- **BancoDM_Unit.cpp/.h/.dfm**: DataModule de acesso ao banco de dados
- **ContasDM_Unit.cpp/.h/.dfm**: DataModule de gerenciamento de contas
- **DetalhesConta_Unit.cpp/.h/.dfm**: Formulário de detalhes de conta
- **EmissaoRelatorio_Unit.cpp/.h/.dfm**: Formulário de emissão de relatórios
- **RelatorioFinanceiro_Unit.cpp/.h/.dfm**: Formulário de exibição de relatórios
- **SelecionarMes_Unit.cpp/.h/.dfm**: Formulário de seleção de mês
- **Cheque_Unit.cpp/.h/.dfm**: Formulário de cadastro de cheques
- **NovoTipoConta_Unit.cpp/.h/.dfm**: Formulário de cadastro de tipos de conta

### 14.2 Estrutura do Banco de Dados

Principais tabelas:
- **PESSOA**: Dados pessoais dos usuários
- **CONTA**: Registros de contas a pagar e receber
- **TIPOCONTA**: Categorias de contas
- **MOEDA**: Tipos de moedas
- **CHEQUE**: Registros de cheques emitidos
- **BANCO**: Cadastro de bancos
- **ENDERECO**: Endereços dos usuários
- **TELEFONE**: Telefones dos usuários
- **LOGIN**: Credenciais de acesso
- **ADMINISTRADOR**: Credenciais de administradores

## 15. Conclusão

O sistema NoMoney 1.0 é uma solução completa para gerenciamento financeiro pessoal, oferecendo funcionalidades essenciais para controle de receitas e despesas, acompanhamento de saldos e geração de relatórios. A documentação apresentada serve como base para o entendimento do sistema atual e planejamento da reescrita, garantindo que todas as funcionalidades existentes sejam preservadas e aprimoradas na nova versão.