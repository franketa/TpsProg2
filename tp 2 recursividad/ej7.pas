unit ej7;

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

  Tformej7 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

//   grilla : array[min..max, min..max] of String =
//   (
//    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
//    ('','S',' ',' ',' ',' ',' ',' ',' ',' '),
//    ('','S','S',' ',' ',' ',' ',' ',' ',' '),
//    ('',' ','S',' ',' ',' ',' ',' ',' ',' '),
//    ('',' ','S','S','S','S','S','S',' ',' '),
//    ('',' ',' ',' ',' ',' ',' ','S',' ',' '),
//    ('',' ',' ',' ',' ',' ',' ','S',' ',' '),
//    ('',' ',' ',' ',' ','C','S','S',' ',' '),
//    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
//    ('',' ',' ',' ',' ',' ',' ',' ',' ',' ')
//   );

//   grilla : array[min..max, min..max] of String =
//   (
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','','C')
//   );

var
  formej7: Tformej7;

implementation

{$R *.dfm}

function posicion.esIgualA(pos2:posicion):boolean;
begin
  result := false;
  if (fila = pos2.fila) and (col = pos2.col) then result := true;
end;

function posicionCabeza():posicion;
var
  x, y:integer;
begin
  result.fila := -1;
  for x := min to max do
    for y := min to max do begin
      if grilla[x,y] = 'C' then begin
        result.fila := x;
        result.col := y;
      end;
    end;
end;

function mostrarPosSerpiente(arrayPos:arrayPosiciones):string;
var
  strAux:string;
  i:integer;
begin

  if length(arrayPos) > 1 then begin
    strAux := 'La serpiente, cuya cabeza comenzó en ( ' + arrayPos[length(arrayPos)-1].fila.ToString + ',' +  GetEnumName(typeInfo(enumIndice), arrayPos[length(arrayPos)-1].col-1) + ') y recorrió ';
    for I := length(arrayPos)-2 downto 0 do
      strAux := strAux + '(' + arrayPos[i].fila.ToString + ',' +  GetEnumName(typeInfo(enumIndice), arrayPos[i].col-1) + ') ';
    strAux := strAux + '. Su longitud es de ' + length(arrayPos).ToString;
  end else if length(arrayPos) = 1 then
    strAux := 'La serpiente, cuya cabeza comenzó en ( ' + arrayPos[0].fila.ToString + ',' +  GetEnumName(typeInfo(enumIndice), arrayPos[0].col-1) + ') Sólo mide 1.'
  else
    strAux := 'No hay ninguna serpiente';

  result := strAux;
end;

function caminoSerpiente:arrayPosiciones;
var
  pos, pos2:posicion;
  auxPosiciones:arrayPosiciones;
  indiceArrayPosiciones:integer;

  procedure posicionesSerpiente(posActual, posAnterior:posicion);
  var
    posSiguiente:posicion;
    fin:boolean;
    arrayResultado:arrayPosiciones;
  begin
      // asigno el actual al vector
      setLength(auxPosiciones,indiceArrayPosiciones + 1);
      auxPosiciones[indiceArrayPosiciones] := posActual;
      inc(indiceArrayPosiciones);

      // caso misma fila columna siguiente
      posSiguiente := posActual;
      inc(posSiguiente.col);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.col < max) then begin
        posicionesSerpiente(posSiguiente, posActual);
      end;

      // caso misma fila columna anterior
      posSiguiente := posActual;
      dec(posSiguiente.col);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.col > min) then begin
        posicionesSerpiente(posSiguiente, posActual);
      end;

      // caso misma columna fila arriba
      posSiguiente := posActual;
      dec(posSiguiente.fila);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.fila > min) then begin
        posicionesSerpiente(posSiguiente, posActual);
      end;

      // caso misma columna fila abajo
      posSiguiente := posActual;
      inc(posSiguiente.fila);
      if (grilla[posSiguiente.fila, posSiguiente.col] = 'S') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.fila < max) then begin
        posicionesSerpiente(posSiguiente, posActual);
      end;
  end;

begin
  indiceArrayPosiciones := 0;
  pos := posicionCabeza();
  pos2.col := -1;
  pos2.fila := -1;
  posicionesSerpiente(pos, pos2);
  result := auxPosiciones;
end;

procedure Tformej7.Button1Click(Sender: TObject);
var
  auxInteger, indiceArrayPosiciones:integer;
begin
  memo1.Lines.Add(mostrarPosSerpiente(caminoSerpiente));
end;



end.
