unit UnPRPRECIOVARIABLE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TPRPRECIOVARIABLE = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PRPRECIOVARIABLE: TPRPRECIOVARIABLE;

implementation

{$R *.dfm}

procedure TPRPRECIOVARIABLE.BitBtn1Click(Sender: TObject);
begin
if TRIM(EDIT1.Text)='' then
   EXIT;


   CLOSE;
end;

procedure TPRPRECIOVARIABLE.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit1.readonly:=false
    else
     edit1.readonly:=true;


   if KEY=#13 then
      BitBtn1Click(Sender);


end;

procedure TPRPRECIOVARIABLE.FormShow(Sender: TObject);
begin
EDIT1.SetFocus;
end;

end.
