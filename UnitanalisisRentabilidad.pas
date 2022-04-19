unit UnitanalisisRentabilidad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,UNIT1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RxMemDS;

type
  TanalisisRentabilidad = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1ARTICULO: TStringField;
    RxMemoryData1MARCA: TStringField;
    RxMemoryData1PROVEEDOR: TStringField;
    RxMemoryData1RENTA: TStringField;
    CheckBox1: TCheckBox;
    RxMemoryData1cantidad: TStringField;
    RxMemoryData1costo: TStringField;
    RxMemoryData1venta: TStringField;
    RxMemoryData1rubro: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FUNCTION DEVUELVECOSTO(FE,FD:STRING;IDAR:LONGINT):REAL;
  end;

var
  analisisRentabilidad: TanalisisRentabilidad;

implementation

{$R *.dfm}

procedure TanalisisRentabilidad.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

FUNCTION TanalisisRentabilidad.DEVUELVECOSTO(FE,FD:STRING;IDAR:LONGINT):REAL;
VAR SQL:STRING;
BEGIN
  SQL:='SELECT * FROM  THISTORIAL_COSTO  '+
      ' WHERE IDARTICULO='+INTTOSTR(IDAR)+' AND FECHA BETWEEN '+#39+TRIM(FE)+#39+
      ' AND '+#39+TRIM(FD)+#39;

 SELF.FDQuery2.Close;
 SELF.FDQuery2.SQL.Clear;
 SELF.FDQuery2.SQL.Add(SQL);
 SELF.FDQuery2.Open;
 if FDQuery2.IsEmpty=FALSE then
BEGIN

  SQL:='SELECT SUM(COSTO)/COUNT(*) FROM  THISTORIAL_COSTO  '+
      ' WHERE IDARTICULO='+INTTOSTR(IDAR)+' AND FECHA BETWEEN '+#39+TRIM(FE)+#39+
      ' AND '+#39+TRIM(FD)+#39;

 SELF.FDQuery2.Close;
 SELF.FDQuery2.SQL.Clear;
 SELF.FDQuery2.SQL.Add(SQL);
 SELF.FDQuery2.Open;
 if SELF.FDQuery2.IsEmpty=TRUE then
   DEVUELVECOSTO:=0
   ELSE
   DEVUELVECOSTO:=FDQuery2.Fields[0].AsFloat;

END ELSE
  DEVUELVECOSTO:=0;

END;

procedure TanalisisRentabilidad.BitBtn2Click(Sender: TObject);
VAR SQL,SRENTABILIDAD:STRING;  IDART:LONGINT;    COSTO,CANTIDAD,VENTA,RENTABILIDAD,costototal:REAL;
begin
SELF.RxMemoryData1.Close;
SELF.RxMemoryData1.Open;
SQL:=' SELECT    '+
                '  A.IDARTICULO AS IDART,   A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR,   '+
                 '    SUM(TI.CANTIDAD)  AS VENDIDO, SUM(TI.PTOTAL) AS TOTALART,a.costo as acosto,M.DESCRIPCION AS MARCA  '+
                 '    FROM     TITEM_FACTURA TI   '+
                 '    INNER JOIN TMOVIMIENTOS TM ON TM.IDMOVIMIENTO = TI.IDFACTURA   '+
                 '    INNER JOIN TARTICULOS A ON A.IDARTICULO=TI.IDARTICULO  '+
                 '    LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO  '+
                 '    LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
                 '      LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA   '+
'  WHERE TM.FECHA BETWEEN '+#39+trim(datetostr(DateTimePicker1.DateTime))+#39+' AND '+#39+trim(datetostr(DateTimePicker2.DateTime))+#39+
' GROUP BY A.DESCRIPCION HAVING SUM(TI.CANTIDAD) > 0';

 SELF.FDQUERY1.Close;
 FDQUERY1.SQL.Clear;
 FDQUERY1.SQL.Add(SQL);
 FDQUERY1.Open;
 while NOT FDQUERY1.Eof do
 BEGIN
 COSTO:=0;
 CANTIDAD:=0;
 VENTA:=0;
 RENTABILIDAD:=0;
 costototal:=0;

     IDART:=FDQUERY1.FieldByName('IDART').AsInteger;
     CANTIDAD:=FDQUERY1.FieldByName('VENDIDO').ASFLOAT;
     VENTA:=FDQUERY1.FieldByName('TOTALART').ASFLOAT;
     if self.CheckBox1.Checked=true then
        COSTO:=DEVUELVECOSTO(trim(datetostr(DateTimePicker1.DateTime)),trim(datetostr(DateTimePicker2.DateTime)),IDART)
       else
       costo:=FDQUERY1.FieldByName('acosto').ASFLOAT;

       costototal:=costo;

     COSTO:=COSTO*CANTIDAD;
     if COSTO >0 then
     BEGIN
     RENTABILIDAD:=(VENTA-COSTO)/COSTO;
     RENTABILIDAD:=RENTABILIDAD *100;
      END ELSE
      RENTABILIDAD:=100;

      SRENTABILIDAD:=FormatFloat('##0.00',RENTABILIDAD)+'%';

      SELF.RxMemoryData1.Append;
      SELF.RxMemoryData1ARTICULO.Value:=TRIM(FDQUERY1.FieldByName('ARTICULOS').ASSTRING);
      SELF.RxMemoryData1RENTA.Value:=TRIM(SRENTABILIDAD);
       self.RxMemoryData1MARCA.Value:=TRIM(FDQUERY1.FieldByName('MARCA').ASSTRING);
       self.RxMemoryData1PROVEEDOR.Value:=TRIM(FDQUERY1.FieldByName('PROVEEDOR').ASSTRING);
       self.RxMemoryData1cantidad.Value:=floattostr(CANTIDAD);
       self.RxMemoryData1venta.Value:=floattostr(VENTA);
       self.RxMemoryData1costo.Value:=floattostr(COSTO);
       self.RxMemoryData1rubro.Value:=TRIM(FDQUERY1.FieldByName('rubro').ASSTRING);
      SELF.RxMemoryData1.Post;

    FDQUERY1.Next;
 END;


end;

procedure TanalisisRentabilidad.FormShow(Sender: TObject);
begin
SELF.DateTimePicker1.DateTime:=NOW;
 SELF.DateTimePicker2.DateTime:=NOW;
 self.CheckBox1.Checked:=false;
end;

end.
