unit ej1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormEj1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEj1: TFormEj1;

implementation

{$R *.dfm}

function esPalindromo(s:string):boolean;
var
  i:integer;
begin
  result := false;
  s := upperCase(s);
  i := 1;
  if (length(s) = 1) or (s = '') then result := true
  else begin
    if (s[i] = s[length(s)]) then begin
      s := copy(s, i+1, length(s)-2);
      inc(i);
      result := esPalindromo(s);
    end;
  end;
end;

procedure TFormEj1.Button1Click(Sender: TObject);
begin
  if esPalindromo(edit1.Text) then
    memo1.Lines.Add('Es palindromo')
  else
    memo1.Lines.Add('No es palindromo')
end;

end.
