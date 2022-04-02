unit TADtarjetaDeCredito;

interface

uses SysUtils, typinfo, TADFecha;

type

  emisor = (Visa, Mastercard, Amex, Maestro);

  vNumInn = array [1.. 13] of integer;

  vecFecha = array [1..3] of string;

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
       fechaDeVencimiento:fecha;
       esValida:boolean;
       limites:Tlimites;
       procedure reducirLimiteCredito(monto:real; cuotas:integer);
       function estaVencida(fechaActual:fecha):boolean;
       procedure validarTarjeta();
    public
      //function validarNro():boolean;
      //function entidadEmisora():emisor;
      procedure setTarjeta(z:string;vencimiento:Fecha);
      procedure setEntidadEmisora();
      function mostrarTarjeta():string;
      function mostrarLimites():string;
      function validarCompra(monto:real;cuotas:integer;fechaCompra:fecha):string;


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

procedure TarjetaDeCredito.setTarjeta(z: string;vencimiento:Fecha);
begin
  numeroDeTarjeta:=z;
  validarTarjeta;
  if esValida then begin
    setEntidadEmisora;
    limites.limiteUnPago := limitesDefault[emisorTarjeta];
    limites.limiteCuotas := limitesDefaultCuotas[emisorTarjeta];
    fechaDeVencimiento := vencimiento;
  end;
end;

procedure TarjetaDeCredito.validarTarjeta();
var
  i, acum, valorActual:integer;
begin

  esValida := false;

  if length(numeroDeTarjeta) <> 16 then exit;

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
    aux := aux + 'Vencimiento: ' + fechaDeVencimiento.devolverStrFecha + sLineBreak;
  end
  else aux := 'La tarjeta '+ numeroDeTarjeta +' no es válida ';
    result := aux;
end;

function tarjetaDeCredito.mostrarLimites():string;
begin
  if esValida then result := 'Limite en un pago disponible: ' +
    floatTostr(limites.limiteUnPago) + sLineBreak + 'Limite en cuotas disponible: '+
    floatTostr(limites.limiteCuotas)
  else result:= 'La tarjeta no es válida.'
end;

function tarjetaDeCredito.estaVencida(fechaActual:fecha):boolean;
begin
  result := true;
  if fechaActual.compararFechas(fechaDeVencimiento) = posterior then result := false;
end;

function TarjetaDeCredito.validarCompra(monto:real;cuotas:integer;fechaCompra:fecha):string;
var
  i:emisor;
  flag:boolean;
begin

  flag:=false;
  if (monto > 0) and not estaVencida(fechaCompra) then
    if cuotas = 1 then begin
      if monto <= limites.limiteUnPago then
        flag := true;
    end
    else
      if monto <= limites.limiteCuotas then
        flag := true;

  if flag then begin
    reducirLimiteCredito(monto, cuotas);
    result := 'La compra ha sido validada correctamente';
  end else
    result := 'La compra no ha sido validada'
end;

procedure TarjetaDeCredito.reducirLimiteCredito(monto:real; cuotas:integer);
var
  i:emisor;
  cuotasRestantes:integer;
begin
  cuotasRestantes := cuotas - 1;
  limites.limiteUnPago := limites.limiteUnPago - (monto * porcentajeDescuentolimitesUnpago[emisorTarjeta] / 100);
  while cuotasRestantes > 0 do begin
    if cuotasRestantes > 6 then
      limites.limiteCuotas := limites.limiteCuotas - (monto * porcentajeDescuentolimitesMas6pagos[emisorTarjeta] / 100);
    limites.limiteCuotas := limites.limiteCuotas - (monto * porcentajeDescuentolimitesHasta6pagos[emisorTarjeta] / 100);
  end;
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


