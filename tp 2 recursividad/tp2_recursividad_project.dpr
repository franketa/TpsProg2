program tp2_recursividad_project;

uses
  Vcl.Forms,
  menuPrincipal in 'menuPrincipal.pas' {Form1},
  ej1 in 'ej1.pas' {FormEj1},
  ej2 in 'ej2.pas' {formej2},
  ej3 in 'ej3.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormEj1, FormEj1);
  Application.CreateForm(Tformej2, formej2);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
