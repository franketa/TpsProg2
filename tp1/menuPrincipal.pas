unit menuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ej9_form, ej1_form, ej6_form, ej7_form, ej10_form, Vcl.StdCtrls;

type
  TFormMenuPrincipal = class(TForm)
    btnej6: TButton;
    btnej7: TButton;
    btnej9: TButton;
    btnej10: TButton;
    procedure btnej7Click(Sender: TObject);
    procedure btnej6Click(Sender: TObject);
    procedure btnej9Click(Sender: TObject);
    procedure btnej10Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuPrincipal: TFormMenuPrincipal;

implementation

{$R *.dfm}

procedure TFormMenuPrincipal.btnej6Click(Sender: TObject);
begin
  formej7.Show;
end;

procedure TFormMenuPrincipal.btnej7Click(Sender: TObject);
begin
  formej6.Show;
end;

procedure TFormMenuPrincipal.btnej9Click(Sender: TObject);
begin
  formej9.Show;
end;

procedure TFormMenuPrincipal.btnej10Click(Sender: TObject);
begin
  formej10.Show;
end;



end.
