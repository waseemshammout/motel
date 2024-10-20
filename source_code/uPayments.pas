unit uPayments;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls;

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
    Label5: TLabel;
    edAmount: TDBEdit;
    Label6: TLabel;
    DBNavigator1: TDBNavigator;
    cmbBooking: TDBLookupComboBox;
    Label1: TLabel;
    tbBooking: TFDTable;
    DataSource2: TDataSource;
    DateTimePicker1: TDateTimePicker;
    cmbType: TDBComboBox;
    Label7: TLabel;
    cmbCurrency: TDBComboBox;
    tbPaymentsexchange_rate: TFloatField;
    tbPaymentsusd_equivalent: TFloatField;
    Label4: TLabel;
    dbExchangeRate: TDBEdit;
    Label8: TLabel;
    edUSDEquivalent: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure UpdateCurrencyList();
    procedure cmbTypeChange(Sender: TObject);
    procedure tbPaymentsAfterScroll(DataSet: TDataSet);
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

procedure TfrmPayments.UpdateCurrencyList();
var
  cash_ccy: TArray<string>;
  crypto_ccy: TArray<string>;
begin
  cash_ccy := ['USD', 'EUR', 'GBP'];
  crypto_ccy := ['USDT', 'USDC', 'BTC', 'ETH', 'SOL'];
  cmbCurrency.Items.Clear;
  if cmbType.Text = 'Crypto' then
    cmbCurrency.Items.AddStrings(crypto_ccy)
  else
    cmbCurrency.Items.AddStrings(cash_ccy);
end;

procedure TfrmPayments.cmbTypeChange(Sender: TObject);
begin
  UpdateCurrencyList();
end;

procedure TfrmPayments.FormCreate(Sender: TObject);
begin
  tbPayments.Open;
end;

procedure TfrmPayments.tbPaymentsAfterScroll(DataSet: TDataSet);
begin
  try
    UpdateCurrencyList();
    if not VarIsNull(edPaymentDate.Text) or (edPaymentDate.Text = '') then
      DateTimePicker1.Date := StrToDate(edPaymentDate.Text)
    else
      DateTimePicker1.Date := Date;
  except
    on EConvertError do
      DateTimePicker1.Date := Date;
  end;
end;

end.
