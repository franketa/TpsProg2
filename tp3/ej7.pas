unit ej7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ListPointer, ListArray, Tipos,
  Vcl.StdCtrls;

const
  largoLista = 10;

type
  vectorFecha = array [1 .. 3] of string; // RANDOMEAR FECHA nashe
  enumEstado = (Pendiente, Abonada, Anulada);

  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    nashei: TButton;
    procedure Button1Click(Sender: TObject);
    procedure nasheiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  dataMulta = record
    fecha: TDate;
    importe: longInt;
    estado: enumEstado;
  end;

  pDataMulta = ^dataMulta;
  pLista = ^Lista;

var
  Form2: TForm2;
  listaAuto, listaMulta: Lista;

implementation

{$R *.dfm}

function totalAdeudado(patente: string; listaAutos: Lista): longInt;
var
  x, multa: tipoElemento;
  listaMulta: Lista;
  p, posListaMulta: posicionLista;
  punListaMulta: pLista;
  total: longInt;
  noEncontrado: boolean;
  punDataMulta: pDataMulta;
begin
  total := 0;
  noEncontrado := true;
  p := listaAutos.comienzo;
  while (p <> nulo) and (noEncontrado) do
  begin
    x := listaAutos.Recuperar(p);
    if x.Clave = patente then
    begin
      noEncontrado := False;
      punListaMulta := x.Valor2;
      posListaMulta := punListaMulta.comienzo;
      multa := punListaMulta.Recuperar(posListaMulta);
      punDataMulta := multa.Valor2;
      total := punDataMulta.importe + total;

    end;

  end;
  result := total
end;

function fechaRandom(): TDate;
var
  d, a, m: integer;
  sAux: string;
begin
  d := random(29) + 1;
  m := random(12) + 1;
  a := random(100) + 1940;
  sAux := d.toString + '/' + m.toString + '/' + a.toString;
  result := strToDate(sAux);
end;

function dataMultaRandom(): dataMulta;
var
  dataMultaAux: dataMulta;
  s: integer;
begin
  dataMultaAux.fecha := Now;
  dataMultaAux.importe := random(10000);
  s := random(3);
  case s of
    0:
      dataMultaAux.estado := Pendiente;
    1:
      dataMultaAux.estado := Abonada;
    2:
      dataMultaAux.estado := Anulada;
  end;
  result := dataMultaAux;

end;

procedure TForm2.Button1Click(Sender: TObject);
var
  x, i: tipoElemento;
  p, posListaMulta: posicionLista;
  dataMultaAux: dataMulta;
  punteroDataMulta: pDataMulta;
  punteroLista: pLista;
begin
  listaAuto.Crear(Cadena, largoLista);

  x.Clave := 1000.toString; // patente al auto 1
  listaMulta.Crear(Numero, 100); // creo lista de multas p aut1
  posListaMulta := listaMulta.comienzo;
  while posListaMulta < 100 do
  begin
    dataMultaAux := dataMultaRandom; // lleno el auxiliar con random
    i.Clave := random(1000); // tipo elemento multa
    New(punteroDataMulta); // Creo un punterodatamulta al registro = valor2 de multa1
    punteroDataMulta^ := dataMultaAux; // contenido del puntero data multa
    i.Valor2 := punteroDataMulta; // guardo puntero en valor 2 de la multa
    listaMulta.Agregar(i);
    posListaMulta:=ListaMulta.Siguiente(posListaMulta);

  end;

  New(punteroLista); // creo un puntero a la lista de las multas
  punteroLista^ := listaMulta;
  x.Valor2 := punteroLista; // valor2 del auto = puntero de la lista
  listaAuto.Agregar(x); // agrego el auto a la lista
  p := listaAuto.comienzo;

  while p < largoLista do
  begin
    x.Clave := random(1000).toString;
    listaMulta.Crear(Numero, 100);
    while posListaMulta < 100 do begin
      dataMultaAux := dataMultaRandom; // lleno el auxiliar con random
      i.Clave := random(1000); // tipo elemento multa
      New(punteroDataMulta); // Creo un punterodatamulta al registro = valor2 de multa1
      punteroDataMulta^ := dataMultaAux; // contenido del puntero data multa
      i.Valor2 := punteroDataMulta; // guardo puntero en valor 2 de la multa
      listaMulta.Agregar(i);
      posListaMulta:=ListaMulta.Siguiente(posListaMulta);

    end;
    New(punteroLista);
    punteroLista^ := listaMulta;
    x.Valor2 := punteroLista;
    listaAuto.Agregar(x);
    p := listaAuto.Siguiente(p);

  end;

end;

procedure TForm2.nasheiClick(Sender: TObject);
begin
  Memo1.Lines.Add(totalAdeudado('1000', listaAuto).toString)
end;

end.
