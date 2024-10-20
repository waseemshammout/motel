unit uPayments;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmPayments = class(TForm)
    tbPayments: TFDTable;
    tbPaymentspayment_id: TFDAutoIncField;
    tbPaymentspayment_num: TStringField;
    tbPaymentspayment_date: TDateField;
    tbPaymentspayment_type: TStringField;
    tbPaymentsamount: TFloatField;
    tbPaymentscurrency: TStringField;
    tbPaymentsbooking_id: TIntegerField;
    tbPaymentscreated_at: TSQLTimeStampField;
    DataSource1: TDataSource;
    Label2: TLabel;
    edPaymentNum: TDBEdit;
    Label3: TLabel;
    edPaymentDate: TDBEdit;
    Label4: TLabel;
    edPaymentType: TDBEdit;
    Label5: TLabel;
    edAmount: TDBEdit;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPayments: TfrmPayments;

implementation

{$R *.dfm}

uses uDataModule;

end.
