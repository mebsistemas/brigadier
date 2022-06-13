unit Unit2frmPermisosUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.Buttons;

type
  TfrmPermisosUsuarios = class(TForm)
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPermisosUsuarios: TfrmPermisosUsuarios;

implementation

{$R *.dfm}

procedure TfrmPermisosUsuarios.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
