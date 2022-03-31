unit ej7_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, TADFecha,
  Vcl.Grids, Vcl.ComCtrls, TADEStacionamiento;

type

  vecPalabrasLinea = array [1..4] of string;

  TFormEj7 = class(TForm)
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label3: TLabel;
    btnConsultarFechaDada: TButton;
    btnConsultarRangoDado: TButton;
    Label4: TLabel;
    Label5: TLabel;
    btnEscribirArchivo: TButton;
    btnDefinirTarifa: TButton;
    Label6: TLabel;
    inputSetTarifa: TEdit;
    Label7: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure btnDefinirTarifaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEj7: TFormEj7;
  estacionamiento1:estacionamiento;

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

procedure TFormEj7.btnDefinirTarifaClick(Sender: TObject);
begin
  estacionamiento1.setTarifaPorHora(strtoint(InputSetTarifa.Text));
  if Estacionamiento1.getTarifaPorHora <> -1 then
    btnConsultarRangoDado.Enabled := true;
  btnConsultarFechaDada.Enabled := true;
  btnEscribirArchivo.Enabled := true;
end;


procedure TFormEj7.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  btnConsultarRangoDado.Enabled := false;
  btnConsultarFechaDada.Enabled := false;
  btnEscribirArchivo.Enabled := false;
end;



end.
