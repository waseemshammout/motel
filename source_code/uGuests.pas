unit uGuests;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmGuests = class(TForm)
    tbGuests: TFDTable;
    DBNavigator1: TDBNavigator;
    tbGuestsguest_id: TFDAutoIncField;
    tbGuestsfirst_name: TStringField;
    tbGuestslast_name: TStringField;
    tbGuestsdate_of_birth: TDateField;
    tbGuestsbirth_country: TStringField;
    tbGuestsid_number: TStringField;
    tbGuestsid_type: TStringField;
    tbGuestssex: TStringField;
    tbGuestsphone: TStringField;
    tbGuestsemail: TStringField;
    tbGuestsguardian_id: TIntegerField;
    tbGuestscreated_at: TSQLTimeStampField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBGrid1: TDBGrid;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGuests: TfrmGuests;

implementation

uses
 uDataModule;

{$R *.dfm}


procedure TfrmGuests.btnSaveClick(Sender: TObject);
begin
 tbGuests.ApplyUpdates;
end;

end.
