unit ej10_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADTarjetaDeCredito,
  Vcl.Mask, Vcl.ComCtrls, Vcl.WinXPickers, TADfecha, Vcl.ExtCtrls;

type
  TFormej10 = class(TForm)
    Memo1: TMemo;
    btnMostrarDatos: TButton;
    Label1: TLabel;
    Label2: TLabel;
    inputNroTarjeta: TMaskEdit;
    Label3: TLabel;
    inputFechaCompra: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    inputMontoCompra: TEdit;
    Label6: TLabel;
    ca: TLabel;
    inputFechaVencimiento: TDatePicker;
    btnAutorizar: TButton;
    btnMostrarLimites: TButton;
    Label7: TLabel;
    inputCantCuotas: TEdit;
    Label8: TLabel;
    procedure btnMostrarDatosClick(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnAutorizarClick(Sender: TObject);
    procedure btnMostrarLimitesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formej10: TFormej10;
  tarjeta1:TarjetaDeCredito;


implementation

{$R *.dfm}

Procedure Parsing(aSS: String; aSep: String; Var aV: vecFecha);
Var I, P: Integer;
Begin
  // Se asume que <aSS> termina con un carácter separador <aSep>
  I := 0;
  P := Pos(aSep, aSS); //Ubica la primer posición del Separador
  While P > 0 Do Begin // Mientras existan separadores
    Inc(I);
    aV[I] := Copy(aSS, 1, P-1); // Copia al array
    // Se queda con el resto del string a procesar
    aSS := Copy(aSS, P+1, Length(aSS));
    // Toma la próxima posición a procesar
    P := Pos(aSep, aSS);
    if P = 0 then
       aV[I+1]:= Ass;
  End;
End;

procedure TFormej10.btnAutorizarClick(Sender: TObject);
var
  fAux:fecha;
  str:string;
  vF:vecFecha;
begin
    str := datetostr(inputFechaCompra.Date) + '/';
    Parsing(str, '/', vF);
    fAux.setFecha(vF[1].ToInteger, vF[2].ToInteger, vF[3].tointeger);
    memo1.Lines.Add(tarjeta1.validarCompra(strToFLoat(inputMontoCompra.text),strToInt(inputCantCuotas.Text),fAux));


end;

procedure TFormej10.btnCargarClick(Sender: TObject);
var
  fAux:fecha;
  str:string;
  vF:vecFecha;
begin
    str := datetostr(inputFechaVencimiento.Date) + '/';
    Parsing(str, '/', vF);
    fAux.setFecha(vF[1].ToInteger, vF[2].ToInteger, vF[3].tointeger);
    tarjeta1.setTarjeta(inputNroTarjeta.Text, fAux);

end;

procedure TFormej10.btnMostrarDatosClick(Sender: TObject);
begin
  memo1.Lines.add(tarjeta1.mostrarTarjeta());
end;

procedure TFormej10.btnMostrarLimitesClick(Sender: TObject);
begin
  memo1.Lines.Add(tarjeta1.mostrarLimites);
end;

end.
