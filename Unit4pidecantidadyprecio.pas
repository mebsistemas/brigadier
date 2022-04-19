unit Unit4pidecantidadyprecio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  Tpidecantidadyprecio = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pidecantidadyprecio: Tpidecantidadyprecio;

implementation

{$R *.dfm}

procedure Tpidecantidadyprecio.BitBtn1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
begin
  showmessage('Debe ingresar cantidad');
  modalresult:=mrnone;
exit;
end;

if trim(edit2.Text)='' then
begin
  showmessage('Debe ingresar precio unitario');
  modalresult:=mrnone;
exit;
end;

if trim(edit3.Text)='' then
begin
  showmessage('Debe ingresar total');
  modalresult:=mrnone;
exit;
end;
end;

procedure Tpidecantidadyprecio.BitBtn3Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
begin
  showmessage('Debe ingresar cantidad');

exit;
end;

if trim(edit2.Text)='' then
begin
  showmessage('Debe ingresar precio unitario');

exit;
end;

  edit3.Text:=FormatFloat('##0.00',(strtofloat(edit1.Text)*strtofloat(edit2.Text)));

  SELF.BitBtn1.SetFocus;
end;

procedure Tpidecantidadyprecio.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit1.ReadOnly:=false
else
edit1.ReadOnly:=true;

if KEY=#13 then
EDIT2.SetFocus;

end;

procedure Tpidecantidadyprecio.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit2.ReadOnly:=false
else
edit2.ReadOnly:=true;

if KEY=#13 then
SELF.BitBtn3.SetFocus;
end;

procedure Tpidecantidadyprecio.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit3.ReadOnly:=false
else
edit3.ReadOnly:=true;


if KEY=#13 then
SELF.BitBtn1.SetFocus;
end;

end.
