unit TADhorario;

interface
uses system.SysUtils;
const
  horaEnSegundos = 3600;
  minutoEnSegundos = 60;
type
  eComparacion = (anterior, igual, posterior);
  horario = object
    h:integer;
    m:integer;
    esValido:boolean;
    procedure validarHorario();
    function diferenciaHorariaEnMinutos(h2:horario):integer;
    function getStr():string;
  end;


implementation

procedure horario.validarHorario();
var
  aux:boolean;
begin
  esValido := true;
  if (h < 0) or (h > 24) then esValido := false;
  if (m < 0) or (m > 59) then esValido := false;
end;

function horario.diferenciaHorariaEnMinutos(h2:horario):integer;
var
  hEnSeg, h2EnSeg:integer;
begin
  if not h2.esValido then result := -1;
  if h = 0 then begin
    h := 24;
    h2.h := h2.h + 24;
  end;
  if h2.h = 0 then begin
    h2.h := 24;
    h := h + 24;
  end;

  hEnSeg := h * horaEnSegundos + m * minutoEnSegundos;
  h2EnSeg := h2.h * horaEnSegundos + h2.m * minutoEnSegundos;

  result :=  (h2EnSeg - hEnSeg) div 60;
end;

function horario.getStr():string;
begin
  if esValido then result := h.ToString + ':' + m.ToString;
end;

end.
