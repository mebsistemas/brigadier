unit Unit2cargarStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,unit1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TcargarStock = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OP:STRING;
    idarticulo:longint;
  end;

var
  cargarStock: TcargarStock;

implementation

{$R *.dfm}

procedure TcargarStock.BitBtn1Click(Sender: TObject);
var cantidad:real;
begin
if trim(edit2.Text)='' then
begin
   showmessage('Debe ingresar la cantidad');
  exit;
end;

cantidad:=Strtoint(edit2.Text);

form1.FDConnection1.StartTransaction;
try

FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT stockcompra, STOCK,STOCKINICIA,STOCKBAJA,STOCKVENTA FROM TARTICULOS  WHERE IDARTICULO='+INTTOSTR(idarticulo));
FDQuery1.OPEN;
 if TRIM(FDQuery1.FieldByName('stockcompra').AsString)='' then
   BEGIN
    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('UPDATE TARTICULOS SET stockcompra=0  WHERE IDARTICULO='+INTTOSTR(idarticulo));
   FDQuery2.ExecSQL;
   END;

 if TRIM(FDQuery1.FieldByName('STOCK').AsString)='' then
    BEGIN
    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('UPDATE TARTICULOS SET STOCK=0  WHERE IDARTICULO='+INTTOSTR(idarticulo));
   FDQuery2.ExecSQL;
   END ;


   if TRIM(FDQuery1.FieldByName('STOCKBAJA').AsString)='' then
    BEGIN
    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('UPDATE TARTICULOS SET STOCKBAJA=0  WHERE IDARTICULO='+INTTOSTR(idarticulo));
   FDQuery2.ExecSQL;
   END ;

    if TRIM(FDQuery1.FieldByName('STOCKINICIA').AsString)='' then
    BEGIN
    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('UPDATE TARTICULOS SET STOCKINICIA=0  WHERE IDARTICULO='+INTTOSTR(idarticulo));
   FDQuery2.ExecSQL;
   END ;

     if TRIM(FDQuery1.FieldByName('STOCKVENTA').AsString)='' then
    BEGIN
    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('UPDATE TARTICULOS SET STOCKVENTA=0  WHERE IDARTICULO='+INTTOSTR(idarticulo));
   FDQuery2.ExecSQL;
   END ;


form1.FDConnection1.Commit;


except
 form1.FDConnection1.Rollback;


end;




form1.FDConnection1.StartTransaction;
try
 if TRIM(OP)='N' then
BEGIN
    FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('UPDATE TARTICULOS SET stockcompra=stockcompra + '+floattostr(cantidad)+',  STOCK=STOCK + '+FLOATTOSTR(cantidad)+'  WHERE IDARTICULO='+INTTOSTR(idarticulo));
    FDQuery1.ExecSQL;
END ELSE BEGIN
      FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('UPDATE TARTICULOS SET stockBAJA=stockBAJA + '+floattostr(cantidad)+',  STOCK=STOCK - '+FLOATTOSTR(cantidad)+'  WHERE IDARTICULO='+INTTOSTR(idarticulo));
    FDQuery1.ExecSQL;

    FDQuery3.Close;
    FDQuery3.SQL.Clear;
    FDQuery3.SQL.Add('INSERT INTO TSTOCKBAJA  (IDARTICULO,CANTIDAD,FECHA) VALUES ('+INTTOSTR(idarticulo)+','+FLOATTOSTR(cantidad)+','+#39+TRIM(DATETOSTR(DATE))+#39+')');
    FDQuery3.ExecSQL;


END;


form1.FDConnection1.Commit;
showmessage('Proceso terminado');
except
 form1.FDConnection1.Rollback;
 showmessage('se produjo un error');

end;

 close;
end;

procedure TcargarStock.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TcargarStock.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit2.readonly:=false
    else
     edit2.readonly:=true;

  if key=#13 then
     BitBtn1Click(Sender);

end;

procedure TcargarStock.FormShow(Sender: TObject);
begin
edit2.SetFocus;
end;

end.
