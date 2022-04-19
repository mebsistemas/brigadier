unit Unitfrmenviarmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrmenviarmail = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmenviarmail: Tfrmenviarmail;

implementation

{$R *.dfm}

procedure Tfrmenviarmail.BitBtn1Click(Sender: TObject);
begin
if TRIM(EDIT1.Text)='' then
BEGIN
SHOWMESSAGE('DEBE INGRESAR EL MAIL DEL CLIENTE');
MODALRESULT:=MRNONE;
EXIT;
END;

end;

end.
