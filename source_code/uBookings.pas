unit uBookings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBookings = class(TForm)
    tbBookings: TFDTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    edBookingNum: TDBEdit;
    DataSource2: TDataSource;
    DBNavigator1: TDBNavigator;
    dsRooms: TFDQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    edStatus: TDBEdit;
    Label8: TLabel;
    Label5: TLabel;
    cmbRoomNo: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DTPCheckOut: TDateTimePicker;
    DTPCheckIn: TDateTimePicker;
    edNights: TDBEdit;
    edCheckInDate: TDBEdit;
    edCheckOutDate: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    edRatePerNight: TDBEdit;
    edTotalAmount: TDBEdit;
    edSettledAmount: TDBEdit;
    dsRoom: TFDQuery;
    ImageList1: TImageList;
    btnConfirm: TButton;
    btnCheckIn: TButton;
    btnCheckOut: TButton;
    btnCancel: TButton;
    btnSave: TButton;
    Label10: TLabel;
    edCreated: TDBEdit;
    Label11: TLabel;
    edConfirmed: TDBEdit;
    edCheckedIn: TDBEdit;
    Label12: TLabel;
    edCheckout: TDBEdit;
    Label13: TLabel;
    edCanceled: TDBEdit;
    Label14: TLabel;
    tbBookingsbooking_id: TFDAutoIncField;
    tbBookingsbooking_num: TStringField;
    tbBookingscheckin_date: TDateField;
    tbBookingscheckout_date: TDateField;
    tbBookingsnights: TIntegerField;
    tbBookingsroom_id: TIntegerField;
    tbBookingsrate_per_night: TFloatField;
    tbBookingstotal_amount: TFloatField;
    tbBookingsstatus: TStringField;
    tbBookingssettled_amount: TFloatField;
    tbBookingscreated_at: TSQLTimeStampField;
    tbBookingscheckedin_at: TSQLTimeStampField;
    tbBookingscheckedout_at: TSQLTimeStampField;
    tbBookingscanceled_at: TSQLTimeStampField;
    tbBookingsconfirmed_at: TSQLTimeStampField;
    BalloonHint1: TBalloonHint;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    btnAdd: TButton;
    btnDelete: TButton;
    sgGuests: TStringGrid;
    Button3: TButton;
    dsBookingGuests: TFDQuery;
    cmd: TFDCommand;
    procedure DTPCheckInChange(Sender: TObject);
    procedure DTPCheckOutChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbRoomNoCloseUp(Sender: TObject);
    procedure edRatePerNightKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmClick(Sender: TObject);
    procedure btnCheckInClick(Sender: TObject);
    procedure btnCheckOutClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure SyncBookingStatus();
    procedure tbBookingsAfterScroll(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBookings: TfrmBookings;

implementation

{$R *.dfm}

uses uDataModule, uMain, uRooms;

procedure TfrmBookings.SyncBookingStatus();
var
  NewStatus: string;
begin
  NewStatus := edStatus.Text;
  if (NewStatus = 'Pending') or (NewStatus = '') then
  begin
    btnSave.Enabled := True;
    btnConfirm.Enabled := True;
    btnCheckIn.Enabled := False;
    btnCheckOut.Enabled := False;
    btnCancel.Enabled := True;
    edRatePerNight.ReadOnly := False;
    edSettledAmount.ReadOnly := False;
    cmbRoomNo.Enabled := True;
    DTPCheckIn.Enabled := True;
    DTPCheckOut.Enabled := True;
  end
  else if NewStatus = 'Confirmed' then
  begin
    btnSave.Enabled := False;
    btnConfirm.Enabled := False;
    btnCheckIn.Enabled := True;
    btnCheckOut.Enabled := False;
    btnCancel.Enabled := True;
    edRatePerNight.ReadOnly := True;
    cmbRoomNo.Enabled := False;
    edSettledAmount.ReadOnly := False;
    DTPCheckIn.Enabled := False;
    DTPCheckOut.Enabled := False;
    btnSave.Enabled := True;
  end
  else if NewStatus = 'CheckedIn' then
  begin
    btnSave.Enabled := False;
    btnConfirm.Enabled := False;
    btnCheckIn.Enabled := False;
    btnCheckOut.Enabled := True;
    btnCancel.Enabled := True;
    edRatePerNight.ReadOnly := True;
    cmbRoomNo.Enabled := False;
    edSettledAmount.ReadOnly := True;
    DTPCheckIn.Enabled := False;
    DTPCheckOut.Enabled := False;
  end
  else // CheckedOut or Canceled
  begin
    btnSave.Enabled := False;
    btnConfirm.Enabled := False;
    btnCheckIn.Enabled := False;
    btnCheckOut.Enabled := False;
    btnCancel.Enabled := False;
    edRatePerNight.ReadOnly := True;
    cmbRoomNo.Enabled := False;
    edSettledAmount.ReadOnly := True;
    DTPCheckIn.Enabled := False;
    DTPCheckOut.Enabled := False;
  end;
end;

procedure TfrmBookings.tbBookingsAfterScroll(DataSet: TDataSet);
begin
  try
    SyncBookingStatus();
    DTPCheckIn.Date := StrToDate(edCheckInDate.Text);
    DTPCheckOut.Date := StrToDate(edCheckOutDate.Text);
    PageControl1.ActivePageIndex := 0;
  except
    on EConvertError do
    begin

    end;

  end;
end;

function GetNights(CheckIn: TDate; CheckOut: TDate): Extended;
begin
  if VarIsNull(CheckIn) or VarIsNull(CheckOut) or (CheckOut < CheckIn) then
    Result := 0
  else
    Result := CheckOut - CheckIn;
end;

procedure TfrmBookings.btnConfirmClick(Sender: TObject);
begin
  if MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    tbBookings.Edit;
    tbBookings.FieldByName('status').Value := 'Confirmed';
    tbBookings.FieldByName('confirmed_at').Value := Now;
    tbBookings.Post;
    tbBookings.Refresh;
    SyncBookingStatus();
  end;
end;

procedure TfrmBookings.btnDeleteClick(Sender: TObject);
begin
  if (sgGuests.Cells[0, sgGuests.Row] = '') or (sgGuests.Row = 0) then
    exit;
  if MessageDlg('Are you sure you want to delete the selected guest?', TMsgDlgType.mtConfirmation, mbYesNo, 0) = mrYes
  then
    with cmd do
    begin
      CommandText.Text := 'Delete from booking_guests_details where id = ' +
        sgGuests.Cells[0, sgGuests.Row];
      Execute();
      Button3Click(Self);
    end;
end;

procedure TfrmBookings.btnSaveClick(Sender: TObject);
begin
  if MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    tbBookings.Edit;
    tbBookings.Post;
    tbBookings.Refresh;
    SyncBookingStatus();
  end;
end;

procedure TfrmBookings.Button3Click(Sender: TObject);
var
  arr_cols_labels: TArray<string>;
  arr_cols_names: TArray<string>;
  arr_cols_sizes: TArray<integer>;
  c, r: integer;
begin
  // fill column names
  arr_cols_labels := ['ID', 'Guest ID', 'First Name', 'Last Name', 'Phone',
    'Email', 'Date of Birth', 'Birth Country', 'ID No.', 'ID Type', 'Guardian'];
  arr_cols_sizes := [20, 50, 100, 100, 150, 200, 150, 100, 100, 150, 50];
  arr_cols_names := ['id', 'guest_id', 'first_name', 'last_name', 'phone',
    'email', 'date_of_birth', 'birth_country', 'id_number', 'id_type',
    'guardian_id'];
  for c in [0 .. 10] do
  begin
    sgGuests.Cols[c].Text := arr_cols_labels[c];
    sgGuests.ColWidths[c] := arr_cols_sizes[c];
  end;
  // loop through guest_details dataset and populate it
  r := 1; // start from second row as the first is reserved for column headers
  with dsBookingGuests do
  begin
    Close;
    ParamByName('pBookingID').Value := tbBookings.FieldByName
      ('booking_id').Value;
    Open;
    sgGuests.RowCount := RecordCount + 1;
    while not eof do
    begin
      for c in [0 .. 10] do
        if Not VarIsNull(FieldByName(arr_cols_names[c]).Value) then
          sgGuests.Cells[c, r] := FieldByName(arr_cols_names[c]).Value;
      Next;
      Inc(r);
    end;
  end;

end;

procedure TfrmBookings.btnCheckInClick(Sender: TObject);
begin
  with tbBookings do
  begin
    if FieldByName('total_amount').Value > FieldByName('settled_amount').Value
    then
    begin
      Beep;
      ShowMessage
        ('Unable to change the booking status to check-in before settling the total amount.');
      exit;
    end;
  end;

  if MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    tbBookings.Edit;
    tbBookings.FieldByName('status').Value := 'CheckedIn';
    tbBookings.FieldByName('checkedin_at').Value := Now;
    tbBookings.Post;
    tbBookings.Refresh;
    SyncBookingStatus();
  end;
end;

procedure TfrmBookings.btnCheckOutClick(Sender: TObject);
begin
  if MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    tbBookings.Edit;
    tbBookings.FieldByName('status').Value := 'CheckedOut';
    tbBookings.FieldByName('checkedout_at').Value := Now;
    tbBookings.Post;
    tbBookings.Refresh;
    SyncBookingStatus();
  end;
end;

procedure TfrmBookings.btnCancelClick(Sender: TObject);
begin
  if MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    tbBookings.Edit;
    tbBookings.FieldByName('status').Value := 'Canceled';
    tbBookings.FieldByName('canceled_at').Value := Now;
    tbBookings.Post;
    tbBookings.Refresh;
    SyncBookingStatus();
  end;
end;

procedure TfrmBookings.cmbRoomNoCloseUp(Sender: TObject);
var
  SelectedRoom: integer;
begin
  try
    SelectedRoom := cmbRoomNo.KeyValue;
    with dsRoom do
    begin
      Close;
      SQL.Text := 'Select * From rooms where room_id=' + SelectedRoom.ToString;
      Open;
      tbBookings.FieldByName('rate_per_night').Value :=
        FieldByName('standard_rate_per_night').Value;
    end;
  except
    on e: EDatabaseError do
    begin

    end;
  end;
end;

procedure TfrmBookings.DTPCheckInChange(Sender: TObject);
begin
  with tbBookings do
  begin
    FieldByName('checkin_date').Value := DTPCheckIn.Date;
    FieldByName('nights').Value := GetNights(DTPCheckIn.Date, DTPCheckOut.Date);
    FieldByName('total_amount').Value := FieldByName('nights').Value *
      FieldByName('rate_per_night').Value;
  end;
end;

procedure TfrmBookings.DTPCheckOutChange(Sender: TObject);
begin
  with tbBookings do
  begin
    FieldByName('checkout_date').Value := DTPCheckOut.Date;
    FieldByName('nights').Value := GetNights(DTPCheckIn.Date, DTPCheckOut.Date);
    FieldByName('total_amount').Value := FieldByName('nights').Value *
      FieldByName('rate_per_night').Value;
  end;
end;

procedure TfrmBookings.edRatePerNightKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    with tbBookings do
    begin
      FieldByName('total_amount').Value := FieldByName('nights').Value *
        edRatePerNight.Text;
    end;
  except
    on EVariantTypeCastError do;
    on EDatabaseError do;
  end;
end;

procedure TfrmBookings.FormCreate(Sender: TObject);
begin
  SyncBookingStatus();
  tbBookings.Open;
  dsRooms.Open;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmBookings.PageControl1Change(Sender: TObject);
begin
  Button3Click(Self);
end;

end.