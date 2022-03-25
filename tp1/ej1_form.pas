unit ej1_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADnumeroRacional;

type
  TFormEj1 = class(TForm)
    btnSumar: TButton;
    Memo1: TMemo;
    Enum1: TEdit;
    eden1: TEdit;
    eden2: TEdit;
    enum2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure btnSumarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEj1: TFormEj1;

implementation

{$R *.dfm}

procedure TFormEj1.btnSumarClick(Sender: TObject);
var
num1, num2, resultado:NumeroRacional;

begin

  if (Strtoint(Eden1.Text) = 0) or (Strtoint(Eden2.Text) = 0) then
    Memo1.Lines.Add('ERROR, no se puede dividir por cero, ingresar otro numero')
  else begin
    num1.setNumerador(Strtoint(Enum1.Text));
    num1.setDenominador(Strtoint(Eden1.Text));
    num2.setNumerador(Strtoint(Enum2.Text));
    num2.setDenominador(Strtoint(Eden2.Text));

    resultado := num1.Sumar(num2);
    memo1.Lines.Add(resultado.mostrar());

  end;


end;

end.
