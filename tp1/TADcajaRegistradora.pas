unit TADCajaregistradora;

interface

Uses

  SysUtils, Math , System.Variants, System.Classes;

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
//      CerrarCaja
  end;

const

  denominacion : Arraybilletes = (1, 2, 5, 10, 20, 50, 100, 200, 500, 1000);


implementation

procedure caja.Cargar(billACargar: arrayBilletes);
var
  I: EnumBilletes;
begin
  for I := b1 to b1000 do
    billetesCaja[I] := billACargar[i];
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
begin

end;



end.
