object Splash_Form: TSplash_Form
  Left = 257
  Top = 177
  BorderStyle = bsNone
  Caption = 'Splash'
  ClientHeight = 151
  ClientWidth = 392
  Color = 11270910
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Animate1: TAnimate
    Left = 0
    Top = 0
    Width = 392
    Height = 151
    Active = False
    FileName = 'NoMoney2.avi'
    StopFrame = 23
  end
end
