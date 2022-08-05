unit Unit2frmCrearPromociones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons,Unit1, RxMemDS, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCrearPromociones = class(TForm)
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
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1IDARTICULO: TIntegerField;
    RxMemoryData1CODIGOBARRA: TStringField;
    RxMemoryData1DESCRIPCION: TStringField;
    RxMemoryData1MARCA: TStringField;
    RxMemoryData1CANTIDAD: TStringField;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    Label6: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    OP:STRING;
  end;

var
  frmCrearPromociones: TfrmCrearPromociones;

implementation

{$R *.dfm}

uses UnifrmBuscarARticulos, Unit2frmPideCantidadPromocion;

procedure TfrmCrearPromociones.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmCrearPromociones.BitBtn2Click(Sender: TObject);
VAR IDPROMOCION:LONGINT;
begin
  if TRIM(EDIT1.Text)='' then
  BEGIN
    SHOWMESSAGE('LA FECHA NO PUEDE SER VACIO');
  EXIT;
  END;

    if TRIM(EDIT2.Text)='' then
  BEGIN
    SHOWMESSAGE('EL CODIGO DE BARRA NO PUEDE SER VACIO');
  EXIT;
  END;

  if TRIM(EDIT3.Text)='' then
  BEGIN
    SHOWMESSAGE('EL NOMBRE DE BARRA  NO PUEDE SER VACIO');
  EXIT;
  END;

  if TRIM(EDIT4.Text)='' then
  BEGIN
    SHOWMESSAGE('EL PRECIO NO PUEDE SER VACIO');
  EXIT;
  END;

   if TRIM(EDIT5.Text)='' then
  BEGIN
    SHOWMESSAGE('EL STOCK NO PUEDE SER VACIO');
  EXIT;
  END;

  if SELF.RxMemoryData1.RecordCount=0 then
    BEGIN
    SHOWMESSAGE('NO HAY ARTICULOS CARGADOS PARA LA PROMOCION');
  EXIT;
  END ;


FORM1.FDConnection1.StartTransaction;
TRY
 if OP='N' then
 BEGIN
   SELF.FDQuery1.Close;
   SELF.FDQuery1.SQL.Clear;
   SELF.FDQuery1.SQL.Add('SELECT MAX(IDPROMOCION) AS M FROM TPROMOCIONES ');
   SELF.FDQuery1.Open ;
   if TRIM(FDQuery1.FieldByName('M').AsSTRING)='' then
     IDPROMOCION:=1
    ELSE
     IDPROMOCION:=SELF.FDQuery1.FieldByName('M').AsInteger + 1;

   SELF.FDQuery1.Close;
   SELF.FDQuery1.SQL.Clear;
   SELF.FDQuery1.SQL.Add('INSERT INTO TPROMOCIONES (IDPROMOCION,FECHA,CODIGO,NOMBRE,ACTIVA,PRECIO,STOCK) '+
                         ' VALUES ('+INTTOSTR(IDPROMOCION)+','+#39+TRIM(EDIT1.Text)+#39+','+#39+TRIM(EDIT2.Text)+#39+
                         ','+#39+TRIM(EDIT3.Text)+#39+','+#39+TRIM(COPY(COMBOBOX1.Text,1,1))+#39+','+#39+TRIM(EDIT4.Text)+#39+','+FLOATTOSTR(STRTOFLOAT(EDIT5.Text))+')');
   SELF.FDQuery1.ExecSQL;

 END ELSE BEGIN
      IDPROMOCION:=STRTOINT(EDIT6.Text);

   SELF.FDQuery1.Close;
   SELF.FDQuery1.SQL.Clear;
   SELF.FDQuery1.SQL.Add('UPDATE TPROMOCIONES SET FECHA='+#39+TRIM(EDIT1.Text)+#39+
                                               ', CODIGO='+#39+TRIM(EDIT2.Text)+#39+
                                               ', NOMBRE='+#39+TRIM(EDIT3.Text)+#39+
                                               ', ACTIVA='+#39+TRIM(COPY(COMBOBOX1.Text,1,1))+#39+
                                               ', PRECIO='+#39+TRIM(EDIT4.Text)+#39+
                                               ', STOCK='+FLOATTOSTR(STRTOFLOAT(EDIT5.Text))+
                                               ' WHERE  IDPROMOCION='+INTTOSTR(IDPROMOCION));

   SELF.FDQuery1.ExecSQL;


  SELF.FDQuery2.Close;
  SELF.FDQuery2.SQL.Clear;
  SELF.FDQuery2.SQL.Add('DELETE FROM TDETALLES_PROMOCIONES  WHERE IDPROMOCION='+INTTOSTR(IDPROMOCION));
  SELF.FDQuery2.ExecSQL;

 END;


SELF.RxMemoryData1.Open;
SELF.RxMemoryData1.First;
while NOT SELF.RxMemoryData1.Eof do
BEGIN


  SELF.FDQuery2.Close;
  SELF.FDQuery2.SQL.Clear;
  SELF.FDQuery2.SQL.Add('INSERT INTO TDETALLES_PROMOCIONES (IDARTICULO,DESCRIPCION,MARCA,CODIGOBARRA,IDPROMOCION,CANTIDAD) '+
                           ' VALUES ('+INTTOSTR(SELF.RxMemoryData1IDARTICULO.Value)+','+#39+TRIM(SELF.RxMemoryData1DESCRIPCION.Value)+#39+
                           ','+#39+TRIM(SELF.RxMemoryData1MARCA.Value)+#39+','+#39+TRIM(SELF.RxMemoryData1CODIGOBARRA.Value)+#39+
                           ','+INTTOSTR(IDPROMOCION)+','+FLOATTOSTR(STRTOFLOAT(SELF.RxMemoryData1CANTIDAD.Value))+')');
  SELF.FDQuery2.ExecSQL;


   SELF.RxMemoryData1.Next;
END;


FORM1.FDConnection1.Commit  ;
SHOWMESSAGE('SE HA CREADO LA PROMOCION CORRECTAMENTE');
CLOSE;
EXCEPT
   FORM1.FDConnection1.Rollback;
   SHOWMESSAGE('SE PRODUJO UN ERROR. ');
END;

end;

procedure TfrmCrearPromociones.BitBtn3Click(Sender: TObject);
VAR aidarticulo:LONGINT;
   CBARRA,DESCRIPCION,MARCA:STRING;
begin
frmBuscarARticulos.Edit1.Clear;
frmBuscarARticulos.showmodal;
if frmBuscarARticulos.ModalResult=MROK then
BEGIN
 aidarticulo:=frmBuscarARticulos.DataSource1.DataSet.FieldByName('aidarticulo').AsInteger;
 DESCRIPCION:=TRIM(frmBuscarARticulos.DataSource1.DataSet.FieldByName('DESCRIPCION').ASSTRING);
 CBARRA:=TRIM(frmBuscarARticulos.DataSource1.DataSet.FieldByName('CODIGOBARRA').ASSTRING);
 MARCA:=TRIM(frmBuscarARticulos.DataSource1.DataSet.FieldByName('MARCA').ASSTRING) ;
 SELF.RxMemoryData1.Append;
 SELF.RxMemoryData1IDARTICULO.Value:=aidarticulo;
 SELF.RxMemoryData1CODIGOBARRA.Value:=TRIM(CBARRA);
 SELF.RxMemoryData1DESCRIPCION.Value:=TRIM(DESCRIPCION);
 SELF.RxMemoryData1MARCA.Value:=TRIM(MARCA);
 frmPideCantidadPromocion.EDIT1.Clear;

 frmPideCantidadPromocion.showmodal;
 SELF.RxMemoryData1CANTIDAD.Value:=TRIM(frmPideCantidadPromocion.Edit1.Text);
 SELF.RxMemoryData1.Post;
END;
end;

procedure TfrmCrearPromociones.DBGrid1DblClick(Sender: TObject);
begin
SELF.RxMemoryData1.Delete;
end;

procedure TfrmCrearPromociones.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if KEY IN ['0','1','2','3','4','5','6','7','8','9','.',#13,#8] then
EDIT4.ReadOnly:=FALSE
ELSE
EDIT4.ReadOnly:=TRUE;


end;

procedure TfrmCrearPromociones.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if KEY IN ['0','1','2','3','4','5','6','7','8','9',#13,#8] then
EDIT5.ReadOnly:=FALSE
ELSE
EDIT5.ReadOnly:=TRUE;


end;

end.
