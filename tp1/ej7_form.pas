unit ej7_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, TADFecha;

type

  TFormEj7 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEj7: TFormEj7;

implementation

{$R *.dfm}



procedure TFormEj7.Button1Click(Sender: TObject);
var
  f1,f2:fecha;
  aux:integer;
begin

end;

procedure TFormEj7.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
