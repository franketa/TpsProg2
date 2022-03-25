program TP1_project;

uses
  Vcl.Forms,
  ej1_form in 'ej1_form.pas' {FormEj1},
  TADnumeroRacional in 'TADnumeroRacional.pas',
  ej6_form in 'ej6_form.pas' {FormEj6},
  TADEstacionamiento in 'TADEstacionamiento.pas',
  menuPrincipal in 'menuPrincipal.pas' {FormMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenuPrincipal, FormMenuPrincipal);
  Application.CreateForm(TFormEj6, FormEj6);
  Application.CreateForm(TFormEj1, FormEj1);
  Application.Run;
end.
