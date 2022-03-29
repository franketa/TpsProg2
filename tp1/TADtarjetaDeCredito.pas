unit TADtarjetaDeCredito;

interface

uses SysUtils;

type
  TarjetaDeCredito = object
    private
       numeroDeTarjeta : longint;
       fechaDeVencimientoMes: integer;
       fechaDeVencimientoAño: integer;
       limiteUnPago: real;
       limiteCuotas: real;
    public
      function validarNro():boolean;
      procedure setTarjeta(z:integer);
      function mostrarTarjeta():string;
  end;


implementation




{ TarjetaDeCredito }

function TarjetaDeCredito.mostrarTarjeta():string;
begin
    result:= intToStr(numeroDeTarjeta)
end;
procedure TarjetaDeCredito.setTarjeta(z: longint);
begin
  numeroDeTarjeta:=z ;
end;

function TarjetaDeCredito.validarNro(): boolean;
var
I:integer;
auxChar: char;
v1: array[0..7] of integer;
vDuplicados: array[0..7] of integer;
auxiliarDuplicados:string;
auxiliarIndividuales:string;
totalSuma:integer;



begin
    if numeroDeTarjeta.ToString.Length = 16 then
      for I :=0 to numeroDeTarjeta.toString.Length-1 do Begin
        auxChar := numeroDeTarjeta.ToString[I];
        if I mod 2 = 0 then
        vDuplicados[I] := strToInt(auxChar)*2
        else
        v1[I] := strToInt(auxChar);
      End;
      for I := 0 to length(vDuplicados)-1 do Begin
       auxiliarDuplicados:=auxiliarDuplicados+intToStr(vDuplicados[I]);
       auxiliarIndividuales:=auxiliarIndividuales+intToStr(v1[I]);
      End;
      for I := 0 to (auxiliarDuplicados.Length-1)+(auxiliarIndividuales.Length-1) do Begin
        totalSuma:= strToInt(auxiliarDuplicados[I])+ strToInt(auxiliarIndividuales);
      End;
      if totalSuma mod 10 = 0 then
        result:=True
      else result:= False;

end;

end.
