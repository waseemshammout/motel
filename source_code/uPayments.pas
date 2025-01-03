unit uPayments;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, System.UITypes;

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
    edExchangeRate: TDBEdit;
    Label8: TLabel;
    edUSDEquivalent: TDBEdit;
    edBookingBalance: TEdit;
    Label9: TLabel;
    dsBookingBalance: TFDQuery;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure UpdateCurrencyList();
    procedure cmbTypeChange(Sender: TObject);
    procedure tbPaymentsAfterScroll(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure edAmountKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edExchangeRateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbPaymentsAfterInsert(DataSet: TDataSet);
    procedure tbPaymentsAfterPost(DataSet: TDataSet);
    procedure UpdateBookingBalance();
    procedure cmbBookingClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure tbPaymentsAfterEdit(DataSet: TDataSet);
    procedure tbPaymentsBeforePost(DataSet: TDataSet);
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

procedure TfrmPayments.UpdateBookingBalance();
begin
  try
    if tbBooking.State <> dsInsert then
      with dsBookingBalance do
      begin
        Close;
        ParamByName('BookingID').Value := cmbBooking.KeyValue;
        Open;
        edBookingBalance.Text := FieldByName('balance').Value;
      end;
  except
    on EVariantTypeCastError do;
    on e: exception do ShowMessage(e.ClassName);
  end;
end;

procedure TfrmPayments.cmbBookingClick(Sender: TObject);
begin
  UpdateBookingBalance();
end;

procedure TfrmPayments.cmbTypeChange(Sender: TObject);
begin
  UpdateCurrencyList();
end;

procedure TfrmPayments.DateTimePicker1Change(Sender: TObject);
begin
  tbPayments.Edit;
  tbPayments.FieldByName('payment_date').Value := DateTimePicker1.Date;
end;

procedure TfrmPayments.edExchangeRateKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    with tbPayments do
    begin
      Edit;
      FieldByName('usd_equivalent').Value := StrToFloat(edAmount.Text) *
        StrToFloat(edExchangeRate.Text);
    end;
  except
    on EConvertError do;
    on EDatabaseError do;
  end;
end;

procedure TfrmPayments.edAmountKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    with tbPayments do
    begin
      Edit;
      FieldByName('usd_equivalent').Value := StrToFloat(edAmount.Text) *
        StrToFloat(edExchangeRate.Text);
    end;
  except
    on EConvertError do;
    on EDatabaseError do;
  end;
end;

procedure TfrmPayments.FormCreate(Sender: TObject);
begin
  tbPayments.Open;
  tbBooking.Open;
  UpdateBookingBalance();
end;

procedure TfrmPayments.FormDeactivate(Sender: TObject);
begin
 if (tbPayments.State = dsEdit) or (tbPayments.State = dsInsert) then tbPayments.Cancel;
end;

procedure TfrmPayments.tbPaymentsAfterEdit(DataSet: TDataSet);
begin
 tbPayments.Cancel;
 raise Exception.Create('Please contact the administrator to edit payment information!');
end;

procedure TfrmPayments.tbPaymentsAfterInsert(DataSet: TDataSet);
begin
  DateTimePicker1.Date := Date;
  tbPayments.FieldByName('payment_date').Value := DateTimePicker1.Date;
end;

procedure TfrmPayments.tbPaymentsAfterPost(DataSet: TDataSet);
begin
  tbPayments.Refresh;
end;

procedure TfrmPayments.tbPaymentsAfterScroll(DataSet: TDataSet);
begin
  try
    begin
      UpdateCurrencyList();
      if not VarIsNull(edPaymentDate.Text) or (edPaymentDate.Text = '') then
        DateTimePicker1.Date := StrToDate(edPaymentDate.Text)
      else
        DateTimePicker1.Date := Date;
      UpdateBookingBalance();
    end;
  except
    on EConvertError do
      DateTimePicker1.Date := Date;
  end;
end;

procedure TfrmPayments.tbPaymentsBeforePost(DataSet: TDataSet);
begin
 if MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   tbPayments.CheckBrowseMode;
end;

end.
