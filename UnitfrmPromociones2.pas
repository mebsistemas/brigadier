unit UnitfrmPromociones2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,Unit1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPromociones = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    FUNCTION GENERACODIGOBARRAPROMCIONES:STRING;
  public
    { Public declarations }
  end;

var
  frmPromociones: TfrmPromociones;

implementation

{$R *.dfm}

uses Unit2frmCrearPromociones;

procedure TfrmPromociones.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmPromociones.BitBtn2Click(Sender: TObject);
begin

frmCrearPromociones.Edit1.Text:=DATETOSTR(DATE);
frmCrearPromociones.Edit2.TEXT:=GENERACODIGOBARRAPROMCIONES;
frmCrearPromociones.Edit3.Clear;
frmCrearPromociones.Edit4.Clear;
frmCrearPromociones.Edit5.Clear;
frmCrearPromociones.ComboBox1.ItemIndex:=1;
frmCrearPromociones.RxMemoryData1.CLOSE;
frmCrearPromociones.RxMemoryData1.Open;
frmCrearPromociones.OP:='N';
frmCrearPromociones.BitBtn2.Caption:='CREAR';
frmCrearPromociones.Caption:='CREAR PROMOCION';
frmCrearPromociones.showmodal;
frmPromociones.FDQuery1.Close;
frmPromociones.FDQuery1.SQL.Clear;
frmPromociones.FDQuery1.SQL.Add('SELECT IDPROMOCION, CODIGO,FECHA,NOMBRE,ACTIVA,PRECIO,STOCK FROM TPROMOCIONES ORDER BY NOMBRE ASC');
frmPromociones.FDQuery1.Open;
end;

procedure TfrmPromociones.BitBtn3Click(Sender: TObject);
begin
frmCrearPromociones.Edit1.Text:=TRIM(SELF.DataSource1.DataSet.FieldByName('FECHA').AsString);
frmCrearPromociones.Edit2.TEXT:=TRIM(SELF.DataSource1.DataSet.FieldByName('CODIGO').AsString);
frmCrearPromociones.Edit3.TEXT:=TRIM(SELF.DataSource1.DataSet.FieldByName('NOMBRE').AsString);
frmCrearPromociones.Edit4.TEXT:=TRIM(SELF.DataSource1.DataSet.FieldByName('PRECIO').AsString);
frmCrearPromociones.Edit5.TEXT:=TRIM(SELF.DataSource1.DataSet.FieldByName('STOCK').AsString);
if TRIM(SELF.DataSource1.DataSet.FieldByName('ACTIVA').AsString)='S' then
frmCrearPromociones.ComboBox1.ItemIndex:=0
ELSE
frmCrearPromociones.ComboBox1.ItemIndex:=1;

frmCrearPromociones.RxMemoryData1.CLOSE;
frmCrearPromociones.RxMemoryData1.Open;
frmCrearPromociones.OP:='M';
frmCrearPromociones.Edit6.Text:=INTTOSTR(SELF.DataSource1.DataSet.FieldByName('IDPROMOCION').ASINTEGER);
SELF.FDQuery3.Close;
SELF.FDQuery3.SQL.Clear;
SELF.FDQuery3.SQL.Add('SELECT * FROM TDETALLES_PROMOCIONES WHERE IDPROMOCION='+INTTOSTR(SELF.DataSource1.DataSet.FieldByName('IDPROMOCION').ASINTEGER));
SELF.FDQuery3.Open;
WHILE NOT SELF.FDQuery3.Eof DO
BEGIN

    frmCrearPromociones.RxMemoryData1.Append;
    frmCrearPromociones.RxMemoryData1IDARTICULO.Value:=FDQuery3.FieldByName('IDARTICULO').AsInteger;
    frmCrearPromociones.RxMemoryData1CODIGOBARRA.Value:=TRIM(FDQuery3.FieldByName('CODIGOBARRA').AsSTRING);
    frmCrearPromociones.RxMemoryData1DESCRIPCION.Value:=TRIM(FDQuery3.FieldByName('DESCRIPCION').AsSTRING);
    frmCrearPromociones.RxMemoryData1MARCA.Value:=TRIM(FDQuery3.FieldByName('MARCA').AsSTRING);
    frmCrearPromociones.RxMemoryData1CANTIDAD.Value:=TRIM(FDQuery3.FieldByName('CANTIDAD').AsSTRING);


    frmCrearPromociones.RxMemoryData1.Post;
    FDQuery3.Next;
END;
 frmCrearPromociones.BitBtn2.Caption:='MODIFICAR';
frmCrearPromociones.Caption:='MODIFICAR PROMOCION';
frmCrearPromociones.showmodal;
frmPromociones.FDQuery1.Close;
frmPromociones.FDQuery1.SQL.Clear;
frmPromociones.FDQuery1.SQL.Add('SELECT IDPROMOCION, CODIGO,FECHA,NOMBRE,ACTIVA,PRECIO,STOCK FROM TPROMOCIONES ORDER BY NOMBRE ASC');
frmPromociones.FDQuery1.Open;
end;

FUNCTION TfrmPromociones.GENERACODIGOBARRAPROMCIONES:STRING;
VAR R:STRING;
BEGIN
    Randomize;
    R:='P'+INTTOSTR(Random(15000));
    SELF.FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('SELECT * FROM TPROMOCIONES WHERE CODIGO='+#39+TRIM(R)+#39);
    FDQuery2.Open;
    if FDQuery2.IsEmpty=FALSE then
      GENERACODIGOBARRAPROMCIONES
      ELSE
      RESULT:=R;

END;

end.
