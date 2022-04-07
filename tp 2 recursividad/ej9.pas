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

  arrayArrayPosiciones = array of arrayPosiciones;

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

function getVectorPosicionesSerpiente:arrayPosiciones;
var
  pos, pos2:posicion;
  auxVectorResultado:arrayPosiciones;
  indiceAuxVectorResultado:integer;

  function posicionSiguienteCarbono(posActual,posAnterior,posC1:posicion):posicion;
  var
    posC2aux,posSiguiente:posicion;
  begin
    posSiguiente := posActual;
    inc(posSiguiente.col);
    // caso misma fila columna siguiente
    if (grilla[posActual.fila, posActual.col] = 'C') and not(posActual.esIgualA(posAnterior))and not(posActual.esIgualA(posC1)) and (posActual.col < max) then begin
      result := posSiguiente;
      exit;
    end;
    posSiguiente := posActual;
    dec(posSiguiente.col);
    // caso misma fila columna anterior
    if (grilla[posActual.fila, posActual.col] = 'C') and not(posActual.esIgualA(posAnterior))and not(posActual.esIgualA(posC1)) and (posActual.col > min) then begin
      result := posSiguiente;
      exit;
    end;
    // caso misma columna fila arriba
    posSiguiente := posActual;
    dec(posSiguiente.col);
    if (grilla[posActual.fila, posActual.col] = 'C') and not(posActual.esIgualA(posAnterior))and not(posActual.esIgualA(posC1)) and (posActual.fila > min) then begin
      result := posSiguiente;
      exit;
    end;
    // caso misma columna fila abajo
    posSiguiente := posActual;
    inc(posSiguiente.fila);
    if (grilla[posActual.fila, posActual.col] = 'C') and not(posActual.esIgualA(posAnterior))and not(posActual.esIgualA(posC1)) and (posActual.fila < max) then begin
      result := posSiguiente;
      exit;
    end;
  end;
  procedure llenarVectorPosicionesSerpiente(posActual, posAnterior:posicion);
  var
    posSiguiente:posicion;
  begin
      // asigno el actual al vector
      setLength(auxVectorResultado,indiceAuxVectorResultado + 1);
      auxVectorResultado[indiceAuxVectorResultado] := posActual;
      inc(indiceAuxVectorResultado);
      posSiguiente := posicionSiguienteCarbono(posActual, posAnterior, posAnterior);
      if posSiguiente then



  end;

begin
  indiceAuxVectorResultado := 0;
  pos := posicionCabeza();
  pos2.col := -1;
  pos2.fila := -1;
  llenarVectorPosicionesSerpiente(pos, pos2);
  result := auxVectorResultado;
end;

end.
