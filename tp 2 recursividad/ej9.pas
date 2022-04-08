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
    ('C','C','C','C',' ',' ',' ',' ',' ',' '),
    (' ',' ','C','',' ','',' ',' ',' ',' '),
    (' ',' ','C','','','',' ',' ',' ',' '),
    ('',' ',' ','',' ','',' ',' ',' ',' '),
    ('',' ',' ',' ',' ','',' ',' ',' ',' '),
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

function setVectorVectores(var memo:Tmemo):arrayarrayPosiciones;
var
  indiceArrayArray,i,j:integer;
  arrayDeArraysResultado:arrayarrayPosiciones;
  posInicial,posAnteriorInicial:posicion;
  strAux:string;
  function getVectorPosicionesCarbonos(posActual, posAnterior:posicion; auxVectorResultado:arrayPosiciones; indiceAuxVectorResultado:integer):arrayPosiciones;
    var
      contador:integer;
    procedure llenarArrayPosicionesCarbono(posActual,posAnterior:posicion);
    var
      pos1, pos2, posSiguiente:posicion;
    begin
      // inicializo
      pos1.fila := -1;
      pos2.fila := -1;
      contador := 0;
      // asigno el actual al vector
      if posActual.fila <> -1 then begin
        setLength(auxVectorResultado,indiceAuxVectorResultado + 1); // aumento el largo del vResultado en 1
        auxVectorResultado[indiceAuxVectorResultado] := posActual; // asigno la posicion en el ultimo del vResultado
        inc(indiceAuxVectorResultado); // aumento el indice del vResultado

        posSiguiente := posActual;
        inc(posSiguiente.col);
        // caso misma fila columna siguiente
        if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.col < max) then begin
          if contador = 1 then begin
            pos2 := posSiguiente;
            setLength(arrayDeArraysResultado,indiceArrayArray + 1); // aumento el largo del vResultado en 1
            arrayDeArraysResultado[indiceArrayArray] := getVectorPosicionesCarbonos(pos2,posActual,auxVectorResultado, indiceAuxVectorResultado); // asigno la posicion en el ultimo del vResultado
            inc(indiceArrayArray);
          end;
          if contador = 0 then begin
            pos1 := posSiguiente;
            inc(contador);
          end;
        end;
        posSiguiente := posActual;
        dec(posSiguiente.col);
        // caso misma fila columna anterior
        if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior))and (posSiguiente.col > min) then begin
          if contador = 1 then begin
            pos2 := posSiguiente;
            setLength(arrayDeArraysResultado,indiceArrayArray + 1); // aumento el largo del vResultado en 1
            arrayDeArraysResultado[indiceArrayArray] := getVectorPosicionesCarbonos(pos2,posActual,auxVectorResultado, indiceAuxVectorResultado); // asigno la posicion en el ultimo del vResultado
            inc(indiceArrayArray);
          end;
          if contador = 0 then begin
            pos1 := posSiguiente;
            inc(contador);
          end;
        end;
        // caso misma columna fila arriba
        posSiguiente := posActual;
        dec(posSiguiente.fila);
        if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior))and (posSiguiente.fila > min) then begin
          if contador = 1 then begin
            pos2 := posSiguiente;
            setLength(arrayDeArraysResultado,indiceArrayArray + 1); // aumento el largo del vResultado en 1
            arrayDeArraysResultado[indiceArrayArray] := getVectorPosicionesCarbonos(pos2,posActual,auxVectorResultado, indiceAuxVectorResultado); // asigno la posicion en el ultimo del vResultado
            inc(indiceArrayArray);
          end;
          if contador = 0 then begin
            pos1 := posSiguiente;
            inc(contador);
          end;
        end;
        // caso misma columna fila abajo
        posSiguiente := posActual;
        inc(posSiguiente.fila);
        if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior)) and (posSiguiente.fila < max) then begin
          // MODIFICAR, CUANDO getVectorPosicionesCarbonos no sigue llenando la cadena al vectordevectores
          if contador = 1 then begin
            pos2 := posSiguiente;
            setLength(arrayDeArraysResultado,indiceArrayArray + 1); // aumento el largo del vResultado en 1
            arrayDeArraysResultado[indiceArrayArray] := auxVectorResultado;
            arrayDeArraysResultado[indiceArrayArray] := getVectorPosicionesCarbonos(pos2,posActual,arrayDeArraysResultado[indiceArrayArray], indiceArrayArray); // asigno la posicion en el ultimo del vResultado

          end;
          if contador = 0 then begin
            pos1 := posSiguiente;
            inc(contador);
          end;
        end;
        // ya tengo la o las posiciones de las c siguientes
        llenarArrayPosicionesCarbono(pos1,posActual);
      end;
    end;
    begin
      llenarArrayPosicionesCarbono(posActual, posAnterior);
      result := auxVectorResultado;
    end;
  // funcion auxiliar fin
// funcion principal
begin
  indiceArrayArray := 0;
  posInicial.fila := 1;
  posInicial.col := 1;
  posAnteriorInicial.fila := -1;
  posAnteriorInicial.col := -1;
  setLength(arrayDeArraysResultado, 1);
  strAux := '';
  arrayDeArraysResultado[0] := getVectorPosicionesCarbonos(posInicial, posAnteriorInicial, arrayDeArraysResultado[0], indiceArrayArray);
  for i := 0 to length(arrayDeArraysResultado)-1 do begin
    for j := 0 to length(arrayDeArraysResultado[i])-1 do begin
      strAux:= strAux + ' (' + arrayDeArraysResultado[i][j].fila.ToString + ':' + arrayDeArraysResultado[i][j].col.ToString + ') ';
    end;
    memo.Lines.Add(strAux);
  end;



end;


procedure Tformej9.Button1Click(Sender: TObject);
begin
   setVectorVectores(memo1);
end;

end.
