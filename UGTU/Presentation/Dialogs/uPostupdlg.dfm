inherited frmPostupDlg: TfrmPostupDlg
  Left = 223
  Top = 257
  HelpKeyword = 'A_Edit_Zayav.htm'
  Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077
  ClientHeight = 601
  ClientWidth = 565
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 571
  ExplicitHeight = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 249
    Width = 565
    Height = 173
    ExplicitTop = 117
    ExplicitWidth = 528
    ExplicitHeight = 198
  end
  inherited Panel1: TPanel
    Top = 560
    Width = 565
    ExplicitTop = 560
    ExplicitWidth = 565
    inherited bbOK: TBitBtn
      Left = 389
      Top = 6
      Action = nil
      Enabled = False
      OnClick = bbOKClick
      ExplicitLeft = 389
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 476
      Enabled = False
      Visible = False
      ExplicitLeft = 476
    end
    inherited bbCancel: TBitBtn
      Left = 476
      Top = 6
      ExplicitLeft = 476
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
    object bbOkPrint: TBitBtn
      Left = 212
      Top = 6
      Width = 171
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1076#1072#1090#1100' '#1074' MS Excel'
      TabOrder = 4
      OnClick = bbOkPrintClick
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 0
    Top = 0
    Width = 565
    Height = 249
    Align = alTop
    Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      565
      249)
    object Label2: TLabel
      Left = 12
      Top = 15
      Width = 35
      Height = 13
      Caption = #1053#1072#1073#1086#1088':'
    end
    object Label5: TLabel
      Left = 211
      Top = -7
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 165
      Top = 59
      Width = 123
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103':'
    end
    object Label6: TLabel
      Left = 288
      Top = 55
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 59
      Width = 67
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080':'
    end
    object Label7: TLabel
      Left = 77
      Top = 59
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 99
      Width = 140
      Height = 13
      Caption = #1057#1088#1077#1076#1085#1080#1081' '#1073#1072#1083#1083' ('#1042#1055#1054' '#1080' '#1057#1055#1054'):'
    end
    object Label1: TLabel
      Left = 48
      Top = 15
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 378
      Top = 148
      Width = 123
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080' '#1086#1088#1080#1075#1080#1085#1072#1083#1072':'
    end
    object lOrganiz: TLabel
      Left = 165
      Top = 99
      Width = 120
      Height = 13
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103'-'#1079#1072#1082#1072#1079#1095#1080#1082':'
    end
    object lOrganiz0: TLabel
      Left = 288
      Top = 96
      Width = 4
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbcbeRecruit: TDBLookupComboboxEh
      Left = 9
      Top = 34
      Width = 553
      Height = 19
      DataField = ''
      EditButtons = <>
      Flat = True
      KeyField = 'NNrecord'
      ListField = 'Name'
      ListSource = dm.dsNabor
      TabOrder = 2
      Visible = True
      OnChange = dbcbeRecruitChange
    end
    object dbcbeCategory: TDBLookupComboboxEh
      Left = 165
      Top = 74
      Width = 397
      Height = 19
      DataField = ''
      EditButtons = <>
      Flat = True
      KeyField = 'Ik_kat_zach'
      ListField = 'Cname_kat_zach'
      ListSource = dmStudentData.dsGetAbitCat
      TabOrder = 0
      Visible = True
      OnChange = eNumChange
    end
    object dbdteList: TDBDateTimeEditEh
      Left = 9
      Top = 74
      Width = 150
      Height = 19
      DynProps = <>
      EditButtons = <>
      Flat = True
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnChange = eNumChange
    end
    object cbReal: TCheckBox
      Left = 3
      Top = 147
      Width = 325
      Height = 17
      Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086' ('#1074#1089#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1074' '#1086#1088#1080#1075#1080#1085#1072#1083#1077')'
      TabOrder = 3
      OnClick = cbRealClick
    end
    object cbIsMain: TCheckBox
      Left = 3
      Top = 170
      Width = 325
      Height = 17
      Caption = #1071#1074#1083#1103#1077#1090#1089#1103' '#1087#1077#1088#1074#1080#1095#1085#1099#1084' ('#1083#1080#1095#1085#1086#1077' '#1076#1077#1083#1086' '#1085#1072' '#1101#1090#1086#1081' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080')'
      TabOrder = 4
      OnClick = cbIsMainClick
    end
    object eAvgBall: TDBNumberEditEh
      Left = 9
      Top = 115
      Width = 150
      Height = 19
      Alignment = taLeftJustify
      DynProps = <>
      EditButtons = <>
      Flat = True
      Increment = 0.100000000000000000
      MaxValue = 5.000000000000000000
      MinValue = 2.000000000000000000
      TabOrder = 5
      Value = 0.000000000000000000
      Visible = True
      OnChange = eNumChange
    end
    object bGetCertData: TButton
      Left = 3
      Top = 208
      Width = 548
      Height = 35
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072' '#1045#1043#1069
      TabOrder = 6
      Visible = False
      OnClick = bGetCertDataClick
    end
    object chbNeedCheckEGE: TCheckBox
      Left = 3
      Top = 217
      Width = 312
      Height = 17
      Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1045#1043#1069' ('#1089#1076#1072#1085#1086' '#1074' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1077' '#1075#1086#1076#1099')'
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox [3]
    Left = 0
    Top = 249
    Width = 565
    Height = 173
    Align = alClient
    Caption = #1069#1082#1079#1072#1084#1077#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object sbAddExam: TSpeedButton
      Left = 539
      Top = 16
      Width = 23
      Height = 23
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
        4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F4E3DAE4CFC2DDC5B7D9BEACD8BCA9D7BAA7D7B9A5D6B7A3D6B6A26349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
        D7C9EED3C4EDD0BFECCDBBD6B7A3634935FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F8ECE5F6E8E0F4E3DAF3DFD4634935F0D7C9EED3C4EDD0BFD7B9A56349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DA63
        4935F1DBCFF0D7C9EED3C4D7BAA7634935FF00FFFF00FFFF00FFFF00FFFF00FF
        BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9D8BCA96349
        35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE563
        4935F4E3DAF3DFD4F1DBCFD9BEAC634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C0AB9CFDFAF9FCF7F5FBF4F0F9F0EB634935F6E8E0F4E3DAF3DFD4D9C0AF6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
        F0EBF8ECE5F6E8E0F4E3DAE1CDC0634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
        A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = sbAddExamClick
    end
    object sbDelExam: TSpeedButton
      Left = 539
      Top = 41
      Width = 23
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
        4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBBEBCAB8EAC8B56349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
        D7C9EED3C4EDD0BFECCDBBEBCAB8634935FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F8ECE5F6E8E0F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBB6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DAF3
        DFD4F1DBCFF0D7C9EED3C4EDD0BF634935FF00FFFF00FFFF00FFFF00FFFF00FF
        BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9EED3C46349
        35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE5F6
        E8E0F4E3DAF3DFD4F1DBCFF0D7C9634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C0AB9CFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DAF3DFD4F1DBCF6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
        F0EBF8ECE5F6E8E0F4E3DAF3DFD4634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
        A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = sbDelExamClick
    end
    object sgExams: TStringGrid
      Left = 2
      Top = 15
      Width = 531
      Height = 156
      Align = alLeft
      BorderStyle = bsNone
      ColCount = 4
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      GridLineWidth = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      OnClick = sgExamsClick
      OnDblClick = sgExamsDblClick
      ColWidths = (
        177
        117
        63
        131)
    end
  end
  object GroupBox3: TGroupBox [4]
    Left = 0
    Top = 422
    Width = 565
    Height = 138
    Align = alBottom
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object sbAddSpec: TSpeedButton
      Left = 539
      Top = 16
      Width = 23
      Height = 23
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
        4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F4E3DAE4CFC2DDC5B7D9BEACD8BCA9D7BAA7D7B9A5D6B7A3D6B6A26349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
        D7C9EED3C4EDD0BFECCDBBD6B7A3634935FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F8ECE5F6E8E0F4E3DAF3DFD4634935F0D7C9EED3C4EDD0BFD7B9A56349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DA63
        4935F1DBCFF0D7C9EED3C4D7BAA7634935FF00FFFF00FFFF00FFFF00FFFF00FF
        BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9D8BCA96349
        35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE563
        4935F4E3DAF3DFD4F1DBCFD9BEAC634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C0AB9CFDFAF9FCF7F5FBF4F0F9F0EB634935F6E8E0F4E3DAF3DFD4D9C0AF6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
        F0EBF8ECE5F6E8E0F4E3DAE1CDC0634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
        A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = sbAddSpecClick
    end
    object SbDelSpec: TSpeedButton
      Left = 539
      Top = 45
      Width = 23
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD4CCC763493563493563493563493563
        4935634935634935634935634935D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBBEBCAB8EAC8B56349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB8A494F6E8E0F4E3DAF3DFD4F1DBCFF0
        D7C9EED3C4EDD0BFECCDBBEBCAB8634935FF00FFFF00FFFF00FFFF00FFFF00FF
        B8A494F8ECE5F6E8E0F4E3DAF3DFD4F1DBCFF0D7C9EED3C4EDD0BFECCDBB6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFB9A595F9F0EBF8ECE5F6E8E0F4E3DAF3
        DFD4F1DBCFF0D7C9EED3C4EDD0BF634935FF00FFFF00FFFF00FFFF00FFFF00FF
        BCA697FBF4F0F9F0EB634935634935634935634935634935F0D7C9EED3C46349
        35FF00FFFF00FFFF00FFFF00FFFF00FFBEA89AFCF7F5FBF4F0F9F0EBF8ECE5F6
        E8E0F4E3DAF3DFD4F1DBCFF0D7C9634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C0AB9CFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DAF3DFD4F1DBCF6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFC3AC9DFEFDFCFDFAF9FCF7F5FBF4F0F9
        F0EBF8ECE5F6E8E0F4E3DAF3DFD4634935FF00FFFF00FFFF00FFFF00FFFF00FF
        C4AE9EFFFFFFFEFDFCFDFAF9FCF7F5FBF4F0F9F0EBF8ECE5F6E8E0F4E3DA6349
        35FF00FFFF00FFFF00FFFF00FFFF00FFEFE8E4C3AD9EC2AC9DC0AB9CBEA899BB
        A798BAA496B8A394B8A394B8A394D4CCC7FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = SbDelSpecClick
    end
    object sgAdditionalSpec: TStringGrid
      Left = 2
      Top = 15
      Width = 531
      Height = 121
      Align = alLeft
      BorderStyle = bsNone
      ColCount = 2
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      GridLineWidth = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      OnClick = sgAdditionalSpecClick
      ColWidths = (
        67
        421)
    end
  end
  object dtpDateOriginal: TDBDateTimeEditEh [5]
    Left = 378
    Top = 167
    Width = 184
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 4
    Visible = True
    OnChange = eNumChange
  end
  object dbcbeTargetOrganization: TDBLookupComboboxEh [6]
    Left = 165
    Top = 115
    Width = 397
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'id'
    ListField = 'OrganizationName'
    ListSource = dmStudentData.dsTargetOrganization
    TabOrder = 5
    Visible = True
    OnChange = eNumChange
  end
  inherited actBaseDialog: TActionList
    Left = 477
    Top = 133
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
end
