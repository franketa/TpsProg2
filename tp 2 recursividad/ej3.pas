unit ej3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  Tformej3 = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    UpDown1: TUpDown;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formej3: Tformej3;

implementation

{$R *.dfm}

function recFibo(x:integer):longint;
begin

  if x <= 1 then result := x
  else result := recFibo(x - 1) + recFibo (x - 2);

end;


procedure Tformej3.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(recFibo(strToint(edit1.Text)).ToString);
end;

end.
