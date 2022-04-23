unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm10 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Vector = array [1..15] of integer;

var
  Form10: TForm10;
  v : Vector;

implementation

{$R *.dfm}

function explosivo(n:integer;b:integer;resultado:string): string;
var n1,n2: integer;
begin
n1 := (n div b);
n2 := n - (n div b);

   if (n1 > b) then begin
    result:=explosivo(n1,b,resultado);
   end
   else resultado := resultado + n1.ToString + ' , ' ;

   if (n2 > b) then begin
    result:=explosivo(n2,b,resultado);
   end
   else resultado := resultado + n2.ToString ;

   if (n1 <= b) and (n2 <= b) then begin    //Caso Base
    result := resultado;
   end;

end;

procedure TForm10.Button1Click(Sender: TObject);
var n,b : integer;
t,r: string;
begin
  r := '';
  n := StrToInt(edit1.Text);
  b := StrToInt(edit2.Text);
  t := 'Número: ' + n.ToString + ' - Bomba: ' + b.ToString;
  memo1.Lines.Add(t);
  t := explosivo(n,b,r);
  memo1.Lines.Add('[' + t + ']');
end;

end.
