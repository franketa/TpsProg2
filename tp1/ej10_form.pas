unit ej10_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADTarjetaDeCredito,
  Vcl.Mask;

type
  TFormej10 = class(TForm)
    Memo1: TMemo;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    inputNroTarjeta: TMaskEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formej10: TFormej10;
  tarjeta1:TarjetaDeCredito;


implementation

{$R *.dfm}

procedure TFormej10.Button1Click(Sender: TObject);
begin
    tarjeta1.setTarjeta(inputNroTarjeta.Text);

end;

procedure TFormej10.Button2Click(Sender: TObject);
begin
  memo1.Lines.add(tarjeta1.mostrarTarjeta());
end;




end.
