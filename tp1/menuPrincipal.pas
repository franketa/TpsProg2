unit menuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ej9_form, ej1_form, ej6_form, ej7_form, ej10_form, Vcl.StdCtrls;

type
  TFormMenuPrincipal = class(TForm)
    btnej6: TButton;
    btnej1: TButton;
    btnej7: TButton;
    btnej9: TButton;
    Button1: TButton;
    procedure btnej7Click(Sender: TObject);
    procedure btnej6Click(Sender: TObject);
    procedure btnej1Click(Sender: TObject);
    procedure btnej9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

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
  formej1.Show
end;

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

procedure TFormMenuPrincipal.Button1Click(Sender: TObject);
begin
  formej10.Show;
end;

end.
