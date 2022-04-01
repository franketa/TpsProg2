program TP1_project;

uses
  Vcl.Forms,
  TADnumeroRacional in 'TADnumeroRacional.pas',
  ej6_form in 'ej6_form.pas' {FormEj6},
  TADEstacionamiento in 'TADEstacionamiento.pas',
  menuPrincipal in 'menuPrincipal.pas' {FormMenuPrincipal},
  ej7_form in 'ej7_form.pas' {FormEj7},
  TADfecha in 'TADfecha.pas',
  ej9_form in 'ej9_form.pas' {Formej9},
  TADtarjetaDeCredito in 'TADtarjetaDeCredito.pas',
  ej10_form in 'ej10_form.pas' {Formej10},
  TADcajaRegistradora in 'TADcajaRegistradora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuPrincipal, FormMenuPrincipal);
  Application.CreateForm(TFormEj6, FormEj6);
  Application.CreateForm(TFormEj7, FormEj7);
  Application.CreateForm(TFormej9, Formej9);
  Application.CreateForm(TFormej10, Formej10);
  Application.Run;
end.
