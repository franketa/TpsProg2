unit ej6_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEstacionamiento;

type
  TFormEj6 = class(TForm)
    Memo1: TMemo;
    btnVerTarifaAPagar: TButton;
    inputPatente: TEdit;
    btnVerAutos: TButton;
    inputSetTarifa: TEdit;
    btnDefinirTarifa: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnDefinirTarifaClick(Sender: TObject);
    procedure btnVerAutosClick(Sender: TObject);
    procedure btnVerTarifaAPagarClick(Sender: TObject);
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

procedure TFormEj6.btnDefinirTarifaClick(Sender: TObject);
begin
  Estacionamiento1.setTarifaPorHora(strtoint(InputSetTarifa.Text));
  if Estacionamiento1.getTarifaPorHora <> -1 then
    btnVerTarifaAPagar.enabled:=true;
    btnVerAutos.enabled:=true;
end;

procedure TFormEj6.btnVerAutosClick(Sender: TObject);
begin
  Estacionamiento1.mostrarDatosTodosLosAutos(memo1);
end;

procedure TFormEj6.btnVerTarifaAPagarClick(Sender: TObject);
begin
  if inputPatente.Text = '' then begin
    memo1.Lines.clear;
    memo1.Lines.Add('Por favor ingrese la patente');
  end
  else
    Estacionamiento1.mostrarDatosAuto(memo1, inputPatente.Text);
end;

procedure TFormEj6.FormCreate(Sender: TObject);
var
  horaEntrada, horaSalida:horario;
begin
  memo1.Clear;
  btnVerTarifaAPagar.enabled:=false;
  btnVerAutos.enabled:=false;
  horaEntrada.horas := 01;
  horaEntrada.minutos :=00;
  horaSalida.horas := 03;
  horaSalida.minutos := 11;
  Estacionamiento1.addAuto('1002', horaEntrada,horaSalida);
  Estacionamiento1.addAuto('EAS102', horaEntrada,horaSalida);

end;

end.
