unit UnitMESYANIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TMESYANIO = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MESYANIO: TMESYANIO;

implementation

{$R *.dfm}

procedure TMESYANIO.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if KEY IN ['0','1','2','3','4','5','6','7','8','9'] then
EDIT1.ReadOnly:=FALSE
ELSE
EDIT1.ReadOnly:=TRUE;

end;

end.
