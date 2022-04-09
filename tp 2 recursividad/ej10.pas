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

function hallarConjuntos(conjuntoDefault:conjunto;num,i:integer):vectorConjuntos;
var
  j:integer;
  vAux:conjunto;
begin

  if conjuntoDefault[i] = num then begin
    setLength(vAux, length(conjuntoDefault) - 1);
    for j := i + 1 to length(conjuntoDefault) do begin
      vAux[j] := conjuntoDefault[j];
    end;
    result[i] := conjuntoDefault[i];
    inc(i);
    hallarConjuntos(vAux, num, i);
  end;
  if conjuntoDefault[i] < num then begin
    setLength(vAux, length(conjuntoDefault) - 1);
    for j := i + 1 to length(conjuntoDefault) do begin
      vAux[j] := conjuntoDefault[j];
    end;

    for j := 0 to length(vAux) do begin
      if ((conjuntoDefault[i] + vAux[j]) = num) then
    end;

  end;


end;

end.
