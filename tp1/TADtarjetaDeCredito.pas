unit TADtarjetaDeCredito;

interface

uses SysUtils;

type
  TarjetaDeCredito = object
    private
       numeroDeTarjeta : integer;
       fechaDeVencimientoMes: integer;
       fechaDeVencimientoAño: integer;
       limiteUnPago: real;
       limiteCuotas: real;
    public
      function validarNro():boolean;
      procedure stepper(hi,lo,step:integer);
  end;


implementation




{ TarjetaDeCredito }

procedure TarjetaDeCredito.stepper(hi, lo, step: integer);
begin

end;

function TarjetaDeCredito.validarNro(): boolean;
var
I:integer;
auxChar: char;
v1: array[0..7] of integer;
vDuplicados: array[0..7] of integer;


begin
    if numeroDeTarjeta.ToString.Length = 16 then
      for I :=0 to numeroDeTarjeta.toString.Length-1 do Begin
        auxChar := numeroDeTarjeta.ToString[I];
        if I mod 2 = 0 then
        vDuplicados[I] := strToInt(auxChar)*2
        else
        v1[I] := strToInt(auxChar);
      End;
      for I := 0 to length(vDuplicados) do Begin

      End;









end;


end.
