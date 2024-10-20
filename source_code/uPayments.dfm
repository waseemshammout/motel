object frmPayments: TfrmPayments
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Payments'
  ClientHeight = 480
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Default'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Label2: TLabel
    Left = 8
    Top = 20
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
    Left = 8
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
  object Label5: TLabel
    Left = 216
    Top = 174
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
    Left = 8
    Top = 174
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
  object Label1: TLabel
    Left = 380
    Top = 92
    Width = 45
    Height = 14
    Caption = 'Booking'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 216
    Top = 92
    Width = 26
    Height = 14
    Caption = 'Type'
    FocusControl = edAmount
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 380
    Top = 173
    Width = 81
    Height = 14
    Caption = 'Exchange Rate'
    FocusControl = dbExchangeRate
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 560
    Top = 173
    Width = 83
    Height = 14
    Caption = 'USD Equivalent'
    FocusControl = edUSDEquivalent
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object edPaymentNum: TDBEdit
    Left = 8
    Top = 40
    Width = 137
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
    Left = 8
    Top = 145
    Width = 181
    Height = 27
    DataField = 'payment_date'
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
    Left = 216
    Top = 194
    Width = 127
    Height = 27
    DataField = 'amount'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 307
    Width = 490
    Height = 25
    DataSource = DataSource1
    TabOrder = 9
  end
  object cmbBooking: TDBLookupComboBox
    Left = 380
    Top = 112
    Width = 193
    Height = 27
    DataField = 'booking_id'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    KeyField = 'booking_id'
    ListField = 'booking_num'
    ListSource = DataSource2
    ParentFont = False
    TabOrder = 4
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 112
    Width = 186
    Height = 27
    Date = 45585.000000000000000000
    Time = 0.919667025460512400
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object cmbType: TDBComboBox
    Left = 216
    Top = 112
    Width = 145
    Height = 27
    Style = csDropDownList
    DataField = 'payment_type'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    Items.Strings = (
      'Cash'
      'Credit Card'
      'Crypto')
    ParentFont = False
    TabOrder = 3
    OnChange = cmbTypeChange
  end
  object cmbCurrency: TDBComboBox
    Left = 8
    Top = 194
    Width = 181
    Height = 27
    DataField = 'currency'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object dbExchangeRate: TDBEdit
    Left = 380
    Top = 194
    Width = 154
    Height = 27
    DataField = 'exchange_rate'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object edUSDEquivalent: TDBEdit
    Left = 560
    Top = 194
    Width = 154
    Height = 27
    DataField = 'usd_equivalent'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object tbPayments: TFDTable
    AfterScroll = tbPaymentsAfterScroll
    IndexFieldNames = 'payment_id'
    Connection = dm.con
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'payments'
    Left = 24
    Top = 344
    object tbPaymentspayment_id: TFDAutoIncField
      FieldName = 'payment_id'
      Origin = 'payment_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
    object tbPaymentsexchange_rate: TFloatField
      FieldName = 'exchange_rate'
      Origin = 'exchange_rate'
      Required = True
    end
    object tbPaymentsusd_equivalent: TFloatField
      FieldName = 'usd_equivalent'
      Origin = 'usd_equivalent'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = tbPayments
    Left = 96
    Top = 344
  end
  object tbBooking: TFDTable
    Active = True
    IndexFieldNames = 'booking_id'
    Connection = dm.con
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'bookings'
    Left = 576
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = tbBooking
    Left = 640
    Top = 104
  end
end
