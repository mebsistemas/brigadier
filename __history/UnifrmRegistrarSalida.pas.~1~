unit UnifrmRegistrarSalida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmRegistrarSalida = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegistrarSalida: TfrmRegistrarSalida;

implementation

{$R *.dfm}

uses Ufrmsalidacaja, Unit1, UFMIMPRESIONVARIOS;

procedure TfrmRegistrarSalida.BitBtn1Click(Sender: TObject);
var fecha:string;     sale:boolean;
begin
  if trim(edit1.Text)='' then
  begin
    showmessage('Debe ingresar la fecha');
  exit;
  end;

  if trim(edit2.Text)='' then
  begin
    showmessage('Debe ingresar el Proveedor');
  exit;
  end;

  if trim(edit3.Text)='' then
  begin
    showmessage('Debe ingresar el Nro de Factura');
  exit;
  end;

   if trim(edit4.Text)='' then
  begin
    showmessage('Debe ingresar el Importe');
  exit;
  end;

   if trim(self.RichEdit1.Text)='' then
  begin
    showmessage('Debe ingresar el Detalle');
  exit;
  end;


form1.FDConnection1.StartTransaction;
try
frmsalidacaja.FDQuery2.Close;
frmsalidacaja.FDQuery2.SQL.Clear;
frmsalidacaja.FDQuery2.SQL.Add('insert into tsalidas (fecha,proveedor,nrofactura,importe,detalle,CIERRE) '+
' values ('+#39+trim(edit1.Text)+#39+','+#39+trim(edit2.Text)+#39+','
+#39+trim(edit3.Text)+#39+','+#39+trim(edit4.Text)+#39+','+#39+trim(self.RichEdit1.Text)+#39+',0)');
frmsalidacaja.FDQuery2.ExecSQL;

form1.FDConnection1.Commit;
showmessage('Se ha registrado correctamente');

 {FRMIMPRESIONVARIOS.QRLabel1.Caption:='SALIDA DE CAJA';
 FRMIMPRESIONVARIOS.QRLabel2.Caption:='FECHA '+DATETOSTR(DATE)+' '+TIMETOSTR(TIME);
 FRMIMPRESIONVARIOS.QRLabel3.Caption:='IMPORTE: '+ trim(edit4.Text);
 FRMIMPRESIONVARIOS.QRPQuickrep1.Prepare;
 FRMIMPRESIONVARIOS.QRPQuickrep1.Print;   }

frmRegistrarSalida.Edit2.Clear;
frmRegistrarSalida.Edit3.Clear;
frmRegistrarSalida.Edit4.Clear;
frmRegistrarSalida.RichEdit1.Clear;
sale:=true;
except
   on E: Exception do
   begin
      ShowMessage (E.ClassName + 'error generado, con mensaje:' + E.Message);
   form1.FDConnection1.Rollback;
   sale:=false;
   end;
end;

   frmsalidacaja.FDQuery1.Close;
   frmsalidacaja.FDQuery1.SQL.Clear;
   frmsalidacaja.FDQuery1.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   frmsalidacaja.FDQuery1.Open;
   fecha:= frmsalidacaja.FDQuery1.FieldByName('fecha').AsString;

 frmsalidacaja.FDQuery1.Close;
 frmsalidacaja.FDQuery1.SQL.Clear;
 frmsalidacaja.FDQuery1.SQL.Add('select * from tsalidas where fecha='+#39+trim(fecha)+#39+' AND CIERRE=0');
 frmsalidacaja.FDQuery1.Open;
 if sale=true then
    close;

end;

procedure TfrmRegistrarSalida.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TfrmRegistrarSalida.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit4.readonly:=false
    else
     edit4.readonly:=true;
end;

end.
