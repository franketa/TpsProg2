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
    procedure addAuto(pat:string;horaEntrada, horaSalida:horario;fSalida:fecha);
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
  cantHoras:horario;
  auxValor:extended;
  i:integer;
  rec:autoDebePagar;
begin

   if (autos[indiceAuto].horarioEntrada.horas = autos[indiceAuto].horarioSalida.horas) and
     (autos[indiceAuto].horarioEntrada.minutos = autos[indiceAuto].horarioSalida.minutos) then begin
       rec.aPagar := 0;
       for i := 1 to 4 do
        rec.Ocupacion[i]:=0;
       result:= rec;         
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

  rec.aPagar := 0;
  for i := 1 to 4 do
    rec.Ocupacion[i]:=0;

  //evaluo distintas posibilidades de tarifa a pagar

  //cargo una EC si es mas de 24 horas y me quedo con el resto
  while cantHoras.horas > 24 do begin
    inc(rec.Ocupacion[1]);
    cantHoras.horas := cantHoras.horas - 24;
  end;
  //cargo estadias completas
  if cantHoras.horas > 6 then
    inc(rec.Ocupacion[1]);
  //cargo media estadia
  if cantHoras.horas > 3 then
    inc(rec.Ocupacion[2]);
  //cargo caso de horas menores iguales a 3 y evaluo los minutos
  if cantHoras.horas <= 3 then begin
    rec.Ocupacion[3]:=cantHoras.horas;
    rec.Ocupacion[4]:=cantHoras.minutos;
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
  if ((rec.Ocupacion[1] = 1) and (rec.Ocupacion[3] <> 0)) then
    strAux:='El auto debe 1 estadía completa y ' + rec.Ocupacion[3].ToString + ' horas.'
  else if (rec.Ocupacion[1] = 1) and (rec.Ocupacion[4] <> 0) then
    strAux:='El auto debe 1 estadía completa y ' + rec.Ocupacion[4].ToString + ' minutos.'
  else if (rec.Ocupacion[1] = 1) and (rec.Ocupacion[2] = 1) then
    strAux:='El auto debe 1 estadía completa y 1 media estadia.'
  else if (rec.Ocupacion[1] <> 0) and (rec.Ocupacion[3] <> 0) then
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas y ' + rec.Ocupacion[3].ToString + ' horas.'
  else if (rec.Ocupacion[1] <> 0) and (rec.Ocupacion[4] <> 0) then
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas y ' + rec.Ocupacion[4].ToString + ' minutos.'
  else if (rec.Ocupacion[1] <> 0) and (rec.Ocupacion[2] = 1) then
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas y 1 media estadia.'
  else
    strAux:='El auto debe '+ rec.Ocupacion[1].ToString + ' estadías completas.';
  // si tiene me. estadia
  if rec.Ocupacion[2] = 1 then
    strAux:= 'El auto debe 1 media estadía.';
  
  // si tiene solo horas
  if rec.Ocupacion[3] = 0 then
    strAux:= 'El auto debe ' + rec.Ocupacion[4].ToString + ' minutos.'
  else if rec.Ocupacion[4] <> 0 then
    strAux:='El auto debe '+ rec.Ocupacion[3].ToString + ' horas y ' + rec.Ocupacion[4].ToString + ' minutos.'
  else
    strAux:= 'El auto debe ' + rec.Ocupacion[3].ToString + ' horas.';

  result:=strAux;
end;

end.
