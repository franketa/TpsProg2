program tp3_proyect;

uses
  Vcl.Forms,
  ListArray in 'ListArray.pas',
  ListPointer in 'ListPointer.pas',
  Tipos in 'Tipos.pas',
  ej7 in 'ej7.pas' {Form2},
  ej8 in 'ej8.pas' {Form3},
  ej9 in 'ej9.pas' {Form4},
  TADhorario in 'TADhorario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
