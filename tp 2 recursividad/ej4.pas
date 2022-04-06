unit ej4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormej4 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formej4: TFormej4;

implementation

{$R *.dfm}

function restaSucesiva(n1,n2:integer):real;
var
  i, resultado:integer;
  strAux:string;
begin
  resultado := 0;
  i := 1;

  if n2 = 0 then begin
    result := 0;
    exit;
  end else if n1 = n2 then begin
    result := 1;
    exit;
  end;

  if (n1 < n2) then begin
    result := resultado;
  end;


  inc(resultado);

  result := restaSucesiva(n1 - n2 , n2) + 1;

end;



procedure TFormej4.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(floatToStr(restaSucesiva(strtoint(edit1.Text), strtoint(edit2.Text))))
end;

end.
