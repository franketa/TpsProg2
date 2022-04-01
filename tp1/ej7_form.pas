unit ej7_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, TADFecha,
  Vcl.Grids, Vcl.ComCtrls, TADEStacionamiento;

type

  ArchivoAutos = file of autoIngresado;

  vecPalabrasLinea = array [1..4] of string;

  TFormEj7 = class(TForm)
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    selectFechaConsulta: TDateTimePicker;
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
    procedure btnConsultarFechaDadaClick(Sender: TObject);
    procedure btnEscribirArchivoClick(Sender: TObject);
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

procedure TFormEj7.btnConsultarFechaDadaClick(Sender: TObject);
var
  strAux:string;
  vStr:vecPalabrasLinea;
  fAux:fecha;
  vE:estadia;
  extaux:extended;
begin
  strAux := dateTimeToStr(selectFechaConsulta.DateTime) + '/';
  Parsing(strAux, '/', vStr);
  fAux.setFecha(vStr[1].ToInteger, vStr[2].ToInteger, vStr[3].tointeger);
  memo1.Lines.Add('En la fecha ' +  faux.devolverStrFecha + ' se recauradon: ');
  vE := estacionamiento1.recaudacionXFecha(faux,extaux );
  memo1.Lines.Add(estacionamiento1.getStrTarifaAPagar(vE, extAux));
end;

procedure TFormEj7.btnDefinirTarifaClick(Sender: TObject);
begin
  estacionamiento1.setTarifaPorHora(strtoint(InputSetTarifa.Text));
  if Estacionamiento1.getTarifaPorHora <> -1 then
    btnConsultarRangoDado.Enabled := true;
  btnConsultarFechaDada.Enabled := true;
  btnEscribirArchivo.Enabled := true;
end;

procedure TFormEj7.btnEscribirArchivoClick(Sender: TObject);
var
  archivo:archivoAutos;
  auto:autoIngresado;
  i:integer;
begin
  estacionamiento1.ordenarAutosIngresadosXfechaSalidaAscendente;
  for I := 0 to (estacionamiento1.getCantAutos ) - 1 do
    estacionamiento1.calcularTarifaAuto(i);

  assignFile(archivo, 'archivoAutos');
  rewrite(archivo);

  for i := 0 to (estacionamiento1.getCantAutos) - 1 do begin
    auto :=  estacionamiento1.GetAutoIngresado(i);
    write(archivo, auto );
  end;
  closeFile(archivo);
end;

procedure CrearAutosEnMemoria(memo:Tmemo);
var
  hE,hS:horario;
  fE, fS:fecha;
begin
  hE.horas := 01;
  hE.minutos := 0;
  hS.horas := 02;
  hS.minutos := 21;
  fE.setFecha(01,03,2022);
  fS.setFecha(01,03,2022);
  memo.lines.add(estacionamiento1.addAuto('AEF201', hE, hS, fE, fS));
  hE.horas := 00;
  hE.minutos := 00;
  hS.horas := 06;
  hS.minutos := 00;
  fE.setFecha(01,03,2022);
  fS.setFecha(01,03,2022);
  memo.lines.add(estacionamiento1.addAuto('EAR401', hE, hS, fE, fS));
  // dia 1 03 2022 2 21
  hE.horas := 16;
  hE.minutos := 20;
  hS.horas := 18;
  hS.minutos := 20;
  fE.setFecha(02,03,2022);
  fS.setFecha(02,03,2022);
  memo.lines.add(estacionamiento1.addAuto('GTD451', hE, hS, fE, fS));
  hE.horas := 12;
  hE.minutos := 00;
  hS.horas := 15;
  hS.minutos := 1;
  fE.setFecha(02,03,2022);
  fS.setFecha(02,03,2022);
  memo.lines.add(estacionamiento1.addAuto('LOP421', hE, hS, fE, fS));
  // dia 2 3 2022  1me 1m
  hE.horas := 00;
  hE.minutos := 00;
  hS.horas := 02;
  hS.minutos := 20;
  fE.setFecha(03,03,2022);
  fS.setFecha(03,03,2022);
  memo.lines.add(estacionamiento1.addAuto('IUY090', hE, hS, fE, fS));
  hE.horas := 00;
  hE.minutos := 0;
  hS.horas := 00;
  hS.minutos := 4;
  fE.setFecha(03,03,2022);
  fS.setFecha(03,03,2022);
  memo.lines.add(estacionamiento1.addAuto('EED423', hE, hS, fE, fS));
  // dia 3 3 2022 2:20
  memo.Lines.Clear;

end;

procedure TFormEj7.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  CrearAutosEnMemoria(MEMO1);
  btnConsultarRangoDado.Enabled := false;
  btnConsultarFechaDada.Enabled := false;
  btnEscribirArchivo.Enabled := false;
end;

end.
