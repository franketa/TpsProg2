unit TADEstacionamiento;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math, TADfecha;

type

  horario = record
    horas:integer;
    minutos:integer;
  end;

  autoIngresado = object
    patente : string;
    fechaSalida : fecha;
    horarioEntrada : horario;
    horarioSalida : horario;
  end;

  Estacionamiento = object
  private
    Autos : array of AutoIngresado;
    cantidadAutos:integer;
    tarifaPorHora:integer;
    function buscarAuto(pat:string):integer;
  public
    function setFechaSalida(pat:string;d,m,a:integer):integer;
    function getFechaSalida(pat:string; var f:fecha):integer;
    procedure setTarifaPorHora(tarifa:integer);
    function getTarifaPorHora:integer;
    procedure addAuto(pat:string;horaEntrada, horaSalida:horario;fSalida:fecha);
    function getTarifaAuto(indiceAuto:integer):string;
    procedure mostrarDatosAuto(memo:Tmemo;pat:string);
    procedure mostrarDatosTodosLosAutos(memo:Tmemo);
  end;

implementation

function Estacionamiento.setFechaSalida(pat:string;d,m,a:integer):integer;
var
  fechaAux:fecha;
  indiceAuto:integer;
begin
  result := -1;
  fechaAux.setFecha(d,m,a);
  if fechaAux.esCorrecta then begin
    indiceAuto := buscarAuto(pat);
    if indiceAuto = -1 then begin

      exit;
    end else begin
      autos[indiceAuto].fechaSalida := fechaAux;
      result := 1;
    end;

  end;
end;

function Estacionamiento.getFechaSalida(pat:string; var f:fecha):integer;
var
  indiceAuto:integer;
begin
  indiceAuto := buscarAuto(pat);
  if indiceAuto = -1 then
    result:=-1
  else begin
    f := autos[indiceAuto].fechaSalida;
    result:=1;
  end;

end;

procedure Estacionamiento.mostrarDatosTodosLosAutos(memo:Tmemo);
var
i:integer;
begin
  memo.Lines.Clear;
  if cantidadAutos = 0 then begin
    memo.Lines.Add('No hay autos para mostar');
    exit;
  end
  else begin
    for i := 0 to CantidadAutos -1 do begin
      memo.Lines.Add('Patente: '+ autos[i].patente);
      memo.Lines.Add('Horario de entrada: '+ autos[i].patente);
      memo.Lines.Add('Horario de salida: '+ autos[i].patente);
      memo.Lines.Add('Tarifa a pagar: '+ getTarifaAuto(i));
    end;
  end;

 end;

procedure Estacionamiento.mostrarDatosAuto(memo:Tmemo;pat:string);
var
  indiceAuto:integer;
begin
  indiceAuto := buscarAuto(pat);
  if indiceAuto = -1 then begin
    memo.Lines.Clear;
    memo.Lines.Add( 'El auto no está registrado');
    exit;
  end;
  memo.Lines.Clear;
  memo.Lines.Add('Patente: '+ autos[indiceAuto].patente);
  memo.Lines.Add('Horario de entrada: '+ autos[indiceAuto].patente);
  memo.Lines.Add('Horario de salida: '+ autos[indiceAuto].patente);
  memo.Lines.Add('Tarifa a pagar: '+ getTarifaAuto(indiceAuto));
end;

procedure Estacionamiento.setTarifaPorHora(tarifa:integer);
begin
   tarifaPorHora := tarifa;
end;

function Estacionamiento.getTarifaPorHora:integer;
 begin
   result := tarifaPorHora;
 end;

function Estacionamiento.buscarAuto(pat:string):integer;
var
  i,aux:integer;
begin
  if cantidadAutos = 0 then begin
   result:=-1;
   exit;
  end;

  aux := -1;
  for I := 0 to length(autos)-1 do begin
    if autos[i].patente = pat then
      aux:= i;
  end;
  result := aux;
end;

function Estacionamiento.getTarifaAuto(indiceAuto:integer):string;
var
  cantHoras:horario;
  auxValor:extended;
begin

   if (autos[indiceAuto].horarioEntrada.horas = autos[indiceAuto].horarioSalida.horas) and
     (autos[indiceAuto].horarioEntrada.minutos = autos[indiceAuto].horarioSalida.minutos) then begin
       result := 'El auto no registra horas de estacionamiento';
       exit;
    end;
   if (autos[indiceAuto].horarioEntrada.horas = 00) then
    autos[indiceAuto].horarioEntrada.horas:=24;
   if (autos[indiceAuto].horarioSalida.horas = 00) then
    autos[indiceAuto].horarioSalida.horas:=24;
   if (autos[indiceAuto].horarioEntrada.horas > autos[indiceAuto].horarioSalida.horas) then
    cantHoras.horas := ((24 - autos[indiceAuto].horarioEntrada.horas) + autos[indiceAuto].horarioSalida.horas)
   else
    cantHoras.horas := (autos[indiceAuto].horarioSalida.horas - autos[indiceAuto].horarioEntrada.horas) ;

  if autos[indiceAuto].horarioEntrada.minutos > autos[indiceAuto].horarioSalida.minutos then begin
    cantHoras.minutos := (60 - autos[indiceAuto].horarioEntrada.minutos) + autos[indiceAuto].horarioSalida.minutos;
    cantHoras.horas := cantHoras.horas - 1
  end
  else
    cantHoras.minutos := autos[indiceAuto].horarioSalida.minutos - autos[indiceAuto].horarioEntrada.minutos;

  if cantHoras.horas > 6 then begin
    result := cantHoras.horas.ToString + ' hs ' + cantHoras.minutos.ToString + ' minutos. Debe pagar tarifa completa';
    exit;
  end
  else if cantHoras.horas > 3 then begin
    result := cantHoras.horas.ToString + ' hs ' + cantHoras.minutos.ToString + ' minutos. Debe pagar media estadía';
    exit;
  end
  else if cantHoras.minutos  = 0 then
    auxValor := cantHoras.horas *  tarifaPorHora
  else if cantHoras.minutos > 10 then
    auxValor := RoundTo((cantHoras.horas *  tarifaPorHora + (cantHoras.minutos / 10 * (tarifaPorHora / 6))), -2)
  else begin
    auxValor := RoundTo(cantHoras.horas *  tarifaPorHora + tarifaPorHora / 6,  -2);
  end;
  result := cantHoras.horas.ToString + ' hs ' + cantHoras.minutos.ToString + ' minutos. Valor a pagar: $'+ auxValor.ToString ;

end;

procedure Estacionamiento.addAuto(pat:string;horaEntrada, horaSalida:horario;fSalida:fecha);
var
  aux:integer;
begin
  aux := buscarAuto(pat);
  if aux <> -1 then exit
  else begin
    if length(autos) = 0 then begin
      setlength(Autos,1);
      autos[length(autos)-1].patente := pat;
      autos[length(autos)-1].horarioEntrada.horas := horaEntrada.horas;
      autos[length(autos)-1].horarioEntrada.minutos := horaEntrada.minutos;
      autos[length(autos)-1].horarioSalida.horas := horaSalida.horas;
      autos[length(autos)-1].horarioSalida.minutos := horaSalida.minutos;
      autos[length(autos)-1].fechaSalida := fSalida;
      cantidadAutos := 1;
    end
    else begin
      setlength(Autos, length(autos)+1);
      autos[length(autos)-1].patente := pat;
      autos[length(autos)-1].horarioEntrada.horas := horaEntrada.horas;
      autos[length(autos)-1].horarioEntrada.minutos := horaEntrada.minutos;
      autos[length(autos)-1].horarioSalida.horas := horaSalida.horas;
      autos[length(autos)-1].horarioSalida.minutos := horaSalida.minutos;
      autos[length(autos)-1].fechaSalida := fSalida;
      inc(cantidadAutos);
    end;
  end;
end;

end.
