unit ej10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  conjunto = array of integer;
  vectorConjuntos = array of conjunto;

  Tformej10 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formej10: Tformej10;

implementation

{$R *.dfm}

function hallarConjuntos(conjuntoDefault:conjunto;numObjetivo,i:integer):vectorConjuntos;
var
  j:integer;
  z:integer;
  vAux:conjunto;
  vAux2:conjunto;
begin

  if (conjuntoDefault[i] = numObjetivo) then begin

    setLength(vAux, length(conjuntoDefault) - 1);
    setLength(vAux2, 1);
    for j := i + 1 to length(conjuntoDefault) do begin
      vAux[j] := conjuntoDefault[j];
    end;
    vAux2[1]:=conjuntoDefault[i];
    result[i] := vAux2;
    inc(i);
    for z := 0 to length(vAux2)-1 do begin
      if vAux2[z]=numObjetivo then begin
          vAux2[z]:=0
      end;
    end;
    hallarConjuntos(vAux, numObjetivo, i);
  end;
  if conjuntoDefault[i] < numObjetivo then begin
    setLength(vAux, length(conjuntoDefault) - 1);
    for j := i + 1 to length(conjuntoDefault) do begin
      vAux[j] := conjuntoDefault[j];
    end;

    for j := 0 to length(vAux) do begin
      if ((conjuntoDefault[i] + vAux[j]) = numObjetivo) then
    end;

  end;


end;

end.
