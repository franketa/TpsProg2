unit ej9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,typinfo, Vcl.StdCtrls;




type
  enumIndice = (A, B, C, D, E, F, G, H, I, J);
  posicion = object
    fila:integer;
    col :integer;
  public
    function esIgualA(pos2:posicion):boolean;
  end;

  arrayPosiciones = array of posicion;
type
  Tformej9 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  min = 1;
  max = 10;
   grilla : array[min..max, min..max] of String =
   (
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
    ('',' ','S','S',' ',' ',' ',' ',' ',' '),
    ('','C',' ','S',' ',' ',' ',' ',' ',' '),
    ('','S','S','S',' ',' ',' ',' ',' ',' '),
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' ')
   );


var
  formej9: Tformej9;

implementation

{$R *.dfm}

function posicion.esIgualA(pos2:posicion):boolean;
begin
  result := false;
  if (fila = pos2.fila) and (col = pos2.col) then result := true;
end;

function caminoCarbono:arrayPosiciones;
var
  pos, pos2:posicion;
  auxPosiciones:arrayPosiciones;
  indiceArrayPosiciones:integer;

  procedure posicionesCarbono(posActual, posAnterior:posicion; var indiceArray:integer; var arrayResultado:arrayPosiciones);
  var
    posSiguiente:posicion;
    fin:boolean;
  begin
      // asigno el actual al vector
      setLength(arrayResultado,indiceArray + 1);
      arrayResultado[indiceArray] := posActual;
      inc(indiceArray);

      // caso misma fila columna siguiente
      posSiguiente := posActual;
      inc(posSiguiente.col);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.col < max) then begin
        posicionesCarbono(posSiguiente, posActual, indiceArray, arrayResultado);
      end;

      // caso misma fila columna anterior
      posSiguiente := posActual;
      dec(posSiguiente.col);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.col > min) then
        posicionesCarbono(posSiguiente, posActual, indiceArray, arrayResultado);

      // caso misma columna fila arriba
      posSiguiente := posActual;
      dec(posSiguiente.fila);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.fila > min) then
        posicionesCarbono(posSiguiente,posActual, indiceArray, arrayResultado);

      // caso misma columna fila abajo
      posSiguiente := posActual;
      inc(posSiguiente.fila);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.fila < max) then
        posicionesCarbono(posSiguiente,posActual, indiceArray, arrayResultado);
  end;

begin
  indiceArrayPosiciones := 0;
  pos2.col := -1;
  pos2.fila := -1;
  posicionesCarbono(pos, pos2, indiceArrayPosiciones, auxPosiciones);
  result := auxPosiciones;
end;


end.
