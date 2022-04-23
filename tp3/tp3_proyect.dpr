program tp3_proyect;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ListArray in 'ListArray.pas',
  ListPointer in 'ListPointer.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
