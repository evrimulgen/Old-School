inherited DBGridEhColumnsEditor: TDBGridEhColumnsEditor
  Top = 506
  Caption = 'DBGridEhColumnsEditor'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited ToolButton3: TToolButton
      Visible = False
    end
    object ToolButton6: TToolButton
      Left = 100
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 108
      Top = 2
      Action = AddAllFieldsCmd
    end
    object ToolButton8: TToolButton
      Left = 131
      Top = 2
      Action = RestoreDefaultsCmd
    end
  end
  inherited ActionList1: TActionList
    inherited MoveDownCmd: TAction
      Visible = False
    end
    inherited MoveUpCmd: TAction
      Visible = False
    end
    object AddAllFieldsCmd: TAction
      Caption = 'Add All &Fields'
      Hint = 'Add All Fields'
      ImageIndex = 5
      OnExecute = AddAllFieldsCmdExecute
      OnUpdate = AddAllFieldsCmdUpdate
    end
    object RestoreDefaultsCmd: TAction
      Caption = '&Restore Defaults'
      Hint = 'Restore Defaults'
      ImageIndex = 6
      OnExecute = RestoreDefaultsCmdExecute
      OnUpdate = RestoreDefaultsCmdUpdate
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N1: TMenuItem [5]
      Caption = '-'
    end
    object AddAllFields1: TMenuItem [6]
      Action = AddAllFieldsCmd
    end
    object RestoreDefaults1: TMenuItem [7]
      Action = RestoreDefaultsCmd
    end
  end
  inherited ImageList1: TImageList
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001800000000000024
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B7B0000000000007B7B7B0000000000007B7B7B
      0000000000007B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      00000000000000000000007B7B7B0000000000007B7B7B0000000000007B7B7B
      7B7B7B7B7B7B7B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007B00007B7B7B7B7B7B00000000000000000000000000000000
      00000000007B7B7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B000000
      0000007B7B7B7B7B7B7B7B7B7B7B7B0000000000007B7B7B7B7B7B0000007B7B
      7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000FF00007B00007B7B7B7B7B7B00000000000000000000000000
      00000000000000000000007B7B7B7B7B7B0000007B7B7B0000007B7B7B007B7B
      007B7B0000007B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B7B7B7B00000000000000000000
      00000000000000000000FF0000007B7B7B7B7B7B7B7B7B007B7B007B7B007B7B
      007B7B007B7B0000000000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00FF0000FF0000FF0000FF0000FF00007B00007B7B7B7B7B7B00000000000000
      00000000007B7B7B0000FF0000FF0000007B7B7B7B7B7B007B7B00FFFF007B7B
      007B7B007B7B007B7B7B7B7B7B7B7B0000000000007B7B7B7B7B7B0000007B7B
      7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF00007B00007B00007B000000000000000000000000
      00000000000000000000FF0000FF0000FF000000000000007B7B00FFFF00FFFF
      007B7B007B7B007B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      00000000000000000000FF0000FF00007B00007B00007B000000000000007B7B
      007B7B0000007B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      00000000007B7B7B0000FF0000FF00007B7B7B7B0000007B7B7B7B7B7B7B7B7B
      7B7B7B7B7B7B0000007B7B7B7B7B7B0000000000007B7B7B7B7B7B0000007B7B
      7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      00000000000000000000FF00007B0000000000007B7B7BFF00007B7B00FF0000
      0000007B7B7B7B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      00000000000000000000007B7B7B0000000000007B7B7B7B7B007B7B00FF0000
      0000007B7B7B7B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      00000000007B7B7B7B7B7B0000007B7B7B7B7B7B0000007B7B7BFF0000FF0000
      0000007B7B7B0000007B7B7B7B7B7B0000000000007B7B7B7B7B7B0000007B7B
      7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B0000007B7B7B7B7B7B00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF00007B000000000000000000000000000000000000
      00000000000000000000007B7B7B0000000000007B7B7B7B7B007B7B00FF0000
      7B00000000007B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B7B0000000000007B7B7B0000000000007B7B7B
      0000000000007B7B7B0000000000000000000000000000000000007B7B7B0000
      000000007B7B7B0000000000007B7B7B0000000000007B7B7B00000000000000
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
      0000000000000000000000000000000000000000000000007B7B7B7B7B7B7B7B
      7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B
      7B7B0000000000007B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B
      7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007B
      7B7B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007B7B7B0000000000000000000000000000
      000000007B7B7B7B7B7B7B7B7B7B7B7B7B7B7B00000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      000000000000000000000000000000000000000000000000FFFFFF00FFFFFFFF
      FF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000000000FFFFFF00FFFF0000007B
      7B7B000000000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
      000000000000FFFFFF00FFFF0000007B7B7B0000000000000000000000000000
      007B00007B00007B00007B00007B00007B7B7B00000000000000000000000000
      00000000000000000000000000000000000000000000007B00007B7B7B7B7B7B
      00000000000000000000000000000000000000000000000000FFFFFFFFFF00FF
      FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF000000FFBDBD000000FFFFFF0000007B
      7B7B7B7B7B00000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
      000000FFBDBD000000FFFFFF0000007B7B7B0000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      0000000000000000000000000000000000000000FF0000FF00007B00007B7B7B
      7B7B7B000000000000000000000000000000000000000000FFFFFF00FFFFFFFF
      FF00FFFFFFFFFF00FFFFFFFFFF00FFFF00000000FFFFFFBDBD0000000000007B
      7B7B00007B000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
      00000000FFFFFFBDBD0000000000007B7B7B0000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF00007B0000
      7B7B7B7B7B7B00000000000000000000000000000000000000FFFFFFFFFF00FF
      FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000000000000000000000000000007B
      7B7B00007B00007B00FFFFFFFFFF00FFFFFFFFFF7B7B7B00007B00FFFFFFFFFF
      0000000000000000000000000000007B7B7B0000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      0000000000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000
      7B00007B7B7B7B7B7B000000000000000000FFFFFF000000FFFFFF7B7B7B00FF
      FFFFFFFF00FFFFFFFFFF00FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007B
      7B7B7B7B7B00007B7B7B7B00FFFFFFFFFF7B7B7B00007B7B7B7BFFFFFF00FFFF
      FFFFFF00FFFFFFFFFF00FFFF0000007B7B7B0000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B00000000000000000000000000
      0000000000000000000000FF0000FF0000FF0000FF0000FF0000FF00007B0000
      7B00007B00000000000000000000000000007B7B7B00FFFF00FFFF7B7B7BFFFF
      FF00FFFF7B7B7B00FFFFFFFFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007B
      7B7B00000000007B00007B7B7B7B00FFFF00007B00007BFFFFFF00FFFFFFFFFF
      00FFFFFFFFFF00FFFFFFFFFF0000007B7B7B0000000000000000000000000000
      00FF0000FF0000FF0000FF00007B00007B7B7B7B7B7B7B7B7B00000000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF00007B0000
      7B7B7B0000000000000000000000000000000000007B7B7BFFFFFF7B7B7B00FF
      FF7B7B7B00FFFFFFFFFF00FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007B
      7B7B0000007B7B7B00007B00007B00007B00007BFFFFFF00FFFFFFFFFF00FFFF
      FFFFFF00FFFFFFFFFF00FFFF0000007B7B7B000000000000000000FF0000FF00
      00FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000000000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF00007B0000
      7B7B7B0000000000000000000000000000007B7B7B7B7B7B7B7B7BFFFFFF7B7B
      7BFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007B
      7B7B0000007B7B7B00007B00007B00007BFFFFFF00FFFFFFFFFF00FFFFFFFFFF
      00FFFFFFFFFF00FFFFFFFFFF0000007B7B7B000000000000000000000000FF00
      00FF0000FF0000FF0000FF0000FF0000FF000000000000000000000000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF00007B0000
      7B7B7B000000000000000000000000000000FFFFFF00FFFF7B7B7B00FFFFFFFF
      FF7B7B7B7B7B7B7B7B7B7B7B7B00000000000000000000000000000000000000
      00007B7B7B00007B00007B00007B00007B7B7B7B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF0000FF0000FF0000FF0000FF000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF00007B0000
      7B7B7B0000000000000000000000000000000000007B7B7B00FFFF7B7B7B00FF
      FF7B7B7B00FFFF00000000000000000000000000000000000000000000000000
      000000007B00007B7B7B7B00000000007B00007B7B7B7B000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000FF0000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF00007B0000
      7B7B7B0000000000000000000000000000007B7B7B00FFFF0000007B7B7BFFFF
      FF0000007B7B7B00FFFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000007B00007B7B7B7B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000FF0000FF0000FF00007B0000
      00000000000000000000000000000000000000FFFF0000000000007B7B7B00FF
      FF0000000000007B7B7B00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B00007B7B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007B7B7BFFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFFFEDB7EDB70000
      FF7FED87EDB70000FE3F800180010000FC1FE507EDB70000F80FC007EDB70000
      F007800180010000E00FC007EDB70000F81FC197EDB70000F81F800180010000
      F81FCC07EDB70000F81FEC07EDB70000F81F800180010000F83FEC17EDB70000
      FFFFEDB7EDB70000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFC000C000FFFFFFFF
      80008000FC1FFF7F80008000F81FFE3F80000000F81FFC1F80000000F81FF80F
      80000000F81FF00700000000F81FE00F00008000F807F81F80008000E00FF81F
      00008000F01FF81F00010001F83FF81F81FF11FFFC7FF81F24FFF8FFFEFFF83F
      66FFFC7FFFFFFFFFE7FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
