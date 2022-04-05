unit ej2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tformej2 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formej2: Tformej2;

implementation

{$R *.dfm}

function sumaSucesiva(n,m:integer):longint;
var
  i:integer;
begin

  if n = 1 then
    result := m
  else begin
    dec(n);
    result := m + sumaSucesiva(n, m);
  end;
end;

procedure Tformej2.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(sumaSucesiva(strToInt(edit1.Text),strToInt(edit2.Text)).ToString);
end;

end.
