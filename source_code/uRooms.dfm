object frmRooms: TfrmRooms
  Left = 0
  Top = 0
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Room'
  ClientHeight = 534
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 17
  object Shape1: TShape
    Left = 0
    Top = 319
    Width = 433
    Height = 162
    Brush.Style = bsClear
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 336
    Width = 113
    Height = 105
    Caption = '# of Beds'
    TabOrder = 9
  end
  object SG1: TStringGrid
    Left = 0
    Top = 0
    Width = 920
    Height = 265
    Align = alTop
    ColCount = 7
    FixedCols = 0
    RowCount = 9
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goFixedRowClick, goFixedRowDefAlign]
    TabOrder = 0
    OnDblClick = SG1DblClick
    ExplicitWidth = 918
  end
  object CheckBox1: TCheckBox
    Left = 152
    Top = 343
    Width = 97
    Height = 17
    Caption = 'Vacant Only'
    TabOrder = 1
  end
  object CheckBox2: TCheckBox
    Left = 288
    Top = 343
    Width = 97
    Height = 17
    Caption = 'With Kitchen'
    TabOrder = 2
  end
  object CheckBox3: TCheckBox
    Left = 288
    Top = 366
    Width = 97
    Height = 17
    Caption = 'With Bath'
    TabOrder = 3
  end
  object CheckBox4: TCheckBox
    Left = 288
    Top = 389
    Width = 97
    Height = 17
    Caption = 'With Safe'
    TabOrder = 4
  end
  object CheckBox5: TCheckBox
    Left = 288
    Top = 412
    Width = 97
    Height = 17
    Caption = 'With TV'
    TabOrder = 5
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 359
    Width = 49
    Height = 17
    Caption = '1'
    TabOrder = 6
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 382
    Width = 49
    Height = 17
    Caption = '2'
    TabOrder = 7
  end
  object RadioButton3: TRadioButton
    Left = 24
    Top = 405
    Width = 49
    Height = 17
    Caption = '3'
    TabOrder = 8
  end
  object btnFilter: TButton
    Left = 456
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Filter'
    TabOrder = 10
    OnClick = btnFilterClick
  end
  object CheckBox6: TCheckBox
    Left = 288
    Top = 435
    Width = 97
    Height = 17
    Caption = 'With Fridge'
    TabOrder = 11
  end
  object DataSource1: TDataSource
    DataSet = dsRooms
    Left = 544
    Top = 320
  end
  object dsRooms: TFDQuery
    Connection = dm.con
    SQL.Strings = (
      'select * from rooms')
    Left = 544
    Top = 384
  end
end
