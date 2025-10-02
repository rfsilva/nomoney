# Jornadas de Negócio - Sistema NoMoney 1.0

Este documento mapeia as principais jornadas de negócio do sistema NoMoney 1.0, detalhando os fluxos de interação do usuário, objetivos de negócio, regras aplicadas e pontos de atenção para cada jornada. Este mapeamento servirá como base para a extração de requisitos funcionais e regras de negócio para a reescrita do sistema.

## Índice de Jornadas

1. [Jornada de Onboarding e Acesso](#1-jornada-de-onboarding-e-acesso)
2. [Jornada de Visualização da Situação Financeira](#2-jornada-de-visualização-da-situação-financeira)
3. [Jornada de Gerenciamento de Contas](#3-jornada-de-gerenciamento-de-contas)
4. [Jornada de Gerenciamento de Cheques](#4-jornada-de-gerenciamento-de-cheques)
5. [Jornada de Análise Financeira](#5-jornada-de-análise-financeira)
6. [Jornada de Emissão de Relatórios](#6-jornada-de-emissão-de-relatórios)
7. [Jornada de Gerenciamento de Dados Pessoais](#7-jornada-de-gerenciamento-de-dados-pessoais)
8. [Jornada de Administração do Sistema](#8-jornada-de-administração-do-sistema)

---

## 1. Jornada de Onboarding e Acesso

### Objetivo de Negócio
Permitir que o usuário acesse o sistema de forma segura, identificando seu perfil e garantindo acesso apenas às funcionalidades pertinentes ao seu nível de permissão.

### Atores
- Usuário Comum
- Administrador
- Sistema

### Fluxo Principal
1. **Inicialização do Sistema**
   - O sistema exibe uma tela de splash durante o carregamento
   - O sistema verifica a existência do arquivo de configuração (NoMoney.ini)

2. **Autenticação**
   - O sistema apresenta a tela de login
   - O usuário informa suas credenciais (login, senha)
   - O usuário seleciona o tipo de acesso (Usuário Comum ou Administrador)
   - O usuário pode optar por salvar suas credenciais para acessos futuros
   - O sistema valida as credenciais no banco de dados

3. **Acesso ao Sistema**
   - Se as credenciais forem válidas, o sistema carrega a interface apropriada para o tipo de usuário
   - Se as credenciais forem inválidas, o sistema exibe mensagem de erro
   - Para usuários comuns, o sistema carrega a tela de situação financeira
   - Para administradores, o sistema carrega a tela de configurações administrativas

4. **Recuperação de Sessão**
   - Se houver credenciais salvas, o sistema preenche automaticamente os campos de login
   - Se a opção de lembrar senha estiver ativada, o sistema também preenche o campo de senha

### Regras de Negócio
- **RN001**: O sistema deve validar as credenciais do usuário na tabela LOGIN para usuários comuns
- **RN002**: O sistema deve validar as credenciais do administrador na tabela ADMINISTRADOR
- **RN003**: As senhas são armazenadas em texto plano no banco de dados
- **RN004**: O sistema deve armazenar as preferências de login no arquivo NoMoney.ini quando solicitado
- **RN005**: O sistema deve carregar interfaces diferentes baseadas no tipo de usuário (comum ou administrador)

### Pontos de Atenção
- As senhas são armazenadas sem criptografia, representando um risco de segurança
- O arquivo NoMoney.ini armazena credenciais localmente, o que pode representar um risco de segurança
- Não há mecanismo de recuperação de senha implementado

### Telas Relacionadas
- Splash_Form
- Login_Dialog

---

## 2. Jornada de Visualização da Situação Financeira

### Objetivo de Negócio
Fornecer ao usuário uma visão clara e imediata da sua situação financeira atual, incluindo saldos, contas a pagar e receber, e alertas sobre contas vencidas.

### Atores
- Usuário Comum
- Sistema

### Fluxo Principal
1. **Carregamento da Visão Mensal**
   - O sistema carrega automaticamente as contas do mês atual
   - O sistema exibe o nome do mês e ano atual no cabeçalho
   - O sistema calcula e exibe os saldos financeiros

2. **Visualização de Indicadores Financeiros**
   - O sistema exibe o total de créditos do mês
   - O sistema exibe o total de débitos do mês
   - O sistema exibe o saldo atual (créditos - débitos pagos)
   - O sistema exibe o débito restante (débitos não pagos)
   - O sistema exibe o saldo do mês (créditos - todos os débitos)
   - O sistema exibe o total de contas pagas e a pagar

3. **Visualização de Contas**
   - O sistema exibe uma lista de todas as contas do mês selecionado
   - O sistema utiliza cores diferentes para indicar o status das contas:
     - Verde: Contas pagas
     - Amarelo: Contas a vencer
     - Vermelho: Contas vencidas
     - Azul: Créditos

4. **Alerta de Contas Vencidas**
   - Ao iniciar o sistema, se houver contas vencidas e não pagas, o sistema exibe um alerta
   - O alerta contém a lista de contas vencidas com suas datas, descrições e valores
   - O alerta exibe o valor total das contas vencidas

5. **Navegação entre Períodos**
   - O usuário pode navegar para o mês anterior
   - O usuário pode navegar para o mês seguinte
   - O usuário pode selecionar um mês específico

### Regras de Negócio
- **RN006**: O sistema deve calcular o saldo atual como: Total de Créditos - Total de Débitos Pagos
- **RN007**: O sistema deve calcular o saldo do mês como: Total de Créditos - Total de Débitos (pagos e não pagos)
- **RN008**: O sistema deve calcular o débito restante como: Total de Débitos Não Pagos
- **RN009**: O sistema deve considerar uma conta como vencida quando sua data de vencimento for anterior à data atual
- **RN010**: O sistema deve exibir o saldo em vermelho quando for negativo e em azul quando for positivo
- **RN011**: O sistema deve exibir o alerta de contas vencidas apenas uma vez por sessão

### Pontos de Atenção
- A visualização é limitada a um mês por vez
- Não há visualização gráfica dos dados financeiros
- O alerta de contas vencidas é exibido apenas no início da sessão

### Telas Relacionadas
- Principal_Form (aba Situação)
- SelecionarMes_Dialog

---

## 3. Jornada de Gerenciamento de Contas

### Objetivo de Negócio
Permitir que o usuário gerencie suas contas a pagar e receber, incluindo adição, edição, exclusão e marcação de pagamento.

### Atores
- Usuário Comum
- Sistema

### Fluxo Principal
1. **Adição de Nova Conta**
   - O usuário seleciona a opção de adicionar nova conta
   - O sistema exibe o formulário de detalhes da conta
   - O usuário preenche os dados da conta:
     - Tipo de conta (água, luz, telefone, etc.)
     - Valor
     - Moeda
     - Data de vencimento
     - Descrição (opcional)
     - Tipo de transação (crédito ou débito)
   - O usuário confirma a adição da conta
   - O sistema registra a conta no banco de dados
   - O sistema atualiza a visualização da situação financeira

2. **Edição de Conta Existente**
   - O usuário seleciona uma conta na lista
   - O usuário seleciona a opção de editar conta
   - O sistema exibe o formulário de detalhes da conta preenchido com os dados atuais
   - O usuário modifica os dados desejados
   - O usuário confirma as alterações
   - O sistema atualiza os dados da conta no banco de dados
   - O sistema atualiza a visualização da situação financeira

3. **Exclusão de Conta**
   - O usuário seleciona uma conta na lista
   - O usuário seleciona a opção de excluir conta
   - O sistema solicita confirmação da exclusão
   - Se confirmado, o sistema exclui a conta do banco de dados
   - O sistema atualiza a visualização da situação financeira

4. **Marcação de Pagamento**
   - O usuário clica duas vezes em uma conta na lista
   - Se a conta estiver aberta (não paga), o sistema pergunta se deseja fechá-la (marcar como paga)
   - Se a conta estiver fechada (paga), o sistema pergunta se deseja reabri-la (marcar como não paga)
   - O sistema atualiza o status da conta no banco de dados
   - O sistema atualiza a visualização da situação financeira

5. **Parcelamento de Conta**
   - Durante a adição ou edição de uma conta, o usuário pode optar por parcelar a conta
   - O usuário seleciona a opção "Estender até o fim do ano"
   - O sistema cria automaticamente contas idênticas para os meses restantes do ano atual
   - O sistema registra todas as parcelas no banco de dados

### Regras de Negócio
- **RN012**: Uma conta deve ter obrigatoriamente: tipo, valor, moeda, vencimento e situação (paga ou não paga)
- **RN013**: O sistema deve permitir a exclusão de contas, removendo também registros relacionados (como cheques)
- **RN014**: Ao marcar uma conta como paga, o sistema deve atualizar seu status para 1 (fechada)
- **RN015**: Ao marcar uma conta como não paga, o sistema deve atualizar seu status para 0 (aberta)
- **RN016**: O parcelamento de contas deve criar registros individuais para cada parcela
- **RN017**: Contas do tipo "CHEQUE" devem ter um registro correspondente na tabela CHEQUE

### Pontos de Atenção
- Não há validação de valores negativos para contas
- O parcelamento é limitado ao ano corrente
- Não há suporte para recorrência de contas além do parcelamento manual

### Telas Relacionadas
- Principal_Form (aba Situação)
- DetalhesConta_Dialog

---

## 4. Jornada de Gerenciamento de Cheques

### Objetivo de Negócio
Permitir que o usuário registre e gerencie cheques emitidos, associando-os a contas financeiras.

### Atores
- Usuário Comum
- Sistema

### Fluxo Principal
1. **Registro de Novo Cheque**
   - O usuário acessa a funcionalidade de cadastro de cheques
   - O sistema exibe o formulário de cadastro de cheques
   - O usuário preenche os dados do cheque:
     - Número do cheque
     - Banco
     - Agência
     - Conta
     - Valor
     - Moeda
     - Motivo
     - Data
   - O usuário confirma o cadastro do cheque
   - O sistema registra o cheque no banco de dados
   - O sistema cria automaticamente uma conta do tipo "CHEQUE" associada ao cheque

2. **Edição de Cheque**
   - O usuário seleciona um cheque na lista
   - O usuário seleciona a opção de editar cheque
   - O sistema exibe o formulário de cadastro de cheques preenchido com os dados atuais
   - O usuário modifica os dados desejados
   - O usuário confirma as alterações
   - O sistema atualiza os dados do cheque no banco de dados
   - O sistema atualiza os dados da conta associada

3. **Exclusão de Cheque**
   - O usuário seleciona um cheque na lista
   - O usuário seleciona a opção de excluir cheque
   - O sistema solicita confirmação da exclusão
   - Se confirmado, o sistema exclui o cheque do banco de dados
   - O sistema exclui a conta associada ao cheque

### Regras de Negócio
- **RN018**: Todo cheque deve estar associado a uma conta do tipo "CHEQUE"
- **RN019**: Um cheque deve ter obrigatoriamente: número, banco, valor, moeda, motivo e data
- **RN020**: Ao excluir uma conta do tipo "CHEQUE", o sistema deve excluir também o registro do cheque associado
- **RN021**: Ao excluir um cheque, o sistema deve excluir também a conta associada

### Pontos de Atenção
- Não há validação de números de cheque duplicados
- Não há controle de talões de cheques
- Não há integração com sistemas bancários para verificação de cheques

### Telas Relacionadas
- CadCheque_Dialog

---

## 5. Jornada de Análise Financeira

### Objetivo de Negócio
Permitir que o usuário analise sua situação financeira, identificando padrões de gastos, receitas e saldos ao longo do tempo.

### Atores
- Usuário Comum
- Sistema

### Fluxo Principal
1. **Análise de Saldos**
   - O sistema calcula e exibe os saldos financeiros do período selecionado
   - O usuário visualiza o saldo atual (créditos - débitos pagos)
   - O usuário visualiza o saldo do mês (créditos - todos os débitos)
   - O usuário visualiza o débito restante (débitos não pagos)

2. **Análise de Contas por Status**
   - O sistema exibe o total de contas pagas
   - O sistema exibe o total de contas a pagar
   - O sistema exibe o total geral de contas

3. **Análise de Contas Vencidas**
   - O sistema identifica contas vencidas e não pagas
   - O sistema exibe um alerta com a lista de contas vencidas
   - O sistema calcula e exibe o valor total das contas vencidas

4. **Navegação Temporal**
   - O usuário navega entre diferentes períodos (meses)
   - O sistema recalcula e atualiza todos os indicadores financeiros para o período selecionado

### Regras de Negócio
- **RN022**: O sistema deve recalcular todos os indicadores financeiros ao mudar de período
- **RN023**: O sistema deve considerar apenas as contas do período selecionado para os cálculos
- **RN024**: O sistema deve destacar visualmente contas vencidas, a vencer, pagas e créditos

### Pontos de Atenção
- Não há análise comparativa entre períodos
- Não há visualização gráfica dos dados financeiros
- Não há categorização avançada de despesas para análise

### Telas Relacionadas
- Principal_Form (aba Situação)

---

## 6. Jornada de Emissão de Relatórios

### Objetivo de Negócio
Permitir que o usuário gere relatórios financeiros para análise, impressão e arquivamento.

### Atores
- Usuário Comum
- Sistema

### Fluxo Principal
1. **Seleção de Tipo de Relatório**
   - O usuário acessa a funcionalidade de emissão de relatórios
   - O sistema exibe as opções de relatório disponíveis:
     - Extrato (todas as contas)
     - Contas Abertas (não pagas)
     - Contas Atrasadas (vencidas e não pagas)
     - Contas Fechadas (pagas)
   - O usuário seleciona o tipo de relatório desejado

2. **Configuração do Relatório**
   - O sistema exibe opções de configuração específicas para o tipo de relatório selecionado
   - O usuário pode selecionar o período do relatório (mês/ano)
   - O usuário confirma a emissão do relatório

3. **Visualização do Relatório**
   - O sistema gera o relatório com base nos parâmetros selecionados
   - O sistema exibe o relatório na tela
   - O relatório inclui:
     - Cabeçalho com identificação do usuário e período
     - Lista de contas conforme o tipo de relatório
     - Totalizadores (valor total das contas listadas)

4. **Impressão do Relatório**
   - O usuário pode imprimir o relatório visualizado
   - O sistema envia o relatório para a impressora padrão

### Regras de Negócio
- **RN025**: Relatório de Extrato deve incluir todas as contas do período selecionado
- **RN026**: Relatório de Contas Abertas deve incluir apenas contas não pagas do período selecionado
- **RN027**: Relatório de Contas Atrasadas deve incluir apenas contas vencidas e não pagas do período selecionado
- **RN028**: Relatório de Contas Fechadas deve incluir apenas contas pagas do período selecionado
- **RN029**: Todos os relatórios devem incluir totalizadores de valores

### Pontos de Atenção
- Não há opção de exportação dos relatórios para formatos como PDF ou Excel
- Não há personalização avançada dos relatórios
- Não há relatórios comparativos entre períodos

### Telas Relacionadas
- EmissaoRelatorio_Dialog
- RelatorioFinanceiro_Form

---

## 7. Jornada de Gerenciamento de Dados Pessoais

### Objetivo de Negócio
Permitir que o usuário mantenha seus dados pessoais atualizados no sistema, incluindo informações de contato e endereço.

### Atores
- Usuário Comum
- Sistema

### Fluxo Principal
1. **Visualização de Dados Pessoais**
   - O usuário acessa a aba de dados pessoais
   - O sistema exibe os dados pessoais atuais do usuário:
     - Nome completo
     - Data de nascimento
     - Sexo
     - Cargo
     - Salário
     - Dia de pagamento

2. **Visualização de Endereços**
   - O sistema exibe os endereços cadastrados para o usuário
   - Para cada endereço, são exibidos:
     - Tipo de logradouro
     - Endereço
     - Número
     - Bairro
     - Cidade
     - Estado
     - CEP
     - País

3. **Visualização de Telefones**
   - O sistema exibe os telefones cadastrados para o usuário
   - Para cada telefone, são exibidos:
     - DDD
     - Número

### Regras de Negócio
- **RN030**: O sistema deve exibir os dados pessoais do usuário logado
- **RN031**: O sistema deve formatar corretamente os telefones com DDD entre parênteses
- **RN032**: O sistema deve formatar corretamente os endereços com o tipo de logradouro

### Pontos de Atenção
- A funcionalidade é apenas de visualização, não permitindo edição dos dados
- Não há validação de dados como CEP ou formato de telefone
- Não há suporte para múltiplos endereços com identificação de tipo (residencial, comercial, etc.)

### Telas Relacionadas
- Principal_Form (aba Dados Pessoais)

---

## 8. Jornada de Administração do Sistema

### Objetivo de Negócio
Permitir que administradores gerenciem configurações do sistema, incluindo cadastros básicos e parâmetros de funcionamento.

### Atores
- Administrador
- Sistema

### Fluxo Principal
1. **Gerenciamento de Tipos de Conta**
   - O administrador acessa a funcionalidade de cadastro de tipos de conta
   - O sistema exibe o formulário de cadastro de tipos de conta
   - O administrador preenche os dados do novo tipo de conta:
     - Nome
     - Descrição
     - Situação (C para crédito, D para débito)
   - O administrador confirma o cadastro do tipo de conta
   - O sistema verifica se já existe um tipo de conta com o mesmo nome
   - Se não existir, o sistema registra o novo tipo de conta no banco de dados

2. **Acesso às Configurações Administrativas**
   - O administrador acessa a aba de configurações administrativas
   - O sistema exibe as opções de configuração disponíveis

### Regras de Negócio
- **RN033**: O sistema não deve permitir cadastrar tipos de conta com nomes duplicados
- **RN034**: Um tipo de conta deve ter obrigatoriamente: nome, descrição e situação
- **RN035**: A situação do tipo de conta deve ser "C" para crédito ou "D" para débito
- **RN036**: Apenas usuários com perfil de administrador podem acessar as funcionalidades administrativas

### Pontos de Atenção
- Não há funcionalidade para edição ou exclusão de tipos de conta existentes
- Não há gerenciamento de outros cadastros básicos como moedas ou bancos
- Não há log de atividades administrativas

### Telas Relacionadas
- Principal_Form (aba Configuração Admin)
- NovoTipoConta_Form

---

## Mapa de Dependências entre Jornadas

```
[1. Onboarding e Acesso] --> [2. Visualização da Situação Financeira]
                          --> [8. Administração do Sistema]

[2. Visualização da Situação Financeira] --> [3. Gerenciamento de Contas]
                                          --> [5. Análise Financeira]
                                          --> [6. Emissão de Relatórios]
                                          --> [7. Gerenciamento de Dados Pessoais]

[3. Gerenciamento de Contas] --> [4. Gerenciamento de Cheques]
```

## Conclusão

As jornadas de negócio mapeadas neste documento representam os principais fluxos de interação do usuário com o sistema NoMoney 1.0. Cada jornada foi detalhada com seus objetivos, fluxos, regras de negócio e pontos de atenção, fornecendo uma base sólida para a extração de requisitos funcionais e regras de negócio para a reescrita do sistema.

A análise das jornadas revela oportunidades de melhoria em várias áreas, como segurança (armazenamento de senhas), usabilidade (visualização gráfica de dados financeiros), funcionalidades (exportação de relatórios) e arquitetura (modularização e escalabilidade).

Este mapeamento servirá como guia para garantir que todas as funcionalidades existentes sejam preservadas na reescrita, além de identificar pontos onde melhorias podem ser implementadas para atender às necessidades atuais dos usuários.