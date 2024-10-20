unit uBooking;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait;

type
  TfrmBooking = class(TForm)
    DataSource1: TDataSource;
    DTPcheckinDate: TDateTimePicker;
    DTPcheckoutDate: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edRatePerNight: TDBEdit;
    Label5: TLabel;
    cmbRoomNum: TComboBox;
    edSettledAmount: TDBEdit;
    LSettledAmount: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBNavigator1: TDBNavigator;
    edNights: TDBEdit;
    edTotalAmount: TDBEdit;
    Label9: TLabel;
    edBookingNo: TDBEdit;
    edCheckInDate: TDBEdit;
    edCheckOutDate: TDBEdit;
    tbBookings: TFDTable;
    dsVacantRooms: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DTPcheckinDateChange(Sender: TObject);
    procedure DTPcheckoutDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure cmbRoomNumChange(Sender: TObject);
    procedure cmbRoomNumDblClick(Sender: TObject);
    procedure edNights0Change(Sender: TObject);
    procedure dsBookingsBeforePost(DataSet: TDataSet);
    procedure tbBookingsBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    checkinDate, CheckoutDate: TDate;
    room_id: integer;
    nights: Extended;
  end;

var
  frmBooking: TfrmBooking;

implementation

{$R *.dfm}

uses uRooms, uMain, uDataModule;

function calc_total_amount(n_nights: integer; rate: real): real;
begin
  if (VarIsNull(n_nights)) or (VarIsNull(rate)) then
    Result := 0.0
  else
    Result := n_nights * rate;
end;

function calc_nights(checkIn: TDate; checkOut: TDate): Extended;
begin
  if checkIn >= checkOut then
    Result := 0
  else if VarIsNull(checkIn) or VarIsNull(checkOut) then
    Result := 0
  else
    Result := checkOut - checkIn;
end;

procedure TfrmBooking.cmbRoomNumChange(Sender: TObject);
begin
  with dsVacantRooms do
  begin
    Filter := 'room_number = ' + QuotedStr(cmbRoomNum.Text);
    Filtered := True;
    Open;
    tbBookings.FieldByName('room_id').Value := FieldByName('room_id').Value;
    tbBookings.FieldByName('rate_per_night').Value := FieldByName('standard_rate_per_night').Value;
    Close;
  end;
end;

procedure TfrmBooking.cmbRoomNumDblClick(Sender: TObject);
begin
  with frmRooms.dsRooms do
  begin
    Close;
    Filter := 'room_number = ' + QuotedStr(cmbRoomNum.Text);
    Filtered := True;
    Open;
    tbBookings.FieldByName('rate_per_night').Value := FieldByName('standard_rate_per_night').Value;
    Close;
  end;
end;

procedure TfrmBooking.dsBookingsBeforePost(DataSet: TDataSet);
begin
  ShowMessage(tbBookings.Command.SQLText);
end;

procedure TfrmBooking.DTPcheckinDateChange(Sender: TObject);
begin
  tbBookings.FieldByName('checkin_date').Value := DTPcheckinDate.Date;
//  edCheckInDate.Text := DateToStr(DTPcheckinDate.Date);
  edNights.Text := calc_nights(DTPcheckinDate.Date, DTPcheckoutDate.Date).ToString;
end;

procedure TfrmBooking.DTPcheckoutDateChange(Sender: TObject);
begin
  tbBookings.FieldByName('checkout_date').Value := DTPcheckoutDate.Date;
//  edCheckOutDate.Text := DateToStr(DTPcheckinDate.Date);
  edNights.Text := calc_nights(DTPcheckinDate.Date, DTPcheckoutDate.Date).ToString
end;

procedure TfrmBooking.edNights0Change(Sender: TObject);
begin
   edTotalAmount.Text := FloatToStr(calc_total_amount(StrToInt(edNights.Text),
   StrToFloat(edRatePerNight.Text)))
end;

procedure TfrmBooking.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmBooking := nil;
  Action := caFree;
end;

procedure TfrmBooking.FormCreate(Sender: TObject);
begin
  with dsVacantRooms do
  begin
    Close;
    Open;
    while not eof do
    begin
      cmbRoomNum.Items.Add(FieldByName('room_number').Value);
      Next;
    end;
    Close;
  end;
  tbBookings.Open;
end;

procedure TfrmBooking.Label4Click(Sender: TObject);
begin
  if not Assigned(frmRooms) then
    frmRooms := TfrmRooms.Create(self);
  frmRooms.Show;
end;

procedure TfrmBooking.Label4MouseEnter(Sender: TObject);
begin
  Label4.Color := clBlue;
end;

procedure TfrmBooking.Label4MouseLeave(Sender: TObject);
begin
  Label4.Color := clNone;
end;

procedure TfrmBooking.tbBookingsBeforePost(DataSet: TDataSet);
begin
 with tbBookings do
 begin
   FieldByName('nights').Value := calc_nights(FieldByName('checkin_date').Value, FieldByName('checkout_date').Value) ;
   FieldByName('total_amount').Value := FieldByName('nights').Value * FieldByName('rate_per_night').Value;
 end;
end;

end.