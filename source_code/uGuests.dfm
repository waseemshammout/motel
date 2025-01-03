object frmGuests: TfrmGuests
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Guests'
  ClientHeight = 663
  ClientWidth = 1364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Roboto'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  TextHeight = 19
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 59
    Height = 19
    Caption = 'guest_id'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 72
    Top = 98
    Width = 78
    Height = 19
    Caption = 'First Name'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 190
    Top = 98
    Width = 77
    Height = 19
    Caption = 'Last Name'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 316
    Top = 98
    Width = 89
    Height = 19
    Caption = 'Date of Birth'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 434
    Top = 98
    Width = 94
    Height = 19
    Caption = 'Birth Country'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 552
    Top = 98
    Width = 40
    Height = 19
    Caption = 'ID No'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 678
    Top = 98
    Width = 55
    Height = 19
    Caption = 'ID Type'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 796
    Top = 98
    Width = 26
    Height = 19
    Caption = 'Sex'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 922
    Top = 98
    Width = 45
    Height = 19
    Caption = 'Phone'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 1040
    Top = 98
    Width = 40
    Height = 19
    Caption = 'Email'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 1160
    Top = 98
    Width = 66
    Height = 19
    Caption = 'Guardian'
    FocusControl = DBEdit11
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 638
    Width = 1364
    Height = 25
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 32
    Top = 56
    Width = 120
    Height = 27
    DataField = 'guest_id'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 72
    Top = 123
    Width = 120
    Height = 27
    DataField = 'first_name'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 190
    Top = 123
    Width = 120
    Height = 27
    DataField = 'last_name'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 316
    Top = 123
    Width = 120
    Height = 27
    DataField = 'date_of_birth'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 434
    Top = 123
    Width = 120
    Height = 27
    DataField = 'birth_country'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 552
    Top = 123
    Width = 120
    Height = 27
    DataField = 'id_number'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 676
    Top = 123
    Width = 120
    Height = 27
    DataField = 'id_type'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 796
    Top = 123
    Width = 120
    Height = 27
    DataField = 'sex'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 922
    Top = 123
    Width = 120
    Height = 27
    DataField = 'phone'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit10: TDBEdit
    Left = 1040
    Top = 123
    Width = 120
    Height = 27
    DataField = 'email'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBEdit11: TDBEdit
    Left = 1160
    Top = 123
    Width = 120
    Height = 27
    DataField = 'guardian_id'
    DataSource = DataSource1
    TabOrder = 11
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 152
    Width = 1305
    Height = 337
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Roboto'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'guest_id'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'first_name'
        Title.Caption = 'First Name'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'last_name'
        Title.Caption = 'Last Name'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_of_birth'
        Title.Caption = 'Date Of Birth'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'birth_country'
        Title.Caption = 'Birth Country'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_number'
        Title.Caption = 'ID No'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_type'
        Title.Caption = 'ID Type'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sex'
        Title.Caption = 'Sex'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Title.Caption = 'Phone'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'Email'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'guardian_id'
        Title.Caption = 'Guardian'
        Width = 120
        Visible = True
      end>
  end
  object btnSave: TButton
    Left = 32
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 13
    OnClick = btnSaveClick
  end
  object tbGuests: TFDTable
    Active = True
    CachedUpdates = True
    IndexFieldNames = 'guest_id'
    Connection = dm.con
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'guests'
    Left = 1056
    Top = 584
    object tbGuestsguest_id: TFDAutoIncField
      FieldName = 'guest_id'
      Origin = 'guest_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbGuestsfirst_name: TStringField
      FieldName = 'first_name'
      Origin = 'first_name'
      Size = 100
    end
    object tbGuestslast_name: TStringField
      FieldName = 'last_name'
      Origin = 'last_name'
      Size = 100
    end
    object tbGuestsdate_of_birth: TDateField
      FieldName = 'date_of_birth'
      Origin = 'date_of_birth'
    end
    object tbGuestsbirth_country: TStringField
      FieldName = 'birth_country'
      Origin = 'birth_country'
      Size = 100
    end
    object tbGuestsid_number: TStringField
      FieldName = 'id_number'
      Origin = 'id_number'
      Size = 100
    end
    object tbGuestsid_type: TStringField
      FieldName = 'id_type'
      Origin = 'id_type'
      Size = 100
    end
    object tbGuestssex: TStringField
      FieldName = 'sex'
      Origin = 'sex'
      Size = 100
    end
    object tbGuestsphone: TStringField
      FieldName = 'phone'
      Origin = 'phone'
      Size = 100
    end
    object tbGuestsemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object tbGuestsguardian_id: TIntegerField
      FieldName = 'guardian_id'
      Origin = 'guardian_id'
    end
    object tbGuestscreated_at: TSQLTimeStampField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
  end
  object DataSource1: TDataSource
    DataSet = tbGuests
    Left = 1008
    Top = 584
  end
end
