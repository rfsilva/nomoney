object EmissaoRelatorio_Dialog: TEmissaoRelatorio_Dialog
  Left = 310
  Top = 204
  Width = 316
  Height = 209
  Caption = 'Emiss'#227'o de Relat'#243'rios'
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
  object Mes: TLabel
    Left = 8
    Top = 144
    Width = 23
    Height = 13
    Caption = 'M'#234's:'
  end
  object Mes_Label: TLabel
    Left = 37
    Top = 144
    Width = 24
    Height = 13
    Caption = 'Mes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Cancelar_BitBtn: TBitBtn
    Left = 220
    Top = 138
    Width = 76
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = Cancelar_BitBtnClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Emitir_BitBtn: TBitBtn
    Left = 138
    Top = 138
    Width = 76
    Height = 25
    Caption = 'Emitir'
    TabOrder = 1
    OnClick = Emitir_BitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object Relatorio_RadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 289
    Height = 121
    Caption = ' Selecione o tipo de relat'#243'rio a ser emitido '
    TabOrder = 2
  end
  object Extrato_RadioButton: TRadioButton
    Left = 17
    Top = 101
    Width = 200
    Height = 17
    Caption = 'Extrato Completo (Todas as Contas)'
    TabOrder = 3
    OnClick = Extrato_RadioButtonClick
    OnDblClick = Extrato_RadioButtonDblClick
  end
  object EntradasAbertas_RadioButton: TRadioButton
    Left = 17
    Top = 29
    Width = 200
    Height = 17
    Caption = 'Relat'#243'rio de Contas A Pagar'
    TabOrder = 4
    OnClick = EntradasAbertas_RadioButtonClick
    OnDblClick = EntradasAbertas_RadioButtonDblClick
  end
  object EntradasFechadas_RadioButton: TRadioButton
    Left = 17
    Top = 53
    Width = 200
    Height = 17
    Caption = 'Relat'#243'rio de Contas Pagas'
    TabOrder = 5
    OnClick = EntradasFechadas_RadioButtonClick
    OnDblClick = EntradasFechadas_RadioButtonDblClick
  end
  object EntradasAtrasadas_RadioButton: TRadioButton
    Left = 17
    Top = 77
    Width = 200
    Height = 17
    Caption = 'Relat'#243'rio de Contas Atrasadas'
    TabOrder = 6
    OnClick = EntradasAtrasadas_RadioButtonClick
    OnDblClick = EntradasAtrasadas_RadioButtonDblClick
  end
end
