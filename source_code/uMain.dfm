object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Motel System'
  ClientHeight = 667
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  FormStyle = fsMDIForm
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 23
  object StatusBar1: TStatusBar
    Left = 0
    Top = 648
    Width = 1076
    Height = 19
    Panels = <>
    StyleName = 'Charcoal Dark Slate'
    ExplicitTop = 644
    ExplicitWidth = 1074
  end
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 185
    Height = 511
    Align = alLeft
    BevelOuter = bvNone
    Color = clBtnText
    ParentBackground = False
    TabOrder = 1
    StyleName = 'Charcoal Dark Slate'
    ExplicitHeight = 507
    object btnExit: TBitBtn
      Left = 0
      Top = 438
      Width = 185
      Height = 73
      Align = alBottom
      Caption = 'Exit'
      TabOrder = 0
      StyleName = 'Charcoal Dark Slate'
      OnClick = btnExitClick
      ExplicitTop = 434
    end
    object btnPayments: TBitBtn
      Left = 0
      Top = 219
      Width = 185
      Height = 73
      Align = alTop
      Caption = 'Payments'
      TabOrder = 1
      StyleName = 'Charcoal Dark Slate'
      OnClick = btnPaymentsClick
    end
    object btnGuests: TBitBtn
      Left = 0
      Top = 146
      Width = 185
      Height = 73
      Align = alTop
      Caption = 'Guests'
      TabOrder = 2
      StyleName = 'Charcoal Dark Slate'
      OnClick = btnGuestsClick
    end
    object btnBookings: TBitBtn
      Left = 0
      Top = 73
      Width = 185
      Height = 73
      Align = alTop
      Caption = 'Bookings'
      TabOrder = 3
      StyleName = 'Charcoal Dark Slate'
      OnClick = btnBookingsClick
    end
    object btnRooms: TBitBtn
      Left = 0
      Top = 0
      Width = 185
      Height = 73
      Align = alTop
      Caption = 'Rooms'
      TabOrder = 4
      StyleName = 'Charcoal Dark Slate'
      OnClick = btnRoomsClick
    end
    object btnSettings: TBitBtn
      Left = 0
      Top = 292
      Width = 185
      Height = 73
      Align = alTop
      Caption = 'Settings'
      TabOrder = 5
      StyleName = 'Charcoal Dark Slate'
    end
    object btnReports: TBitBtn
      Left = 0
      Top = 365
      Width = 185
      Height = 73
      Align = alTop
      Caption = 'Reports'
      TabOrder = 6
      StyleName = 'Charcoal Dark Slate'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1076
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    StyleName = 'Charcoal Dark Slate'
    ExplicitWidth = 1074
  end
  object Panel3: TPanel
    Left = 0
    Top = 129
    Width = 1076
    Height = 8
    Align = alTop
    TabOrder = 3
    StyleName = 'Charcoal Dark Slate'
    ExplicitWidth = 1074
  end
  object Panel4: TPanel
    Left = 185
    Top = 137
    Width = 8
    Height = 511
    Align = alLeft
    TabOrder = 4
    StyleName = 'Charcoal Dark Slate'
    ExplicitHeight = 507
  end
end
