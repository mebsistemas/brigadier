unit UnitPIDECOMENTARIOS4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TPIDECOMENTARIOS = class(TForm)
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PIDECOMENTARIOS: TPIDECOMENTARIOS;

implementation

{$R *.dfm}

procedure TPIDECOMENTARIOS.BitBtn1Click(Sender: TObject);
begin
if TRIM(SELF.RichEdit1.Text)='' then
BEGIN
MODALRESULT:=MRNONE;
EXIT;
END ELSE
 MODALRESULT:=MROK;


end;

end.
