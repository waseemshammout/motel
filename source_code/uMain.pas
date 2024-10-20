unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg;

type
  TfrmMain = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    btnExit: TBitBtn;
    btnPayments: TBitBtn;
    btnGuests: TBitBtn;
    btnBookings: TBitBtn;
    btnRooms: TBitBtn;
    btnSettings: TBitBtn;
    btnReports: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure btnRoomsClick(Sender: TObject);
    procedure btnBookingsClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uRooms, uDataModule, uBooking, uBookings;

{$R *.dfm}


procedure TfrmMain.btnBookingsClick(Sender: TObject);
begin
  if not Assigned(frmBookings) then frmBookings := TfrmBookings.Create(self);
  frmBookings.Show;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnRoomsClick(Sender: TObject);
begin
  if not Assigned(frmRooms) then  frmRooms := TfrmRooms.Create(self);
  frmRooms.Show;
end;

end.