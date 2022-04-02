unit ej9_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, TADCajaregistradora,
  Vcl.ExtCtrls;

type
  TFormej9 = class(TForm)
    Memo1: TMemo;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    UpDown8: TUpDown;
    UpDown9: TUpDown;
    UpDown10: TUpDown;
    UpDown11: TUpDown;
    btnIngresar: TButton;
    btnCobrar: TButton;
    inputMontoACobrar: TLabeledEdit;
    inputMonUn: TLabeledEdit;
    InputMonDos: TLabeledEdit;
    inputMonCinco: TLabeledEdit;
    inputBilDiez: TLabeledEdit;
    inputBilVeinte: TLabeledEdit;
    inputBilCincuenta: TLabeledEdit;
    inputBilCien: TLabeledEdit;
    inputBilDoscientos: TLabeledEdit;
    inputBilQuinientos: TLabeledEdit;
    inputBilMil: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnCerrar: TButton;
    Label3: TLabel;
    btnVerSaldo: TButton;
    Label4: TLabel;
    procedure btnIngresarClick(Sender: TObject);
    procedure btnCobrarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnVerSaldoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEj9: TFormej9;
  caja1:caja;
  error:TError;
implementation

{$R *.dfm}

procedure TFormej9.btnCerrarClick(Sender: TObject);
var
  strAux:string;
begin
  memo1.Lines.Add(caja1.CerrarCaja);
end;

procedure TFormej9.btnCobrarClick(Sender: TObject);
var
  vBilletesPago, vBilletesVuelto:arraybilletes;
  auxReal:real;
  error:TError;
begin
  vBilletesPago[B1] := strtoint(inputMonUn.Text);
  vBilletesPago[B2] := strtoint(inputMonDos.Text);
  vBilletesPago[B5] := strtoint(inputMonCinco.Text);
  vBilletesPago[B10] := strtoint(inputBilDiez.Text);
  vBilletesPago[B20] := strtoint(inputBilVeinte.Text);
  vBilletesPago[B50]:= strtoint(inputBilCincuenta.Text);
  vBilletesPago[B100] := strtoint(inputBilCien.Text);
  vBilletesPago[B200] := strtoint(inputBilDoscientos.Text);
  vBilletesPago[B500] := strtoint(inputBilQuinientos.Text);
  vBilletesPago[B1000] := strtoint(inputBilMil.Text);
  auxReal := strtoint(inputMontoACobrar.Text);
  error := caja1.DarVuelto(vBilletesVuelto, vBilletesPago, auxReal);
  if error = exitoso then
    memo1.Lines.Add('Ingreso exitoso')
  else
    memo1.Lines.Add('Ingreso fallido, no hay vuelto disponible');


end;

procedure TFormej9.btnIngresarClick(Sender: TObject);
var
  vBilletesIngreso:arraybilletes;
begin
  vBilletesIngreso[B1] := strtoint(inputMonUn.Text);
  vBilletesIngreso[B2] := strtoint(inputMonDos.Text);
  vBilletesIngreso[B5] := strtoint(inputMonCinco.Text);
  vBilletesIngreso[B10] := strtoint(inputBilDiez.Text);
  vBilletesIngreso[B20] := strtoint(inputBilVeinte.Text);
  vBilletesIngreso[B50]:= strtoint(inputBilCincuenta.Text);
  vBilletesIngreso[B100] := strtoint(inputBilCien.Text);
  vBilletesIngreso[B200] := strtoint(inputBilDoscientos.Text);
  vBilletesIngreso[B500] := strtoint(inputBilQuinientos.Text);
  vBilletesIngreso[B1000] := strtoint(inputBilMil.Text);
  caja1.Cargar(vBilletesIngreso);
  memo1.Lines.Add('Ingreso exitoso');
end;

procedure TFormej9.btnVerSaldoClick(Sender: TObject);
begin
  memo1.Lines.Add('Tu saldo es: ' + floatToStr(caja1.getSaldo()));
end;

end.
