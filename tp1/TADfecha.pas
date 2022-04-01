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
    function compararFechas(fechaDos:fecha):ResultadoComparacionFechas;
    function perteneceAñoBisiesto():boolean;
    function diferenciaDias(fechados:fecha):integer;
    function devolverStrFecha():string;
  end;

implementation

function fecha.devolverStrFecha():string;
begin
  result:=  dia.ToString + '/' + mes.ToString + '/' + año.ToString;
end;

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

function fecha.perteneceAñoBisiesto():boolean;
begin
  if (año < 0) or (año > 9999) then result := false;

  result := ((año mod 4 = 0) and (año mod 100 <> 0)) or (año mod 400 = 0);


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

  if not fecha.perteneceAñoBisiesto and (mes = 2) and (dia = 29) then begin
    result := false;
    exit;
  end;
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

//f1 respecto de f2
function fecha.compararFechas(fechaDos:fecha):ResultadoComparacionFechas;
begin

  if not fecha.esCorrecta then exit;
  if not fechaDos.esCorrecta then exit;



  if (año = fechaDos.año) and (dia > fechaDos.dia)
  and (mes = fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end;

  if (año = fechaDos.año) and (dia < fechaDos.dia)
  and (mes = fechaDos.mes) then  begin
    Result:= POSTERIOR;
    exit;
  end;

  if (año = fechaDos.año) and (dia = fechaDos.dia)
  and (mes = fechaDos.mes) then begin
    Result:= IGUAL;
    exit;
  end;

  if (año = fechaDos.año) and (dia = fechaDos.dia)
  and (mes > fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end;

  if (año = fechaDos.año) and (dia = fechaDos.dia)
  and (mes < fechaDos.mes) then begin
    Result:= POSTERIOR;
    exit;
  end;

  if (año > fechaDos.año) and (dia = fechaDos.dia)
  and (mes = fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end;

  if (año > fechaDos.año) and (dia <> fechaDos.dia)
  and (mes <> fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end;

  if (año < fechaDos.año) and (dia <> fechaDos.dia)
  and (mes <> fechaDos.mes) then begin
    Result:= POSTERIOR;
    exit;
  end;

  if (año = fechaDos.año) and (dia <> fechaDos.dia)
  and (mes > fechaDos.mes) then begin
    Result:= Anterior;
    exit;
  end;

  if (año = fechaDos.año) and (dia <> fechaDos.dia)
  and (mes < fechaDos.mes) then begin
    Result:= POSTERIOR;
    exit;
  end;

  if (año > fechaDos.año) and (dia = fechaDos.dia)
  and (mes = fechaDos.mes) then begin
    Result:= POSTERIOR;
    exit;
  end;

  
  end;

function cantidadAñosbisiestos(f:fecha):integer;
begin
  if f.mes <= 2 then
    dec(f.año);
  result := (f.año div 4) - (f.año div 100) + (f.año div 400);
end;

function fecha.diferenciaDias(fechados:fecha):integer;
var
  n1, n2,i:integer;
begin
  n1:=0;
  n2:=0;
  n1 := año * 365 + dia;

  for i := 1 to mes - 1 do
    n1 := n1 + cantDiasMeses[i];

  n1 := n1 + cantidadAñosbisiestos(self);

  n2 := fechados.año * 365 + fechados.dia;

  for i := 1 to fechados.mes - 1 do
    n2 := n2 + cantDiasMeses[i];

  n2 := n2 + cantidadAñosbisiestos(fechados);

  result:= n2 - n1;

  if n2 - n1 < 0 then result := (n2 - n1) * -1;

end;



end.


