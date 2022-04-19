unit UnFRMAGREGrtarjetait4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFRMAGREGrtarjeta = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OP:STRING;
  end;

var
  FRMAGREGrtarjeta: TFRMAGREGrtarjeta;

implementation

{$R *.dfm}

procedure TFRMAGREGrtarjeta.BitBtn1Click(Sender: TObject);
begin
if TRIM(EDIT1.Text)='' then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR LA DENOMINACION DE LA TARJETA.');
   MODALRESULT:=MRNONE;
  EXIT
END;

 if COMBOBOX1.ItemIndex=-1 then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL TIPO DE TARJETA');
   MODALRESULT:=MRNONE;
  EXIT
END;

end;

procedure TFRMAGREGrtarjeta.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

end.
