unit ej6_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEstacionamiento;

type
  TFormEj6 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    inputPatente: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEj6: TFormEj6;
  Estacionamiento1:estacionamiento;

implementation

{$R *.dfm}

procedure TFormEj6.FormCreate(Sender: TObject);
var
  horaEntrada, horaSalida:horario;
begin
  horaEntrada.horas := 22;
  horaEntrada.minutos :=42;
  horaSalida.horas := 23;
  horaSalida.minutos := 41;
  Estacionamiento1.addAuto(1001, horaEntrada,horaSalida);
  Estacionamiento1.addAuto(10145, horaEntrada,horaSalida);
  memo1.Lines.Add(Estacionamiento1.getTarifaAutoDado(1001));
end;

end.
