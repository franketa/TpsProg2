unit ej7_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, TADFecha,
  Vcl.Grids, Vcl.ComCtrls, TADEStacionamiento;

type

  TFormEj7 = class(TForm)
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Button3: TButton;

    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEj7: TFormEj7;
  estacionamiento2:estacionamiento;

implementation

{$R *.dfm}



procedure TFormEj7.FormCreate(Sender: TObject);
var
  hEntrada, hSalida:horario;
  pat:String;
  fechaSalida:fecha;
begin
  memo1.Clear;
  pat:='EAE201';
  hEntrada.horas := 01;
  hEntrada.minutos := 10;
  hSalida.horas:=03;
  hSalida.minutos:=30;
  fechaSalida.setFecha(1,3,2022);
  estacionamiento2.addAuto(pat,hEntrada,hSalida,fechaSalida);
  pat:='AED109';
  hEntrada.horas := 22;
  hEntrada.minutos := 10;
  hSalida.horas:=3;
  hSalida.minutos:=14;
  fechaSalida.setFecha(2,3,2022);
  estacionamiento2.addAuto(pat,hEntrada,hSalida,fechaSalida);
  pat:='ESA304';
  hEntrada.horas := 01;
  hEntrada.minutos := 10;
  hSalida.horas:=03;
  hSalida.minutos:=30;
  fechaSalida.setFecha(3,3,2022);
  estacionamiento2.addAuto(pat,hEntrada,hSalida,fechaSalida);
  pat:='EGG341';
  hEntrada.horas := 01;
  hEntrada.minutos := 10;
  hSalida.horas:=03;
  hSalida.minutos:=30;
  fechaSalida.setFecha(1,3,2022);
  estacionamiento2.addAuto(pat,hEntrada,hSalida,fechaSalida);
end;



end.
