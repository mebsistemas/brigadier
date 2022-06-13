unit Unit2NUEVOUSUARIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.CheckLst;

type
  TNUEVOUSUARIO = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    CheckListBox1: TCheckListBox;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NUEVOUSUARIO: TNUEVOUSUARIO;

implementation

{$R *.dfm}

procedure TNUEVOUSUARIO.BitBtn1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
   begin
   showmessage('Debe ingresar el apellido y nombre');
       modalresult:=mrnone;
     exit;
   end;

  if trim(edit2.Text)='' then
   begin
       showmessage('Debe ingresar el codigo');
        modalresult:=mrnone;
        exit;
   end;

       modalresult:=mrok;
end;

procedure TNUEVOUSUARIO.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9',#13,#8] then
     edit2.ReadOnly:=false
     else
      edit2.ReadOnly:=true;
end;

end.
