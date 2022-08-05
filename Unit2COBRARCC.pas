unit Unit2COBRARCC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.DBCtrls;

type
  TCOBRARCC = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  COBRARCC: TCOBRARCC;

implementation

{$R *.dfm}

procedure TCOBRARCC.BitBtn1Click(Sender: TObject);
begin
if trim(edit4.Text)='' then
begin
     showmessage('Debe ingresar el importe a pagar');
     modalresult:=mrnone;
exit;
end;

if strtofloat(trim(edit4.Text)) =0 then
begin
     showmessage('Debe ingresar el importe no puede ser cero');
     modalresult:=mrnone;
exit;
end;

if trim(self.DBLookupComboBox1.Text)='' then
begin
     showmessage('Debe seleccionar la forma de pago');
     modalresult:=mrnone;
exit;
end;
  if Application.MessageBox( PCHAR(' EL IMPORTE A PAGAR ES: '+trim(edit4.Text)+' ¿Desea continuar?'), 'PROCESAR PAGO',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  BEGIN
       modalresult:=mrOK;
  END ELSE
   modalresult:=mrnone;

end;

procedure TCOBRARCC.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TCOBRARCC.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9',#13,#8,'.'] then
Edit4.ReadOnly:=false
else
Edit4.ReadOnly:=true ;

end;

end.
