unit ej5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormej5 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formej5: TFormej5;

implementation

{$R *.dfm}

function parsimoniosa (n:integer):string;
begin

  if n = 1 then result := '**\ /**' else
    if n mod 2 = 0 then result := '++\' + parsimoniosa(n-1) + '/++'
      else
    if n mod 2 = 1 then result := '**\' + parsimoniosa(n-1) + '/**';

end;

procedure TFormej5.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(parsimoniosa(strtoint(edit1.Text)));
end;

end.
