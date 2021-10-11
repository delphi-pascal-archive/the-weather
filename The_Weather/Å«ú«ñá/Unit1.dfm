object Form1: TForm1
  Left = 252
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1086#1075#1086#1076#1072
  ClientHeight = 407
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Web: TWebBrowser
    Left = 0
    Top = 0
    Width = 567
    Height = 432
    TabOrder = 0
    OnNavigateComplete2 = WebNavigateComplete2
    ControlData = {
      4C000000E22E0000B82300000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126200000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 388
    Width = 508
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'by brother'
        Width = 50
      end>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end
