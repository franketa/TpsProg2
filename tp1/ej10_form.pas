unit ej10_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADTarjetaDeCredito;

type
  TForm1 = class(TForm)
    EditNroTarjeta: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formej10: TForm1;
  tarjeta1:TarjetaDeCredito;


implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  tarjeta1.setTarjeta(strToint(EditNroTarjeta.Text));
  Memo1.Lines.Add(tarjeta1.mostrarTarjeta);
end;


end.
