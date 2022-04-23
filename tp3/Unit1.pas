unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, tipos, listArray;

const
  min = 1;
  max = 10;

type

  repetidos = array of integer;

  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  l1,l2:lista;
  X:tipoelemento;
  p:posicionLista;
begin
  l1.LlenarClavesRandom(10, 1, 11);
  l2.Crear(l1.DatoDeLaClave, l1.SizeList);
  memo1.Lines.Add(l1.RetornarClaves);
  p := l1.Comienzo ;
  x := l1.Recuperar(p);
  l2.Agregar(x);
  p := l1.Siguiente(p);
  while p <> nulo do begin
    x := l1.Recuperar(p);

    l2.Insertar(x, l1.Comienzo);

    p := l1.Siguiente(p);
  end;
  memo1.Lines.Add(l2.RetornarClaves);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  l1,l2:lista;
  X:tipoelemento;
  p,pMenor:posicionLista;
  menor : integer;
begin
  l1.LlenarClavesRandom(10, 1, 11);
  memo1.Lines.Add(l1.RetornarClaves);
  p := l1.Comienzo;
  x := l1.Recuperar(p);
  menor := x.Clave;
  pMenor := p;
  p := l1.Siguiente(p);
  while p <> nulo do begin
    x := l1.Recuperar(p);
    if (x.Clave < menor) then begin
      menor := x.Clave;
      pMenor := p;
    end;
    p := l1.Siguiente(p);
  end;
  memo1.Lines.Add('Menor :' + menor.ToString + ' pos: '+ pMenor.ToString);
end;

function estaRepetido(dato:integer;vector:repetidos):boolean;
var
  i:integer;
  flag:boolean;
begin
  flag := false;
  i:=0;
  while (i < length(vector) - 1) and not flag do begin
    if vector[i] = dato then flag := true;
    inc(i);
  end;
  result := flag;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  l1:lista;
  X:tipoelemento;
  p:posicionLista;
  vRepetidos:repetidos;
  num,rango,indiceRepetidos:integer;
  i: Integer;
begin
  rango := 4;
  l1.Crear(numero, 3);

  num := random(rango);
  x.Clave := num;
  l1.Agregar(x);

  setlength(vRepetidos, 1);
  vRepetidos[0]:= num;
  indiceRepetidos := 1;

  p := 2;

  while p < max do begin
    num := random(rango);
    while estaRepetido(num, vRepetidos) do begin
      num := random(rango);
    end;

    x.Clave := num;
    l1.Agregar(x);
    setlength(vRepetidos, indiceRepetidos + 1);
    vRepetidos[indiceRepetidos]:= num;
    inc(indiceRepetidos);

    p := l1.Siguiente(p);

  end;

  memo1.Lines.Add(l1.RetornarClaves);

end;


end.
