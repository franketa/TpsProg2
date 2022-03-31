unit TADtarjetaDeCredito;

interface

uses SysUtils;

type
  TarjetaDeCredito = object
    private
       numeroDeTarjeta : string;
       fechaDeVencimientoMes: integer;
       fechaDeVencimientoAño: integer;
       limiteUnPago: real;
       limiteCuotas: real;
    public
      function validarNro():string;
      procedure setTarjeta(z:string);
      function mostrarTarjeta():string;
  end;


implementation




{ TarjetaDeCredito }

function TarjetaDeCredito.mostrarTarjeta():string;
begin
    result:=numeroDeTarjeta
end;
procedure TarjetaDeCredito.setTarjeta(z: string);
begin
  numeroDeTarjeta:=z;
end;

function TarjetaDeCredito.validarNro(): string;
var
I,X,C:integer;
auxChar: string;
v1: array[0..7] of integer;
vDuplicados: array[0..7] of integer;
vIndividuales: array[0..7] of integer;
v2: array[0..15] of integer;
auxiliarTarjeta:string;
auxiliarIndividuales:string;
totalSuma:integer;

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
      if (totalSuma-1) mod 10 = 0 then
      result:='true'+auxiliarTarjeta
      else
      result:='false'+auxiliarTarjeta+intToStr(TotalSuma);












end;

end.


