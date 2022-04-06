program tp2_recursividad_project;

uses
  Vcl.Forms,
  menuPrincipal in 'menuPrincipal.pas' {Form1},
  ej1 in 'ej1.pas' {FormEj1},
  ej2 in 'ej2.pas' {formej2},
  ej3 in 'ej3.pas' {formej3},
  ej4 in 'ej4.pas' {Formej4},
  ej5 in 'ej5.pas' {Formej5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormEj1, FormEj1);
  Application.CreateForm(Tformej2, formej2);
  Application.CreateForm(Tformej3, formej3);
  Application.CreateForm(TFormej4, Formej4);
  Application.CreateForm(TFormej5, Formej5);
  Application.Run;
end.
