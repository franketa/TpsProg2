unit TADfecha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.StdCtrls;

  const
     cantDiasMeses : array [1 .. 12] of integer =
   (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30 , 31);

type

  meses = (enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre);


  ResultadoComparacionFechas = (ANTERIOR, POSTERIOR,IGUAL);

  fecha = object
  private
    dia : integer;
    mes : integer;
    año : integer;
  public
    procedure setFecha(d,m,a:integer);
    procedure mostrarFecha(memo:Tmemo);
    function esCorrecta():boolean;
    procedure sumarDias(diasASumar:integer);
    procedure restarDias(diasARestar:integer);
    function diferenciaConFecha(fechaDos:fecha):fecha;
    function compararFechas(fechaDos:fecha):ResultadoComparacionFechas;
    function perteneceAñoBisiesto():boolean;
  end;

implementation

procedure fecha.setFecha(d,m,a:integer);
begin
  año := a;
  mes:= m;
  dia:=d;
end;

procedure fecha.mostrarFecha(memo:Tmemo);
begin
  if not fecha.esCorrecta then exit;
  memo.Lines.Add(dia.ToString + '\'+ mes.ToString + '\' + año.ToString);
end;

function fecha.esCorrecta():boolean;
begin
  result:= true;
  if (dia < 1) or (dia > 31) then begin
    result := false;
    exit;
  end;

  if (mes < 1) or (mes > 12) then begin
    result := false;
    exit;
  end;

  if (año < 1) or (año > 9999) then begin
    result := false;
    exit;
  end;

  if (mes = 2) and (dia > 29) then begin
    result := false;
    exit;
  end;

end;

function fecha.perteneceAñoBisiesto():boolean;
begin
  if not fecha.esCorrecta then exit;
  
  if ((año mod 400 = 0) or (año mod 100 <> 0)) and (año mod 4 = 0) then
    result := true
  else
    result := false;

end;

procedure fecha.sumarDias(diasASumar:integer);
var
  diasRestantesMes:integer;
begin
  if not fecha.esCorrecta then exit;
  if perteneceAñoBisiesto and (mes = 2) then diasRestantesMes := 29 - dia else
      diasRestantesMes := cantDiasMeses[mes] - dia;
  while (diasASumar > 0) do begin
    while (diasRestantesMes > 0) and (diasASumar > 0) do begin
      inc(dia);
      dec(diasRestantesMes);
      dec(diasASumar);
    end;
    if (mes <> 12) and (diasASumar > 0) then begin
      inc(mes);
      dia:= 0;
      if perteneceAñoBisiesto and (mes = 2) then diasRestantesMes := 29- dia else
      diasRestantesMes := cantDiasMeses[mes] - dia;
    end
    else if (diasASumar > 0) then begin
      inc(año);
      mes := 1;
      dia := 0;
      if perteneceAñoBisiesto and (mes = 2) then diasRestantesMes := 29- dia else
      diasRestantesMes := cantDiasMeses[mes] ;
    end;

  end;
end;

procedure fecha.restarDias(diasARestar:integer);
var
  DiasMesActual:integer;
begin
  if not fecha.esCorrecta then exit;
  while (diasARestar > 0) do begin
    while (dia > 1) and (diasARestar > 0) do begin
      dec(dia);
      dec(diasARestar);
    end;
    if (mes <> 1) and (diasARestar > 0) then begin
      dec(mes);
      dec(diasARestar);
      if perteneceAñoBisiesto and (mes = 2) then DiasMesActual := 29 else
      DiasMesActual := cantDiasMeses[mes];
      dia:=DiasMesActual;
    end
    else if (diasARestar > 0) then begin
      dec(año);
      dec(diasARestar);
      mes := 12;
      dia := 31;
    end;
  end;
end;

function fecha.compararFechas(fechaDos:fecha):ResultadoComparacionFechas;
begin
  if not fecha.esCorrecta then exit;

  if (año = fechaDos.año) and (dia = fechaDos.dia)
  and (mes = fechaDos.mes) then begin
    Result:= IGUAL;
    exit;
  end;

  if (año = fechaDos.año) and (dia > fechaDos.dia)
  and (mes = fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end
  else begin
    Result:= POSTERIOR;
    exit;
  end;

  if (año = fechaDos.año) and (dia = fechaDos.dia)
  and (mes > fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end
  else begin
    Result:= POSTERIOR;
    exit;
  end;

  if (año > fechaDos.año) and (dia = fechaDos.dia)
  and (mes = fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end
  else begin
    Result:= POSTERIOR;
    exit;
  end;

  
  end;

function fecha.diferenciaConFecha(fechaDos:fecha):fecha;
 var
  DiasMesActual,diasRestantesMes:integer;
  Resultado, FechaAux:fecha;
begin
  if not fecha.esCorrecta then exit;
  resultado.dia := 0;
  FechaAux.dia:=dia;
  FechaAux.mes:=mes;
  FechaAux.año:=año;

  if fecha.compararFechas(fechaDos) = igual then begin
    result.dia:=0;
    exit;
  end

  else if fecha.compararFechas(fechaDos) = posterior then begin

    while fecha.compararFechas(fechaDos) <> igual do begin
      if perteneceAñoBisiesto and (mes = 2) then diasRestantesMes := 29 - dia else
      diasRestantesMes := cantDiasMeses[FechaAux.mes] - FechaAux.dia;
      while (diasRestantesMes > 0) and ( fecha.compararFechas(fechaDos) <> igual ) do begin
        inc(FechaAux.dia);
        inc(resultado.dia);
        dec(diasRestantesMes);
      end;
      if FechaAux.mes <> 12 then begin
        inc(FechaAux.mes);
        FechaAux.dia:=1;
      end
      else begin
        inc(FechaAux.año);
        FechaAux.mes := 1;
        FechaAux.dia := 1;
      end;
    end;
  end else begin

    while fecha.compararFechas(fechaDos) <> igual do begin
      while (FechaAux.dia > 0) and (fecha.compararFechas(fechaDos) <> igual) do begin
        dec(FechaAux.dia);
        inc(resultado.dia);
      end;
      if mes <> 1 then begin
        dec(FechaAux.mes);
        if perteneceAñoBisiesto and (mes = 2) then diasRestantesMes := 29 - dia else
        diasRestantesMes := cantDiasMeses[FechaAux.mes] - FechaAux.dia;
        FechaAux.dia:=DiasMesActual;
      end
      else begin
        dec(FechaAux.año);
        FechaAux.mes := 12;
        FechaAux.dia := 31;
      end;
    end;
  end;
end;

end.


