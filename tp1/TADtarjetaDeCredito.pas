unit TADtarjetaDeCredito;

interface

uses SysUtils;

type
  TarjetaDeCredito = object
    private
       numeroDeTarjeta : int64;
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
    result:= intToStr(numeroDeTarjeta)
end;
procedure TarjetaDeCredito.setTarjeta(z: string);
begin
  numeroDeTarjeta:=strToInt64(z) ;
end;

function TarjetaDeCredito.validarNro(): string;
var
I:integer;
auxChar: char;
v1: array[0..7] of integer;
vDuplicados: array[0..7] of integer;
auxiliarDuplicados:string;
auxiliarIndividuales:string;
totalSuma:integer;

begin
      for I :=0 to numeroDeTarjeta.toString.Length-1 do Begin
        auxChar := numeroDeTarjeta.ToString[I];
        if I mod 2 = 0 then
        vDuplicados[I] := strToInt(auxChar)*2
        else v1[I] := strToInt(auxChar);
      End;


end;

end.
