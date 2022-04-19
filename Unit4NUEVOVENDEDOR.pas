unit Unit4NUEVOVENDEDOR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TNUEVOVENDEDOR = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IDVENDE:LONGINT;
  end;

var
  NUEVOVENDEDOR: TNUEVOVENDEDOR;

implementation

{$R *.dfm}

procedure TNUEVOVENDEDOR.BitBtn1Click(Sender: TObject);
begin
 if trim(edit1.Text)='' then
 begin
   showmessage('DEBE INGRESAR EL NOMBRE DEL VENDEDOR');
   MODALRESULT:=MRNONE;
   EXIT;
 end;

  if trim(edit2.Text)='' then
 begin
   showmessage('DEBE INGRESAR LA COMISION');
   MODALRESULT:=MRNONE;
   EXIT;
 end;

end;

procedure TNUEVOVENDEDOR.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if KEY IN ['0','1','2','3','4','5','9','7','6','8',#13,#8,'.'] then
EDIT2.ReadOnly:=FALSE
ELSE
EDIT2.ReadOnly:=TRUE;

end;

end.
