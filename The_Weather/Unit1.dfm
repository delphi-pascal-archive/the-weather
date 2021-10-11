object Form1: TForm1
  Left = 222
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = #1055#1086#1075#1086#1076#1072
  ClientHeight = 518
  ClientWidth = 610
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Status: TLabel
    Left = 11
    Top = 100
    Width = 108
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Status'
    Color = clInfoBk
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 228
    Height = 90
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    object Label1: TLabel
      Left = 2
      Top = 4
      Width = 41
      Height = 16
      Caption = 'Label1'
      OnMouseDown = Panel1MouseDown
    end
    object Label2: TLabel
      Left = 2
      Top = 23
      Width = 41
      Height = 16
      Caption = 'Label2'
      OnMouseDown = Panel1MouseDown
    end
    object Label3: TLabel
      Left = 2
      Top = 43
      Width = 41
      Height = 16
      Caption = 'Label3'
      OnMouseDown = Panel1MouseDown
    end
    object Label4: TLabel
      Left = 2
      Top = 63
      Width = 41
      Height = 16
      Caption = 'Label4'
      OnMouseDown = Panel1MouseDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 148
    Width = 238
    Height = 355
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object Label6: TLabel
      Left = 1
      Top = 1
      Width = 135
      Height = 16
      Caption = '  '#1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1082#1089#1080':  '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 0
      Top = 276
      Width = 240
      Height = 16
      Caption = ' * '#1076#1083#1103' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1087#1088#1072#1074#1086#1081' '#1087#1072#1085#1077#1083#1080
    end
    object Label7: TLabel
      Left = 10
      Top = 295
      Width = 144
      Height = 16
      Caption = #1085#1072#1089#1090#1088#1086#1081#1090#1077' '#1087#1088#1086#1082#1089#1080' '#1074' IE'
    end
    object Label12: TLabel
      Left = -2
      Top = 315
      Width = 223
      Height = 16
      Caption = ' * '#1087#1086#1089#1083#1077' '#1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1087#1088#1086#1082#1089#1080' ('#1079#1076#1077#1089#1100')'
    end
    object Label13: TLabel
      Left = 10
      Top = 335
      Width = 187
      Height = 16
      Caption = #1087#1077#1088#1077#1079#1072#1087#1091#1089#1090#1080#1090#1077' '#1080#1085#1092#1086#1088#1084#1072#1090#1086#1088
    end
    object LabeledEdit1: TLabeledEdit
      Left = 10
      Top = 39
      Width = 218
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 16
      EditLabel.Caption = #1057#1077#1088#1074#1077#1088
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 217
      Width = 168
      Height = 21
      Cursor = crHandPoint
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1088#1086#1082#1089#1080
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object LabeledEdit2: TLabeledEdit
      Left = 10
      Top = 89
      Width = 50
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 16
      EditLabel.Caption = #1055#1086#1088#1090
      TabOrder = 1
    end
    object LabeledEdit3: TLabeledEdit
      Left = 10
      Top = 138
      Width = 218
      Height = 21
      EditLabel.Width = 122
      EditLabel.Height = 16
      EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      TabOrder = 2
    end
    object LabeledEdit4: TLabeledEdit
      Left = 10
      Top = 187
      Width = 218
      Height = 21
      EditLabel.Width = 49
      EditLabel.Height = 16
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100
      TabOrder = 3
    end
    object CheckBox2: TCheckBox
      Left = 10
      Top = 246
      Width = 119
      Height = 21
      Caption = #1055#1086#1074#1077#1088#1093' '#1086#1082#1086#1085
      Enabled = False
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 266
    Top = 0
    Width = 336
    Height = 129
    BevelOuter = bvNone
    Color = clGreen
    TabOrder = 2
    object WebBrowser1: TWebBrowser
      Left = 0
      Top = 0
      Width = 400
      Height = 137
      TabOrder = 0
      OnNavigateComplete2 = WebBrowser1NavigateComplete2
      ControlData = {
        4C00000013210000540B00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object Button1: TButton
    Left = 197
    Top = 98
    Width = 18
    Height = 19
    Cursor = crHandPoint
    Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 236
    Top = 69
    Width = 19
    Height = 18
    Cursor = crHandPoint
    Hint = #1055#1086#1076#1088#1086#1073#1085#1099#1081' '#1087#1088#1086#1075#1085#1086#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button2Click
  end
  object Panel4: TPanel
    Left = 266
    Top = 148
    Width = 320
    Height = 354
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 5
    object Label8: TLabel
      Left = 39
      Top = 20
      Width = 252
      Height = 16
      Caption = #1048#1085#1092#1086#1088#1084#1072#1090#1086#1088' '#1086' '#1087#1086#1075#1086#1076#1077' '#1074' '#1048#1088#1082#1091#1090#1089#1082#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 69
      Top = 49
      Width = 166
      Height = 26
      Caption = 'ALPHA '#1074#1077#1088#1089#1080#1103' :)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 20
      Top = 325
      Width = 298
      Height = 16
      Caption = #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1085#1072' '#1089#1074#1086#1081' '#1089#1090#1088#1072#1093' '#1080' '#1088#1080#1089#1082
    end
    object Label11: TLabel
      Left = 89
      Top = 89
      Width = 120
      Height = 32
      Caption = 'by brother'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 20
      Top = 217
      Width = 128
      Height = 16
      Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1083#1091#1095#1077#1085#1099' '#1089
    end
    object Label15: TLabel
      Left = 108
      Top = 236
      Width = 96
      Height = 16
      Caption = 'http://angara.net'
    end
    object Label16: TLabel
      Left = 108
      Top = 256
      Width = 102
      Height = 16
      Caption = 'http://gismeteo.ru'
    end
    object Bevel1: TBevel
      Left = 20
      Top = 187
      Width = 286
      Height = 11
      Shape = bsBottomLine
    end
    object Bevel2: TBevel
      Left = 20
      Top = 305
      Width = 286
      Height = 11
      Shape = bsBottomLine
    end
    object Label18: TLabel
      Left = 20
      Top = 148
      Width = 280
      Height = 16
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
    end
    object Label19: TLabel
      Left = 20
      Top = 167
      Width = 187
      Height = 16
      Caption = #1082#1072#1078#1076#1099#1081' '#1095#1072#1089' ('#1103' '#1090#1072#1082' '#1079#1072#1093#1086#1090#1077#1083' ;) )'
    end
    object Bevel3: TBevel
      Left = 20
      Top = 128
      Width = 286
      Height = 11
      Shape = bsBottomLine
    end
  end
  object Button3: TButton
    Left = 236
    Top = 0
    Width = 19
    Height = 18
    Cursor = crHandPoint
    Hint = #1047#1072#1082#1088#1099#1090#1100
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button5: TButton
    Left = 236
    Top = 20
    Width = 19
    Height = 18
    Cursor = crHandPoint
    Hint = #1057#1074#1077#1088#1085#1091#1090#1100
    Caption = '_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button4: TButton
    Left = 236
    Top = 42
    Width = 19
    Height = 18
    Cursor = crHandPoint
    Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    Caption = 'R'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = Button4Click
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 16
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 48
    Top = 32
  end
end
