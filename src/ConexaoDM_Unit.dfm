object Conexao_DataModule: TConexao_DataModule
  OldCreateOrder = False
  Left = 280
  Top = 177
  Height = 118
  Width = 215
  object Conexao_SQLConnection: TSQLConnection
    Connected = True
    ConnectionName = 'FinanceiroInterbase'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoadParamsOnConnect = True
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=FINANCEIRO.GDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited')
    VendorLib = 'gds32.dll'
    Left = 88
    Top = 24
  end
end
