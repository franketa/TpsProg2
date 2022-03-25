unit TADEstacionamiento;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  horario = record
    horas:integer;
    minutos:integer;
  end;

  autoIngresado = object
  
    patente : string;
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
    procedure setTarifaPorHora(tarifa:integer);
    function getTarifaPorHora:integer;
    procedure addAuto(pat:string;horaEntrada, horaSalida:horario);
    function getTarifaAuto(indiceAuto:integer):string;
    procedure mostrarDatosAuto(memo:Tmemo;pat:string);
    procedure mostrarDatosTodosLosAutos(memo:Tmemo);
  end;

implementation

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
    memo.Lines.Add( 'El auto no est� registrado');
    exit;
  end;
  memo.Lines.Add('Patente: '+ autos[indiceAuto].patente);
  memo.Lines.Add('Horario de entrada: '+ autos[indiceAuto].patente);
  memo.Lines.Add('Horario de salida: '+ autos[indiceAuto].patente);
  memo.Lines.Add('Tarifa a pagar: '+ getTarifaAuto(indiceAuto));
end;

procedure Estacionamiento.setTarifaPorHora(tarifa:integer);
begin
  if tarifa < 0 then tarifaPorHora := -1
  else begin
   tarifaPorHora := tarifa;
  end;
end;

function Estacionamiento.getTarifaPorHora:integer;
 begin
   result := tarifaPorHora;
 end;

function Estacionamiento.buscarAuto(pat:string):integer;
var
  i,aux:integer;
begin
  aux := -1;
  for I := 0 to length(autos) do begin
    if autos[i].patente = pat then
      aux:= i;
  end;
  result := aux;
end;

function Estacionamiento.getTarifaAuto(indiceAuto:integer):string;
var
  cantHoras:horario;
  auxHorasEnMinutosEntrada, auxHorasEnMinutosSalida, auxMinutos:integer;
begin

   if (autos[indiceAuto].horarioEntrada.horas = autos[indiceAuto].horarioSalida.horas) and
     (autos[indiceAuto].horarioEntrada.minutos = autos[indiceAuto].horarioSalida.minutos) then begin
       result := 'El auto no registra horas de estacionamiento';
       exit;
  end;

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

  if cantHoras.horas > 6 then
    result := 'tarifa completa'
  else if cantHoras.horas > 3 then
    result := 'media estad�a'
  else begin
    //PODRIA SER calculo el total a pagar en base a la tarifa por hora

    result := cantHoras.horas.ToString + ' hs ' + cantHoras.minutos.ToString + ' minutos.' ;
  end;
end;

procedure Estacionamiento.addAuto(pat:string;horaEntrada, horaSalida:horario);
begin
  if length(autos) = 0 then begin
    setlength(Autos,1);
    autos[length(autos)-1].patente := pat;
    autos[length(autos)-1].horarioEntrada.horas := horaEntrada.horas;
    autos[length(autos)-1].horarioEntrada.minutos := horaEntrada.minutos;
    autos[length(autos)-1].horarioSalida.horas := horaSalida.horas;
    autos[length(autos)-1].horarioSalida.minutos := horaSalida.minutos;
    cantidadAutos := 1;
  end
  else begin
    setlength(Autos, length(autos)+1);
    autos[length(autos)-1].patente := pat;
    autos[length(autos)-1].horarioEntrada.horas := horaEntrada.horas;
    autos[length(autos)-1].horarioEntrada.minutos := horaEntrada.minutos;
    autos[length(autos)-1].horarioSalida.horas := horaSalida.horas;
    autos[length(autos)-1].horarioSalida.minutos := horaSalida.minutos;
    inc(cantidadAutos);
  end;
end;

end.