unit ej8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, listArray, tipos, Vcl.StdCtrls, System.TypInfo;

type

  enumEntidades = (puntito, frutilla, banana, cereza, fantasma, bonus);
  enumVEntidades = array [puntito .. Bonus] of integer;
  pEntidad = ^enumEntidades;

  TForm3 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  vPuntos : enumVEntidades = (1, 10, 30, 50, 100, 0);
  largoRecorrido = 12;
var
  Form3: TForm3;

implementation

{$R *.dfm}

function entidadRandom():enumEntidades;
var
  i:Integer;
begin
  i := random(5);
  result :=  enumEntidades(i);
end;

function mostrarRecorrido(l:lista):String;
var
  p:posicionLista;
  entidad:tipoElemento;
  entidadActual : enumEntidades;
  pEntidadActual:pEntidad;
  strAux:string;
begin
  strAux := '';
  p := l.Comienzo;
  while p <> nulo do begin
    entidad := l.Recuperar(p);
    pEntidadActual := entidad.Valor2;
    entidadActual := pEntidadActual^;
    strAux := strAux + GetEnumName(TypeInfo(enumEntidades), ord(entidadActual)) + ', ';
    p := l.Siguiente(p);
  end;
  result := strAux;
end;

procedure setListaRecorrido(var l:lista);
var
  p:posicionLista;
  entidad:tipoElemento;
  pEntidadActual:pEntidad;
  clave:integer;
begin
  l.Crear(numero, largoRecorrido);
  clave := 1;
  entidad.Clave := clave;
  new(pEntidadActual);
  pEntidadActual^ := entidadRandom;
  entidad.Valor2 := pEntidadActual;
  l.Agregar(entidad);
  p := l.Comienzo;
  while p < largoRecorrido do begin
    clave := p + 1;
    entidad.Clave := clave;
    new(pEntidadActual);
    pEntidadActual^ := entidadRandom;
    entidad.Valor2 := pEntidadActual;
    l.Agregar(entidad);
    p := l.Siguiente(p);
  end;
end;

function getPuntaje(l:lista):integer;
var
  p:posicionLista;
  entidad:tipoElemento;
  entidadActual : enumEntidades;
  pEntidadActual:pEntidad;
  distanciaBonus, auxPuntaje:integer;
  bonusActivado, enJuego :boolean;
begin
  bonusActivado := false;
  enJuego := true;
  auxPuntaje := 0;
  distanciaBonus := 0;
  p := l.Comienzo;
  while (p <> nulo)and enJuego do begin
    entidad := l.Recuperar(p);
    pEntidadActual := entidad.Valor2;
    entidadActual := pEntidadActual^;
    if distanciaBonus > 10 then bonusActivado := false;
    if entidadActual = bonus then begin
      bonusActivado := true;
      distanciaBonus := 0;
    end;
    if bonusActivado then begin
      auxPuntaje := auxPuntaje + (vPuntos[entidadActual] * 2);
      inc(distanciaBonus);
    end;
    auxPuntaje := auxPuntaje + vPuntos[entidadActual];
    if (entidadActual = fantasma) and not bonusActivado then begin
      enJuego := false;
      auxPuntaje := -1;
    end;
    p := l.Siguiente(p);
  end;
  result := auxPuntaje;


end;

procedure setBonus(p:posicionLista;var l:lista);
var
  entidadActual : enumEntidades;
  pEntidadActual:pEntidad;
  entidad:tipoElemento;
begin
  entidad := l.Recuperar(p);
  pEntidadActual := entidad.Valor2;
  pEntidadActual^ := bonus;
  l.Actualizar(entidad, p);
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  recorrido:lista;
begin
  setListaRecorrido(recorrido);
  setBonus(1, recorrido);
  memo1.Lines.Add(mostrarRecorrido(recorrido));
  memo1.Lines.Add(getPuntaje(recorrido).ToString);
end;

end.
