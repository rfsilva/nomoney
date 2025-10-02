object NovoTipoConta_Form: TNovoTipoConta_Form
  Left = 343
  Top = 236
  Width = 321
  Height = 146
  Caption = 'Adicionar Tipo de Conta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 9
    Top = 8
    Width = 295
    Height = 94
    TabOrder = 0
    object TipoConta_Label: TLabel
      Left = 9
      Top = 16
      Width = 70
      Height = 13
      Caption = 'Tipo de Conta:'
    end
    object Label1: TLabel
      Left = 184
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Situa'#231#227'o:'
    end
    object NovoTipoConta_Edit: TEdit
      Left = 9
      Top = 32
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object Situacao_ComboBox: TComboBox
      Left = 184
      Top = 32
      Width = 102
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'CR'#201'DITO'
        'D'#201'BITO')
    end
    object Adicionar_BitBtn: TBitBtn
      Left = 96
      Top = 60
      Width = 91
      Height = 25
      Caption = 'Adicionar'
      Default = True
      TabOrder = 2
      OnClick = Adicionar_BitBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Fechar_BitBtn: TBitBtn
      Left = 194
      Top = 60
      Width = 91
      Height = 25
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = Fechar_BitBtnClick
      Kind = bkClose
    end
  end
end
