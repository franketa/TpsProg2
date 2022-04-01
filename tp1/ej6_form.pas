unit ej6_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, tadFecha, Vcl.Dialogs, Vcl.StdCtrls, TADEstacionamiento,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type

  vecPalabrasLinea = array [1..4] of string;

  TFormEj6 = class(TForm)
    Memo1: TMemo;
    btnVerTarifaAPagar: TButton;
    inputPatenteVer: TEdit;
    btnVerAutos: TButton;
    inputSetTarifa: TEdit;
    btnDefinirTarifa: TButton;
    btnCargar: TButton;
    InputFechaSalidaCargar: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    inputPatenteCargarAuto: TLabeledEdit;
    InputFechaEntradaCargar: TDateTimePicker;
    Label3: TLabel;
    InputHorasEntradaCargar: TLabeledEdit;
    inputHorasSalidaCargar: TLabeledEdit;
    inputMinutosEntradaCargar: TEdit;
    inputMinutosSalidaCargar: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnDefinirTarifaClick(Sender: TObject);
    procedure btnVerAutosClick(Sender: TObject);
    procedure btnVerTarifaAPagarClick(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEj6: TFormEj6;
  Estacionamiento1:estacionamiento;

implementation

{$R *.dfm}

Procedure Parsing(aSS: String; aSep: String; Var aV: vecPalabrasLinea);
Var I, P,J: Integer;
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
    j := P;
    P := Pos(aSep, aSS);
    if P = 0 then
       aV[I+1]:= Ass;
  End;
End;

procedure TFormEj6.btnCargarClick(Sender: TObject);
var
  hEntrada,hSalida:horario;
  fEntrada,fSalida:fecha;
  strAux, strAux2: string;
  vStr:vecPalabrasLinea;
  i:integer;
begin
  strAux := '';
  strAux2 := '';
  hEntrada.horas:= strtoint(InputHorasEntradaCargar.Text);
  hEntrada.minutos:= strtoint(InputminutosEntradaCargar.Text);
  hSalida.horas:= strtoint(InputHorasSalidaCargar.Text);
  hSalida.minutos:= strtoint(InputminutosSalidaCargar.Text);
  strAux := dateTimeToStr(InputFechaEntradaCargar.DateTime) + '/';
  Parsing(strAux, '/', vStr);
  fEntrada.setFecha(vStr[1].ToInteger,vStr[2].ToInteger,vStr[3].tointeger);
  strAux := dateTimeToStr(InputFechaSalidaCargar.DateTime) + '/';
  Parsing(strAux, '/', vStr);
  fSalida.setFecha(vStr[1].ToInteger,vStr[2].ToInteger,vStr[3].tointeger);
  memo1.Lines.Add(estacionamiento1.addAuto(inputPatenteCargarAuto.Text,hEntrada, hSalida, fEntrada, fSalida));
end;

procedure TFormEj6.btnDefinirTarifaClick(Sender: TObject);
begin
  Estacionamiento1.setTarifaPorHora(strtoint(InputSetTarifa.Text));
  if Estacionamiento1.getTarifaPorHora <> -1 then
    btnVerTarifaAPagar.enabled:=true;
    btnVerAutos.enabled:=true;
end;

procedure TFormEj6.btnVerAutosClick(Sender: TObject);
begin
  Estacionamiento1.mostrarDatosTodosLosAutos(memo1);
end;

procedure TFormEj6.btnVerTarifaAPagarClick(Sender: TObject);
begin
  if inputPatenteVer.Text = '' then begin
    memo1.Lines.clear;
    memo1.Lines.Add('Por favor ingrese la patente');
  end
  else
    Estacionamiento1.mostrarDatosAuto(memo1, inputPatenteVer.Text);
end;

procedure TFormEj6.FormCreate(Sender: TObject);
var
  horaEntrada, horaSalida:horario;
  fechaSalida, fechaEntrada:fecha;
begin
  memo1.Clear;
  btnVerTarifaAPagar.enabled:=false;
  btnVerAutos.enabled:=false;

end;

end.
