unit TADtarjetaDeCredito;

interface

uses SysUtils;

type

  emisor = (visa, mastercard, amex, maestro);

  Tlimites=record
   limiteUnPago: real;
   limiteCuotas: real;
  end;

  valoresLimites = array [visa .. maestro] of real;
  valoresLimitesR = array [visa .. maestro] of Tlimites;

  TarjetaDeCredito = object
    private
       numeroDeTarjeta : string;
       emisorTarjeta:emisor;
       fechaDeVencimientoMes: integer;
       fechaDeVencimientoAño: integer;
       esValida:boolean;
       limites:Tlimites;
    public
      function validarNro():boolean;
      procedure setTarjeta(z:string);
      function mostrarTarjeta():string;
      function mostrarLimites():Tlimites;
      function entidadEmisora():emisor;
      function autorizarcompra(monto:real;cuotas:integer):boolean;
  end;

const

  limitesDefault : array [visa .. maestro] of real = (80000, 80000, 90000, 80000);
  limitesDefaultCuotas : array [visa .. maestro] of real = (100000, 100000, 120000, 110000);
  DescuentolimitesUnpago :  valoresLimites = (80, 80, 100, 100);
  DescuentolimitesHasta6pagos :  valoresLimites = (90, 90, 90, 90);
  DescuentolimitesMas6pagos :  valoresLimites = (70, 70, 70, 70);

implementation

{ TarjetaDeCredito }

function TarjetaDeCredito.autorizarcompra(monto:real;cuotas:integer):boolean;
var
  i:emisor;
  limiteAux:Tlimites;
  flag:boolean;
begin

  flag:=false;


end;

function TarjetaDeCredito.mostrarTarjeta():string;
begin
    result:=numeroDeTarjeta
end;

procedure TarjetaDeCredito.setTarjeta(z: string);
begin
  numeroDeTarjeta:=z;
end;

function TarjetaDeCredito.validarNro(): boolean;
var
  I,X,C:integer;
  auxChar: string;
  v2: array[0..15] of integer;
  auxiliarTarjeta:string;
  totalSuma: integer;
begin
  X:=0;
  C:=0;
  for I :=1 to numeroDeTarjeta.Length do Begin
    auxChar:= NumeroDeTarjeta[I];
    v2[I-1]:= strToInt(auxChar);
  End;

  while X<=15  do Begin
    v2[X] := v2[X]*2;
    X:=X+2;
  End;
  I:=0;
  for i := 0 to length(v2)-1 do Begin
    auxiliarTarjeta:= auxiliarTarjeta+intToStr(v2[I]);
  End;

  for I := 1 to auxiliarTarjeta.Length do Begin
  totalSuma:=totalSuma+strToInt(AuxiliarTarjeta[i]);
  End;
  if (totalSuma) mod 10 = 0 then
  result:= True
  else
  result:=False;
end;

function tarjetaDeCredito.entidadEmisora(): emisor;
var
  emisorTarjeta: emisor;
begin

  if strToInt(numeroDeTarjeta[1]) = 4 then
    emisorTarjeta:= visa
  else if strToInt(numeroDeTarjeta[1]) = 3 then
    emisorTarjeta:= amex
  else if strToInt(numeroDeTarjeta[1]) = 2  then
    emisorTarjeta:= mastercard
  else if strToInt(numeroDeTarjeta[1]) = 5 then
    if strToInt(numeroDeTarjeta[2]) = 5 then
      emisorTarjeta:= mastercard
    else if strToInt(numeroDeTarjeta[2]) = 1 then
      emisorTarjeta:= mastercard
    else
      emisorTarjeta:= maestro;

  limites.limiteUnPago := limitesDefault[emisorTarjeta];
  limites.limiteCuotas := limitesDefaultCuotas[emisorTarjeta];
  result := emisorTarjeta;

end;

function tarjetaDeCredito.mostrarLimites():Tlimites;
begin
  if esValida then

  result:=limites
end;


end.


