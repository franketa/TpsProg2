program tp2_recursividad_project;

uses
  Vcl.Forms,
  menuPrincipal in 'menuPrincipal.pas' {Form1},
  ej1 in 'ej1.pas' {FormEj1},
  ej2 in 'ej2.pas' {formej2},
  ej3 in 'ej3.pas' {formej3},
  ej4 in 'ej4.pas' {Formej4},
  ej5 in 'ej5.pas' {Formej5},
  ej6 in 'ej6.pas' {formej6},
  ej7 in 'ej7.pas' {formej7};

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
  Application.CreateForm(Tformej6, formej6);
  Application.CreateForm(Tformej7, formej7);
  Application.Run;
end.
