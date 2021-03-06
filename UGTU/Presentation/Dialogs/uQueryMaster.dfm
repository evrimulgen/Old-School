inherited frmQueryMaster: TfrmQueryMaster
  Left = 221
  Top = 186
  BorderStyle = bsSizeable
  Caption = #1052#1072#1089#1090#1077#1088' '#1079#1072#1087#1088#1086#1089#1086#1074
  ClientHeight = 641
  ClientWidth = 721
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitTop = 2
  ExplicitWidth = 729
  ExplicitHeight = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 473
    Height = 600
    ExplicitWidth = 491
    ExplicitHeight = 313
  end
  inherited Panel1: TPanel
    Top = 600
    Width = 721
    ExplicitTop = 583
    ExplicitWidth = 721
    inherited bbOK: TBitBtn
      Left = 486
      Top = 6
      Width = 133
      Caption = #1055#1086#1089#1083#1072#1090#1100' '#1079#1072#1087#1088#1086#1089
      ExplicitLeft = 486
      ExplicitTop = 6
      ExplicitWidth = 133
    end
    inherited bbApply: TBitBtn
      Left = 93
      Top = 6
      Visible = False
      ExplicitLeft = 93
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 622
      Top = 6
      Width = 88
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ExplicitLeft = 622
      ExplicitTop = 6
      ExplicitWidth = 88
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
    object bSaveQuery: TBitBtn
      Left = 352
      Top = 6
      Width = 129
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      TabOrder = 4
      Visible = False
      OnClick = bSaveQueryClick
    end
    object bLoadQuery: TBitBtn
      Left = 217
      Top = 6
      Width = 129
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      TabOrder = 5
      Visible = False
      OnClick = bLoadQueryClick
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 473
    Height = 600
    Align = alClient
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 583
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 471
      Height = 415
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 1
      OnResize = ScrollBox1Resize
      ExplicitHeight = 395
      object imQuery: TImage32
        Left = -1
        Top = -2
        Width = 452
        Height = 424
        Bitmap.ResamplerClassName = 'TNearestResampler'
        BitmapAlign = baTopLeft
        PopupMenu = QMPopup
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        TabOrder = 0
        OnMouseDown = imQueryMouseDown
      end
    end
    object pnlFieldFilter: TPanel
      Left = 1
      Top = 447
      Width = 471
      Height = 152
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      Visible = False
      DesignSize = (
        471
        152)
      object Label1: TLabel
        Left = 16
        Top = 6
        Width = 95
        Height = 13
        Caption = #1059#1089#1083#1086#1074#1080#1077' '#1076#1083#1103' '#1087#1086#1083#1103':'
      end
      object Label2: TLabel
        Left = 124
        Top = 6
        Width = 51
        Height = 13
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
      end
      object Label3: TLabel
        Left = 191
        Top = 30
        Width = 6
        Height = 13
        Caption = #1080
        Visible = False
      end
      object SpeedButton1: TSpeedButton
        Left = 276
        Top = 23
        Width = 81
        Height = 22
        Action = actAddFilter
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '
        Flat = True
      end
      object SpeedButton2: TSpeedButton
        Left = 363
        Top = 23
        Width = 85
        Height = 22
        Action = actDeleteLastFilter
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Flat = True
      end
      object eValue1: TDBEditEh
        Left = 124
        Top = 26
        Width = 141
        Height = 19
        DynProps = <>
        EditButtons = <>
        Flat = True
        TabOrder = 0
        Visible = True
        EditMask = ''
      end
      object eCommand: TDBComboBoxEh
        Left = 16
        Top = 26
        Width = 104
        Height = 19
        DynProps = <>
        EditButtons = <>
        Flat = True
        Items.Strings = (
          #1088#1072#1074#1085#1086
          #1084#1077#1085#1100#1096#1077
          #1073#1086#1083#1100#1096#1077
          #1084#1077#1078#1076#1091
          #1074#1082#1083#1102#1095#1072#1077#1090
          #1085#1077' '#1088#1072#1074#1085#1086
          #1085#1077' '#1084#1077#1078#1076#1091
          #1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
          #1087#1088#1080#1089#1091#1090#1089#1090#1074#1091#1077#1090)
        TabOrder = 1
        Text = #1088#1072#1074#1085#1086
        Visible = True
        OnChange = eCommandChange
        OnDblClick = ActAddEntityExecute
      end
      object eValue2: TDBEditEh
        Left = 203
        Top = 26
        Width = 62
        Height = 19
        DynProps = <>
        EditButtons = <>
        Flat = True
        TabOrder = 2
        Visible = False
      end
      object FilterMemo: TMemo
        Left = 16
        Top = 58
        Width = 432
        Height = 60
        Anchors = [akLeft, akTop, akRight]
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        ReadOnly = True
        TabOrder = 3
      end
      object cbOrder: TCheckBox
        Left = 16
        Top = 124
        Width = 125
        Height = 17
        Caption = #1055#1086#1083#1077' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
        TabOrder = 4
        OnClick = cbOrderClick
      end
      object rbAll: TRadioButton
        Left = 179
        Top = 124
        Width = 86
        Height = 17
        Caption = #1042#1089#1077
        Checked = True
        TabOrder = 5
        TabStop = True
        OnClick = rbAllClick
      end
      object rbAverage: TRadioButton
        Left = 227
        Top = 124
        Width = 70
        Height = 17
        Caption = #1057#1088#1077#1076#1085#1077#1077
        TabOrder = 6
        OnClick = rbAllClick
      end
      object rbMin: TRadioButton
        Left = 295
        Top = 124
        Width = 70
        Height = 17
        Caption = #1052#1080#1085#1080#1084#1091#1084
        TabOrder = 7
        OnClick = rbAllClick
      end
      object rbMax: TRadioButton
        Left = 371
        Top = 124
        Width = 80
        Height = 17
        Caption = #1052#1072#1082#1089#1080#1084#1091#1084
        TabOrder = 8
        OnClick = rbAllClick
      end
    end
    object pnlFilters: TPanel
      Left = 1
      Top = 416
      Width = 471
      Height = 31
      Align = alBottom
      ParentBackground = False
      TabOrder = 2
      OnMouseMove = pnlFiltersMouseMove
      DesignSize = (
        471
        31)
      object Label4: TLabel
        Left = 16
        Top = 10
        Width = 113
        Height = 13
        Caption = #1053#1072#1083#1086#1078#1077#1085#1085#1099#1077' '#1091#1089#1083#1086#1074#1080#1103':'
      end
      object SpeedButton5: TSpeedButton
        Left = 276
        Top = 6
        Width = 172
        Height = 22
        Action = actDelFilter
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B5B5
          B5006B6B6B009C9C9C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00E7E7E700A5A5A50094949400FF00FF00FF00FF00947BEF002900
          DE003929A50063636300CECECE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00D6D6D6006352B5002900DE00A5A5A500FF00FF00FF00FF00BDADF7002900
          DE003108DE00524A6B007B7B7B00DEDEDE00FF00FF00FF00FF00FF00FF00CEC6
          D6004229C6002900DE007B6BCE00FF00FF00FF00FF00FF00FF00FF00FF008473
          EF002900DE003918D6005A5A5A0094949400E7E7E700FF00FF00CEC6D6003918
          CE002900DE00A59CC600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF007B63EF002900DE005239C6006363630094949400B5B5C6003918CE002900
          DE00A59CC600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF007B63EF002900DE005231C60052525A003110C6002900D600A59C
          C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF007B5AEF002900DE002900D6002900D6006B638C00DEDE
          DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00CEC6D6002908DE002900DE004229C600737373009494
          9400D6D6D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00CEC6D6003918CE002900DE00735ACE003108E7005A39D6007B7B
          8C0084848400C6C6C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00CEC6D6003918CE002900DE008C84BD00FF00FF00FF00FF004218E7004A29
          DE007B739C007B7B7B00B5B5B500FF00FF00FF00FF00FF00FF00FF00FF00BDBD
          C6003910CE002900DE007363B500FF00FF00FF00FF00FF00FF00FF00FF005A42
          E7003108DE007B6BB5008C8C8C00DEDEDE00FF00FF00FF00FF00C6BDEF003910
          CE002900DE005A42B500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00947BEF002900DE00CECEE700FF00FF00FF00FF00FF00FF004218E7002900
          DE004229C600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003110E7004A29
          E700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object lbFilters: TListBox
        Left = 16
        Top = 36
        Width = 432
        Height = 85
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvLowered
        BevelKind = bkFlat
        BorderStyle = bsNone
        ItemHeight = 13
        PopupMenu = ppmFilters
        TabOrder = 0
        OnClick = lbFiltersClick
      end
      object cbGroupBy: TCheckBox
        Left = 16
        Top = 127
        Width = 137
        Height = 17
        Caption = #1057#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel [3]
    Left = 473
    Top = 0
    Width = 248
    Height = 600
    Align = alRight
    TabOrder = 2
    ExplicitHeight = 583
    DesignSize = (
      248
      600)
    object SpeedButton3: TSpeedButton
      Left = 13
      Top = 521
      Width = 224
      Height = 25
      Action = ActAddEntity
      Anchors = [akLeft, akBottom]
      ExplicitTop = 504
    end
    object SpeedButton4: TSpeedButton
      Left = 13
      Top = 557
      Width = 224
      Height = 25
      Action = actDeleteEntity
      Anchors = [akLeft, akBottom]
      ExplicitTop = 540
    end
    object Label5: TLabel
      Left = 13
      Top = 4
      Width = 89
      Height = 13
      Caption = #1057#1091#1097#1085#1086#1089#1090#1080' '#1080' '#1087#1086#1083#1103':'
    end
    object Button3: TButton
      Left = 14
      Top = 473
      Width = 225
      Height = 25
      Action = actBuildQuery
      TabOrder = 2
      Visible = False
    end
    object PageControl1: TPageControl
      Left = 14
      Top = 65
      Width = 217
      Height = 248
      ActivePage = TabSheet2
      Style = tsFlatButtons
      TabOrder = 3
      Visible = False
      object TabSheet1: TTabSheet
        Caption = #1055#1086#1083#1103
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgeFields: TDBGridEh
          Left = 0
          Top = 0
          Width = 209
          Height = 217
          Align = alClient
          DataSource = dsFields
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          OnDblClick = ActAddEntityExecute
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1058#1072#1073#1083#1080#1094#1099
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgeEntities: TDBGridEh
          Left = 0
          Top = 0
          Width = 209
          Height = 217
          Align = alClient
          DataSource = dsEntities
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          OnDblClick = ActAddEntityExecute
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object dbcbeQMTables: TDBLookupComboboxEh
      Left = 28
      Top = 40
      Width = 185
      Height = 19
      DataField = ''
      EditButtons = <>
      Flat = True
      KeyField = 'ik_table'
      ListField = 'ctable_caption'
      ListSource = dsQMTables
      TabOrder = 0
      Visible = False
    end
    object Memo1: TMemo
      Left = 12
      Top = 256
      Width = 225
      Height = 211
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 1
      Visible = False
    end
    object tvFields: TTreeView
      Left = 13
      Top = 25
      Width = 224
      Height = 490
      Anchors = [akLeft, akTop, akBottom]
      BevelOuter = bvRaised
      BevelKind = bkFlat
      BorderStyle = bsNone
      Images = ilTV
      Indent = 19
      PopupMenu = ppmTV
      ReadOnly = True
      TabOrder = 4
      OnDblClick = tvFieldsDblClick
      ExplicitHeight = 473
    end
  end
  inherited actBaseDialog: TActionList
    Images = frmMain.ImageList1
    Left = 409
    Top = 4
    inherited actOK: TAction [0]
      ImageIndex = 11
      OnUpdate = actOKUpdate
    end
    inherited actApply: TAction [1]
    end
    object ActAddEntity: TAction
      Category = 'catEntity'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 21
      ShortCut = 16429
      OnExecute = ActAddEntityExecute
    end
    object actDeleteEntity: TAction
      Category = 'catEntity'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 22
      ShortCut = 16430
      OnExecute = actDeleteEntityExecute
    end
    object actBuildQuery: TAction
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      OnExecute = actBuildQueryExecute
    end
    object actAddFilter: TAction
      Category = 'catItem'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 0
      OnExecute = actAddFilterExecute
    end
    object actDeleteLastFilter: TAction
      Category = 'catItem'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 18
      OnExecute = actDeleteFilterExecute
      OnUpdate = actDeleteLastFilterUpdate
    end
    object actSort: TAction
      Category = 'catItem'
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1087#1086#1083#1102
      ImageIndex = 61
      OnExecute = actSortExecute
    end
    object actDelFilter: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Enabled = False
      OnExecute = actDelFilterExecute
      OnUpdate = actDelFilterUpdate
    end
  end
  object dsQMTables: TDataSource
    DataSet = QMDataModule.adodsQMTables
    Left = 440
    Top = 4
  end
  object QMPopup: TPopupMenu
    Images = frmMain.ImageList1
    OnPopup = QMPopupPopup
    Left = 376
    Top = 4
    object N1: TMenuItem
      Action = ActAddEntity
    end
    object N2: TMenuItem
      Action = actDeleteEntity
    end
    object N3: TMenuItem
      Action = actAddFilter
    end
    object N4: TMenuItem
      Action = actDeleteLastFilter
    end
    object OK1: TMenuItem
      Action = actSort
    end
  end
  object dsEntities: TDataSource
    DataSet = QMDataModule.adodsQMTables
    Left = 568
    Top = 36
  end
  object dsFields: TDataSource
    DataSet = QMDataModule.adodsQMAllFields
    Left = 568
    Top = 68
  end
  object ilTV: TImageList
    Left = 412
    Top = 36
    Bitmap = {
      494C010103000400080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1968F00666462006C6966006C6764006C6762006C645F006B635C006B61
      5A006B5F57006A5E54006B5D540060544A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8A89E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFAEE00FFF3
      E600FFEEDD00FFE8D400FFEED5006A5E5400937B6A0060463200634935006349
      350063493500634935006349350063493500634935006349350063493500684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8A89E00FFFFFF00FAD6C400FAD6C400FAD6C400FBF3EC00FAD6C400FAD6
      C400FAD6C400FAD6C400FFE0CD006A5E540097806F00FCFEFC00E7E6E400E7E2
      DC00E6DCD400E5D6CB00E4CFC100E3CAB800E3C5B100E2C2AC00C7AA9800684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096492400CCBEB4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8A89E00FFFFFF00FFFFFF00FFFEFD00FEFAF800FDF6F100FCF0EA00FBEB
      E200FAE6D900F9E0D100FFE4D1006A5E54009C857400FCFEFC00B09B8C00AA94
      8500FBF5EF00B6A19200B09A8C00AB958500A58F7F00F6DBC800C7AA9800684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009D4D25009D4E2800CCBE
      B400000000000000000000000000000000000000000080B2C20078AABC006DA0
      B200B8A89E00FFFFFF00FAD6C400FAD6C400FAD6C400FEF9F600FAD6C400FAD6
      C400FAD6C400FAD6C400FFE7D6006A5E5400A08A7A00FCFEFC00FCFEFC00FCFE
      FC00FBFAF700FBF5EF00FAEFE600F9E8DC00F7E1D100F6DBC800C8AE9C00684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF835D009247
      23009A4B25009A4B25009A4B25009A4B2500A24F2700AB542900BF6A3F00A050
      2A00CCBEB4000000000000000000000000006A95A60051B0D10084D5E800A1EB
      F600B8A89E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFBFA00FEF7F400FDF3
      ED00FCEEE500FAE8DC00FFEBDD006A5E5400A58F7F00FCFEFC00B09B8C00AA94
      8500FBFAF700B5A19200B09B8C00AA948500A48F7E00F7E1D100C8B2A200684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D78B6500FDAB
      8200F7905C00F7905C00F7905C00F28D5A00EC885600DE7F4F00D1764800C46E
      4200A2563100D6C1B30000000000000000006F9AAB004DD7FF0090EAFA00A1EB
      F600B8A89E00FFFFFF00FAD6C400FAD6C400FAD6C400FFFEFD00FAD6C400FAD6
      C400FAD6C400FAD6C400FFF0E3006A5E5400AA958500FCFEFC00FCFEFC00FCFE
      FC00FCFEFC00FCFEFC00FBFAF700FBF5F000FAF1E900F9E8DD00CAB8AB00684E
      3A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE926C00FCB9
      9700FDA57800FDA57800FDA57800FD9E6D00FC935E00F28C5900E5845300D87B
      4C00C66E4100AE582B00000000000000000076A0B0004CD2FA008DE4F600A1EB
      F600B8A89E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFB00FEF8F200FFFDF4006A5E5400AF9B8B00FCFEFC00DBCBC100E5DA
      D100FCFEFC00DCCAC100DCCAC100B0ADAC00415C7200FAF3EC00D4C9C1006A51
      3D00000000000000000000000000F4F7F4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4987200FBC3
      A600FBC3A600FDBE9E00FDBE9E00FDB79300FEAE8500FFA87D00F89D6F00E583
      5100AE582B000000000000000000000000007DA8B7004ED2FA008DE4F400A1EB
      F600B8A89E00FAD6C400F2CCB800ECBEA800E9BAA200E8B89F00E7B59C00E7B2
      9700E6AF9400E5AD8F00ECB191006A5E5400B4A09100FCFEFC00E2E9E9005E75
      8400DFE4E500FCFEFC00C2CACE004A6170002EA9D60023354700C2BEB9007F69
      58000000000000000000A8C1AB0041824C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E89C7600E296
      7000E2967000E2967000DA8E6800DA8E6800D1855F00DB906A00F79A6B00AE58
      2B000000000000000000000000000000000085AEBD004FD1FB008EE4F500A1EB
      F600B8A89E00FDBA9600F6AE8900EFA27900EA997000E7936900E58E6100E187
      5900DE815100DB7C4B00E07B48006A5E5400DF9D7D00F1CAB7008FA4AC0086D3
      E5004B617000A79289004A61700061C1DE004C616F0029B6E90015273300102C
      3A0017293500798187003D7443004BA761000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5997300C5764E000000
      0000000000000000000000000000000000008EB6C4004FD0F9008DE3F500A1EB
      F600B7AA9F00B8A89E00B8A89E00BD9E8D00C88B6D00C88B6D00BD806300B377
      5900A76B4E00A76B4E00A86D4F008B614C00DF9D7D00FFC5A400E5C9B9008FA4
      AC0083E1F6004B6170007ACDE2004C616F0065D2F200455D710032B2DF001D99
      C8001A88B3001F536D004F8458004CAC64000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E89C7600000000000000
      00000000000000000000000000000000000095BDCB004DD0F9008DE3F400A1EB
      F6006FD7F2001FB7EE0001A7E800039CDA00346F8F0000000000000000000000
      000000000000000000000000000000000000DF9D7D00DF9D7D00DF9D7D00DABA
      AA008FA4AC0083E1F6004B61700083E1F6003C59730065D2F20050C9EF003BBF
      EB0027B2E4001CA3D60064956E0053B46C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009BC3D00047CEF7008BE3F400A1EB
      F6006ED6F2001FB7EE0001A7E800039CDA003170920000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00E6EBEC008FA4AC0083E1F600405B720083E1F60077DBF40065D2F20050C9
      EF003BBFEB0029B6E90076A583005DC078000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A1C8D50056D4FA009CECFA00ABEF
      FA00A6EDF80094E7F80071D9F6003CBDE900437C970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E6EBEC008FA4AC0083E1F60083E1F60083E1F60077DBF40065D2
      F2005FB2CF007A8B9600AEC1A60093D39A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5CCD9009BDEEB00C5F9FD00C5F9
      FD00C5F9FD00C5F9FD00C5F9FD00A0DFEA006691A20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6EBEC008FA4AC008CA1A900889CA5008396A0007E90
      9A007A8B9600BFC8CD0099B89C00AEC1A6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5CCD9009FC6D40096BE
      CC008BB4C3007FA9B900759FAF006D97A700FEFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFF000FFFF0000FFFFF000000F0000
      FFFFF000000F0000FF9FF000000F0000FF8F8000000F0000C0070000000F0000
      C0030000000F0000C0030000000E0000C0070000000C0000C00F000000000000
      FF9F000000000000FFBF007F00000000FFFF007FE0000000FFFF007FF8000000
      FFFF007FFC000000FFFF807FFFFF000000000000000000000000000000000000
      000000000000}
  end
  object ppmFilters: TPopupMenu
    Left = 344
    Top = 4
    object N5: TMenuItem
      Action = actDelFilter
    end
  end
  object ppmTV: TPopupMenu
    Left = 344
    Top = 40
    object Cd1: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1105
      OnClick = Cd1Click
    end
    object N6: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1105
      OnClick = N6Click
    end
  end
  object sdSaveQuery: TSaveDialog
    DefaultExt = '*.qm'
    Filter = #1060#1072#1081#1083' '#1084#1072#1089#1090#1077#1088#1072' '#1079#1072#1087#1088#1086#1089#1086#1074'|*.qm'
    Left = 304
    Top = 8
  end
  object odLoadQuery: TOpenDialog
    DefaultExt = '*.qm'
    Filter = #1060#1072#1081#1083' '#1084#1072#1089#1090#1077#1088#1072' '#1079#1072#1087#1088#1086#1089#1086#1074'|*.qm'
    Left = 304
    Top = 40
  end
end
