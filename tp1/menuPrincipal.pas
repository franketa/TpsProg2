unit menuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ej1_form, ej6_form, Vcl.StdCtrls;

type
  TFormMenuPrincipal = class(TForm)
    btnej1: TButton;
    btnej2: TButton;
    procedure btnej1Click(Sender: TObject);
    procedure btnej2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuPrincipal: TFormMenuPrincipal;

implementation

{$R *.dfm}

procedure TFormMenuPrincipal.btnej1Click(Sender: TObject);
begin
  Formej1.Show;
end;

procedure TFormMenuPrincipal.btnej2Click(Sender: TObject);
begin
  formEj6.Show;
end;

end.