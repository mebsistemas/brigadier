unit UnitregistarIngresosCaja2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TregistarIngresosCaja = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  registarIngresosCaja: TregistarIngresosCaja;

implementation

{$R *.dfm}

procedure TregistarIngresosCaja.BitBtn1Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
begin
  showmessage('Debe ingresar la fecha');
  exit;
end;
if trim(edit2.Text)='' then
begin
  showmessage('Debe ingresar el motivo');
  exit;
end;
if trim(edit3.Text)='' then
begin
  showmessage('Debe ingresarel importe');
  exit;
end;

BitBtn1.ModalResult:=mrok;
end;

procedure TregistarIngresosCaja.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit3.readonly:=false
    else
     edit3.readonly:=true;
end;

end.
