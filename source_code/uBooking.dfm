object frmBooking: TfrmBooking
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Booking'
  ClientHeight = 291
  ClientWidth = 857
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 23
  object Label1: TLabel
    Left = 40
    Top = 27
    Width = 67
    Height = 23
    Caption = 'Check-in'
  end
  object Label2: TLabel
    Left = 224
    Top = 27
    Width = 79
    Height = 23
    Caption = 'Check-out'
  end
  object Label3: TLabel
    Left = 456
    Top = 32
    Width = 77
    Height = 23
    Caption = 'Room No.'
  end
  object Label4: TLabel
    Left = 551
    Top = 59
    Width = 100
    Height = 23
    Cursor = crHandPoint
    Caption = 'Go to Rooms'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label4Click
    OnMouseEnter = Label4MouseEnter
    OnMouseLeave = Label4MouseLeave
  end
  object Label5: TLabel
    Left = 224
    Top = 131
    Width = 112
    Height = 23
    Caption = 'Rate per Night'
  end
  object LSettledAmount: TLabel
    Left = 664
    Top = 131
    Width = 120
    Height = 23
    Caption = 'Settled Amount'
  end
  object Label6: TLabel
    Left = 40
    Top = 131
    Width = 50
    Height = 23
    Caption = 'Nights'
  end
  object Label7: TLabel
    Left = 184
    Top = 163
    Width = 10
    Height = 23
    Caption = 'X'
  end
  object Label8: TLabel
    Left = 456
    Top = 131
    Width = 103
    Height = 23
    Caption = 'Total Amount'
  end
  object Label9: TLabel
    Left = 664
    Top = 27
    Width = 90
    Height = 23
    Caption = 'Booking No'
  end
  object DTPcheckoutDate: TDateTimePicker
    Left = 224
    Top = 56
    Width = 169
    Height = 31
    Date = 45570.000000000000000000
    Time = 0.061313888887525540
    TabOrder = 1
    OnChange = DTPcheckoutDateChange
  end
  object DTPcheckinDate: TDateTimePicker
    Left = 40
    Top = 56
    Width = 154
    Height = 31
    Date = 45570.000000000000000000
    Time = 0.061313888887525540
    TabOrder = 0
    OnChange = DTPcheckinDateChange
  end
  object edRatePerNight: TDBEdit
    Left = 224
    Top = 160
    Width = 186
    Height = 31
    DataField = 'rate_per_night'
    DataSource = DataSource1
    TabOrder = 2
  end
  object cmbRoomNum: TComboBox
    Left = 456
    Top = 56
    Width = 89
    Height = 31
    TabOrder = 3
    OnChange = cmbRoomNumChange
    OnDblClick = cmbRoomNumDblClick
  end
  object edSettledAmount: TDBEdit
    Left = 664
    Top = 160
    Width = 186
    Height = 31
    DataField = 'settled_amount'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 240
    Width = 600
    Height = 25
    DataSource = DataSource1
    TabOrder = 5
  end
  object edNights: TDBEdit
    Left = 40
    Top = 160
    Width = 120
    Height = 31
    DataField = 'nights'
    DataSource = DataSource1
    TabOrder = 6
  end
  object edTotalAmount: TDBEdit
    Left = 456
    Top = 160
    Width = 186
    Height = 31
    DataField = 'total_amount'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
  end
  object edBookingNo: TDBEdit
    Left = 664
    Top = 56
    Width = 186
    Height = 31
    DataField = 'booking_num'
    DataSource = DataSource1
    TabOrder = 8
  end
  object edCheckOutDate: TDBEdit
    Left = 224
    Top = 56
    Width = 153
    Height = 31
    DataField = 'checkout_date'
    DataSource = DataSource1
    TabOrder = 10
  end
  object edCheckInDate: TDBEdit
    Left = 40
    Top = 56
    Width = 137
    Height = 31
    DataField = 'checkin_date'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DataSource1: TDataSource
    DataSet = tbBookings
    Left = 664
    Top = 200
  end
  object tbBookings: TFDTable
    BeforePost = tbBookingsBeforePost
    IndexFieldNames = 'booking_id'
    Connection = dm.con
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'bookings'
    Left = 728
    Top = 200
  end
  object dsVacantRooms: TFDQuery
    Connection = dm.con
    SQL.Strings = (
      'select * from rooms where room_status = '#39'Vacant'#39)
    Left = 544
    Top = 8
  end
end
