unit TADtarjetaDeCredito;

interface

uses SysUtils;

type
  Tlimites=record
   limiteUnPago: real;
   limiteCuotas: real;
  end;
  TarjetaDeCredito = object
    private
       numeroDeTarjeta : string;
       fechaDeVencimientoMes: integer;
       fechaDeVencimientoAño: integer;
       esValida:boolean;
       limites:Tlimites;
    public
      function validarNro():boolean;
      procedure setTarjeta(z:string);
      function mostrarTarjeta():string;
      function mostrarLimites():Tlimites;
      function entidadEmisora():string  ;
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

function tarjetaDeCredito.entidadEmisora(): string;
var
emisor:string;
begin


if strToInt(numeroDeTarjeta[1])=4 then
        emisor:= 'Visa'

      else if strToInt(numeroDeTarjeta[1])=3 then begin
        emisor:= 'Amex'
      end
      else if strToInt(numeroDeTarjeta[1])=2  then begin
        emisor:= 'Mastercard'
      end
      else if strToInt(numeroDeTarjeta[1])=5 then begin
        if strToInt(numeroDeTarjeta[2])=5 then
          emisor:='Mastercard'
        else if strToInt(numeroDeTarjeta[2])=1 then
             emisor:='Mastercard'
      end
      else
      emisor:= 'Maestro';
end;

function tarjetaDeCredito.mostrarLimites():Tlimites;
begin
  if esValida then

  result:=limites
end;


end.


