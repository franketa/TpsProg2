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
    (' ',' ',' ','C',' ',' ',' ',' ',' ',' '),
    ('',' ',' ','C',' ',' ',' ',' ',' ',' '),
    ('',' ',' ',' ',' ',' ',' ',' ',' ',' '),
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
    if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior))and not(posActual.esIgualA(posC1)) and (posActual.col < max) then begin
      result := posSiguiente;
      exit;
    end;
    posSiguiente := posActual;
    dec(posSiguiente.col);
    // caso misma fila columna anterior
    if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior))and not(posSiguiente.esIgualA(posC1)) and (posActual.col > min) then begin
      result := posSiguiente;
      exit;
    end;
    // caso misma columna fila arriba
    posSiguiente := posActual;
    dec(posSiguiente.col);
    if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior))and not(posSiguiente.esIgualA(posC1)) and (posActual.fila > min) then begin
      result := posSiguiente;
      exit;
    end;
    // caso misma columna fila abajo
    posSiguiente := posActual;
    inc(posSiguiente.fila);
    if (grilla[posSiguiente.fila, posSiguiente.col] = 'C') and not(posSiguiente.esIgualA(posAnterior))and not(posSiguiente.esIgualA(posC1)) and (posActual.fila < max) then begin
      result := posSiguiente;
      exit;
    end;
    // no encontró mas c's
    result.fila := -1;

  end;

  procedure llenarVectorPosicionesSerpiente(posActual, posAnterior:posicion);
  var
    posSiguiente:posicion;
  begin
      // asigno el actual al vector
      setLength(auxVectorResultado,indiceAuxVectorResultado + 1); // aumento el largo del vResultado en 1
      auxVectorResultado[indiceAuxVectorResultado] := posActual; // asigno la posicion en el ultimo del vResultado
      inc(indiceAuxVectorResultado); // aumento el indice del vResultado
      posSiguiente := posicionSiguienteCarbono(posActual, posAnterior, posAnterior); // busco la siguiente C
      if posSiguiente.fila <> -1 then begin
        llenarVectorPosicionesSerpiente(posSiguiente, posActual);
      end;
      // no encontró mas c's


  end;

begin
  indiceAuxVectorResultado := 0;
  pos.fila := 1;
  pos.col := 1;
  pos2.col := -1;
  pos2.fila := -1;
  llenarVectorPosicionesSerpiente(pos, pos2);
  result := auxVectorResultado;
end;

procedure Tformej9.Button1Click(Sender: TObject);
begin
  getVectorPosicionesSerpiente
end;

end.
