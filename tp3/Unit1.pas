unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, tipos, listArray;

const
  min = 1;
  max = 10;

type
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

procedure TForm1.Button3Click(Sender: TObject);
var
  l1:lista;
  X:tipoelemento;
  p:posicionLista;
  repetidos : array of integer;
  num,rango,i, j,indiceRepetidos:integer;
begin
  rango := 12;
  l1.Crear(numero, max);
  setlength(repetidos, 1);
  num := random(rango);
  x.Clave := num;
  l1.Agregar(x);
  repetidos[0]:= num;
  indiceRepetidos := 1;
  i:=1;
  p := 2;
  while p <> nulo do begin
     num := random(rango);
     j := 0;
     while num = repetidos[j] do begin
        num := random(rango);
        inc(j);
     end;
    x.Clave := num;
    l1.Agregar(x);
    setlength(repetidos, indiceRepetidos + 1);
    repetidos[i]:= num;
    inc(i);
    p := l1.Siguiente(p);
  end;
  memo1.Lines.Add(l1.RetornarClaves);

end;


end.