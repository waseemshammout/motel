object frmPayments: TfrmPayments
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Payments'
  ClientHeight = 548
  ClientWidth = 934
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
  OnDeactivate = FormDeactivate
  TextHeight = 15
  object Shape1: TShape
    Left = 40
    Top = 106
    Width = 809
    Height = 223
    Brush.Style = bsClear
  end
  object Label2: TLabel
    Left = 64
    Top = 28
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
    Left = 64
    Top = 124
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
    Left = 272
    Top = 206
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
    Left = 64
    Top = 206
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
    Left = 436
    Top = 124
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
    Left = 272
    Top = 124
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
    Left = 436
    Top = 205
    Width = 81
    Height = 14
    Caption = 'Exchange Rate'
    FocusControl = edExchangeRate
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 616
    Top = 205
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
  object Label9: TLabel
    Left = 649
    Top = 124
    Width = 92
    Height = 14
    Caption = 'Booking Balance'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 64
    Top = 144
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
    OnChange = DateTimePicker1Change
  end
  object edPaymentNum: TDBEdit
    Left = 64
    Top = 48
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
  object edAmount: TDBEdit
    Left = 272
    Top = 226
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
    OnKeyUp = edAmountKeyUp
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 523
    Width = 934
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alBottom
    TabOrder = 9
  end
  object cmbBooking: TDBLookupComboBox
    Left = 436
    Top = 144
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
    OnClick = cmbBookingClick
  end
  object cmbType: TDBComboBox
    Left = 272
    Top = 144
    Width = 145
    Height = 27
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
    Left = 64
    Top = 226
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
  object edExchangeRate: TDBEdit
    Left = 436
    Top = 226
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
    OnKeyUp = edExchangeRateKeyUp
  end
  object edUSDEquivalent: TDBEdit
    Left = 616
    Top = 226
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
    ReadOnly = True
    TabOrder = 8
  end
  object edBookingBalance: TEdit
    Left = 649
    Top = 144
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object edPaymentDate: TDBEdit
    Left = 64
    Top = 144
    Width = 169
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
  object tbPayments: TFDTable
    AfterInsert = tbPaymentsAfterInsert
    AfterEdit = tbPaymentsAfterEdit
    BeforePost = tbPaymentsBeforePost
    AfterPost = tbPaymentsAfterPost
    AfterScroll = tbPaymentsAfterScroll
    IndexFieldNames = 'payment_id'
    Connection = dm.con
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'payments'
    Left = 56
    Top = 376
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
    AutoEdit = False
    DataSet = tbPayments
    Left = 128
    Top = 376
  end
  object tbBooking: TFDTable
    Active = True
    IndexFieldNames = 'booking_id'
    Connection = dm.con
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'bookings'
    Left = 608
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = tbBooking
    Left = 672
    Top = 72
  end
  object dsBookingBalance: TFDQuery
    Connection = dm.con
    SQL.Strings = (
      'select sum(total_amount) balance'
      'from (select total_amount'
      '      from bookings'
      '      where booking_id = :BookingID'
      '      union'
      '      select - sum(usd_equivalent)'
      '      from payments'
      '      where booking_id = :BookingID)')
    Left = 776
    Top = 176
    ParamData = <
      item
        Name = 'BOOKINGID'
        ParamType = ptInput
      end>
  end
end
