unit UnitcomisionesVendedores4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,UNIT1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TcomisionesVendedores = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    FDVENDEDOR: TFDQuery;
    DTSVENDEDOR: TDataSource;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  comisionesVendedores: TcomisionesVendedores;

implementation

{$R *.dfm}

uses UnitimprimeVentasVendedor2;

procedure TcomisionesVendedores.BitBtn1Click(Sender: TObject);
var fe,fe1,sql:string;  pago,t,comi:real;
begin
fe:=datetostr(datetimepicker1.DateTime);
fe1:=datetostr(datetimepicker2.DateTime);


sql:='select '+
' sum(tm.total) as total  '+
'       from tmovimientos tm, tventas_vendedor tv  '+
' where tm.idmovimiento=tv.idventa  '+
' and tm.fecha BETWEEN '+#39+trim(fe)+#39+' and  '+#39+trim(fe1)+#39+
' and tv.idvendedor='+inttostr(self.DBLookupComboBox1.KeyValue);
 self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add(sql);
self.FDQuery1.Open;
edit1.Text:=trim(FDQuery1.FieldByName('total').AsString);

sql:='select comision from tvendedores where idvendedor='+inttostr(self.DBLookupComboBox1.KeyValue);
 self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add(sql);
self.FDQuery1.Open;
edit2.Text:=trim(FDQuery1.FieldByName('comision').AsString);
if trim(edit2.Text)='' then
   edit2.Text:='0';

if trim(edit1.Text)='' then
   edit1.Text:='0';

 if strtofloat(edit1.Text)=0 then
     edit4.Text:='0'
      else
         if strtofloat(edit2.Text)=0 then
            edit4.Text:='0'
             else
               begin
                   pago:=0;
                   comi:=strtofloat(edit2.Text);
                   t:=strtofloat(edit1.Text);
                   pago:=(t*comi)/100;
                   edit4.Text:=floattostr(pago)

               end;


self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select tm.fecha as FECHA, '+
      ' tc.apenom AS CLIENTE,   '+
      ' t.descripcion AS COMPROBANTE, '+
      ' tm.nrofactura AS NUMERO,'+
      ' tm.total  AS TOTAL  '+
      ' from tmovimientos tm, tventas_vendedor tv  ,tclientes tc,  '+
' TIPOMOVIMIENTOS T  '+
' where tm.idmovimiento=tv.idventa  '+
' and tm.idcliente=tc.idcliente '+
' and tm.tipomovimiento=t.idtipo '+
' and tm.fecha BETWEEN '+#39+trim(fe)+#39+' and  '+#39+trim(fe1)+#39+
' and tv.idvendedor='+inttostr(self.DBLookupComboBox1.KeyValue)+
' ORDER BY tm.idmovimiento asc');
self.FDQuery1.Open;

end;

procedure TcomisionesVendedores.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TcomisionesVendedores.BitBtn3Click(Sender: TObject);
begin
imprimeVentasVendedor.QRLabel2.Caption:='VENDEDOR: '+TRIM(SELF.DBLookupComboBox1.Text);
imprimeVentasVendedor.QRLabel3.Caption:='DESDE: '+TRIM(DATETOSTR(SELF.DateTimePicker1.DateTime))+'  HASTA: '+TRIM(DATETOSTR(SELF.DateTimePicker2.DateTime)) ;
imprimeVentasVendedor.QRLabel9.Caption:='TOTAL VENTA: $'+TRIM(EDIT1.Text);
imprimeVentasVendedor.QRLabel10.Caption:='% COMISION: '+TRIM(EDIT2.Text);
imprimeVentasVendedor.QRLabel11.Caption:='TOTAL COMISION: $'+TRIM(EDIT4.Text);
imprimeVentasVendedor.QuickRep1.Prepare;
imprimeVentasVendedor.QuickRep1.Preview;
end;

end.
