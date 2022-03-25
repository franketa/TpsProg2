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
begin
  f1.setFecha(1,3,2000);
  f2.setFecha(12,3,2000);
  f1.mostrarFecha(memo1);
 // f2.mostrarFecha(memo1);
//  if f1.esCorrecta then
//    memo1.Lines.Add('fecha 1 correcta');
  f1.restarDias(1);
  f1.mostrarFecha(memo1);
end;

procedure TFormEj7.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
