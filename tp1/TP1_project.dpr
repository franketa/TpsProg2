program TP1_project;

uses
  Vcl.Forms,
  ej1_form in 'ej1_form.pas' {FormEj1},
  TADnumeroRacional in 'TADnumeroRacional.pas',
  ej6_form in 'ej6_form.pas' {FormEj6},
  TADEstacionamiento in 'TADEstacionamiento.pas',
  menuPrincipal in 'menuPrincipal.pas' {FormMenuPrincipal},
  ej7_form in 'ej7_form.pas' {FormEj7},
  TADfecha in 'TADfecha.pas',
  ej9_form in 'ej9_form.pas' {Formej9},
  TADcajaRegistradora in 'TADcajaRegistradora.pas',
  TADtarjetaDeCredito in 'TADtarjetaDeCredito.pas',
  ej10_form in 'ej10_form.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuPrincipal, FormMenuPrincipal);
  Application.CreateForm(TFormEj6, FormEj6);
  Application.CreateForm(TFormEj1, FormEj1);
  Application.CreateForm(TFormEj7, FormEj7);
  Application.CreateForm(TFormej9, Formej9);
  Application.CreateForm(TForm1, Formej10);
  Application.Run;
end.
