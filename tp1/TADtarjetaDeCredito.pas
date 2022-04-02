unit TADtarjetaDeCredito;

interface

uses SysUtils, typinfo;

type

  emisor = (visa, mastercard, amex, maestro);

  vNumInn = array [1.. 13] of integer;


  Tlimites=record
   limiteUnPago: real;
   limiteCuotas: real;
  end;

  valoresLimites = array [visa .. maestro] of real;
  valoresInn = array [visa .. maestro] of vNumInn;

  TarjetaDeCredito = object
    private
       numeroDeTarjeta : string;
       emisorTarjeta:emisor;
       fechaDeVencimientoMes: integer;
       fechaDeVencimientoAño: integer;
       esValida:boolean;
       limites:Tlimites;
    public
      //function validarNro():boolean;
      //function entidadEmisora():emisor;
      procedure setTarjeta(z:string);
      procedure validarTarjeta();
      procedure setEntidadEmisora();
      function mostrarTarjeta():string;
      function mostrarLimites():Tlimites;
      function autorizarcompra(monto:real;cuotas:integer):boolean;
end;

const

  limitesDefault : array [visa .. maestro] of real = (80000, 80000, 90000, 80000);
  limitesDefaultCuotas : array [visa .. maestro] of real = (100000, 100000, 120000, 110000);
  porcentajeDescuentolimitesUnpago :  valoresLimites = (80, 80, 100, 100);
  porcentajeDescuentolimitesHasta6pagos :  valoresLimites = (90, 90, 90, 90);
  porcentajeDescuentolimitesMas6pagos :  valoresLimites = (70, 70, 70, 70);

  vInnMastercard : vNumInn = (20,21,22,23,24,25,26,27,51,52,53,54,55);
  vInnAmex : vNumInn = (34,35,36,37,00,00,00,00,00,00,00,00,00);
  vInnVisa : vNumInn = (4,00,00,00,00,00,00,00,00,00,00,00,00);
  vInnMaestro : vNumInn = (50,56,57,58,00,00,00,00,00,00,00,00,00);

implementation

{ TarjetaDeCredito }

procedure TarjetaDeCredito.setTarjeta(z: string);
begin
  numeroDeTarjeta:=z;
  validarTarjeta;
  if esValida then begin
    setEntidadEmisora;
    limites.limiteUnPago := limitesDefault[emisorTarjeta];
    limites.limiteCuotas := limitesDefaultCuotas[emisorTarjeta];
  end;
end;

procedure TarjetaDeCredito.validarTarjeta();
var
  i, acum, valorActual:integer;
begin

  esValida := false;

  if length(numeroDeTarjeta) < 16 then exit;

  acum := 0;
  for I := length(numeroDeTarjeta) downto 1 do begin
    valorActual := strToInt(numeroDeTarjeta[i]);
    if I mod 2 = 1 then
      valorActual := valorActual * 2;
    acum := valorActual + acum;
  end;
  if acum mod 10 = 0 then
    esValida := true


end;

procedure tarjetaDeCredito.setEntidadEmisora();
var
  j, k:integer;
  auxEmisor, i:emisor;
  vInn: valoresInn;
begin
  vInn[visa]:= vInnVisa;
  vInn[mastercard]:= vInnMastercard;
  vInn[amex]:= vInnAmex;
  vInn[maestro]:= vInnMaestro;

  j := strToInt(numeroDeTarjeta[1] + numeroDeTarjeta[2]);
  // se valoró la automatizacion antes que la eficiencia
  for i := visa to maestro do begin
    for k := 1 to length(vInn[i]) do
      if (vInn[i][k] = j) then auxEmisor := i;
  end;

  emisorTarjeta := auxEmisor;
end;

function TarjetaDeCredito.mostrarTarjeta():string;
var
  aux:string;
begin
  if esValida then begin
    aux:= 'Tarjeta Nº ' + numeroDeTarjeta + sLineBreak;
    aux := aux + 'Emisor: ' + GetEnumName(typeInfo(emisor), Ord(emisorTarjeta)) + sLineBreak;
    aux := aux + 'Vencimiento: ' + fechaDeVencimientoMes.ToString + '/' + fechaDeVencimientoAño.ToString + sLineBreak;
  end
  else aux := 'La tarjeta '+ numeroDeTarjeta +' no es válida ';
    result := aux;
end;

function tarjetaDeCredito.mostrarLimites():Tlimites;
begin
  if esValida then

  result:=limites
end;

function TarjetaDeCredito.autorizarcompra(monto:real;cuotas:integer):boolean;
var
  i:emisor;
  flag:boolean;
begin

  flag:=false;

end;

//function TarjetaDeCredito.validarNro(): boolean;
//var
//  I,X,C:integer;
//  auxChar: string;
//  v2: array[0..15] of integer;
//  auxiliarTarjeta:string;
//  totalSuma: integer;
//begin
//  X:=0;
//  C:=0;
//  for I :=1 to numeroDeTarjeta.Length do Begin
//    auxChar:= NumeroDeTarjeta[I];
//    v2[I-1]:= strToInt(auxChar);
//  End;
//
//  while X<=15  do Begin
//    v2[X] := v2[X]*2;
//    X:=X+2;
//  End;
//  I:=0;
//  for i := 0 to length(v2)-1 do Begin
//    auxiliarTarjeta:= auxiliarTarjeta+intToStr(v2[I]);
//  End;
//
//  for I := 1 to auxiliarTarjeta.Length do Begin
//  totalSuma:=totalSuma+strToInt(AuxiliarTarjeta[i]);
//  End;
//  if (totalSuma) mod 10 = 0 then
//  result:= True
//  else
//  result:=False;
//end;
//
//function tarjetaDeCredito.entidadEmisora(): emisor;
//var
//  emisorTar: emisor;
//
//begin
//
//  if strToInt(numeroDeTarjeta[1]) = 4 then
//    emisorTarjeta:= visa
//  else if strToInt(numeroDeTarjeta[1]) = 3 then
//    emisorTarjeta:= amex
//  else if strToInt(numeroDeTarjeta[1]) = 2  then
//    emisorTarjeta:= mastercard
//  else if strToInt(numeroDeTarjeta[1]) = 5 then
//    if strToInt(numeroDeTarjeta[2]) = 5 then
//      emisorTarjeta:= mastercard
//    else if strToInt(numeroDeTarjeta[2]) = 1 then
//      emisorTarjeta:= mastercard
//    else
//      emisorTarjeta:= maestro;
//
//
//  result := emisorTarjeta;
//end;

end.


