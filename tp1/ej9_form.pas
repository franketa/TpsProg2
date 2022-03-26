unit ej9_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFormej9 = class(TForm)
    Memo1: TMemo;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    UpDown8: TUpDown;
    UpDown9: TUpDown;
    UpDown10: TUpDown;
    UpDown11: TUpDown;
    btnIngresar: TButton;
    btnCobrar: TButton;
    inputMontoACobrar: TLabeledEdit;
    inputMonUn: TLabeledEdit;
    InputMonDos: TLabeledEdit;
    inputMonCinco: TLabeledEdit;
    inputMonDiez: TLabeledEdit;
    inputBilDiez: TLabeledEdit;
    inputBilVeinte: TLabeledEdit;
    inputBilCincuenta: TLabeledEdit;
    inputBilCien: TLabeledEdit;
    inputBilDoscientos: TLabeledEdit;
    inputBilQuinientos: TLabeledEdit;
    inputBilMil: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnCerrar: TButton;
    Label3: TLabel;
    btnVerSaldo: TButton;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEj9: TFormej9;

implementation

{$R *.dfm}

end.
