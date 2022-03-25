unit TADnumeroRacional;

interface

Uses
  SysUtils;

//const
//  Numerador1 = 1;
//  Numerador2 = 3;
//  Denominador1 = 2;
//  Denominador2 = 6;
//

type
  NumeroRacional = object
    private
      Numerador: longint;
      Denominador: longint;
    public
      procedure setNumerador(num:integer);
      procedure setDenominador(num:integer);
      function Sumar(n2:NumeroRacional):NumeroRacional;

      function getdenominador():longint;
      function getnumerador():longint;
      function mostrar():string;
  end;

  implementation

function NumeroRacional.getdenominador():longint;
begin
  result := denominador
end;

function NumeroRacional.getnumerador():longint;
begin
  result := numerador
end;

procedure NumeroRacional.setNumerador(num:integer);
begin
  numerador := num;
end;

procedure NumeroRacional.setDenominador(num:integer);
begin
  Denominador := num;
end;

function NumeroRacional.Sumar(n2:NumeroRacional):NumeroRacional;
var
  denN2,numN2,denAux,Numerador_Resultado1,Numerador_Resultado2:longint;
  resultado: NumeroRacional;
begin

  numN2 := n2.getNumerador;
  denN2 := n2.getDenominador;

  if denominador = denN2 then begin
    resultado.setDenominador(DenN2);
    resultado.setNumerador(NumN2 + numerador);
    result:=resultado;
    exit;
  end;

  denAux := denN2 * denominador;
  Numerador_Resultado1 := DenN2 * numerador;
  Numerador_Resultado2 := denominador * numN2;
  resultado.setDenominador(denAux);
  resultado.setNumerador(Numerador_Resultado1 + Numerador_Resultado2);

  result:=resultado;
end;

function NumeroRacional.mostrar():string;
begin
  result:= intToStr(numerador) + '/' + intToStr(Denominador);
end;

end.
