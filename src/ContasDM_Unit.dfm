object Contas_DataModule: TContas_DataModule
  OldCreateOrder = False
  Left = 171
  Top = 165
  Height = 594
  Width = 742
  object ContasMes_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodId'
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
      'AND C.MOEDA = M.CODIGO'
      'AND C.VENCIMENTO >= :DataInicio'
      'AND C.VENCIMENTO <= :DataFim'
      'ORDER BY VENCIMENTO, SITUACAO')
    Left = 88
    Top = 24
    object ContasMes_SQLQueryID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ContasMes_SQLQueryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ContasMes_SQLQueryMOEDA: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object ContasMes_SQLQueryVENCIMENTO: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ContasMes_SQLQueryTIPOCONTA: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object ContasMes_SQLQuerySITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object ContasMes_SQLQueryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object ContasMes_SQLQueryCREDITO: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ContasMes_SQLQueryVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,###.00'
    end
  end
  object ContasMes_DataSetProvider: TDataSetProvider
    DataSet = ContasMes_SQLQuery
    Constraints = True
    Left = 88
    Top = 72
  end
  object ContasMes_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ContasMes_DataSetProvider'
    OnCalcFields = ContasClientDataSetCalcFields
    Left = 64
    Top = 120
    object ContasMes_ClientDataSetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ContasMes_ClientDataSetCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ContasMes_ClientDataSetMOEDA: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object ContasMes_ClientDataSetVENCIMENTO: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ContasMes_ClientDataSetTIPOCONTA: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object ContasMes_ClientDataSetSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object ContasMes_ClientDataSetPAGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAGO'
      Size = 10
      Calculated = True
    end
    object ContasMes_ClientDataSetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object ContasMes_ClientDataSetCREDITO: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ContasMes_ClientDataSetCREDITOSTRING: TStringField
      FieldKind = fkCalculated
      FieldName = 'CREDITOSTRING'
      Calculated = True
    end
    object ContasMes_ClientDataSetVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
  end
  object ContasMes_DataSource: TDataSource
    DataSet = ContasMes_ClientDataSet
    Left = 112
    Top = 120
  end
  object ContasPagas_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodId'
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
      'AND C.MOEDA = M.CODIGO'
      'AND C.VENCIMENTO >= :DataInicio'
      'AND C.VENCIMENTO <= :DataFim'
      'AND C.SITUACAO = 1'
      'AND T.SITUACAO = '#39'D'#39
      'ORDER BY VENCIMENTO, SITUACAO')
    Left = 256
    Top = 24
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField2: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object IntegerField3: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object StringField4: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,###.00'
    end
  end
  object ContasPagas_DataSetProvider: TDataSetProvider
    DataSet = ContasPagas_SQLQuery
    Constraints = True
    Left = 256
    Top = 72
  end
  object ContasPagas_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ContasPagas_DataSetProvider'
    OnCalcFields = ContasClientDataSetCalcFields
    Left = 232
    Top = 120
    object IntegerField4: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object StringField5: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField6: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object IntegerField6: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object StringField7: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAGO'
      Size = 10
      Calculated = True
    end
    object StringField8: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object StringField9: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField10: TStringField
      FieldKind = fkCalculated
      FieldName = 'CREDITOSTRING'
      Calculated = True
    end
    object FloatField2: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
  end
  object ContasPagas_DataSource: TDataSource
    DataSet = ContasPagas_ClientDataSet
    Left = 280
    Top = 120
  end
  object ContasAPagar_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodId'
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
      'AND C.MOEDA = M.CODIGO'
      'AND C.VENCIMENTO >= :DataInicio'
      'AND C.VENCIMENTO <= :DataFim'
      'AND C.SITUACAO = 0'
      'AND T.SITUACAO = '#39'D'#39
      'ORDER BY VENCIMENTO, SITUACAO')
    Left = 424
    Top = 24
    object IntegerField7: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object StringField11: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object SQLTimeStampField3: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField12: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object IntegerField9: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object StringField13: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object StringField14: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FloatField3: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,###.00'
    end
  end
  object ContasAPagar_DataSetProvider: TDataSetProvider
    DataSet = ContasAPagar_SQLQuery
    Constraints = True
    Left = 424
    Top = 72
  end
  object ContasAPagar_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ContasAPagar_DataSetProvider'
    OnCalcFields = ContasClientDataSetCalcFields
    Left = 400
    Top = 120
    object IntegerField10: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField11: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object StringField15: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object SQLTimeStampField4: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField16: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object IntegerField12: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object StringField17: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAGO'
      Size = 10
      Calculated = True
    end
    object StringField18: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object StringField19: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField20: TStringField
      FieldKind = fkCalculated
      FieldName = 'CREDITOSTRING'
      Calculated = True
    end
    object FloatField4: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
  end
  object ContasAPagar_DataSource: TDataSource
    DataSet = ContasAPagar_ClientDataSet
    Left = 448
    Top = 120
  end
  object ContasAtrasadas_SQLQuery: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    Params = <
      item
        DataType = ftInteger
        Name = 'CodId'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DataAtual'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'SELECT C.ID, C.CODIGO, C.VALOR, M.SIGLA MOEDA, C.VENCIMENTO, T.T' +
        'IPO TIPOCONTA, C.SITUACAO, C.DESCRICAO, T.SITUACAO CREDITO'
      'FROM CONTA C, MOEDA M, TIPOCONTA T'
      'WHERE ID = :CodId'
      'AND C.TIPOCONTA = T.CODIGO'
      'AND C.MOEDA = M.CODIGO'
      'AND C.VENCIMENTO <= :DataAtual'
      'AND C.SITUACAO = 0'
      'AND T.SITUACAO = '#39'D'#39
      'ORDER BY VENCIMENTO, SITUACAO')
    Left = 592
    Top = 24
    object IntegerField13: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object StringField21: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object SQLTimeStampField5: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField22: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object IntegerField15: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object StringField23: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object StringField24: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FloatField5: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,###.00'
    end
  end
  object ContasAtrasadas_DataSetProvider: TDataSetProvider
    DataSet = ContasAtrasadas_SQLQuery
    Constraints = True
    Left = 592
    Top = 72
  end
  object ContasAtrasadas_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ContasAtrasadas_DataSetProvider'
    OnCalcFields = ContasClientDataSetCalcFields
    Left = 568
    Top = 120
    object IntegerField16: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object IntegerField17: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object StringField25: TStringField
      FieldName = 'MOEDA'
      Required = True
    end
    object SQLTimeStampField6: TSQLTimeStampField
      FieldName = 'VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField26: TStringField
      DisplayWidth = 119
      FieldName = 'TIPOCONTA'
      Required = True
      Size = 119
    end
    object IntegerField18: TIntegerField
      FieldName = 'SITUACAO'
      Required = True
    end
    object StringField27: TStringField
      FieldKind = fkCalculated
      FieldName = 'PAGO'
      Size = 10
      Calculated = True
    end
    object StringField28: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object StringField29: TStringField
      FieldName = 'CREDITO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object StringField30: TStringField
      FieldKind = fkCalculated
      FieldName = 'CREDITOSTRING'
      Calculated = True
    end
    object FloatField6: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
  end
  object ContasAtrasadas_DataSource: TDataSource
    DataSet = ContasAtrasadas_ClientDataSet
    Left = 616
    Top = 120
  end
end
