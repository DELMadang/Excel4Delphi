object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'MakeXLSX'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbRows: TLabel
    Left = 16
    Top = 16
    Width = 51
    Height = 15
    Caption = #54665#51032' '#44079#49688
  end
  object eRowCount: TEdit
    Left = 80
    Top = 13
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 0
    Text = '100000'
  end
  object btnExport: TButton
    Left = 207
    Top = 12
    Width = 75
    Height = 25
    Caption = #49373#49457
    TabOrder = 1
    OnClick = btnExportClick
  end
  object eLog: TMemo
    Left = 8
    Top = 43
    Width = 608
    Height = 390
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
