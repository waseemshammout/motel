program MotelSystem;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  uRooms in 'uRooms.pas' {frmRooms},
  uDataModule in 'uDataModule.pas' {dm: TDataModule},
  uBookings in 'uBookings.pas' {frmBookings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
