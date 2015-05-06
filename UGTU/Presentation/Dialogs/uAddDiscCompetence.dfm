inherited frmAddDiscCompetence: TfrmAddDiscCompetence
  Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1080#1077' '#1082#1086#1084#1087#1077#1090#1077#1085#1094#1080#1081' '#1076#1083#1103' '#1076#1080#1089#1094#1080#1087#1083#1080#1085#1099
  ClientHeight = 462
  ClientWidth = 610
  ExplicitWidth = 616
  ExplicitHeight = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 584
    Height = 421
    ExplicitWidth = 610
    ExplicitHeight = 421
  end
  inherited Panel1: TPanel
    Top = 421
    Width = 610
    ExplicitTop = 421
    ExplicitWidth = 610
    inherited bbOK: TBitBtn
      Left = 353
      ExplicitLeft = 353
    end
    inherited bbApply: TBitBtn
      Left = 521
      ExplicitLeft = 521
    end
    inherited bbCancel: TBitBtn
      Left = 437
      ExplicitLeft = 437
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object dbgrCompetence: TDBGridEh [2]
    Left = 0
    Top = 0
    Width = 584
    Height = 421
    Align = alClient
    DataSource = dsGetCompetence
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    ImeMode = imDisable
    IndicatorOptions = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ik_competence'
        Footers = <>
        Visible = False
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'short_Name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
        Width = 77
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'InDiscStr'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1082#1083#1102#1095#1080#1090#1100
        Width = 80
        OnUpdateData = dbgrCompetenceColumns1UpdateData
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ik_structure_competence'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1084#1087#1077#1090#1077#1085#1094#1080#1103
        Visible = False
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'name_level_competence'
        Footers = <>
        Title.Caption = #1057#1086#1089#1090#1072#1074#1083#1103#1102#1097#1072#1103
        Width = 82
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'description_content'
        Footers = <>
        Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1077#1081
        Title.Hint = #1072' '#1095#1090#1086' '#1073#1091#1076#1077#1090' '#1077#1089#1083#1080' '#1089#1102#1076#1072' '#1095#1077#1075#1086'-'#1085#1080#1073#1091#1076#1100' '#1085#1072#1087#1080#1089#1072#1090#1100
        Width = 900
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ik_type_competence'
        Footers = <>
        Visible = False
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel2: TPanel [3]
    Left = 584
    Top = 0
    Width = 26
    Height = 421
    Align = alRight
    TabOrder = 2
    object ToolBar1: TToolBar
      Left = 1
      Top = 16
      Width = 24
      Height = 24
      Align = alNone
      Caption = 'ToolBar2'
      Constraints.MaxHeight = 24
      Constraints.MaxWidth = 24
      Constraints.MinHeight = 24
      Constraints.MinWidth = 24
      GradientEndColor = 13025726
      Images = imgCmptnc
      TabOrder = 0
    end
  end
  inherited actBaseDialog: TActionList
    Left = 145
    Top = 424
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
    inherited actOK: TAction
      OnUpdate = actOKUpdate
    end
  end
  object dsGetCompetence: TDataSource
    Left = 456
    Top = 232
  end
  object actStrCmptnc: TActionList
    Images = imgCmptnc
    Left = 200
    Top = 424
    object actEditStrCmptnc: TAction
      Caption = 'actEditStrCmptnc'
      Hint = #1059#1082#1072#1079#1072#1090#1100' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1082#1086#1084#1087#1077#1090#1077#1085#1094#1080#1080
      ImageIndex = 2
    end
  end
  object imgCmptnc: TImageList
    ShareImages = True
    Left = 248
    Top = 424
    Bitmap = {
      494C010103000400080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B39A8A0088705E00836A59007E66
      530079604D00745B4800705642006C523E00684E3900654B3600634833006348
      3300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC7000000000000000000000000000000000000000000D4CCC7006349
      3500634935006349350063493500634935006349350063493500634935006349
      3500D4CCC700000000000000000000000000B69C8F00FFFFFF00FFFFFF00FEFC
      FC00FDF9F700FCF4F000FAEFEA00F9EBE400F8E6DD00F6E1D700F5DCD1006348
      3300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8A49400F4E3
      DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCAB800EAC8
      B500634935000000000000000000000000000000000000000000B8A49400F4E3
      DA00E4CFC200DDC5B700D9BEAC00D8BCA900D7BAA700D7B9A500D6B7A300D6B6
      A20063493500000000000000000000000000BAA09300FFFFFF00FFFFFF00A690
      81009F8A79009A827100937B6B008C746300856D5A00F7E6DD00F6E1D700654A
      3500634833006348330000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00EBCA
      B800634935000000000000000000000000000000000000000000B8A49400F6E8
      E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCDBB00D6B7
      A30063493500000000000000000000000000BEA69800FFFFFF00FFFFFF00AB95
      860001FFFF005F7EF900CCFFCD00FF9900008A726000F8EAE400F7E5DD00684D
      3800F5DCD1006348330000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0BF00ECCD
      BB00634935000000000000000000000000000000000000000000B8A49400F8EC
      E500F6E8E000F4E3DA00F3DFD40063493500F0D7C900EED3C400EDD0BF00D7B9
      A50063493500000000000000000000000000C2AA9D00FFFFFF00FFFFFF00B09A
      8C00FF990000CCFFCD0033CB670001FFFF008E776500FAF0EB00F8EAE4006B51
      3C00F6E1D700654A350063483300634833000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7C900EED3C400EDD0
      BF00634935000000000000000000000000000000000000000000B9A59500F9F0
      EB00F8ECE500F6E8E000F4E3DA0063493500F1DBCF00F0D7C900EED3C400D7BA
      A70063493500000000000000000000000000C5AFA300FFFFFF00FFFFFF00B4A0
      9100AD988900A69181009F89790099827100937C6A00FCF4F000FBEFEA006E55
      4000F7E5DD00684D3800F5DCD100634833000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900EED3
      C400634935000000000000000000000000000000000000000000BCA69700FBF4
      F000F9F0EB006349350063493500634935006349350063493500F0D7C900D8BC
      A90063493500000000000000000000000000C9B4A900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FEF8F700FCF4F0007358
      4400F8EAE4006B513C00F6E1D700654A35000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DBCF00F0D7
      C900634935000000000000000000000000000000000000000000BEA89A00FCF7
      F500FBF4F000F9F0EB00F8ECE50063493500F4E3DA00F3DFD400F1DBCF00D9BE
      AC0063493500000000000000000000000000CDBAB000C9B4A800C5AEA300C0A9
      9D00BDA39600B89F9100B49B8C00B1978800AD948400AA908000A58B7B00A187
      7500FBEFEA006E554000F7E5DD00684D38000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DFD400F1DB
      CF00634935000000000000000000000000000000000000000000C0AB9C00FDFA
      F900FCF7F500FBF4F000F9F0EB0063493500F6E8E000F4E3DA00F3DFD400D9C0
      AF00634935000000000000000000000000000000000000000000C9B4A900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFB00FEF8
      F700FCF4F00073584400F8EAE4006B513C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00F3DF
      D400634935000000000000000000000000000000000000000000C3AC9D00FEFD
      FC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3DA00E1CD
      C000634935000000000000000000000000000000000000000000CDBAB000C9B4
      A800C5AEA300C0A99D00BDA39600B89F9100B49B8C00B1978800AD948400AA90
      8000A58B7B00A1877500FBEFEA006E5540000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA00634935000000000000000000000000000000000000000000C4AE9E00FFFF
      FF00FEFDFC00FDFAF900FCF7F500FBF4F000F9F0EB00F8ECE500F6E8E000F4E3
      DA00634935000000000000000000000000000000000000000000000000000000
      0000C9B4A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFCFB00FEF8F700FCF4F000735844000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFE8E400C3AD
      9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
      9400D4CCC7000000000000000000000000000000000000000000EFE8E400C3AD
      9E00C2AC9D00C0AB9C00BEA89900BBA79800BAA49600B8A39400B8A39400B8A3
      9400D4CCC7000000000000000000000000000000000000000000000000000000
      0000CDBAB000C9B4A800C5AEA300C0A99D00BDA39600B89F9100B49B8C00B197
      8800AD948400AA908000A58B7B00A18775000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFF000F0000C007C007000F0000C007C00700030000C007C00700030000
      C007C00700000000C007C00700000000C007C00700000000C007C00700000000
      C007C007C0000000C007C007C0000000C007C007F0000000C007C007F0000000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
