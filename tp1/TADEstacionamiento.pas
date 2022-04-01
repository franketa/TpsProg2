unit TADEstacionamiento;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math, TADfecha;



type


  comparacionHorarios = (horarioanterior, horarioposterior, horariosiguales);

  estadias = (EC, ME, HR, MIN);

  estadia = array [EC..MIN] of integer;

  horario = record
    horas:integer;
    minutos:integer;
  end;

  autoIngresado = object
    patente : string[6];
    fechaEntrada : fecha;
    fechaSalida : fecha;
    horarioEntrada : horario;
    horarioSalida : horario;
    estadiaAuto : estadia;
    totalAPagar : extended;
  end;

  ArchivoAutos = file of autoIngresado;

  Estacionamiento = object
  private
    autosIngresados : array of AutoIngresado;
    cantidadAutos:integer;
    tarifaPorHora:integer;
    function buscarAuto(pat:string):integer;
  public
    procedure calcularTarifaAuto(indiceAuto:integer);
    function getCantAutos:integer;
    function getStrTarifaAPagar(vecE:estadia; ext:extended):string;
    function recaudacionXFecha(f:fecha; var ext:extended):estadia;
    function setFechaSalida(pat:string;d,m,a:integer):integer;
    function getFechaSalida(pat:string):fecha;
    procedure setTarifaPorHora(tarifa:integer);
    function getTarifaPorHora:integer;
    function addAuto(pat:string;horaEntrada, horaSalida:horario;fentrada,fSalida:fecha):string;
    procedure mostrarDatosAuto(memo:Tmemo;pat:string);
    procedure mostrarDatosTodosLosAutos(memo:Tmemo);
    function recaudacionXRangodeFechas(f1, f2:fecha):string;
    procedure ordenarAutosIngresadosXfechaSalidaAscendente();
    function getAutoIngresado(indiceauto:integer):autoIngresado;
  end;

const
  horasEstadias : array [EC.. ME] of integer = (6, 3);

implementation

function estacionamiento.getAutoIngresado(indiceauto:integer):autoIngresado;
begin
  result := autosIngresados[indiceauto];
end;

function estacionamiento.getCantAutos:integer;
begin
  result := cantidadAutos;
end;

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
    memo.Lines.add('La cantidad de autos registrados es: ' + cantidadAutos.ToString);
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
  calcularTarifaAuto(indiceAuto);
  memo.Lines.add('-------------------------------------------------');
  memo.Lines.Add('Patente: '+ autosIngresados[indiceAuto].patente);
  memo.Lines.Add('Fecha de entrada: '+ autosIngresados[indiceAuto].fechaEntrada.devolverStrFecha);
  memo.Lines.Add('Fecha de salida: '+ autosIngresados[indiceAuto].fechaSalida.devolverStrFecha);
  memo.Lines.Add('Horario de entrada: '+ autosIngresados[indiceAuto].horarioEntrada.horas.ToString + ':' + autosIngresados[indiceAuto].horarioEntrada.minutos.ToString );
  memo.Lines.Add('Horario de salida: '+ autosIngresados[indiceAuto].horarioSalida.horas.ToString + ':' + autosIngresados[indiceAuto].horarioSalida.minutos.ToString);
  memo.Lines.Add('Tarifa a pagar: '+ getStrTarifaAPagar(autosIngresados[indiceAuto].estadiaAuto, autosIngresados[indiceAuto].totalAPagar));
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
        autosIngresados[indiceAuto].estadiaAuto[i] := 0;
        autosIngresados[indiceAuto].totalAPagar :=0;
  end;

  if autosIngresados[indiceAuto].fechaEntrada.compararFechas(autosIngresados[indiceAuto].fechaSalida) = igual then begin
    if (autosIngresados[indiceAuto].horarioEntrada.horas = autosIngresados[indiceAuto].horarioSalida.horas) and (autosIngresados[indiceAuto].horarioEntrada.minutos = autosIngresados[indiceAuto].horarioSalida.minutos) then
      exit;  // si el auto no registra horas de estacionamiento asigno 0 a todo y salgo

    // si el auto salio el mismo día que entro y registra tiempo de estacionado...

    if (autosIngresados[indiceAuto].horarioEntrada.horas = 00) then begin
      autosIngresados[indiceAuto].horarioEntrada.horas:=24;
      autosIngresados[indiceAuto].horarioSalida.horas := autosIngresados[indiceAuto].horarioSalida.horas + 24;
    end;
    if (autosIngresados[indiceAuto].horarioSalida.horas = 00) then begin
      autosIngresados[indiceAuto].horarioSalida.horas:=24;
      autosIngresados[indiceAuto].horarioEntrada.horas:= autosIngresados[indiceAuto].horarioEntrada.horas + 24;
    end;

    horasEntradaEnSegundos := autosIngresados[indiceAuto].horarioEntrada.horas * 3600;
    horasSalidaEnSegundos := autosIngresados[indiceAuto].horarioSalida.horas * 3600;
    minutosEntradaEnSegundos :=  autosIngresados[indiceAuto].horarioEntrada.minutos * 60;
    minutosSalidaEnSegundos :=  autosIngresados[indiceAuto].horarioSalida.minutos * 60;

    cantTiempoEstadia.horas := abs(horasSalidaEnSegundos - horasEntradaEnSegundos) div 3600;
    cantTiempoEstadia.minutos := abs(minutosSalidaEnSegundos - minutosEntradaEnSegundos) div 60;

    if (cantTiempoEstadia.horas > horasEstadias[EC]) or ((cantTiempoEstadia.horas = horasEstadias[EC]) and (cantTiempoEstadia.minutos > 0)) then
      autosIngresados[indiceAuto].estadiaAuto[ec] := 1
    else if ((cantTiempoEstadia.horas <= horasEstadias[EC]) and (cantTiempoEstadia.horas > horasEstadias[ME])) or ((cantTiempoEstadia.horas = horasEstadias[ME]) and (cantTiempoEstadia.minutos > 0)) then
      autosIngresados[indiceAuto].estadiaAuto[me] := 1
    else begin
      autosIngresados[indiceAuto].estadiaAuto[hr] :=  cantTiempoEstadia.horas;
      autosIngresados[indiceAuto].estadiaAuto[min] :=  cantTiempoEstadia.minutos;
      autosIngresados[indiceAuto].totalAPagar := cantTiempoEstadia.horas * tarifaPorHora + ( cantTiempoEstadia.minutos / 10 * (tarifaPorHora / 6) );
      if (autosIngresados[indiceAuto].estadiaAuto[hr] = 0) and (autosIngresados[indiceAuto].estadiaAuto[ec] = 0) and (autosIngresados[indiceAuto].estadiaAuto[me] = 0) and (autosIngresados[indiceAuto].estadiaAuto[min]<>0) then
      autosIngresados[indiceAuto].totalAPagar := tarifaPorHora;
    end;

  end else begin

    difDias := autosIngresados[indiceAuto].fechaEntrada.diferenciaDias(autosIngresados[indiceAuto].fechaSalida);
    // si la diferencia es mayor a 1, añado estadia completa por cada dia - 1
    while difDias >= 1 do begin
      inc(autosIngresados[indiceAuto].estadiaAuto[ec]);
      dec(difDias);
    end;

    cantTiempoEstadia.horas := 0;

    if (autosIngresados[indiceAuto].horarioEntrada.horas = 00) then begin
      autosIngresados[indiceAuto].horarioEntrada.horas:=24;
      autosIngresados[indiceAuto].horarioSalida.horas := autosIngresados[indiceAuto].horarioSalida.horas + 24;
    end;
    if (autosIngresados[indiceAuto].horarioSalida.horas = 00) then begin
      autosIngresados[indiceAuto].horarioSalida.horas:=24;
      autosIngresados[indiceAuto].horarioEntrada.horas:= autosIngresados[indiceAuto].horarioEntrada.horas + 24;
    end;

    horasEntradaEnSegundos := autosIngresados[indiceAuto].horarioEntrada.horas * 3600;
    horasSalidaEnSegundos := autosIngresados[indiceAuto].horarioSalida.horas * 3600;
    minutosEntradaEnSegundos :=  autosIngresados[indiceAuto].horarioEntrada.minutos * 60;
    minutosSalidaEnSegundos :=  autosIngresados[indiceAuto].horarioSalida.minutos * 60;

    cantTiempoEstadia.horas := abs(horasSalidaEnSegundos - horasEntradaEnSegundos) div 3600;
    cantTiempoEstadia.minutos := abs(minutosSalidaEnSegundos - minutosEntradaEnSegundos) div 60;

    if cantTiempoEstadia.horas > horasEstadias[EC] then
      inc(autosIngresados[indiceAuto].estadiaAuto[ec])
    else if (cantTiempoEstadia.horas < horasEstadias[EC]) and (cantTiempoEstadia.horas > horasEstadias[ME]) then
      inc(autosIngresados[indiceAuto].estadiaAuto[me])
    else begin
      autosIngresados[indiceAuto].estadiaAuto[hr] :=  cantTiempoEstadia.horas;
      autosIngresados[indiceAuto].estadiaAuto[min] :=  cantTiempoEstadia.minutos;
      autosIngresados[indiceAuto].totalAPagar := cantTiempoEstadia.horas * tarifaPorHora + ( cantTiempoEstadia.minutos / 10 * (tarifaPorHora / 6) );
      if (autosIngresados[indiceAuto].estadiaAuto[hr] = 0) and (autosIngresados[indiceAuto].estadiaAuto[ec] = 0) and (autosIngresados[indiceAuto].estadiaAuto[min]<>0) then
        autosIngresados[indiceAuto].totalAPagar := tarifaPorHora;
    end;
  end;
end;

function validarFechasYHorarios(f1,f2:fecha;h1, h2:horario):boolean;
var
flag:boolean;
begin

  flag:=true;
  if (h1.horas > 24) or (h2.horas > 24)
  or (h2.minutos > 59) or (h1.minutos > 59) then begin
    result := false;
    exit
  end;

  if f1.compararFechas(f2) = anterior then begin
    result := false;
    exit
  end else if (f1.compararFechas(f2) = igual) then begin
    if (h1.horas = h2.horas) and (h1.minutos = h2.minutos) then flag := false;
    if (h1.horas > h2.horas) then  flag := false;
    if (h1.horas = h2.horas) and (h1.minutos > h2.minutos) then  flag := false;
  end;

  result := flag;

end;

function Estacionamiento.addAuto(pat:string;horaEntrada, horaSalida:horario; fentrada, fSalida:fecha):string;
var
  aux:integer;
begin
  aux := buscarAuto(pat);
  if (aux <> -1 ) or not validarFechasYHorarios(fentrada,fsalida,horaEntrada,Horasalida) then begin
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

function Estacionamiento.recaudacionXFecha(f:fecha; var ext:extended):estadia;
var
  i:integer;
  auxE:extended;
  j:estadias;
  strAux:string;
  Vresultado:estadia;
begin
  auxE:=0;

  if cantidadAutos = 0 then begin
    for j := ec to min do
    Vresultado[j] := -1;
    exit;
  end;

  for j := ec to min do
    Vresultado[j] := 0;

  for i := 0 to cantidadAutos - 1 do begin
    if autosIngresados[i].fechaSalida.compararFechas(f) = IGUAL then begin
      calcularTarifaAuto(i);
      Vresultado[ec] := Vresultado[ec] + autosIngresados[i].estadiaAuto[ec];
      Vresultado[me] := Vresultado[me] + autosIngresados[i].estadiaAuto[me];
      Vresultado[hr] := Vresultado[hr] + autosIngresados[i].estadiaAuto[hr];
      Vresultado[min] := Vresultado[min] + autosIngresados[i].estadiaAuto[min];
    end;
  end;

  auxE := roundto(Vresultado[hr] * tarifaPorHora + ( Vresultado[min] / 10 * (tarifaPorHora / 6) ),-2);
  if ( Vresultado[ec] = 0) and ( Vresultado[me] = 0) and ( Vresultado[hr] = 0) and ( Vresultado[min]<>0) then
      auxE := tarifaPorHora;

  ext:=auxE;
  result := Vresultado;

end;

function Estacionamiento.recaudacionXRangodeFechas(f1, f2:fecha):string;
var
  fActual:fecha;
  Vresultado:estadia;
  j:estadias;
  primerIndice,i:integer;
begin

  if f1.compararFechas(f2)=posterior then begin
    fActual:=f1;
    f1:= f2;
    f2:=fActual;
  end;

  i := 0;
  while not (f1.compararFechas(f2) = igual) do begin
    calcularTarifaAuto(i);
    Vresultado[ec] := Vresultado[ec] + autosIngresados[primerIndice].estadiaAuto[ec];
    Vresultado[me] := Vresultado[me] + autosIngresados[primerIndice].estadiaAuto[me];
    Vresultado[hr] := Vresultado[hr] + autosIngresados[primerIndice].estadiaAuto[hr];
    Vresultado[min] := Vresultado[min] + autosIngresados[primerIndice].estadiaAuto[min];
    inc(primerIndice);
    f1.sumarDias(1);
  end;

end;

function estacionamiento.getStrTarifaAPagar(vecE:estadia; ext:extended):string;
var
  i:estadias;
  str:string;
begin

  str := '';
  if vecE[ec] <> 0 then
    str := vecE[ec].ToString + ' estadias completas ';
  if vecE[me] <> 0 then
    str := str + vecE[me].ToString + ' medias estadias ';
  if vecE[hr] <> 0 then
    str := str + vecE[hr].ToString + ' horas ';
  if vecE[min] <> 0 then begin
    str := str + vecE[min].ToString + ' minutos que agregan un valor de $' + floattostr(roundto(ext, -2));
  end;

  result := str;
end;

procedure estacionamiento.ordenarAutosIngresadosXfechaSalidaAscendente();
var
  i:integer;
  autoAux:AutoIngresado;
begin
  for I := cantidadAutos - 1 downto 1 do begin
    if (autosIngresados[i].fechaSalida.compararFechas(autosIngresados[i -1].fechaSalida) = posterior) then begin
      autoAux := autosIngresados[i];
      autosIngresados[i] := autosIngresados[i-1];
      autosIngresados[i-1] := autoAux;
    end;
  end;
end;

end.
