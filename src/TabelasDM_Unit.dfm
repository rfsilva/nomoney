object Tabelas_DataModule: TTabelas_DataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 65532
  Top = 5
  Height = 514
  Width = 883
  object Administrador_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'ADMINISTRADOR'
    Left = 72
    Top = 8
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
    Top = 56
  end
  object Administrador_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Administrador_DataSetProvider'
    Left = 72
    Top = 104
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
    Top = 8
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
    Top = 56
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
    Top = 104
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
    Top = 8
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
    Top = 56
  end
  object Cargo_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Cargo_DataSetProvider'
    Left = 352
    Top = 104
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
    Top = 8
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
    Top = 56
  end
  object Cheque_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Cheque_DataSetProvider'
    Left = 496
    Top = 104
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
    Top = 8
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
    Top = 56
  end
  object Conta_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Conta_DataSetProvider'
    Left = 632
    Top = 104
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
    Top = 8
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
    Top = 56
  end
  object Continente_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Continente_DataSetProvider'
    Left = 776
    Top = 104
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
    Top = 160
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
    Top = 208
  end
  object Endereco_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Endereco_DataSetProvider'
    Left = 72
    Top = 256
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
    Top = 160
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
    Top = 208
  end
  object Estado_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Estado_DataSetProvider'
    Left = 208
    Top = 256
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
    Top = 160
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
    Top = 208
  end
  object Login_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Login_DataSetProvider'
    Left = 352
    Top = 256
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
    Top = 160
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
    Top = 208
  end
  object Moeda_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Moeda_DataSetProvider'
    Left = 632
    Top = 256
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
    Top = 160
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
    Top = 208
  end
  object Pais_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Pais_DataSetProvider'
    Left = 776
    Top = 256
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
    Top = 312
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
    Top = 360
  end
  object Pessoa_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Pessoa_DataSetProvider'
    Left = 72
    Top = 408
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
    Top = 312
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
    Top = 360
  end
  object Telefone_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Telefone_DataSetProvider'
    Left = 216
    Top = 408
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
    Top = 312
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
  end
  object TipoConta_DataSetProvider: TDataSetProvider
    DataSet = TipoConta_SQLTable
    Constraints = True
    Left = 352
    Top = 360
  end
  object TipoConta_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'TipoConta_DataSetProvider'
    Left = 352
    Top = 408
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
  end
  object TipoLocalizacao_SQLTable: TSQLTable
    SQLConnection = Conexao_DataModule.Conexao_SQLConnection
    TableName = 'TIPOLOCALIZACAO'
    Left = 496
    Top = 312
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
    Left = 496
    Top = 360
  end
  object TipoLocalizacao_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'TipoLocalizacao_DataSetProvider'
    Left = 496
    Top = 408
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
    Top = 160
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
    Top = 208
  end
  object Mes_ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Mes_DataSetProvider'
    Left = 496
    Top = 256
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
end
