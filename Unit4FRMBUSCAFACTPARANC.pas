unit Unit4FRMBUSCAFACTPARANC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFRMBUSCAFACTPARANC = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMBUSCAFACTPARANC: TFRMBUSCAFACTPARANC;

implementation

{$R *.dfm}

procedure TFRMBUSCAFACTPARANC.BitBtn1Click(Sender: TObject);
begin
if TRIM(EDIT1.Text)='' then
EDIT1.Text:='1';

end;

procedure TFRMBUSCAFACTPARANC.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if KEY IN ['1','2','3','4','5','6','7','8','9','0',#13,#8] then
EDIT1.ReadOnly:=FALSE
ELSE
EDIT1.ReadOnly:=TRUE;
end;

procedure TFRMBUSCAFACTPARANC.FormShow(Sender: TObject);
begin
EDIT1.Clear;
end;

end.
