unit menuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ej1,ej2,ej3,ej4,ej5,ej7, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   formEj1.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  formej2.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  formej3.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  formej4.show;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  formej5.show;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  formej7.show;
end;

end.
