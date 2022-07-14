unit UnAPERTURACAJA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TAPERTURACAJA = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  APERTURACAJA: TAPERTURACAJA;

implementation

{$R *.dfm}

uses Unit1;

procedure TAPERTURACAJA.BitBtn1Click(Sender: TObject);
var fe:String;   estado:longint;
begin
fe:=datetostr(datetimepicker1.DateTime);
if TRIM(EDIT1.Text)='' then
BEGIN
  SHOWMESSAGE('Debe ingresar el cambio');
  exit;
END;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE fecha='+#39+trim(fe)+#39+' and estado=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
form1.FDQuery2.Open;
if form1.FDQuery2.RecordCount > 0 then
begin
   showmessage('Ya existe una caja con la fecha '+fe);
  exit;
end;

estado:=1;
form1.FDConnection1.StartTransaction;
try
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('insert into TCAJA  (fecha,cambio,estado,PC) values ('+#39+trim(fe)+#39+','+floattostr(strtofloat(edit1.Text))+','+inttostr(estado)+','+INTTOSTR(FORM1.PUESTO_PC)+')');
form1.FDQuery2.ExecSQL;
form1.FDConnection1.Commit;
form1.Panel2.Caption:='CAJA '+FE;
showmessage('Se ha creado la caja correctamente');
close;
except
  form1.FDConnection1.Rollback;
  showmessage('Error al crear la caja');
end;

end;

procedure TAPERTURACAJA.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TAPERTURACAJA.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit1.readonly:=false
    else
     edit1.readonly:=true
end;

end.
