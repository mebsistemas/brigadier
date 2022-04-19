unit Unit4verventas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls,unit1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tverventas = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  verventas: Tverventas;

implementation

{$R *.dfm}

procedure Tverventas.BitBtn1Click(Sender: TObject);
var fe,fe1,sql:string;  pago,t,comi:real;
begin
fe:=datetostr(datetimepicker1.DateTime);
fe1:=datetostr(datetimepicker2.DateTime);


sql:='select '+
' sum(tm.total) as total  '+
'       from tmovimientos tm '+
' where '+
'  tm.fecha BETWEEN '+#39+trim(fe)+#39+' and  '+#39+trim(fe1)+#39;
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
      ' from tmovimientos tm ,tclientes tc,  '+
' TIPOMOVIMIENTOS T  '+
' where '+
'  tm.idcliente=tc.idcliente '+
' and tm.tipomovimiento=t.idtipo '+
' and tm.fecha BETWEEN '+#39+trim(fe)+#39+' and  '+#39+trim(fe1)+#39+
' ORDER BY tm.idmovimiento asc');
self.FDQuery1.Open;

end;

procedure Tverventas.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

end.
