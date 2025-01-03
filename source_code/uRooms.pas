unit uRooms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmRooms = class(TForm)
    DataSource1: TDataSource;
    SG1: TStringGrid;
    Shape1: TShape;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    btnFilter: TButton;
    CheckBox6: TCheckBox;
    dsRooms: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure RefreshRooms();
    procedure SG1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    sql_statement: string;
  end;

var
  frmRooms: TfrmRooms;

implementation

{$R *.dfm}

uses uMain, uDataModule;

procedure TfrmRooms.RefreshRooms();
var
  r, beds, max_cap: integer;
  room_no, description, status: string;
  rate: Real;
  tempTxt: string;
begin
  with dsRooms do
  begin
    Open;
    r := 1;
    while not Eof do
    begin
      // populate variables
      room_no := FieldByName('room_number').Value;
      description := FieldByName('description').Value;
      status := FieldByName('room_status').Value;
      beds := FieldByName('beds').Value;
      rate := FieldByName('standard_rate_per_night').Value;
      max_cap := FieldByName('max_capacity_guests').Value;

      if FieldByName('has_kitchen').Value = True then
        tempTxt := tempTxt + ' Kitchin,';
      if FieldByName('has_bath').Value = True then
        tempTxt := tempTxt + ' Bath,';
      if FieldByName('has_fridge').Value = True then
        tempTxt := tempTxt + ' Fridge,';
      if FieldByName('has_safe').Value = True then
        tempTxt := tempTxt + ' Safe,';
      if FieldByName('has_tv').Value = True then
        tempTxt := tempTxt + 'TV,';

      // populate rows of the string grid

      SG1.Cells[0, r] := room_no;
      SG1.Cells[1, r] := description;
      SG1.Cells[2, r] := status;
      SG1.Cells[3, r] := beds.ToString;
      SG1.Cells[4, r] := FloatToStr((rate));
      SG1.Cells[5, r] := tempTxt;
      SG1.Cells[6, r] := max_cap.ToString;
      Inc(r);
      tempTxt := '';
      Next;
    end;
  end;
end;

procedure TfrmRooms.SG1DblClick(Sender: TObject);
var
  selected_room, room_status: string;
begin
  selected_room := SG1.Cells[0, SG1.Row];
  room_status := SG1.Cells[2, SG1.Row];
//  if room_status = 'vacant' then
//  begin
//    if not assigned(frmBooking) then
//      frmBooking := TfrmBooking.Create(Self);
//    frmBooking.Show;
//    frmBooking.cmbRoomNum.Text := selected_room;
//  end;
end;

procedure TfrmRooms.btnFilterClick(Sender: TObject);
var
  c, r: integer;
begin
  // Empty String Grid
  for c := 0 to SG1.ColCount - 1 do
  begin
    for r := 1 to SG1.RowCount do
      SG1.Cells[c, r] := '';
  end;

  with dsRooms do
  begin
    Close;
    if CheckBox1.Checked then
      sql_statement := sql_statement + ' and room_status = ' + QuotedStr('Vacant');
    if CheckBox2.Checked then
      sql_statement := sql_statement + ' and has_kitchen is true';
    if CheckBox3.Checked then
      sql_statement := sql_statement + ' and has_bath is true';
    if CheckBox4.Checked then
      sql_statement := sql_statement + ' and has_safe is true';
    if CheckBox5.Checked then
      sql_statement := sql_statement + ' and has_tv is true';
    if CheckBox6.Checked then
      sql_statement := sql_statement + ' and has_fridge is true';
    if RadioButton1.Checked then
      sql_statement := sql_statement + ' and beds = 1';
    if RadioButton2.Checked then
      sql_statement := sql_statement + ' and beds = 2';
    if RadioButton3.Checked then
      sql_statement := sql_statement + ' and beds = 3';

    SQL.Text := sql_statement;
    Open;
    SG1.RowCount := RecordCount + 1;
  end;
  RefreshRooms();
  sql_statement := 'select * from rooms where 1 = 1 ';
end;

procedure TfrmRooms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmRooms := nil;
  Action := caFree;
end;

procedure TfrmRooms.FormCreate(Sender: TObject);

begin
  sql_statement := 'select * from rooms where 1 = 1 ';

  SG1.Cells[0, 0] := 'Room No';
  SG1.Cells[1, 0] := 'Description';
  SG1.Cells[2, 0] := 'Currently';
  SG1.Cells[3, 0] := '# of Beds';
  SG1.Cells[4, 0] := 'Rate Per Night';
  SG1.Cells[5, 0] := 'Facilities';
  SG1.Cells[6, 0] := 'Max Guests';

  SG1.ColWidths[0] := 100;
  SG1.ColWidths[1] := 250;
  SG1.ColWidths[2] := 100;
  SG1.ColWidths[3] := 100;
  SG1.ColWidths[4] := 100;
  SG1.ColWidths[5] := 400;
  SG1.ColWidths[6] := 100;

  RefreshRooms();

end;

end.
