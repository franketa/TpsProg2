unit ej7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, system.DateUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ListPointer, ListArray, Tipos,
  Vcl.StdCtrls;

const
  largoListaAutos = 10;
  largoListaMultas = 5;


type
  vectorFecha = array [1 .. 3] of string; // RANDOMEAR FECHA nashe
  enumEstado = (Pendiente, Abonada, Anulada);

  TForm2 = class(TForm)
    Memo1: TMemo;
    btnTotalPatente: TButton;
    btnMasAntigua: TButton;
    Label1: TLabel;
    Label3: TLabel;
    btnMasReciente: TButton;
    Label4: TLabel;
    inPatentePunto1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnAutoMasMultas: TButton;
    Memo2: TMemo;
    btnVerTodasMultas: TButton;
    inVerTodasMultas: TEdit;
    Label2: TLabel;
    btnAutoMasDeuda: TButton;
    Label7: TLabel;
    Button1: TButton;

    procedure btnTotalPatenteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMasAntiguaClick(Sender: TObject);
    procedure btnMasRecienteClick(Sender: TObject);
    procedure btnAutoMasMultasClick(Sender: TObject);
    procedure btnVerTodasMultasClick(Sender: TObject);
    procedure btnAutoMasDeudaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

function totalAdeudadoAuto(patente: string; listaAutos: Lista): longInt;
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
    p := listaAutos.siguiente(p);
  end;
  result := total;
end;

function adeudadoMultaMasAntigua(patente:string; listaAutos:lista):tipoElemento;
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
        masAntigua := multa; // tipoElemento multa mas antigua
        posListaMulta := punListaMulta.Siguiente(posListaMulta); // busco la siguiente
        while posListaMulta <> nulo do begin
          multa := punListaMulta.Recuperar(posListaMulta);
          punDataMulta := multa.Valor2;
          if (compareDate(punDataMulta.fecha, punDataMultaMasAntigua.fecha) < 0) then begin
            punDataMultaMasAntigua := punDataMulta;
            masAntigua := multa;
          end;
          posListaMulta := punListaMulta.Siguiente(posListaMulta);
        end;
      end;
    end;
    p := listaAutos.siguiente(p);
  end;
  result := masAntigua;
end;

function adeudadoMultaMasReciente(patente:string; listaAutos:lista):tipoElemento;
var
  x, multa, masReciente: tipoElemento;
  listaMulta: Lista;
  p, posListaMulta: posicionLista;
  punListaMulta: pLista;
  noEncontrado: boolean;
  punDataMulta, punDataMultaMasReciente: pDataMulta;
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
        punDataMultaMasReciente := multa.Valor2; // asigno la primera como la mas antigua
        masReciente := multa; // tipoElemento multa mas antigua
        posListaMulta := punListaMulta.Siguiente(posListaMulta); // busco la siguiente
        while posListaMulta <> nulo do begin
          multa := punListaMulta.Recuperar(posListaMulta);
          punDataMulta := multa.Valor2;
          if (compareDate(punDataMulta.fecha, punDataMultaMasReciente.fecha) > 0) then begin
            punDataMultaMasReciente := punDataMulta;
            masReciente := multa;
          end;
          posListaMulta := punListaMulta.Siguiente(posListaMulta);
        end;
      end;
    end;
    p := listaAutos.siguiente(p);
  end;
  result := masReciente;
end;

function autoConMasInfracciones(listaAutos:lista):tipoElemento;
var
  x, autoResult: tipoElemento;
  listaMulta: Lista;
  p: posicionLista;
  punListaMulta: pLista;
  cantMultasResult, cantMultas:integer;
begin
  p := listaAutos.comienzo;
  x := listaAutos.Recuperar(p);
  punListaMulta := x.Valor2; // lista multa
  autoResult := x;
  cantMultasResult := punListaMulta.CantidadElementos;
  p := listaAutos.siguiente(p);
  while (p <> nulo) do begin
    x := listaAutos.Recuperar(p);
    punListaMulta := x.Valor2; // lista multa
    cantMultas := punListaMulta.CantidadElementos;
    if cantMultas > cantMultasResult then begin
      cantMultasResult := cantMultas;
      autoResult := x;
    end;
    p := listaAutos.siguiente(p);
  end;
  result := autoResult;
end;

function mostrarDatosMulta(multa:tipoElemento):string;
var
  strAux,Estado:string;
  punDataMulta:pDataMulta;
begin
  punDataMulta := multa.Valor2;
  case punDataMulta.estado of
    pendiente: Estado := 'Pendiente';
    abonada: Estado := 'Abonada';
    anulada: Estado := 'Anulada';
  end;
  strAux :=
    'Nº Acta: ' + multa.ArmarString + sLineBreak +
    'Fecha: ' + datetostr(punDataMulta.fecha) + sLineBreak +
    'Importe: $'+ punDataMulta.importe.ToString + sLineBreak +
    'Estado: ' + Estado + sLineBreak +
    '------------------------------------';
  result := strAux;
end;

function autoConMasDeuda(listaAutos:lista):tipoElemento;
var
  x, autoResult: tipoElemento;
  p: posicionLista;
  deudaResult, deudaAuto:integer;
begin
  p := listaAutos.comienzo;
  x := listaAutos.Recuperar(p);
  autoResult := x;
  deudaResult := totalAdeudadoAuto(x.Clave, listaAutos);
  p := listaAutos.siguiente(p);
  while (p <> nulo) do begin
    x := listaAutos.Recuperar(p);
    deudaAuto := totalAdeudadoAuto(x.Clave, listaAutos); // lista multa
    if deudaAuto > deudaResult then begin
      deudaResult := deudaAuto;
      autoResult := x;
    end;
    p := listaAutos.siguiente(p);
  end;
  result := autoResult;
end;

function autoSinDeuda(listaAutos:lista):tipoElemento;
var
  x, autoResult: tipoElemento;
  p: posicionLista;
  deudaResult, deudaAuto:integer;
begin
  p := listaAutos.comienzo;
  x := listaAutos.Recuperar(p);
  autoResult := x;
  deudaResult := totalAdeudadoAuto(x.Clave, listaAutos);
  p := listaAutos.siguiente(p);
  while (p <> nulo) do begin
    x := listaAutos.Recuperar(p);
    deudaAuto := totalAdeudadoAuto(x.Clave, listaAutos); // lista multa
    if deudaAuto = 0 then begin
      deudaResult := deudaAuto;
      autoResult := x;
    end;
    p := listaAutos.siguiente(p);
  end;
  if deudaResult = 0 then result := autoResult;
end;

function mostrarDatosAuto(auto:tipoElemento):string;
var
  strAux:string;
  punListaMultas:pLista;
begin
  punListaMultas := auto.Valor2;
  strAux :=
    'Patente: ' + auto.ArmarString + sLineBreak +
    'Cantidad de multas: ' + punListaMultas.CantidadElementos.ToString+ sLineBreak +
    '------------------------------------';
  result := strAux;
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
  dataMultaAux.fecha := fechaRandom;
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
  cantidadMultasRandom:integer;
begin
  cantidadMultasRandom := random(largoListaMultas);
  dataMultaAux := dataMultaRandom; // lleno el auxiliar con random
  x.Clave := random(1000); // tipo elemento multa
  New(punteroDataMulta); // Creo un punterodatamulta al registro = valor2 de multa1
  punteroDataMulta^ := dataMultaAux; // contenido del puntero data multa
  x.Valor2 := punteroDataMulta; // guardo puntero en valor 2 de la multa
  listaMulta.Agregar(x);
  posListaMulta := listaMulta.comienzo;
  while posListaMulta < cantidadMultasRandom do
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

procedure TForm2.btnAutoMasDeudaClick(Sender: TObject);
var
  auto:tipoElemento;
begin
  auto := autoConMasDeuda(listaAutos);
  Memo1.Lines.Add(mostrarDatosAuto(auto));
  Memo1.Lines.Add('Total adeudado por la patente ' + auto.ArmarString);
  Memo1.Lines.Add('$' + totalAdeudadoAuto(auto.Clave, listaAutos).toString);
end;

procedure TForm2.btnAutoMasMultasClick(Sender: TObject);
begin
  Memo1.Lines.Add(mostrarDatosAuto(autoConMasInfracciones(listaAutos)));
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  randomize;
  crearListaAutos(listaAutos);
end;

procedure TForm2.btnMasAntiguaClick(Sender: TObject);
begin
  if inPatentePunto1.Text <> '' then begin
    memo1.Lines.Clear;
    Memo1.Lines.Add(mostrarDatosMulta(adeudadoMultaMasAntigua(inPatentePunto1.Text,listaAutos)));
  end;
end;

procedure TForm2.btnMasRecienteClick(Sender: TObject);
begin
  if inPatentePunto1.Text <> '' then begin
    memo1.Lines.Clear;
    Memo1.Lines.Add(mostrarDatosMulta(adeudadoMultaMasReciente(inPatentePunto1.Text,listaAutos)));
  end;
end;

procedure TForm2.btnTotalPatenteClick(Sender: TObject);
begin
  if inPatentePunto1.Text <> '' then begin
    memo1.Lines.Clear;
    Memo1.Lines.Add('Total adeudado por la patente ' + inPatentePunto1.Text);
    Memo1.Lines.Add('$' + totalAdeudadoAuto(inPatentePunto1.Text, listaAutos).toString);
  end;
end;

procedure TForm2.btnVerTodasMultasClick(Sender: TObject);
var
  x, multa: tipoElemento;
  listaMulta: Lista;
  p, posListaMulta: posicionLista;
  punListaMulta: pLista;
  total: longInt;
  noEncontrado: boolean;
  punDataMulta: pDataMulta;
begin
  p := listaAutos.comienzo;
  while (p <> nulo) do begin
    x := listaAutos.Recuperar(p);
    if x.Clave = inVerTodasMultas.Text then
    begin
      punListaMulta := x.Valor2;
      posListaMulta := punListaMulta.comienzo; // recorro todas las multas
      while posListaMulta <> nulo do begin
        multa := punListaMulta.Recuperar(posListaMulta);
        memo2.lines.add(mostrarDatosMulta(multa));
        posListaMulta := punListaMulta.Siguiente(posListaMulta);
      end;
    end;
    p := listaAutos.siguiente(p);
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  auto:tipoElemento;
begin
  auto := autoSinDeuda(listaAutos);
  if auto.EsTEVacio then exit;
  Memo1.Lines.Add(mostrarDatosAuto(auto));
end;

end.
