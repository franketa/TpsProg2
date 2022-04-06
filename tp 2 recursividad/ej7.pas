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
//  grilla : array[min..max, min..max] of String =
//   (
//    ('', '', '', '', '', '', '', '','',''),
//    ('', 'S', '', '', '', '', '', '','',''),
//    ('', 'S', 'S', '', '', '', '', '','',''),
//    ('', '', 'S', '', '', '', '', '','',''),
//    ('', '', 'S', 'S', 'S', 'S', 'S', '','',''),
//    ('', '', '', '', '', '', '', 'S','',''),
//    ('', '', '', '', '', '', '', 'S','',''),
//    ('', '', '', '', '', 'C', 'S', 'S','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','','')
//   );

//   grilla : array[min..max, min..max] of String =
//   (
//    ('', '', '', '', '', '', '', '','',''),
//    ('', 'S', '', '', '', '', '', '','',''),
//    ('', 'S', 'S', '', '', '', '', '','',''),
//    ('', '', 'S', '', '', '', '', '','',''),
//    ('', '', 'S', 'S', 'S', 'S', 'S', '','',''),
//    ('', '', '', '', '', '', '', 'S','',''),
//    ('', '', '', '', '', '', '', 'S','',''),
//    ('', '', '', '', '', 'C', 'S', 'S','',''),
//    ('', '', '', '', '', '', '', '','',''),
//    ('', '', '', '', '', '', '', '','','')
//   );

   grilla : array[min..max, min..max] of String =
   (
    ('C', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','',''),
    ('', '', '', '', '', '', '', '','','')
   );

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
    strAux := 'La serpiente, cuya cabeza comenzó en ( ' + arrayPos[length(arrayPos)-1].fila.ToString + ',' +  GetEnumName(typeInfo(enumIndice), arrayPos[length(arrayPos)-1].col-1) + ') y recorrió';
    for I := length(arrayPos)-1 downto 0 do
      strAux := strAux + '(' + arrayPos[i].fila.ToString + ',' +  GetEnumName(typeInfo(enumIndice), arrayPos[i].col-1) + ') ';
    strAux := strAux + '. Su longitud es de ' + length(arrayPos).ToString;
  end else if length(arrayPos) = 1 then
    strAux := 'La serpiente, cuya cabeza comenzó en ( ' + arrayPos[0].fila.ToString + ',' +  GetEnumName(typeInfo(enumIndice), arrayPos[0].col-1) + ') Sólo mide 1.'
  else
    strAux := 'No hay ninguna serpiente';

  result := strAux;
end;

procedure posSerpiente(posAnterior:posicion; var indiceArray:integer; var arrayResultado:arrayPosiciones);
begin
  if posAnterior.fila <> -1 then begin
    // Si es una posicion valida la agrego al vector resultado
    setLength(arrayResultado, indiceArray + 1);
    arrayResultado[indiceArray] := posAnterior;
    inc(indiceArray);
// pregunto por cada fila columna siguiente si hay 'S'
    // caso misma fila columna siguiente
    inc(posAnterior.col);
    if (grilla[posAnterior.fila, posAnterior.col] = 'S') and not(posAnterior.esIgualA(arrayResultado[indiceArray - 2])) and (posAnterior.col < max)  then
      posSerpiente(posAnterior, indiceArray, arrayResultado);
    // caso misma fila columna anterior
    posAnterior := arrayResultado[indiceArray - 1];
    dec(posAnterior.col);
    if (grilla[posAnterior.fila, posAnterior.col] = 'S') and not(posAnterior.esIgualA(arrayResultado[indiceArray - 2 ])) and (posAnterior.col > min)  then
      posSerpiente(posAnterior, indiceArray, arrayResultado);
    // caso misma columna fila arriba
    posAnterior := arrayResultado[indiceArray - 1];
    dec(posAnterior.fila);
    if (grilla[posAnterior.fila, posAnterior.col] = 'S') and not(posAnterior.esIgualA(arrayResultado[indiceArray - 2 ])) and (posAnterior.fila > min)  then
      posSerpiente(posAnterior, indiceArray, arrayResultado);
    // caso misma columna fila abajo
    posAnterior := arrayResultado[indiceArray - 1];
    inc(posAnterior.fila);
    if (grilla[posAnterior.fila, posAnterior.col] = 'S') and not(posAnterior.esIgualA(arrayResultado[indiceArray - 2 ])) and (posAnterior.fila < max) then
      posSerpiente(posAnterior, indiceArray, arrayResultado);
  end;
end;

procedure Tformej7.Button1Click(Sender: TObject);
var
  auxInteger, indiceArrayPosiciones:integer;
  pos:posicion;
  auxPosiciones:arrayPosiciones;
begin
  indiceArrayPosiciones := 0;
  pos := posicionCabeza();
  memo1.Lines.Add('Fila: '+ pos.fila.ToString + 'Columna: '+ GetEnumName(typeInfo(enumIndice), Ord(pos.col)));
  posSerpiente(pos, indiceArrayPosiciones, auxPosiciones);
  memo1.Lines.Add(mostrarPosSerpiente(auxPosiciones));
end;



end.
