unit TADCajaregistradora;

interface

Uses

  SysUtils, Math , System.Variants, System.Classes, Vcl.StdCtrls;

type
  TError = (exitoso, erroneo);
  EnumBilletes = (B1, B2, B5, B10, B20, B50, B100, B200, B500, B1000);
  arrayBilletes =  array [B1 .. B1000] of integer;
  caja = object
    private
      billetesCaja:arrayBilletes;
    public
      procedure Cargar(billACargar:arraybilletes);
      function Saldo(billSaldo:arraybilletes):real;
      function DarVuelto( var billetesVuelto , billetesPago:arraybilletes;pago:real):TError;
      function CerrarCaja():string;
      function getSaldo():real;
  end;

const

  denominacion : Arraybilletes = (1, 2, 5, 10, 20, 50, 100, 200, 500, 1000);


implementation

function caja.getSaldo():real;
begin
  result:= saldo(billetesCaja);
end;

procedure caja.Cargar(billACargar: arrayBilletes);
var
  I: EnumBilletes;
begin
  for I := b1 to b1000 do
    billetesCaja[I] := billetesCaja[I] + billACargar[i];
end;

function caja.Saldo(billSaldo: arrayBilletes):real;
var
  I: EnumBilletes;
  realAux:real;
begin
  realAux :=0;
  for I := B1 to B1000 do
    realAux:= (billSaldo[I]* denominacion[I]) + realAux;
  Result := realAux;
end;

function caja.DarVuelto(VAR billetesVuelto, billetesPago :arrayBilletes; pago: Real):TError;
var
  i:enumBilletes;
  cantidadAPAgar:real;
  error:TError;
  vAux:arrayBilletes;
begin
  vAux := billetesCaja;
  for I := B1 to B1000 do
    billetesVuelto[I] := 0;

  Cargar(billetesPago);

  cantidadAPAgar := saldo(billetesPago) - pago ;

  error:=exitoso;

  while (cantidadAPagar > 0) and (error = exitoso) do begin
    for I := B1000 downto B1 do
      while (cantidadAPagar >= denominacion[I]) and (BilletesCaja[i] > 0) do begin
        billetesVuelto[I] := billetesVuelto[I] + 1;
        cantidadAPAgar := cantidadAPAgar - denominacion[i];
        billetesCaja[i] := billetesCaja[i] - 1;
      end;
      if cantidadAPAgar <> 0 then
          error := erroneo
      else
        billetesCaja := vAux;
  end;

  result := error;

end;

function caja.CerrarCaja():string;
var
  strAux:string;
  I:enumbilletes;
begin
  strAux:='La composicion de la caja final es: ' + sLineBreak;
  strAux:= strAux + 'Monedas: ' + sLineBreak;
  for I := B1 to B5 do
    strAux := strAux + denominacion[i].ToString + ' : ' + Billetescaja[i].ToString  + sLineBreak;
  strAux:= strAux + 'Billetes: ' + sLineBreak;
  for I := B10 to B1000 do
    strAux := strAux + denominacion[i].ToString + ' : ' + Billetescaja[i].ToString  + sLineBreak;
  strAux:= strAux + 'Con un saldo total de: ' + floattoStr(Saldo(Billetescaja));

  result := strAux;
end;







end.
