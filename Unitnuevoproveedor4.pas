unit Unitnuevoproveedor4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,UNIT1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons;

type
  Tnuevoproveedor = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    Edit5: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    N:STRING;
  end;

var
  nuevoproveedor: Tnuevoproveedor;

implementation

{$R *.dfm}

procedure Tnuevoproveedor.BitBtn1Click(Sender: TObject);
var sql:String;     idp:longint;
begin
if TRIM(EDIT1.Text)='' then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR LA RAZON SOCIAL');
EXIT;
END;
if TRIM(EDIT2.Text)='' then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL CUIT');
EXIT;
END;
if TRIM(EDIT3.Text)='' then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL TELEFONO');
EXIT;
END;
if TRIM(EDIT4.Text)='' then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL MAIL');
EXIT;
END;

if trim(n)='N' then
begin
   sql:='insert into tproveedores (razonsocial, telefono, email, cuit) values ('+#39+trim(edit1.Text)+#39+
   ','+#39+trim(edit3.Text)+#39+','+#39+trim(edit4.Text)+#39+','+#39+trim(edit2.Text)+#39+')';
end else
begin
    idp:=strtoint(edit5.Text);
     sql:='update tproveedores set    '+
     ' razonsocial='+#39+trim(edit1.Text)+#39+
     ', telefono='+#39+trim(edit3.Text)+#39+
     ',  email='+#39+trim(edit4.Text)+#39+
     ', cuit='+#39+trim(edit2.Text)+#39+
     ' where idproveedor='+inttostr(idp);



end;

 form1.FDConnection1.StartTransaction;
 try
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add(sql);
self.FDQuery1.ExecSQL;
form1.FDConnection1.Commit;
showmessage('Proceso Correcto');
 except
   form1.FDConnection1.Rollback;
   showmessage('Se produjo un error');
 end;
  CLOSE;
end;

procedure Tnuevoproveedor.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

end.
