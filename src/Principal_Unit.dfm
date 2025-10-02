object Principal_Form: TPrincipal_Form
  Left = 65
  Top = 87
  Width = 895
  Height = 646
  Caption = 'NoMoney 1.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Geral_PageControl: TPageControl
    Left = 8
    Top = 8
    Width = 865
    Height = 553
    ActivePage = Situacao_TabSheet
    TabIndex = 0
    TabOrder = 0
    Visible = False
    object Situacao_TabSheet: TTabSheet
      Caption = 'Situa'#231#227'o'
      object GroupBox1: TGroupBox
        Left = 7
        Top = 5
        Width = 843
        Height = 514
        TabOrder = 0
        object Mes_Label: TLabel
          Left = 36
          Top = 10
          Width = 62
          Height = 13
          Caption = 'Mes_Label'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 10
          Width = 26
          Height = 13
          Caption = 'M'#234's: '
        end
        object BitBtn1: TBitBtn
          Left = 523
          Top = 477
          Width = 100
          Height = 25
          Caption = 'M'#234's Anterior'
          TabOrder = 0
          OnClick = BitBtn1Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFF00FFFFFFFFFFFFF0C0FFFFF
            FFFFFFF0CC00000000FFFF0CCCCCCCCCC0FFF0CCCCCCCCCCC0FFF0CCCCCCCCCC
            C0FFFF0CCCCCCCCCC0FFFFF0CC00000000FFFFFF0C0FFFFFFFFFFFFFF00FFFFF
            FFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object BitBtn2: TBitBtn
          Left = 731
          Top = 477
          Width = 100
          Height = 25
          Caption = 'Pr'#243'ximo M'#234's'
          TabOrder = 1
          OnClick = BitBtn2Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF00FFFFFFFFFFFFFF0C0
            FFFFFF00000000CC0FFFFF0CCCCCCCCCC0FFFF0CCCCCCCCCCC0FFF0CCCCCCCCC
            CC0FFF0CCCCCCCCCC0FFFF00000000CC0FFFFFFFFFFFF0C0FFFFFFFFFFFFF00F
            FFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object BitBtn3: TBitBtn
          Left = 627
          Top = 477
          Width = 100
          Height = 25
          Caption = 'Selecionar M'#234's'
          TabOrder = 2
          OnClick = BitBtn3Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
            777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
            79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
            7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
            777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
            79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
            CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
          NumGlyphs = 2
        end
        object BitBtn4: TBitBtn
          Left = 12
          Top = 477
          Width = 100
          Height = 25
          Caption = 'Nova Conta'
          TabOrder = 3
          OnClick = BitBtn4Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
        end
        object BitBtn5: TBitBtn
          Left = 116
          Top = 477
          Width = 100
          Height = 25
          Caption = 'Editar'
          TabOrder = 4
          OnClick = BitBtn5Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
        end
        object BitBtn6: TBitBtn
          Left = 220
          Top = 477
          Width = 100
          Height = 25
          Caption = 'Excluir'
          TabOrder = 5
          OnClick = BitBtn6Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333993777777777993399900000000999333999FFFFFF99933333999FFFF99
            97333330999FF99907333330F999999F07333330FF9999FF07333330FF9999FF
            03333330F999999003333330999F09993333333999FF0F99933333999FFF0039
            9933399900000333999339933333333339933333333333333333}
        end
        object GroupBox2: TGroupBox
          Left = 9
          Top = 395
          Width = 824
          Height = 76
          Caption = 'An'#225'lise'
          TabOrder = 6
          object Label2: TLabel
            Left = 13
            Top = 18
            Width = 116
            Height = 13
            Caption = 'Total de Contas no M'#234's:'
          end
          object Label3: TLabel
            Left = 13
            Top = 52
            Width = 119
            Height = 13
            Caption = 'Total de Contas A Pagar:'
          end
          object Label4: TLabel
            Left = 13
            Top = 35
            Width = 111
            Height = 13
            Caption = 'Total de Contas Pagas:'
          end
          object TotalContas_Label: TLabel
            Left = 119
            Top = 18
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TotalContasAPagar_Label: TLabel
            Left = 119
            Top = 52
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TotalContasPagas_Label: TLabel
            Left = 119
            Top = 35
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 296
            Top = 52
            Width = 68
            Height = 13
            Caption = 'Saldo do M'#234's:'
          end
          object Real3: TLabel
            Left = 432
            Top = 52
            Width = 17
            Height = 13
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SobraMes_Label: TLabel
            Left = 468
            Top = 52
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grana'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 296
            Top = 18
            Width = 130
            Height = 13
            Caption = 'Total de Dinheiro em Caixa:'
          end
          object Label9: TLabel
            Left = 296
            Top = 35
            Width = 92
            Height = 13
            Caption = 'Total de Despesas:'
          end
          object Label10: TLabel
            Left = 432
            Top = 19
            Width = 17
            Height = 13
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 432
            Top = 36
            Width = 17
            Height = 13
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Credito_Label: TLabel
            Left = 468
            Top = 19
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grana'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Debito_Label: TLabel
            Left = 468
            Top = 35
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grana'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GroupBox3: TGroupBox
            Left = 612
            Top = 9
            Width = 198
            Height = 57
            Caption = 'Situa'#231#227'o Atual'
            TabOrder = 0
            object Label5: TLabel
              Left = 15
              Top = 19
              Width = 57
              Height = 13
              Caption = 'Saldo Atual:'
            end
            object SaldoMes_Label: TLabel
              Left = 152
              Top = 19
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Real1: TLabel
              Left = 112
              Top = 19
              Width = 17
              Height = 13
              Caption = 'R$'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 15
              Top = 37
              Width = 90
              Height = 13
              Caption = 'D'#233'bitos Restantes:'
            end
            object DebitoRestante_Label: TLabel
              Left = 152
              Top = 37
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Real2: TLabel
              Left = 112
              Top = 37
              Width = 17
              Height = 13
              Caption = 'R$'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object BitBtn7: TBitBtn
          Left = 324
          Top = 477
          Width = 100
          Height = 25
          Caption = 'Relat'#243'rio'
          TabOrder = 7
          OnClick = BitBtn7Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
            000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
            FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
            00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
            00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
            FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
            0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
            05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
            55557F7777777555555500000005555555557777777555555555}
          NumGlyphs = 2
        end
        object PageControl1: TPageControl
          Left = 8
          Top = 25
          Width = 825
          Height = 367
          ActivePage = TabSheet1
          TabIndex = 0
          TabOrder = 8
          object TabSheet1: TTabSheet
            Caption = 'Todas as Contas'
            object Situacao_DBGrid: TDBGrid
              Left = 3
              Top = 2
              Width = 810
              Height = 333
              DataSource = Contas_DataModule.ContasMes_DataSource
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = Situacao_DBGridDrawColumnCell
              OnDblClick = Situacao_DBGridDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPOCONTA'
                  Title.Caption = 'Conta'
                  Width = 400
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'MOEDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Moeda'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor'
                  Width = 60
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'VENCIMENTO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Vencimento'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PAGO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Situa'#231#227'o'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CREDITOSTRING'
                  Title.Alignment = taCenter
                  Title.Caption = 'Tipo'
                  Width = 76
                  Visible = True
                end>
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Contas Pagas'
            ImageIndex = 1
            object DBGrid2: TDBGrid
              Left = 3
              Top = 2
              Width = 810
              Height = 333
              DataSource = Contas_DataModule.ContasPagas_DataSource
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = Situacao_DBGridDrawColumnCell
              OnDblClick = Situacao_DBGridDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPOCONTA'
                  Title.Caption = 'Conta'
                  Width = 400
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'MOEDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Moeda'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor'
                  Width = 60
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'VENCIMENTO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Vencimento'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PAGO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Situa'#231#227'o'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CREDITOSTRING'
                  Title.Alignment = taCenter
                  Title.Caption = 'Tipo'
                  Width = 76
                  Visible = True
                end>
            end
          end
          object TabSheet3: TTabSheet
            Caption = 'Contas A Pagar'
            ImageIndex = 2
            object DBGrid3: TDBGrid
              Left = 3
              Top = 2
              Width = 810
              Height = 333
              DataSource = Contas_DataModule.ContasAPagar_DataSource
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = Situacao_DBGridDrawColumnCell
              OnDblClick = Situacao_DBGridDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPOCONTA'
                  Title.Caption = 'Conta'
                  Width = 400
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'MOEDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Moeda'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor'
                  Width = 60
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'VENCIMENTO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Vencimento'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PAGO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Situa'#231#227'o'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CREDITOSTRING'
                  Title.Alignment = taCenter
                  Title.Caption = 'Tipo'
                  Width = 76
                  Visible = True
                end>
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Contas Atrasadas'
            ImageIndex = 3
            object DBGrid4: TDBGrid
              Left = 3
              Top = 2
              Width = 810
              Height = 333
              DataSource = Contas_DataModule.ContasAtrasadas_DataSource
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = Situacao_DBGridDrawColumnCell
              OnDblClick = Situacao_DBGridDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TIPOCONTA'
                  Title.Caption = 'Conta'
                  Width = 400
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'MOEDA'
                  Title.Alignment = taCenter
                  Title.Caption = 'Moeda'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Title.Alignment = taCenter
                  Title.Caption = 'Valor'
                  Width = 60
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'VENCIMENTO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Vencimento'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'PAGO'
                  Title.Alignment = taCenter
                  Title.Caption = 'Situa'#231#227'o'
                  Width = 90
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CREDITOSTRING'
                  Title.Alignment = taCenter
                  Title.Caption = 'Tipo'
                  Width = 76
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object ConfiguracaoAdmin_TabSheet: TTabSheet
      Caption = 'Administra'#231#227'o'
      ImageIndex = 2
      object GroupBox8: TGroupBox
        Left = 7
        Top = 5
        Width = 843
        Height = 514
        TabOrder = 0
        object Button1: TButton
          Left = 10
          Top = 16
          Width = 105
          Height = 25
          Caption = 'Usu'#225'rios'
          TabOrder = 0
        end
        object Button2: TButton
          Left = 10
          Top = 48
          Width = 105
          Height = 25
          Caption = 'Categorias'
          TabOrder = 1
        end
        object Button3: TButton
          Left = 10
          Top = 80
          Width = 105
          Height = 25
          Caption = 'Tipos de Contas'
          TabOrder = 2
        end
      end
    end
    object DadosPessoais_TabSheet: TTabSheet
      Caption = 'Dados Pessoais'
      ImageIndex = 2
      OnShow = DadosPessoais_TabSheetShow
      object GroupBox4: TGroupBox
        Left = 7
        Top = 5
        Width = 843
        Height = 514
        TabOrder = 0
        object GroupBox5: TGroupBox
          Left = 11
          Top = 16
          Width = 819
          Height = 268
          Caption = 'Dados Pessoais'
          TabOrder = 0
          object Label12: TLabel
            Left = 8
            Top = 16
            Width = 31
            Height = 13
            Caption = 'Nome:'
          end
          object Label14: TLabel
            Left = 448
            Top = 16
            Width = 38
            Height = 13
            Caption = 'Apelido:'
          end
          object Label17: TLabel
            Left = 296
            Top = 62
            Width = 31
            Height = 13
            Caption = 'Cargo:'
          end
          object Label16: TLabel
            Left = 149
            Top = 62
            Width = 27
            Height = 13
            Caption = 'Sexo:'
          end
          object Label15: TLabel
            Left = 8
            Top = 62
            Width = 98
            Height = 13
            Caption = 'Data de nascimento:'
          end
          object Label18: TLabel
            Left = 56
            Top = 108
            Width = 35
            Height = 13
            Caption = 'Sal'#225'rio:'
          end
          object Label19: TLabel
            Left = 8
            Top = 108
            Width = 36
            Height = 13
            Caption = 'Moeda:'
          end
          object Label20: TLabel
            Left = 136
            Top = 108
            Width = 97
            Height = 13
            Caption = 'Data de pagamento:'
          end
          object Label21: TLabel
            Left = 264
            Top = 108
            Width = 73
            Height = 13
            Caption = 'E-mail principal:'
          end
          object Sobrenome_DBEdit: TDBEdit
            Left = 8
            Top = 32
            Width = 433
            Height = 21
            DataField = 'NOMECOMPLETO'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 0
          end
          object Apelido_DBEdit: TDBEdit
            Left = 448
            Top = 32
            Width = 217
            Height = 21
            DataField = 'APELIDO'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 1
          end
          object Cargo_DBEdit: TDBEdit
            Left = 296
            Top = 78
            Width = 369
            Height = 21
            DataField = 'CARGO'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 2
          end
          object Sexo_DBEdit: TDBEdit
            Left = 148
            Top = 78
            Width = 140
            Height = 21
            DataField = 'SEXO_STRING'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 3
          end
          object Nascimento_DBEdit: TDBEdit
            Left = 8
            Top = 78
            Width = 133
            Height = 21
            DataField = 'NASCIMENTO'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 4
          end
          object Salario_DBEdit: TDBEdit
            Left = 56
            Top = 124
            Width = 73
            Height = 21
            DataField = 'SALARIO'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 5
          end
          object Moeda_DBEdit: TDBEdit
            Left = 8
            Top = 124
            Width = 41
            Height = 21
            DataField = 'MOEDA'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 6
          end
          object DiaPagto_DBEdit: TDBEdit
            Left = 136
            Top = 124
            Width = 121
            Height = 21
            DataField = 'DIA_STRING'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 7
          end
          object Email_DBEdit: TDBEdit
            Left = 264
            Top = 124
            Width = 401
            Height = 21
            DataField = 'EMAIL'
            DataSource = Banco_DataModule.QPessoa_DataSource
            TabOrder = 8
          end
        end
        object GroupBox6: TGroupBox
          Left = 11
          Top = 288
          Width = 819
          Height = 186
          Caption = 'Dados de Localiza'#231#227'o'
          TabOrder = 1
          object Label22: TLabel
            Left = 638
            Top = 18
            Width = 56
            Height = 13
            Caption = 'Telefone(s):'
          end
          object Label23: TLabel
            Left = 8
            Top = 20
            Width = 49
            Height = 13
            Caption = 'Endere'#231'o:'
          end
          object Label24: TLabel
            Left = 320
            Top = 20
            Width = 30
            Height = 13
            Caption = 'Bairro:'
          end
          object Label25: TLabel
            Left = 8
            Top = 66
            Width = 36
            Height = 13
            Caption = 'Cidade:'
          end
          object Label26: TLabel
            Left = 244
            Top = 66
            Width = 24
            Height = 13
            Caption = 'CEP:'
          end
          object Label27: TLabel
            Left = 345
            Top = 66
            Width = 36
            Height = 13
            Caption = 'Estado:'
          end
          object DBGrid1: TDBGrid
            Left = 638
            Top = 35
            Width = 171
            Height = 110
            DataSource = Banco_DataModule.QTelefone_DataSource
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'TELEFONE_STR'
                Title.Caption = 'N'#250'mero(s)'
                Width = 115
                Visible = True
              end>
          end
          object BitBtn12: TBitBtn
            Left = 646
            Top = 151
            Width = 75
            Height = 22
            Caption = 'Novo'
            TabOrder = 1
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
              333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
              0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
              07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
              0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
              33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
              B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
              3BB33773333773333773B333333B3333333B7333333733333337}
            NumGlyphs = 2
          end
          object BitBtn13: TBitBtn
            Left = 723
            Top = 151
            Width = 75
            Height = 22
            Cancel = True
            Caption = 'Excluir'
            TabOrder = 2
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
          object Endereco_DBEdit: TDBEdit
            Left = 8
            Top = 35
            Width = 305
            Height = 21
            DataField = 'ENDERECO_STRING'
            DataSource = Banco_DataModule.QEndereco_DataSource
            TabOrder = 3
          end
          object Bairro_DBEdit: TDBEdit
            Left = 320
            Top = 35
            Width = 181
            Height = 21
            DataField = 'BAIRRO'
            DataSource = Banco_DataModule.QEndereco_DataSource
            TabOrder = 4
          end
          object Cidade_DBEdit: TDBEdit
            Left = 8
            Top = 82
            Width = 229
            Height = 21
            DataField = 'CIDADE'
            DataSource = Banco_DataModule.QEndereco_DataSource
            TabOrder = 5
          end
          object CEP_DBEdit: TDBEdit
            Left = 244
            Top = 82
            Width = 94
            Height = 21
            DataField = 'CEP'
            DataSource = Banco_DataModule.QEndereco_DataSource
            TabOrder = 6
          end
          object Estado_DBEdit: TDBEdit
            Left = 345
            Top = 82
            Width = 156
            Height = 21
            DataField = 'ESTADO_STRING'
            DataSource = Banco_DataModule.QEndereco_DataSource
            TabOrder = 7
          end
        end
        object BitBtn8: TBitBtn
          Left = 631
          Top = 479
          Width = 95
          Height = 25
          Caption = 'Confirmar'
          Default = True
          TabOrder = 2
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
        object BitBtn14: TBitBtn
          Left = 735
          Top = 479
          Width = 95
          Height = 25
          Cancel = True
          Caption = 'Cancelar'
          TabOrder = 3
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
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 570
    Width = 887
    Height = 22
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 560
    Top = 8
    object Logon1: TMenuItem
      Caption = 'Conectar'
      OnClick = Logon1Click
    end
    object Logoff1: TMenuItem
      Caption = 'Desconectar'
      Visible = False
      OnClick = Logoff1Click
    end
    object Situacao1: TMenuItem
      Caption = 'Situa'#231#227'o'
      OnClick = Situacao1Click
    end
    object DadosPessoais1: TMenuItem
      Caption = 'Dados Pessoais'
      OnClick = DadosPessoais1Click
    end
    object Sobre1: TMenuItem
      Caption = 'Sobre'
      OnClick = Sobre1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object ImageList1: TImageList
    Left = 528
    Top = 8
  end
end
