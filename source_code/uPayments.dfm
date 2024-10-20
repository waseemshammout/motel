object frmPayments: TfrmPayments
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Payments'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  TextHeight = 15
  object Label2: TLabel
    Left = 88
    Top = 92
    Width = 69
    Height = 14
    Caption = 'Payment No.'
    FocusControl = edPaymentNum
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 226
    Top = 92
    Width = 25
    Height = 14
    Caption = 'Date'
    FocusControl = edPaymentDate
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 88
    Top = 148
    Width = 26
    Height = 14
    Caption = 'Type'
    FocusControl = edPaymentType
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 226
    Top = 148
    Width = 43
    Height = 14
    Caption = 'Amount'
    FocusControl = edAmount
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 88
    Top = 207
    Width = 48
    Height = 14
    Caption = 'Currency'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object edPaymentNum: TDBEdit
    Left = 88
    Top = 112
    Width = 100
    Height = 27
    DataField = 'payment_num'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edPaymentDate: TDBEdit
    Left = 226
    Top = 112
    Width = 100
    Height = 27
    DataField = 'payment_date'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edPaymentType: TDBEdit
    Left = 88
    Top = 168
    Width = 100
    Height = 27
    DataField = 'payment_type'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edAmount: TDBEdit
    Left = 226
    Top = 168
    Width = 100
    Height = 27
    DataField = 'amount'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBComboBox1: TDBComboBox
    Left = 88
    Top = 227
    Width = 145
    Height = 27
    DataField = 'currency'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object tbPayments: TFDTable
    IndexFieldNames = 'payment_id'
    Connection = dm.con
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'payments'
    Left = 392
    Top = 432
    object tbPaymentspayment_id: TFDAutoIncField
      FieldName = 'payment_id'
      Origin = 'payment_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tbPaymentspayment_num: TStringField
      FieldName = 'payment_num'
      Origin = 'payment_num'
      Size = 100
    end
    object tbPaymentspayment_date: TDateField
      FieldName = 'payment_date'
      Origin = 'payment_date'
    end
    object tbPaymentspayment_type: TStringField
      FieldName = 'payment_type'
      Origin = 'payment_type'
      Size = 100
    end
    object tbPaymentsamount: TFloatField
      FieldName = 'amount'
      Origin = 'amount'
    end
    object tbPaymentscurrency: TStringField
      FieldName = 'currency'
      Origin = 'currency'
      Size = 10
    end
    object tbPaymentsbooking_id: TIntegerField
      FieldName = 'booking_id'
      Origin = 'booking_id'
      Required = True
    end
    object tbPaymentscreated_at: TSQLTimeStampField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
  end
  object DataSource1: TDataSource
    DataSet = tbPayments
    Left = 448
    Top = 432
  end
end
