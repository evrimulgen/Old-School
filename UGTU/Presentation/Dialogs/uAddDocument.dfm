inherited frmAddDocument: TfrmAddDocument
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 426
  ClientWidth = 435
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 441
  ExplicitHeight = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 435
    Height = 321
    Align = alTop
    ExplicitTop = 2
    ExplicitWidth = 435
    ExplicitHeight = 321
  end
  object Label1: TLabel [1]
    Left = 10
    Top = 8
    Width = 76
    Height = 13
    Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object Label8: TLabel [2]
    Left = 88
    Top = 8
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [3]
    Left = 111
    Top = 55
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label3: TLabel [4]
    Left = 10
    Top = 55
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
  end
  object Label6: TLabel [5]
    Left = 10
    Top = 96
    Width = 254
    Height = 13
    Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085' ('#1087#1086#1083#1085#1086#1089#1090#1100#1102', '#1082#1072#1082' '#1091#1082#1072#1079#1072#1085#1086' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1077')'
  end
  object Label11: TLabel [6]
    Left = 249
    Top = 55
    Width = 66
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
  end
  object Label4: TLabel [7]
    Left = 147
    Top = 55
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [8]
    Left = 10
    Top = 164
    Width = 153
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  end
  object Label9: TLabel [9]
    Left = 96
    Top = 28
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object WhoRequired: TLabel [10]
    Left = 266
    Top = 96
    Width = 6
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 385
    Width = 435
    ExplicitTop = 385
    ExplicitWidth = 435
    inherited bbOK: TBitBtn
      Left = 170
      Top = 6
      Visible = False
      ExplicitLeft = 170
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 341
      Top = 6
      ParentFont = False
      ExplicitLeft = 341
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 254
      Top = 6
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 254
      ExplicitTop = 6
    end
    inherited bbSprav: TBitBtn
      Left = 10
      Top = 6
      Visible = False
      ExplicitLeft = 10
      ExplicitTop = 6
    end
  end
  object dbcbeKind: TDBLookupComboboxEh [12]
    Left = 10
    Top = 27
    Width = 414
    Height = 19
    DataField = ''
    EditButtons = <>
    Flat = True
    KeyField = 'ik_vid_doc'
    ListField = 'cvid_doc'
    ListSource = dmStudentData.dsDocType
    TabOrder = 1
    Visible = True
    OnChange = dbcbeKindChange
  end
  object eSer: TDBEditEh [13]
    Left = 10
    Top = 71
    Width = 95
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
    OnChange = dbcbeKindChange
    OnExit = eSerExit
  end
  object eNum: TDBEditEh [14]
    Left = 111
    Top = 71
    Width = 132
    Height = 19
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 3
    Visible = True
    OnChange = dbcbeKindChange
  end
  object eWho: TDBEditEh [15]
    Left = 10
    Top = 111
    Width = 413
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 5
    Text = #1054#1090#1076#1077#1083' '#1059#1060#1052#1057' '#1056#1086#1089#1089#1080#1080
    Visible = True
    OnChange = dbcbeKindChange
  end
  object dbdteGetDate: TDBDateTimeEditEh [16]
    Left = 249
    Top = 71
    Width = 175
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    Kind = dtkDateEh
    TabOrder = 4
    Visible = True
    OnChange = dbcbeKindChange
  end
  object dbeAddInfo: TDBEditEh [17]
    Left = 10
    Top = 180
    Width = 413
    Height = 19
    DynProps = <>
    EditButtons = <>
    Flat = True
    TabOrder = 6
    Visible = True
    OnChange = dbcbeKindChange
  end
  object btnLoad: TButton [18]
    Left = 8
    Top = 206
    Width = 129
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'...'
    TabOrder = 7
    OnClick = btnLoadClick
  end
  object chbxBonuses: TCheckBox [19]
    Left = 8
    Top = 298
    Width = 121
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1072#1083#1083#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = chbxBonusesClick
  end
  object pnlBonuses: TPanel [20]
    Left = 0
    Top = 321
    Width = 435
    Height = 64
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = False
    object Label7: TLabel
      Left = 16
      Top = 8
      Width = 123
      Height = 13
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1073#1072#1083#1083#1099
    end
    object Label10: TLabel
      Left = 170
      Top = 8
      Width = 171
      Height = 13
      Caption = #1044#1080#1089#1094#1080#1087#1083#1080#1085#1072' ('#1087#1088#1080' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1089#1090#1080')'
    end
    object UpDown1: TUpDown
      Left = 129
      Top = 27
      Width = 16
      Height = 19
      Associate = dbBalls
      Max = 35
      TabOrder = 0
      OnClick = UpDown1Click
    end
    object dbBalls: TDBEditEh
      Left = 18
      Top = 27
      Width = 111
      Height = 19
      DynProps = <>
      EditButtons = <>
      Flat = True
      ReadOnly = True
      TabOrder = 1
      Text = '0'
      Visible = True
    end
    object dbcbeDisc: TDBLookupComboboxEh
      Left = 170
      Top = 27
      Width = 171
      Height = 19
      DataField = ''
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Flat = True
      KeyField = 'ik_disc'
      ListField = #1089'name_disc'
      ListSource = dmStudentData.dsAbitDisc
      ParentFont = False
      TabOrder = 2
      Visible = True
      OnChange = dbcbeKindChange
    end
  end
  object cbReal: TCheckBox [21]
    Left = 10
    Top = 138
    Width = 111
    Height = 17
    Caption = #1055#1088#1080#1085#1103#1090' '#1086#1088#1080#1075#1080#1085#1072#1083
    TabOrder = 10
    OnClick = dbcbeKindChange
  end
  inherited actBaseDialog: TActionList
    inherited actApply: TAction
      Enabled = False
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      Enabled = False
      OnUpdate = actOKUpdate
    end
    object actCheckFields: TAction
      Caption = 'actCheckFields'
      OnUpdate = actCheckFieldsUpdate
    end
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object opDocs: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.tif;*.tiff;*.ico;*.emf;*.w' +
      'mf)|*.gif;*.jpg;*.jpeg;*.png;*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wm' +
      'f|GIF Image (*.gif)|*.gif|JPEG Image File (*.jpg)|*.jpg|JPEG Ima' +
      'ge File (*.jpeg)|*.jpeg|Portable Network Graphics (*.png)|*.png|' +
      'Bitmaps (*.bmp)|*.bmp|TIFF Images (*.tif)|*.tif|TIFF Images (*.t' +
      'iff)|*.tiff|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 392
    Top = 208
  end
end
