unit TADEstacionamiento;

interface
Uses
  SysUtils;

type

  horario = record
    horas:integer;
    minutos:integer;
  end;

  autoIngresado = object
  
    patente : integer;
    horarioEntrada : horario;
    horarioSalida : horario;
  end;

  Estacionamiento = object
  private
    Autos : array of AutoIngresado;
    cantidadAutos:integer;
    function buscarAuto(pat:integer):integer;
    function getCantidadAutos():integer;
  public
    procedure addAuto(pat:integer;horaEntrada, horaSalida:horario);
    function getTarifaAutoDado(pat:integer):string;
  end;

implementation

function Estacionamiento.getCantidadAutos():integer;
begin
  result := cantidadAutos;
end;


function Estacionamiento.buscarAuto(pat:integer):integer;
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

function Estacionamiento.getTarifaAutoDado(pat:integer):string;
var
  cantHoras:horario;
  indiceAuto, auxHorasEnMinutosEntrada, auxHorasEnMinutosSalida, auxMinutos:integer;  
begin

  indiceAuto := buscarAuto(pat);
  if indiceAuto = -1 then begin
    result := 'El auto no está registrado';
    exit;
  end;

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
    result := 'Paga tarifa completa'
  else if cantHoras.horas > 3 then
    result := 'Paga media estadía'
  else
    result := 'Paga ' + cantHoras.horas.ToString + ' hs ' + cantHoras.minutos.ToString + ' minutos.' ;

  end;

procedure Estacionamiento.addAuto(pat:integer;horaEntrada, horaSalida:horario);
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
