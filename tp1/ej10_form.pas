unit ej10_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADTarjetaDeCredito;

type
  TFormej10 = class(TForm)
    EditNroTarjeta: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TFormej10.Button2Click(Sender: TObject);
begin
  memo1.Lines.add(tarjeta1.mostrarTarjeta());
end;




procedure TFormej10.FormCreate(Sender: TObject);
begin
  tarjeta1.setTarjeta('52122000');

end;

end.
