unit TADEstacionamiento;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math, TADfecha;



type

  estadias = (EC, ME, HR, MIN);

  horario = record
    horas:integer;
    minutos:integer;
  end;

  autoIngresado = object
    patente : string;
    fechaEntrada : fecha;
    fechaSalida : fecha;
    horarioEntrada : horario;
    horarioSalida : horario;
    estadia : array [EC..MIN] of integer;
    totalAPagar : extended;
  end;

  Estacionamiento = object
  private
    autosIngresados : array of AutoIngresado;
    cantidadAutos:integer;
    tarifaPorHora:integer;
    function buscarAuto(pat:string):integer;
    procedure calcularTarifaAuto(indiceAuto:integer);
    function getStrTarifaAPagar(indiceAuto:integer):string;
    function recaudacionXhoraEnXFecha(f:fecha):longint;
   // function recaudacionMediaEstadiaEnXFecha(f:fecha):longint;
   // function recaudacionEstadiaCompletaEnXFecha(f:fecha):longint;
  public
    function setFechaSalida(pat:string;d,m,a:integer):integer;
    function getFechaSalida(pat:string):fecha;
    procedure setTarifaPorHora(tarifa:integer);
    function getTarifaPorHora:integer;
    function addAuto(pat:string;horaEntrada, horaSalida:horario;fentrada,fSalida:fecha):string;
    procedure mostrarDatosAuto(memo:Tmemo;pat:string);
    procedure mostrarDatosTodosLosAutos(memo:Tmemo);

  end;

const

  horasEstadias : array [EC.. ME] of integer =
  (6, 3);


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
      AutosIngresados[indiceAuto].fechaSalida := fechaAux;
      result := 1;
    end;

  end;
end;

function Estacionamiento.getFechaSalida(pat:string):fecha;
var
  indiceAuto:integer;
begin
  indiceAuto := buscarAuto(pat);
  if indiceAuto = -1 then exit
  else begin
    result := autosIngresados[indiceAuto].fechaSalida;
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
    for i := 0 to CantidadAutos - 1 do begin
      mostrarDatosAuto(memo, autosIngresados[i].patente);
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
  memo.Lines.add('-------------------------------------------------');
  memo.Lines.Add('Patente: '+ autosIngresados[indiceAuto].patente);
  memo.Lines.Add('Fecha de entrada: '+ autosIngresados[indiceAuto].fechaEntrada.devolverStrFecha);
  memo.Lines.Add('Fecha de salida: '+ autosIngresados[indiceAuto].fechaSalida.devolverStrFecha);
  memo.Lines.Add('Horario de entrada: '+ autosIngresados[indiceAuto].horarioEntrada.horas.ToString + ':' + autosIngresados[indiceAuto].horarioEntrada.minutos.ToString );
  memo.Lines.Add('Horario de salida: '+ autosIngresados[indiceAuto].horarioSalida.horas.ToString + ':' + autosIngresados[indiceAuto].horarioSalida.minutos.ToString);
  memo.Lines.Add('Tarifa a pagar: '+ getStrTarifaAPagar(indiceAuto));
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
  for I := 0 to length(autosIngresados)-1 do begin
    if autosIngresados[i].patente = pat then
      aux:= i;
  end;
  result := aux;
end;

procedure Estacionamiento.calcularTarifaAuto(indiceAuto:integer);
var
  i: estadias;
  horasEntradaEnSegundos, minutosEntradaEnSegundos, horasSalidaEnSegundos, minutosSalidaEnSegundos :longint;
  cantTiempoEstadia : horario;
  difDias:integer;
begin

  for i := ec to min do begin
        autosIngresados[indiceAuto].estadia[i] := 0;
        autosIngresados[indiceAuto].totalAPagar :=0;
  end;


  if autosIngresados[indiceAuto].fechaEntrada.compararFechas(autosIngresados[indiceAuto].fechaSalida) = igual then begin
    if (autosIngresados[indiceAuto].horarioEntrada.horas = autosIngresados[indiceAuto].horarioSalida.horas) and (autosIngresados[indiceAuto].horarioEntrada.minutos = autosIngresados[indiceAuto].horarioSalida.minutos) then
      exit;  // si el auto no registra horas de estacionamiento asigno 0 a todo y salgo


     // si el auto salio el mismo día que entro y registra tiempo de estacionado...

    if (autosIngresados[indiceAuto].horarioEntrada.horas = 00) then
      autosIngresados[indiceAuto].horarioEntrada.horas:=24;
    if (autosIngresados[indiceAuto].horarioSalida.horas = 00) then
      autosIngresados[indiceAuto].horarioSalida.horas:=24;

    horasEntradaEnSegundos := autosIngresados[indiceAuto].horarioEntrada.horas * 3600;
    horasSalidaEnSegundos := autosIngresados[indiceAuto].horarioSalida.horas * 3600;
    minutosEntradaEnSegundos :=  autosIngresados[indiceAuto].horarioEntrada.minutos * 60;
    minutosSalidaEnSegundos :=  autosIngresados[indiceAuto].horarioSalida.minutos * 60;

    cantTiempoEstadia.horas := abs(horasSalidaEnSegundos - horasEntradaEnSegundos) div 3600;
    cantTiempoEstadia.minutos := abs(minutosSalidaEnSegundos - minutosEntradaEnSegundos) div 60;

    if cantTiempoEstadia.horas > horasEstadias[EC] then
      autosIngresados[indiceAuto].estadia[ec] := 1
    else if (cantTiempoEstadia.horas < horasEstadias[EC]) and (cantTiempoEstadia.horas > horasEstadias[ME]) then
      autosIngresados[indiceAuto].estadia[me] := 1
    else begin
      autosIngresados[indiceAuto].estadia[hr] :=  cantTiempoEstadia.horas;
      autosIngresados[indiceAuto].estadia[min] :=  cantTiempoEstadia.minutos;
      autosIngresados[indiceAuto].totalAPagar := cantTiempoEstadia.horas * tarifaPorHora + ( cantTiempoEstadia.minutos / 10 * (tarifaPorHora / 6) );
    end;

  end else begin

    difDias := autosIngresados[indiceAuto].fechaEntrada.diferenciaDias(autosIngresados[indiceAuto].fechaSalida);
    // si la diferencia es mayor a 1, añado estadia completa por cada dia - 1
    while difDias >= 1 do begin
      inc(autosIngresados[indiceAuto].estadia[ec]);
      dec(difDias);
    end;

    cantTiempoEstadia.horas := 0;

//    if (autosIngresados[indiceAuto].horarioEntrada.horas < 12) and (autosIngresados[indiceAuto].horarioSalida.horas < 12) then
//      cantTiempoEstadia.horas := cantTiempoEstadia.horas + 12
//    else if (autosIngresados[indiceAuto].horarioEntrada.horas < 12) and (autosIngresados[indiceAuto].horarioSalida.horas > 12) then
//      cantTiempoEstadia.horas := cantTiempoEstadia.horas + 24
//    else if (autosIngresados[indiceAuto].horarioEntrada.horas > 12) and (autosIngresados[indiceAuto].horarioSalida.horas > 12) then
//      cantTiempoEstadia.horas := cantTiempoEstadia.horas + 12
//    else if (autosIngresados[indiceAuto].horarioEntrada.horas = 12) and (autosIngresados[indiceAuto].horarioSalida.horas = 12) then
//      cantTiempoEstadia.horas := cantTiempoEstadia.horas + 24;

    if (autosIngresados[indiceAuto].horarioEntrada.horas = 00) then
      autosIngresados[indiceAuto].horarioEntrada.horas:=24;
    if (autosIngresados[indiceAuto].horarioSalida.horas = 00) then
      autosIngresados[indiceAuto].horarioSalida.horas:=24;

    horasEntradaEnSegundos := autosIngresados[indiceAuto].horarioEntrada.horas * 3600;
    horasSalidaEnSegundos := autosIngresados[indiceAuto].horarioSalida.horas * 3600;
    minutosEntradaEnSegundos :=  autosIngresados[indiceAuto].horarioEntrada.minutos * 60;
    minutosSalidaEnSegundos :=  autosIngresados[indiceAuto].horarioSalida.minutos * 60;

    cantTiempoEstadia.horas := abs(horasSalidaEnSegundos - horasEntradaEnSegundos) div 3600;
    cantTiempoEstadia.minutos := abs(minutosSalidaEnSegundos - minutosEntradaEnSegundos) div 60;

    if cantTiempoEstadia.horas > horasEstadias[EC] then
      inc(autosIngresados[indiceAuto].estadia[ec])
    else if (cantTiempoEstadia.horas < horasEstadias[EC]) and (cantTiempoEstadia.horas > horasEstadias[ME]) then
      inc(autosIngresados[indiceAuto].estadia[me])
    else begin
      autosIngresados[indiceAuto].estadia[hr] :=  cantTiempoEstadia.horas;
      autosIngresados[indiceAuto].estadia[min] :=  cantTiempoEstadia.minutos;
      autosIngresados[indiceAuto].totalAPagar := cantTiempoEstadia.horas * tarifaPorHora + ( cantTiempoEstadia.minutos / 10 * (tarifaPorHora / 6) );
    end;
  end;
end;

function Estacionamiento.addAuto(pat:string;horaEntrada, horaSalida:horario; fentrada, fSalida:fecha):string;
var
  aux:integer;
begin
  aux := buscarAuto(pat);
  if (aux <> -1)or (fEntrada.compararFechas(fSalida) = anterior) then begin
   result := 'Error, el auto ya está registrado o datos no validos';
   exit // salgo si el auto ya esta en el vector
  end
  else begin
    if length(autosIngresados) = 0 then begin
      setlength(autosIngresados,1);
      autosIngresados[length(autosIngresados)-1].patente := pat;
      autosIngresados[length(autosIngresados)-1].horarioEntrada.horas := horaEntrada.horas;
      autosIngresados[length(autosIngresados)-1].horarioEntrada.minutos := horaEntrada.minutos;
      autosIngresados[length(autosIngresados)-1].horarioSalida.horas := horaSalida.horas;
      autosIngresados[length(autosIngresados)-1].horarioSalida.minutos := horaSalida.minutos;
      autosIngresados[length(autosIngresados)-1].fechaSalida := fSalida;
      autosIngresados[length(autosIngresados)-1].fechaEntrada := fentrada;
      cantidadAutos := 1;
      result := 'Auto cargado correctamente';
    end
    else begin
      setlength(autosIngresados, length(autosIngresados)+1);
      autosIngresados[length(autosIngresados)-1].patente := pat;
      autosIngresados[length(autosIngresados)-1].horarioEntrada.horas := horaEntrada.horas;
      autosIngresados[length(autosIngresados)-1].horarioEntrada.minutos := horaEntrada.minutos;
      autosIngresados[length(autosIngresados)-1].horarioSalida.horas := horaSalida.horas;
      autosIngresados[length(autosIngresados)-1].horarioSalida.minutos := horaSalida.minutos;
      autosIngresados[length(autosIngresados)-1].fechaSalida := fSalida;
      autosIngresados[length(autosIngresados)-1].fechaEntrada := fentrada;
      inc(cantidadAutos);
      result := 'Auto cargado correctamente';
    end;
  end;
end;

function estacionamiento.recaudacionXhoraEnXFecha(f:fecha):longint; // falta terminar
var
  i:integer;
  recaudacion:extended;
begin
  recaudacion:=0;
  if not f.esCorrecta then begin
    result:=-1;
    exit;
  end;

  if cantidadAutos = 0 then begin
    result:=-1;
    exit;
  end;

  for i := 0 to cantidadAutos - 1 do begin
    if autosIngresados[i].fechaSalida.compararFechas(f) = IGUAL then
//      recaudacion := recaudacion + calcularTarifaAuto(i).aPagar;
  end;

end;

function estacionamiento.getStrTarifaAPagar(indiceAuto:integer):string;
begin
  calcularTarifaAuto(indiceAuto);
  result:= 'El auto debe  ' + autosIngresados[indiceAuto].estadia[EC].ToString +
  ' estadias completas ' + autosIngresados[indiceAuto].estadia[me].ToString +
  ' medias estadias ' +  autosIngresados[indiceAuto].estadia[hr].ToString +
  ' horas ' + autosIngresados[indiceAuto].estadia[min].ToString +
  ' minutos que agregan un valor de $' + floattostr(roundto(autosIngresados[indiceAuto].totalAPagar, -2));
end;

end.
