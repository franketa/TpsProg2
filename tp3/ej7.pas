unit ej7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, system.DateUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ListPointer, ListArray, Tipos,
  Vcl.StdCtrls;

const
  largoListaAutos = 10;
  largoListaMultas = 20;


type
  vectorFecha = array [1 .. 3] of string; // RANDOMEAR FECHA nashe
  enumEstado = (Pendiente, Abonada, Anulada);

  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    nashei: TButton;
    procedure Button1Click(Sender: TObject);
    procedure nasheiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  listaAutos: Lista;

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
  while (p <> nulo) and (noEncontrado) do begin
    x := listaAutos.Recuperar(p);
    if x.Clave = patente then
    begin
      noEncontrado := False;
      punListaMulta := x.Valor2;
      posListaMulta := punListaMulta.comienzo; // recorro todas las multas
      while posListaMulta <> nulo do begin
        multa := punListaMulta.Recuperar(posListaMulta);
        punDataMulta := multa.Valor2;
        if punDataMulta.estado = pendiente then total := punDataMulta.importe + total;
        posListaMulta := punListaMulta.Siguiente(posListaMulta);
      end;
    end;
  end;
  result := total;
end;

function multaMasAntigua(patente:string; listaAutos:lista):tipoElemento;
var
  x, multa, masAntigua: tipoElemento;
  listaMulta: Lista;
  p, posListaMulta: posicionLista;
  punListaMulta: pLista;
  noEncontrado: boolean;
  punDataMulta, punDataMultaMasAntigua: pDataMulta;
begin
  noEncontrado := true;
  p := listaAutos.comienzo;
  while (p <> nulo) and (noEncontrado) do begin
    x := listaAutos.Recuperar(p);
    if x.Clave = patente then begin
      noEncontrado := False;
      punListaMulta := x.Valor2; // lista multa
      posListaMulta := punListaMulta.comienzo;
      if posListaMulta <> nulo then begin
        multa := punListaMulta.Recuperar(posListaMulta);
        punDataMultaMasAntigua := multa.Valor2; // asigno la primera como la mas antigua
        masAntigua := multa;
        posListaMulta := punListaMulta.Siguiente(posListaMulta); // busco la siguiente
        while posListaMulta <> nulo do begin
          multa := punListaMulta.Recuperar(posListaMulta);
          punDataMulta := multa.Valor2;
          if (compareDate(punDataMultaMasAntigua.fecha, punDataMulta.fecha) = -1) then begin
            punDataMultaMasAntigua := punDataMulta;
            masAntigua := multa;
          end;
          posListaMulta := punListaMulta.Siguiente(posListaMulta);
        end;
      end;
    end;
  end;
  result := masAntigua;
end;

function mostrarDatosMulta(multa:tipoElemento):string;
var
  strAux:string;
  punDataMulta:pDataMulta;
begin
  punDataMulta := multa.Valor2;
  strAux :=
    'Nº ACTA: ' + multa.Clave + sLineBreak +
    'Fecha: ' + datetostr(punDataMulta.fecha) + sLineBreak +
    'Importe: '+ punDataMulta.importe ;

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

procedure llenarlistaMultas(var listaMulta:lista);
var
  posListaMulta: posicionLista;
  x:tipoelemento;
  dataMultaAux: dataMulta;
  punteroDataMulta: pDataMulta;
begin
  dataMultaAux := dataMultaRandom; // lleno el auxiliar con random
  x.Clave := random(1000); // tipo elemento multa
  New(punteroDataMulta); // Creo un punterodatamulta al registro = valor2 de multa1
  punteroDataMulta^ := dataMultaAux; // contenido del puntero data multa
  x.Valor2 := punteroDataMulta; // guardo puntero en valor 2 de la multa
  listaMulta.Agregar(x);
  posListaMulta := listaMulta.comienzo;
  while posListaMulta < largoListaMultas do
  begin
    dataMultaAux := dataMultaRandom; // lleno el auxiliar con random
    x.Clave := random(1000); // tipo elemento multa
    New(punteroDataMulta); // Creo un punterodatamulta al registro = valor2 de multa1
    punteroDataMulta^ := dataMultaAux; // contenido del puntero data multa
    x.Valor2 := punteroDataMulta; // guardo puntero en valor 2 de la multa
    listaMulta.Agregar(x);
    posListaMulta:=ListaMulta.Siguiente(posListaMulta);
  end;
end;

procedure crearListaAutos(var listaAuto:lista);
var
  x, i: tipoElemento;
  p, posListaMulta: posicionLista;
  dataMultaAux: dataMulta;
  punteroDataMulta: pDataMulta;
  punteroLista: pLista;
  listaMulta :lista;
begin
  listaAuto.Crear(Cadena, largoListaAutos);
  x.Clave := 1000.toString; // patente al auto 1
  listaMulta.Crear(Numero, 100); // creo lista de multas p aut1
  llenarlistaMultas(listaMulta); // lleno la lista de las multas
  New(punteroLista); // creo un puntero a la lista de las multas
  punteroLista^ := listaMulta;
  x.Valor2 := punteroLista; // valor2 del auto = puntero de la lista
  listaAuto.Agregar(x); // agrego el auto a la lista
  p := listaAuto.comienzo;
  while p < largoListaAutos do begin
    x.Clave := random(1000).toString;
    listaMulta.Crear(Numero, 100);
    llenarlistaMultas(listaMulta);
    New(punteroLista);
    punteroLista^ := listaMulta;
    x.Valor2 := punteroLista;
    listaAuto.Agregar(x);
    p := listaAuto.Siguiente(p);
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  crearListaAutos(listaAutos);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  randomize;
end;

procedure TForm2.nasheiClick(Sender: TObject);
begin
  Memo1.Lines.Add(totalAdeudado('1000', listaAutos).toString)
end;

end.
