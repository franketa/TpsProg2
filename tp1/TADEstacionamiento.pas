unit TADEstacionamiento;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math, TADfecha;

type

  autoDebePagar = record
    Ocupacion : array [1..4] of integer;
    //pos 1 igual a estadias completas, 2 media estadia, 3 horas ocupadas, 4 minutos ocupados
    aPagar : extended;
  end;

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
  end;

  Estacionamiento = object
  private
    Autos : array of AutoIngresado;
    cantidadAutos:integer;
    tarifaPorHora:integer;
    function buscarAuto(pat:string):integer;
  public
    function setFechaSalida(pat:string;d,m,a:integer):integer;
    function getFechaSalida(pat:string):fecha;
    function recaudacionXhoraFecha(f:fecha):longint;
   // function recaudacionMEstadiaFecha(f:fecha):longint;
   // function recaudacionEstadiaCFecha(f:fecha):longint;
    procedure setTarifaPorHora(tarifa:integer);
    function getTarifaPorHora:integer;
    procedure addAuto(pat:string;horaEntrada, horaSalida:horario;fentrada,fSalida:fecha);
    function getTarifaAuto(indiceAuto:integer):autoDebePagar;
    procedure mostrarDatosAuto(memo:Tmemo;pat:string);
    procedure mostrarDatosTodosLosAutos(memo:Tmemo);
    function getStrTarifaAPagar(indiceAuto:integer):string;
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

function Estacionamiento.getFechaSalida(pat:string):fecha;
var
  indiceAuto:integer;
begin
  indiceAuto := buscarAuto(pat);
  if indiceAuto = -1 then exit
  else begin
    result := autos[indiceAuto].fechaSalida;
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
      memo.Lines.Add('Tarifa a pagar: '+ getStrTarifaAPagar(i));
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
  memo.Lines.Add('Horario de entrada: '+ autos[indiceAuto].horarioEntrada.horas.ToString + ':' + autos[indiceAuto].horarioEntrada.minutos.ToString );
  memo.Lines.Add('Horario de salida: '+ autos[indiceAuto].horarioSalida.horas.ToString + ':' + autos[indiceAuto].horarioSalida.minutos.ToString);
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
  for I := 0 to length(autos)-1 do begin
    if autos[i].patente = pat then
      aux:= i;
  end;
  result := aux;
end;

function Estacionamiento.getTarifaAuto(indiceAuto:integer):autoDebePagar;
var
  cantTiempoEstadia:horario;
  auxValor:extended;
  i, difDias:integer;
   horaEnsE, minEnSE, horaEnsS, minEnSS:longint;
  rec:autoDebePagar;
begin
  rec.aPagar := 0;
  for i := 1 to 4 do
    rec.Ocupacion[i]:=0;
  cantTiempoEstadia.horas := 0;
  cantTiempoEstadia.minutos := 0;
  // si sale el mismo dia que entra..
  if autos[indiceAuto].fechaEntrada.compararFechas(autos[indiceAuto].fechaSalida) = igual then begin

    if (autos[indiceAuto].horarioEntrada.horas = autos[indiceAuto].horarioSalida.horas) and
    (autos[indiceAuto].horarioEntrada.minutos = autos[indiceAuto].horarioSalida.minutos) then begin
      result:= rec;
      exit;
    end;

    if (autos[indiceAuto].horarioEntrada.horas = 00) then
    autos[indiceAuto].horarioEntrada.horas:=24;
    if (autos[indiceAuto].horarioSalida.horas = 00) then
    autos[indiceAuto].horarioSalida.horas:=24;

    horaEnsE := autos[indiceAuto].horarioEntrada.horas * 3600 + autos[indiceAuto].horarioEntrada.minutos * 60;
    horaEnsS := autos[indiceAuto].horarioSalida.horas * 3600 + autos[indiceAuto].horarioSalida.minutos * 60;

    cantTiempoEstadia.horas := abs(horaEnsS - horaEnsE) div 3600;
    cantTiempoEstadia.minutos := abs(horaEnsS - horaEnsE) div 60;

    

    //evaluo distintas posibilidades de tarifa a pagar
    //cargo estadias completas
    if cantTiempoEstadia.horas > 6 then
      inc(rec.Ocupacion[1]);
    //cargo media estadia
    if (cantTiempoEstadia.horas > 3) and (cantTiempoEstadia.horas < 6) then
      inc(rec.Ocupacion[2]);
    //cargo caso de horas menores iguales a 3 y evaluo los minutos
    if cantTiempoEstadia.horas <= 3 then begin
      rec.Ocupacion[3]:=cantTiempoEstadia.horas;
      rec.Ocupacion[4]:=cantTiempoEstadia.minutos;
      if rec.Ocupacion[4] = 0 then // si no tiene minutos solo calculo con horas
        rec.aPagar := rec.Ocupacion[3] * tarifaPorHora
      else if rec.Ocupacion[4] <= 10 then // si tiene menos o 10 minutos solo sumo una tarifaxhora
        rec.aPagar := RoundTo(rec.Ocupacion[3] * tarifaPorHora + tarifaPorHora, -2)
      else // si tiene mas de 10 minutos, calculo el proporcional de la tarifaxhora cada 10 minutos
        rec.aPagar := RoundTo(rec.Ocupacion[3] * tarifaPorHora + ( rec.Ocupacion[4] / 10 * (tarifaPorHora / 6) ), -2);
    end;
    // devuelvo el record, que va a tener
    // en 1 las estadias completas, en 2 las media estadias, en 3 las horas y en 4 los minutos. en aPagar el total por hora y minutos
    result:= rec;
  end else if autos[indiceAuto].fechaEntrada.compararFechas(autos[indiceAuto].fechaSalida) = Anterior then exit else begin  // si sale un dia posterior al que entro..

    difDias := autos[indiceAuto].fechaEntrada.diferenciaDias(autos[indiceAuto].fechaSalida);
    // si la diferencia es mayor a 1, añado estadia completa por cada dia - 1
    while difDias > 1 do begin
      inc(rec.Ocupacion[1]);
      dec(difDias);
    end;

    // si la diferencia es uno, veo casos posibles..
    if (autos[indiceAuto].horarioEntrada.horas < 12) and (autos[indiceAuto].horarioSalida.horas < 12) then
      rec.Ocupacion[3] := rec.Ocupacion[3] + 12
    else if (autos[indiceAuto].horarioEntrada.horas < 12) and (autos[indiceAuto].horarioSalida.horas > 12) then
      rec.Ocupacion[3] := rec.Ocupacion[3] + 24
    else if (autos[indiceAuto].horarioEntrada.horas > 12) and (autos[indiceAuto].horarioSalida.horas > 12) then
      rec.Ocupacion[3] := rec.Ocupacion[3] + 12
    else if (autos[indiceAuto].horarioEntrada.horas = 12) and (autos[indiceAuto].horarioSalida.horas = 12) then
    rec.Ocupacion[3] := rec.Ocupacion[3] + 24;    

    if (autos[indiceAuto].horarioEntrada.horas = 00) then
    autos[indiceAuto].horarioEntrada.horas:=24;
    if (autos[indiceAuto].horarioSalida.horas = 00) then
    autos[indiceAuto].horarioSalida.horas:=24;

    horaEnsE := autos[indiceAuto].horarioEntrada.horas * 3600 + autos[indiceAuto].horarioEntrada.minutos * 60;
    horaEnsS := autos[indiceAuto].horarioSalida.horas * 3600 + autos[indiceAuto].horarioSalida.minutos * 60;

    cantTiempoEstadia.horas := abs(horaEnsS - horaEnsE) div 3600;
    cantTiempoEstadia.minutos := abs(horaEnsS - horaEnsE) div 60;

    //evaluo distintas posibilidades de tarifa a pagar
    //cargo estadias completas
    if cantTiempoEstadia.horas > 6 then
      inc(rec.Ocupacion[1]);
    //cargo media estadia
    if (cantTiempoEstadia.horas > 3) and (cantTiempoEstadia.horas < 6) then
      inc(rec.Ocupacion[2]);
    //cargo caso de horas menores iguales a 3 y evaluo los minutos
    if cantTiempoEstadia.horas <= 3 then begin
      rec.Ocupacion[3]:= rec.Ocupacion[3] + cantTiempoEstadia.horas;
      rec.Ocupacion[4]:= rec.Ocupacion[4] + cantTiempoEstadia.minutos;
      if rec.Ocupacion[4] = 0 then // si no tiene minutos solo calculo con horas
        rec.aPagar := rec.Ocupacion[3] * tarifaPorHora
      else if rec.Ocupacion[4] <= 10 then // si tiene menos o 10 minutos solo sumo una tarifaxhora
        rec.aPagar := RoundTo(rec.Ocupacion[3] * tarifaPorHora + tarifaPorHora, -2)
      else // si tiene mas de 10 minutos, calculo el proporcional de la tarifaxhora cada 10 minutos
        rec.aPagar := RoundTo(rec.Ocupacion[3] * tarifaPorHora + ( rec.Ocupacion[4] / 10 * (tarifaPorHora / 6) ), -2);
    end;
    // devuelvo el record, que va a tener
    // en 1 las estadias completas, en 2 las media estadias, en 3 las horas y en 4 los minutos. en aPagar el total por hora y minutos
    result:= rec;
  end;



  
end;

procedure Estacionamiento.addAuto(pat:string;horaEntrada, horaSalida:horario; fentrada, fSalida:fecha);
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
      autos[length(autos)-1].fechaEntrada := fentrada;
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
      autos[length(autos)-1].fechaEntrada := fentrada;
      inc(cantidadAutos);
    end;
  end;
end;

function estacionamiento.recaudacionXhoraFecha(f:fecha):longint;
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
    if autos[i].fechaSalida.compararFechas(f) = IGUAL then
      recaudacion := recaudacion + getTarifaAuto(i).aPagar;
  end;

end;

function estacionamiento.getStrTarifaAPagar(indiceAuto:integer):string;
var
  rec:autoDebePagar;
  strAux:string;
begin

  rec := getTarifaAuto(indiceAuto);
  strAux:='';
  if (rec.Ocupacion[1] = 0)and (rec.Ocupacion[2] = 0) and( rec.Ocupacion[3] = 0 )and (rec.Ocupacion[4] = 0 )then begin
    result:= 'El auto no registra tiempo de estacionamiento.';
    exit;
  end;

  //si tiene estadias c
  if (rec.Ocupacion[1] = 1) and (rec.Ocupacion[3] < 3) and (rec.Ocupacion[3] <> 0 ) then
    strAux:='El auto debe 1 estadía completa y ' + rec.Ocupacion[3].ToString + ' horas por un valor de $' + rec.aPagar.ToString
  else if (rec.Ocupacion[1] = 1) and (rec.Ocupacion[4] <> 0) and (rec.Ocupacion[3] = 0)  then
    strAux:='El auto debe 1 estadía completa y ' + rec.Ocupacion[4].ToString + ' minutos por un valor de $' + rec.aPagar.ToString
  else if (rec.Ocupacion[1] = 1) and (rec.Ocupacion[2] = 1) then
    strAux:='El auto debe 1 estadía completa y 1 media estadia.'
  else if (rec.Ocupacion[1] = 1) and (rec.Ocupacion[3] = 0) and (rec.Ocupacion[4] = 0)then
    strAux:='El auto debe 1 estadía completa'
  else if (rec.Ocupacion[1] <> 0) and (rec.Ocupacion[3] <> 0) then
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas y ' + rec.Ocupacion[3].ToString + ' horas por un valor de $' + rec.aPagar.ToString
  else if (rec.Ocupacion[1] <> 0) and (rec.Ocupacion[4] <> 0) then
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas y ' + rec.Ocupacion[4].ToString + ' minutos por un valor de $' + rec.aPagar.ToString
  else if (rec.Ocupacion[1] <> 0) and (rec.Ocupacion[2] = 1) then
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas y 1 media estadia.'
  else
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas.';
  // si tiene me. estadia
  if rec.Ocupacion[2] = 1 then
    strAux:= 'El auto debe 1 media estadía.';

  // si tiene solo horas
  if (rec.Ocupacion[1] = 0) and (rec.Ocupacion[2] = 0) then
    if (rec.Ocupacion[3] = 0) then
      strAux:= 'El auto debe ' + rec.Ocupacion[4].ToString + ' minutos por un valor de $' + rec.aPagar.ToString
    else if rec.Ocupacion[4] <> 0 then
      strAux:='El auto debe '+ rec.Ocupacion[3].ToString + ' horas y ' + rec.Ocupacion[4].ToString + ' minutos por un valor de $' + rec.aPagar.ToString
    else if rec.Ocupacion[3] = 1 then
      strAux:= 'El auto debe 1 hora por un valor de $' + rec.aPagar.ToString
    else
      strAux:= 'El auto debe ' + rec.Ocupacion[3].ToString + ' horas por un valor de $' + rec.aPagar.ToString;
  result:=strAux;
end;

end.
