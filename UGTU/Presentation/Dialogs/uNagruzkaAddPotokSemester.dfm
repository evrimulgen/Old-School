inherited frmAddPotokSemester: TfrmAddPotokSemester
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1087#1086#1090#1086#1082#1086#1074' '#1074' '#1089#1077#1084#1077#1089#1090#1088
  ClientHeight = 482
  ClientWidth = 481
  ExplicitWidth = 487
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 41
    Width = 481
    Height = 400
    ExplicitTop = 2
    ExplicitWidth = 449
    ExplicitHeight = 441
  end
  inherited Panel1: TPanel
    Top = 441
    Width = 481
    ExplicitTop = 441
    ExplicitWidth = 481
    inherited bbOK: TBitBtn
      Left = 221
      Top = 6
      ExplicitLeft = 221
      ExplicitTop = 6
    end
    inherited bbApply: TBitBtn
      Left = 395
      Top = 6
      ExplicitLeft = 395
      ExplicitTop = 6
    end
    inherited bbCancel: TBitBtn
      Left = 308
      ExplicitLeft = 308
    end
    inherited bbSprav: TBitBtn
      Visible = False
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 481
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 191
      Top = 10
      Width = 50
      Height = 13
      Caption = #1057#1077#1084#1077#1089#1090#1088' :'
    end
    object Label2: TLabel
      Left = 8
      Top = 10
      Width = 24
      Height = 13
      Caption = #1043#1086#1076' :'
    end
    object dbcbSemester: TDBLookupComboboxEh
      Left = 247
      Top = 7
      Width = 190
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 0
      Visible = True
      OnKeyValueChanged = dbcbSemesterKeyValueChanged
    end
    object dbcbYear: TDBLookupComboboxEh
      Left = 56
      Top = 7
      Width = 129
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      TabOrder = 1
      Visible = True
      OnKeyValueChanged = dbcbYearKeyValueChanged
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 41
    Width = 481
    Height = 400
    Align = alClient
    TabOrder = 2
    DesignSize = (
      481
      400)
    object sbAddManySpec: TSpeedButton
      Left = 223
      Top = 31
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Enabled = False
      Flat = True
      Glyph.Data = {
        06030000424D060300000000000036000000280000000F0000000F0000000100
        180000000000D0020000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FF000000000000C0C0C0FF00FFFF00FFFF00FF00
        0000000000C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF000000
        000000000000C0C0C0FF00FFFF00FF000000000000000000C0C0C0FF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FF000000000000000000C0C0C0FF00FFFF
        00FF000000000000000000C0C0C0FF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FF000000000000000000C0C0C0FF00FFFF00FF000000000000000000C0C0
        C0FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF000000000000000000C0
        C0C0FF00FFFF00FF000000000000000000C0C0C0FF00FF000000FF00FFFF00FF
        FF00FF000000000000000000C0C0C0FF00FFFF00FF000000000000000000C0C0
        C0FF00FFFF00FF000000FF00FFFF00FF000000000000000000C0C0C0FF00FFFF
        00FF000000000000000000C0C0C0FF00FFFF00FFFF00FF000000FF00FF000000
        000000000000C0C0C0FF00FFFF00FF000000000000000000C0C0C0FF00FFFF00
        FFFF00FFFF00FF000000FF00FF000000000000C0C0C0FF00FFFF00FFFF00FF00
        0000000000C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000}
      OnClick = sbAddManySpecClick
    end
    object sbAddOneSpec: TSpeedButton
      Left = 223
      Top = 62
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Enabled = False
      Flat = True
      Glyph.Data = {
        06030000424D060300000000000036000000280000000F0000000F0000000100
        180000000000D0020000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000000000C0
        C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FF000000000000000000C0C0C0FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000
        0000000000C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000C0C0C0FF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF000000000000000000C0C0C0FF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000C0C0C0FF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000
        0000000000C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FF000000000000000000C0C0C0FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000000000C0
        C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000}
      OnClick = sbAddOneSpecClick
    end
    object sbDelOneSpec: TSpeedButton
      Left = 223
      Top = 93
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Enabled = False
      Flat = True
      Glyph.Data = {
        06030000424D060300000000000036000000280000000F0000000F0000000100
        180000000000D0020000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0
        C0C0000000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC0C0C0000000000000000000FF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFC0C0C000000000
        0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFC0C0C0000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFC0C0C0000000000000000000FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFC0C0C0000000000000000000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFC0C0C000000000
        0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC0C0C0000000000000000000FF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0
        C0C0000000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000}
      OnClick = sbDelOneSpecClick
    end
    object sbDelManySpec: TSpeedButton
      Left = 223
      Top = 124
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Enabled = False
      Flat = True
      Glyph.Data = {
        06030000424D060300000000000036000000280000000F0000000F0000000100
        180000000000D0020000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFC0C0C000000000
        0000FF00FFFF00FFFF00FFC0C0C0000000000000FF00FF000000FF00FFFF00FF
        FF00FFFF00FFC0C0C0000000000000000000FF00FFFF00FFC0C0C00000000000
        00000000FF00FF000000FF00FFFF00FFFF00FFC0C0C0000000000000000000FF
        00FFFF00FFC0C0C0000000000000000000FF00FFFF00FF000000FF00FFFF00FF
        C0C0C0000000000000000000FF00FFFF00FFC0C0C0000000000000000000FF00
        FFFF00FFFF00FF000000FF00FFC0C0C0000000000000000000FF00FFFF00FFC0
        C0C0000000000000000000FF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        C0C0C0000000000000000000FF00FFFF00FFC0C0C0000000000000000000FF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFC0C0C0000000000000000000FF
        00FFFF00FFC0C0C0000000000000000000FF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFC0C0C0000000000000000000FF00FFFF00FFC0C0C00000000000
        00000000FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFC0C0C000000000
        0000FF00FFFF00FFFF00FFC0C0C0000000000000FF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF000000}
      OnClick = sbDelManySpecClick
    end
    object ListBox1: TListBox
      Left = 8
      Top = 6
      Width = 209
      Height = 365
      Style = lbOwnerDrawFixed
      Anchors = [akLeft, akTop, akBottom]
      ItemHeight = 17
      MultiSelect = True
      TabOrder = 0
      TabWidth = 2
      OnClick = ListBox1Click
    end
    object ListBox2: TListBox
      Left = 254
      Top = 6
      Width = 209
      Height = 365
      Style = lbOwnerDrawFixed
      Anchors = [akLeft, akTop, akBottom]
      ItemHeight = 17
      MultiSelect = True
      TabOrder = 1
      TabWidth = 2
      OnClick = ListBox2Click
    end
  end
  inherited actBaseDialog: TActionList
    Left = 401
    inherited actApply: TAction
      OnUpdate = actApplyUpdate
    end
  end
end
