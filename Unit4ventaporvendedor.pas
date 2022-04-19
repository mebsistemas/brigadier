unit Unit4ventaporvendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unit1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tventaporvendedor = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    FDVENDEDOR: TFDQuery;
    DTSVENDEDOR: TDataSource;
    Edit1: TEdit;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ventaporvendedor: Tventaporvendedor;

implementation

{$R *.dfm}

procedure Tventaporvendedor.BitBtn1Click(Sender: TObject);
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

procedure Tventaporvendedor.BitBtn2Click(Sender: TObject);
begin
close;
end;

end.
