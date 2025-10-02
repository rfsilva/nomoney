object Banco_DataModule: TBanco_DataModule
  OldCreateOrder = False
  Left = 5
  Top = 6
  Height = 691
  Width = 878
  object QTipoConta_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <>
    SQL.Strings = (
      'SELECT CODIGO, TIPO, SITUACAO'
      'FROM TIPOCONTA'
      'ORDER BY TIPO')
    Left = 640
    Top = 320
    object QTipoConta_SQLQueryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object QTipoConta_SQLQueryTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 16
    end
    object QTipoConta_SQLQuerySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QTipoConta_DataSetProvider: TDataSetProvider
    DataSet = QTipoConta_SQLQuery
    Constraints = True
    Left = 640
    Top = 368
  end
  object QTipoConta_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'QTipoConta_DataSetProvider'
    Left = 616
    Top = 416
    object QTipoConta_ClientDataSetCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object QTipoConta_ClientDataSetTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 16
    end
    object QTipoConta_ClientDataSetSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object QTipoConta_DataSource: TDataSource
    DataSet = QTipoConta_ClientDataSet
    Left = 664
    Top = 416
  end
  object QMoeda_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <>
    SQL.Strings = (
      'SELECT CODIGO, NOME'
      'FROM MOEDA'
      'ORDER BY NOME')
    Left = 776
    Top = 320
    object QMoeda_SQLQueryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object QMoeda_SQLQueryNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
  end
  object QMoeda_DataSetProvider: TDataSetProvider
    DataSet = QMoeda_SQLQuery
    Constraints = True
    Left = 776
    Top = 368
  end
  object QMoeda_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'QMoeda_DataSetProvider'
    Left = 752
    Top = 416
    object QMoeda_ClientDataSetCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object QMoeda_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
  end
  object QMoeda_DataSource: TDataSource
    DataSet = QMoeda_ClientDataSet
    Left = 800
    Top = 416
  end
  object QPessoa_DataSource: TDataSource
    DataSet = QPessoa_ClientDataSet
    Left = 88
    Top = 568
  end
  object QPessoa_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT ID,'
      '               P.PRIMEIRO_NOME,'
      '               P.SOBRENOME,'
      '               P.APELIDO,'
      '               P.NASCIMENTO,'
      '               P.SEXO,'
      '               C.DESCRICAO CARGO,'
      '               P.SALARIO,'
      '               M.SIGLA MOEDA,'
      '               P.DIA_PAGTO,'
      '               P.EMAIL'
      'FROM PESSOA P, MOEDA M, CARGO C'
      'WHERE P.CARGO = C.CODIGO'
      'AND M.CODIGO = P.MOEDA'
      'AND P.ID = :CodID')
    Left = 64
    Top = 472
    object QPessoa_SQLQueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QPessoa_SQLQueryPRIMEIRO_NOME: TStringField
      FieldName = 'PRIMEIRO_NOME'
      Required = True
    end
    object QPessoa_SQLQuerySOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Required = True
      Size = 40
    end
    object QPessoa_SQLQueryAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object QPessoa_SQLQueryNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object QPessoa_SQLQuerySEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      Size = 1
    end
    object QPessoa_SQLQueryCARGO: TStringField
      FieldName = 'CARGO'
      Required = True
      Size = 50
    end
    object QPessoa_SQLQuerySALARIO: TFloatField
      FieldName = 'SALARIO'
      Required = True
    end
    object QPessoa_SQLQueryMOEDA: TStringField
      FieldName = 'MOEDA'
      Required = True
      Size = 5
    end
    object QPessoa_SQLQueryDIA_PAGTO: TIntegerField
      FieldName = 'DIA_PAGTO'
      Required = True
    end
    object QPessoa_SQLQueryEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
  end
  object QPessoa_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'QPessoa_DataSetProvider'
    OnCalcFields = QPessoa_ClientDataSetCalcFields
    Left = 40
    Top = 568
    object QPessoa_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QPessoa_ClientDataSetPRIMEIRO_NOME: TStringField
      FieldName = 'PRIMEIRO_NOME'
      Required = True
    end
    object QPessoa_ClientDataSetSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Required = True
      Size = 40
    end
    object QPessoa_ClientDataSetAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object QPessoa_ClientDataSetNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QPessoa_ClientDataSetSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      Size = 1
    end
    object QPessoa_ClientDataSetCARGO: TStringField
      FieldName = 'CARGO'
      Required = True
      Size = 50
    end
    object QPessoa_ClientDataSetSALARIO: TFloatField
      FieldName = 'SALARIO'
      Required = True
      DisplayFormat = '#,###.00'
    end
    object QPessoa_ClientDataSetMOEDA: TStringField
      FieldName = 'MOEDA'
      Required = True
      Size = 5
    end
    object QPessoa_ClientDataSetDIA_PAGTO: TIntegerField
      FieldName = 'DIA_PAGTO'
      Required = True
    end
    object QPessoa_ClientDataSetEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 60
    end
    object QPessoa_ClientDataSetDIA_STRING: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DIA_STRING'
      Size = 30
      Calculated = True
    end
    object QPessoa_ClientDataSetSEXO_STRING: TStringField
      FieldKind = fkCalculated
      FieldName = 'SEXO_STRING'
      Calculated = True
    end
    object QPessoa_ClientDataSetNOMECOMPLETO: TStringField
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'NOMECOMPLETO'
      Size = 100
      Calculated = True
    end
  end
  object QPessoa_DataSetProvider: TDataSetProvider
    DataSet = QPessoa_SQLQuery
    Constraints = True
    Left = 64
    Top = 520
  end
  object QTelefone_DataSource: TDataSource
    DataSet = QTelefone_ClientDataSet
    Left = 224
    Top = 568
  end
  object QTelefone_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DDD, TELEFONE'
      'FROM TELEFONE'
      'WHERE ID = :CodID'
      'ORDER BY DDD, TELEFONE')
    Left = 200
    Top = 472
    object QTelefone_SQLQueryDDD: TIntegerField
      FieldName = 'DDD'
      Required = True
    end
    object QTelefone_SQLQueryTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
      Size = 9
    end
  end
  object QTelefone_DataSetProvider: TDataSetProvider
    DataSet = QTelefone_SQLQuery
    Constraints = True
    Left = 200
    Top = 520
  end
  object QTelefone_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'QTelefone_DataSetProvider'
    OnCalcFields = QTelefone_ClientDataSetCalcFields
    Left = 176
    Top = 568
    object QTelefone_ClientDataSetDDD: TIntegerField
      FieldName = 'DDD'
      Required = True
    end
    object QTelefone_ClientDataSetTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
      Size = 9
    end
    object QTelefone_ClientDataSetTELEFONE_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'TELEFONE_STR'
      Calculated = True
    end
  end
  object QEndereco_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT E.ID,'
      '               T.NOME TIPO,'
      '               T.SIGLA SIGLATIPO,'
      '               E.ENDERECO,'
      '               E.NUMERO,'
      '               E.BAIRRO,'
      '               E.CIDADE,'
      '               S.NOME ESTADO,'
      '               S.SIGLA SIGLAESTADO,'
      '               E.CEP,'
      '               P.NOME PAIS'
      'FROM ENDERECO E, TIPOLOCALIZACAO T, ESTADO S, PAIS P'
      'WHERE T.CODIGO = E.TIPO'
      'AND S.CODIGO = E.ESTADO'
      'AND P.CODIGO = E.PAIS'
      'AND E.ID = :CodID               ')
    Left = 344
    Top = 472
    object QEndereco_SQLQueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QEndereco_SQLQueryTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
    object QEndereco_SQLQuerySIGLATIPO: TStringField
      FieldName = 'SIGLATIPO'
      Required = True
      Size = 5
    end
    object QEndereco_SQLQueryENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object QEndereco_SQLQueryNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object QEndereco_SQLQueryBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object QEndereco_SQLQueryCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 50
    end
    object QEndereco_SQLQueryESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 30
    end
    object QEndereco_SQLQuerySIGLAESTADO: TStringField
      FieldName = 'SIGLAESTADO'
      Required = True
      Size = 2
    end
    object QEndereco_SQLQueryCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object QEndereco_SQLQueryPAIS: TStringField
      FieldName = 'PAIS'
      Required = True
      Size = 50
    end
  end
  object QEndereco_DataSetProvider: TDataSetProvider
    DataSet = QEndereco_SQLQuery
    Constraints = True
    Left = 344
    Top = 520
  end
  object QEndereco_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'QEndereco_DataSetProvider'
    OnCalcFields = QEndereco_ClientDataSetCalcFields
    Left = 320
    Top = 568
    object QEndereco_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object QEndereco_ClientDataSetTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
    object QEndereco_ClientDataSetSIGLATIPO: TStringField
      FieldName = 'SIGLATIPO'
      Required = True
      Size = 5
    end
    object QEndereco_ClientDataSetENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object QEndereco_ClientDataSetNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object QEndereco_ClientDataSetBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object QEndereco_ClientDataSetCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 50
    end
    object QEndereco_ClientDataSetESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 30
    end
    object QEndereco_ClientDataSetSIGLAESTADO: TStringField
      FieldName = 'SIGLAESTADO'
      Required = True
      Size = 2
    end
    object QEndereco_ClientDataSetCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object QEndereco_ClientDataSetPAIS: TStringField
      FieldName = 'PAIS'
      Required = True
      Size = 50
    end
    object QEndereco_ClientDataSetENDERECO_STRING: TStringField
      DisplayWidth = 70
      FieldKind = fkCalculated
      FieldName = 'ENDERECO_STRING'
      Size = 70
      Calculated = True
    end
    object QEndereco_ClientDataSetESTADO_STRING: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'ESTADO_STRING'
      Size = 50
      Calculated = True
    end
  end
  object QEndereco_DataSource: TDataSource
    DataSet = QEndereco_ClientDataSet
    Left = 368
    Top = 568
  end
  object QBanco_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <>
    SQL.Strings = (
      'SELECT CODIGO, NOME'
      'FROM BANCO'
      'ORDER BY NOME;')
    Left = 488
    Top = 472
    object QBanco_SQLQueryCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object QBanco_SQLQueryNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object QBanco_DataSetProvider: TDataSetProvider
    DataSet = QBanco_SQLQuery
    Constraints = True
    Left = 488
    Top = 520
  end
  object QBanco_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'QBanco_DataSetProvider'
    Left = 464
    Top = 568
    object QBanco_ClientDataSetCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object QBanco_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object QBanco_DataSource: TDataSource
    DataSet = QBanco_ClientDataSet
    Left = 512
    Top = 568
  end
  object ContasDivididas_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodId'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TipoConta'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DataInicio'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DataFim'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT C.ID, C.CODIGO, C.VALOR, M.SIGLA MOEDA, C.VENCIMENTO, T.T' +
        'IPO TIPOCONTA, C.SITUACAO, C.DESCRICAO, T.SITUACAO CREDITO'
      'FROM CONTA C, MOEDA M, TIPOCONTA T'
      'WHERE ID = :CodId'
      'AND C.TIPOCONTA = T.CODIGO'
      'AND C.SITUACAO = :TipoConta'
      'AND C.MOEDA = M.CODIGO'
      'AND C.VENCIMENTO >= :DataInicio'
      'AND C.VENCIMENTO <= :DataFim'
      'ORDER BY VENCIMENTO, SITUACAO')
    Left = 632
    Top = 472
    object ContasDivididas_SQLQueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ContasDivididas_SQLQueryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ContasDivididas_SQLQueryVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
    end
    object ContasDivididas_SQLQueryMOEDA: TStringField
      FieldName = 'MOEDA'
      Required = True
      Size = 5
    end
    object ContasDivididas_SQLQueryVENCIMENTO: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
    end
    object ContasDivididas_SQLQueryTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object ContasDivididas_SQLQuerySITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object ContasDivididas_SQLQueryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object ContasDivididas_SQLQueryCREDITO: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object ContasDivididas_DataSetProvider: TDataSetProvider
    DataSet = ContasDivididas_SQLQuery
    Constraints = True
    Left = 632
    Top = 520
  end
  object ContasDivididas_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ContasDivididas_DataSetProvider'
    OnCalcFields = ContasDivididas_ClientDataSetCalcFields
    Left = 608
    Top = 568
    object ContasDivididas_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ContasDivididas_ClientDataSetCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ContasDivididas_ClientDataSetVALOR: TFloatField
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object ContasDivididas_ClientDataSetMOEDA: TStringField
      FieldName = 'MOEDA'
      Required = True
      Size = 5
    end
    object ContasDivididas_ClientDataSetVENCIMENTO: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ContasDivididas_ClientDataSetSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object ContasDivididas_ClientDataSetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object ContasDivididas_ClientDataSetCREDITO: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ContasDivididas_ClientDataSetCREDITOSTRING: TStringField
      FieldKind = fkCalculated
      FieldName = 'CREDITOSTRING'
      Size = 100
      Calculated = True
    end
    object ContasDivididas_ClientDataSetTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object ContasDivididas_ClientDataSetPAGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAGO'
      Size = 100
      Calculated = True
    end
  end
  object ContasDivididas_DataSource: TDataSource
    DataSet = ContasDivididas_ClientDataSet
    Left = 656
    Top = 568
  end
  object Administrador_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'ADMINISTRADOR'
    Left = 72
    Top = 16
    object Administrador_SQLTableID: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID'
      Required = True
    end
    object Administrador_SQLTableLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 8
    end
    object Administrador_SQLTableSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      Size = 16
    end
    object Administrador_SQLTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object Administrador_DataSetProvider: TDataSetProvider
    DataSet = Administrador_SQLTable
    Constraints = True
    Left = 72
    Top = 64
  end
  object Administrador_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Administrador_DataSetProvider'
    Left = 72
    Top = 112
    object Administrador_ClientDataSetID: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID'
      Required = True
    end
    object Administrador_ClientDataSetLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 8
    end
    object Administrador_ClientDataSetSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      Size = 16
    end
    object Administrador_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object Banco_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'BANCO'
    Left = 208
    Top = 16
    object Banco_SQLTableCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object Banco_SQLTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 60
    end
  end
  object Banco_DataSetProvider: TDataSetProvider
    DataSet = Banco_SQLTable
    Constraints = True
    Left = 208
    Top = 64
  end
  object Banco_ClientDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Banco_DataSetProvider'
    StoreDefs = True
    Left = 208
    Top = 112
    object Banco_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      KeyFields = 'NOME'
      Required = True
      Size = 60
    end
    object Banco_ClientDataSetCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
  end
  object Cargo_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'CARGO'
    Left = 352
    Top = 16
    object Cargo_SQLTableCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object Cargo_SQLTableDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object Cargo_DataSetProvider: TDataSetProvider
    DataSet = Cargo_SQLTable
    Constraints = True
    Left = 352
    Top = 64
  end
  object Cargo_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Cargo_DataSetProvider'
    Left = 352
    Top = 112
    object Cargo_ClientDataSetCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object Cargo_ClientDataSetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object Cheque_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'CHEQUE'
    Left = 496
    Top = 16
    object Cheque_SQLTableID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object Cheque_SQLTableNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object Cheque_SQLTableBANCO: TIntegerField
      FieldName = 'BANCO'
      Required = True
    end
    object Cheque_SQLTableAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object Cheque_SQLTableCONTA: TStringField
      FieldName = 'CONTA'
      Size = 10
    end
    object Cheque_SQLTableCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
      Required = True
    end
  end
  object Cheque_DataSetProvider: TDataSetProvider
    DataSet = Cheque_SQLTable
    Constraints = True
    Left = 496
    Top = 64
  end
  object Cheque_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Cheque_DataSetProvider'
    Left = 496
    Top = 112
    object Cheque_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object Cheque_ClientDataSetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object Cheque_ClientDataSetBANCO: TIntegerField
      FieldName = 'BANCO'
      Required = True
    end
    object Cheque_ClientDataSetAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object Cheque_ClientDataSetCONTA: TStringField
      FieldName = 'CONTA'
      Size = 10
    end
    object Cheque_ClientDataSetCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
      Required = True
    end
  end
  object Conta_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'CONTA'
    Left = 632
    Top = 16
    object Conta_SQLTableID: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID'
      Required = True
    end
    object Conta_SQLTableCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object Conta_SQLTableMOEDA: TIntegerField
      FieldName = 'MOEDA'
      Required = True
    end
    object Conta_SQLTableVENCIMENTO: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object Conta_SQLTableTIPOCONTA: TIntegerField
      FieldName = 'TIPOCONTA'
      Required = True
    end
    object Conta_SQLTableSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object Conta_SQLTableDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object Conta_SQLTableVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#.00'
    end
  end
  object Conta_DataSetProvider: TDataSetProvider
    DataSet = Conta_SQLTable
    Constraints = True
    Left = 632
    Top = 64
  end
  object Conta_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Conta_DataSetProvider'
    Left = 600
    Top = 112
    object Conta_ClientDataSetID: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID'
      Required = True
    end
    object Conta_ClientDataSetCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object Conta_ClientDataSetMOEDA: TIntegerField
      FieldName = 'MOEDA'
      Required = True
    end
    object Conta_ClientDataSetVENCIMENTO: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object Conta_ClientDataSetTIPOCONTA: TIntegerField
      FieldName = 'TIPOCONTA'
      Required = True
    end
    object Conta_ClientDataSetSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object Conta_ClientDataSetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object Conta_ClientDataSetVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#.00'
    end
  end
  object Continente_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'CONTINENTE'
    Left = 776
    Top = 16
    object Continente_SQLTableCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Continente_SQLTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
  end
  object Continente_DataSetProvider: TDataSetProvider
    DataSet = Continente_SQLTable
    Constraints = True
    Left = 776
    Top = 64
  end
  object Continente_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Continente_DataSetProvider'
    Left = 776
    Top = 112
    object Continente_ClientDataSetCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Continente_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
  end
  object Endereco_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'ENDERECO'
    Left = 72
    Top = 168
    object Endereco_SQLTableID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object Endereco_SQLTableTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object Endereco_SQLTableENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object Endereco_SQLTableNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object Endereco_SQLTableBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object Endereco_SQLTableCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 50
    end
    object Endereco_SQLTableESTADO: TIntegerField
      FieldName = 'ESTADO'
      Required = True
    end
    object Endereco_SQLTableCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object Endereco_SQLTablePAIS: TIntegerField
      FieldName = 'PAIS'
      Required = True
    end
  end
  object Endereco_DataSetProvider: TDataSetProvider
    DataSet = Endereco_SQLTable
    Constraints = True
    Left = 72
    Top = 216
  end
  object Endereco_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Endereco_DataSetProvider'
    Left = 72
    Top = 264
    object Endereco_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object Endereco_ClientDataSetTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object Endereco_ClientDataSetENDERECO: TStringField
      FieldName = 'ENDERECO'
      Required = True
      Size = 50
    end
    object Endereco_ClientDataSetNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object Endereco_ClientDataSetBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object Endereco_ClientDataSetCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 50
    end
    object Endereco_ClientDataSetESTADO: TIntegerField
      FieldName = 'ESTADO'
      Required = True
    end
    object Endereco_ClientDataSetCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object Endereco_ClientDataSetPAIS: TIntegerField
      FieldName = 'PAIS'
      Required = True
    end
  end
  object Estado_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'ESTADO'
    Left = 208
    Top = 168
    object Estado_SQLTableCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Estado_SQLTableSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 2
    end
    object Estado_SQLTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 30
    end
  end
  object Estado_DataSetProvider: TDataSetProvider
    DataSet = Estado_SQLTable
    Constraints = True
    Left = 208
    Top = 216
  end
  object Estado_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Estado_DataSetProvider'
    Left = 208
    Top = 264
    object Estado_ClientDataSetCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Estado_ClientDataSetSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 2
    end
    object Estado_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 30
    end
  end
  object Login_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'LOGIN'
    Left = 352
    Top = 168
    object Login_SQLTableLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 8
    end
    object Login_SQLTableSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      Size = 16
    end
    object Login_SQLTableID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object Login_DataSetProvider: TDataSetProvider
    DataSet = Login_SQLTable
    Constraints = True
    Left = 352
    Top = 216
  end
  object Login_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Login_DataSetProvider'
    Left = 352
    Top = 264
    object Login_ClientDataSetLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
      Size = 8
    end
    object Login_ClientDataSetSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      Size = 16
    end
    object Login_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object Moeda_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'MOEDA'
    Left = 632
    Top = 168
    object Moeda_SQLTableCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object Moeda_SQLTableSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 5
    end
    object Moeda_SQLTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object Moeda_SQLTableCONVERSAO: TFloatField
      FieldName = 'CONVERSAO'
    end
  end
  object Moeda_DataSetProvider: TDataSetProvider
    DataSet = Moeda_SQLTable
    Constraints = True
    Left = 632
    Top = 216
  end
  object Moeda_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Moeda_DataSetProvider'
    Left = 632
    Top = 264
    object Moeda_ClientDataSetCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object Moeda_ClientDataSetSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 5
    end
    object Moeda_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object Moeda_ClientDataSetCONVERSAO: TFloatField
      FieldName = 'CONVERSAO'
    end
  end
  object Pais_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'PAIS'
    Left = 776
    Top = 168
    object Pais_SQLTableCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Pais_SQLTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object Pais_SQLTableCONTINENTE: TIntegerField
      FieldName = 'CONTINENTE'
      Required = True
    end
  end
  object Pais_DataSetProvider: TDataSetProvider
    DataSet = Pais_SQLTable
    Constraints = True
    Left = 776
    Top = 216
  end
  object Pais_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Pais_DataSetProvider'
    Left = 776
    Top = 264
    object Pais_ClientDataSetCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object Pais_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object Pais_ClientDataSetCONTINENTE: TIntegerField
      FieldName = 'CONTINENTE'
      Required = True
    end
  end
  object Pessoa_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'PESSOA'
    Left = 72
    Top = 320
    object Pessoa_SQLTableID: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID'
      Required = True
    end
    object Pessoa_SQLTablePRIMEIRO_NOME: TStringField
      FieldName = 'PRIMEIRO_NOME'
      Required = True
    end
    object Pessoa_SQLTableSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Required = True
      Size = 40
    end
    object Pessoa_SQLTableAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object Pessoa_SQLTableNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object Pessoa_SQLTableSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      Size = 1
    end
    object Pessoa_SQLTableCARGO: TIntegerField
      FieldName = 'CARGO'
      Required = True
    end
    object Pessoa_SQLTableSALARIO: TFloatField
      FieldName = 'SALARIO'
      Required = True
    end
    object Pessoa_SQLTableMOEDA: TIntegerField
      FieldName = 'MOEDA'
      Required = True
    end
    object Pessoa_SQLTableDIA_PAGTO: TIntegerField
      FieldName = 'DIA_PAGTO'
      Required = True
    end
  end
  object Pessoa_DataSetProvider: TDataSetProvider
    DataSet = Pessoa_SQLTable
    Constraints = True
    Left = 72
    Top = 368
  end
  object Pessoa_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Pessoa_DataSetProvider'
    Left = 72
    Top = 416
    object Pessoa_ClientDataSetID: TIntegerField
      DefaultExpression = '0'
      FieldName = 'ID'
      Required = True
    end
    object Pessoa_ClientDataSetPRIMEIRO_NOME: TStringField
      FieldName = 'PRIMEIRO_NOME'
      Required = True
    end
    object Pessoa_ClientDataSetSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Required = True
      Size = 40
    end
    object Pessoa_ClientDataSetAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object Pessoa_ClientDataSetNASCIMENTO: TSQLTimeStampField
      FieldName = 'NASCIMENTO'
    end
    object Pessoa_ClientDataSetSEXO: TStringField
      FieldName = 'SEXO'
      Required = True
      Size = 1
    end
    object Pessoa_ClientDataSetCARGO: TIntegerField
      FieldName = 'CARGO'
      Required = True
    end
    object Pessoa_ClientDataSetSALARIO: TFloatField
      FieldName = 'SALARIO'
      Required = True
    end
    object Pessoa_ClientDataSetMOEDA: TIntegerField
      FieldName = 'MOEDA'
      Required = True
    end
    object Pessoa_ClientDataSetDIA_PAGTO: TIntegerField
      FieldName = 'DIA_PAGTO'
      Required = True
    end
  end
  object Telefone_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'TELEFONE'
    Left = 216
    Top = 320
    object Telefone_SQLTableID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object Telefone_SQLTableDDD: TIntegerField
      FieldName = 'DDD'
      Required = True
    end
    object Telefone_SQLTableTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
      Size = 9
    end
  end
  object Telefone_DataSetProvider: TDataSetProvider
    DataSet = Telefone_SQLTable
    Constraints = True
    Left = 216
    Top = 368
  end
  object Telefone_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Telefone_DataSetProvider'
    Left = 216
    Top = 416
    object Telefone_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object Telefone_ClientDataSetDDD: TIntegerField
      FieldName = 'DDD'
      Required = True
    end
    object Telefone_ClientDataSetTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Required = True
      Size = 9
    end
  end
  object TipoConta_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'TIPOCONTA'
    Left = 352
    Top = 320
    object TipoConta_SQLTableCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object TipoConta_SQLTableTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 16
    end
    object TipoConta_SQLTableDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TipoConta_SQLTableSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TipoConta_SQLTableCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Required = True
    end
  end
  object TipoConta_DataSetProvider: TDataSetProvider
    DataSet = TipoConta_SQLTable
    Constraints = True
    Left = 352
    Top = 368
  end
  object TipoConta_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'TipoConta_DataSetProvider'
    Left = 352
    Top = 416
    object TipoConta_ClientDataSetCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object TipoConta_ClientDataSetTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 16
    end
    object TipoConta_ClientDataSetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object TipoConta_ClientDataSetSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TipoConta_ClientDataSetCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
      Required = True
    end
  end
  object TipoLocalizacao_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'TIPOLOCALIZACAO'
    Left = 784
    Top = 472
    object TipoLocalizacao_SQLTableCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object TipoLocalizacao_SQLTableNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object TipoLocalizacao_SQLTableSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 5
    end
  end
  object TipoLocalizacao_DataSetProvider: TDataSetProvider
    DataSet = TipoLocalizacao_SQLTable
    Constraints = True
    Left = 784
    Top = 520
  end
  object TipoLocalizacao_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'TipoLocalizacao_DataSetProvider'
    Left = 784
    Top = 568
    object TipoLocalizacao_ClientDataSetCODIGO: TIntegerField
      DefaultExpression = '0'
      FieldName = 'CODIGO'
      Required = True
    end
    object TipoLocalizacao_ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Required = True
    end
    object TipoLocalizacao_ClientDataSetSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 5
    end
  end
  object Mes_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'MES'
    Left = 496
    Top = 168
    object Mes_SQLTableMES: TIntegerField
      FieldName = 'MES'
      Required = True
    end
    object Mes_SQLTableANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object Mes_SQLTableUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Required = True
    end
    object Mes_SQLTableSALDO: TFloatField
      FieldName = 'SALDO'
      Required = True
    end
    object Mes_SQLTableTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
  end
  object Mes_DataSetProvider: TDataSetProvider
    DataSet = Mes_SQLTable
    Constraints = True
    Left = 496
    Top = 216
  end
  object Mes_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Mes_DataSetProvider'
    Left = 496
    Top = 264
    object Mes_ClientDataSetMES: TIntegerField
      FieldName = 'MES'
      Required = True
    end
    object Mes_ClientDataSetANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object Mes_ClientDataSetUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Required = True
    end
    object Mes_ClientDataSetSALDO: TFloatField
      FieldName = 'SALDO'
      Required = True
    end
    object Mes_ClientDataSetTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 1
    end
  end
  object Conta_DataSource: TDataSource
    DataSet = Conta_ClientDataSet
    Left = 656
    Top = 112
  end
end
