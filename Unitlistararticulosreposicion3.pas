unit Unitlistararticulosreposicion3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,UNIT1;

type
  Tlistararticulosreposicion = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    FDQuery3: TFDQuery;
    DataSource3: TDataSource;
    BitBtn4: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listararticulosreposicion: Tlistararticulosreposicion;

implementation

{$R *.dfm}

procedure Tlistararticulosreposicion.BitBtn1Click(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT '+
' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR, '+
' A.STOCK  AS S ,A.STOCKALERTA SA , M.DESCRIPCION AS MARCA'+
' FROM    TARTICULOS a  '+
' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO   '+
' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
 ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
' WHERE A.STOCK <=A.STOCKALERTA  AND A.IDRUBRO='+INTTOSTR(SELF.DBLookupComboBox1.KeyValue)+
' ORDER BY A.DESCRIPCION   ASC');
SELF.FDQUERY1.OPEN;
end;

procedure Tlistararticulosreposicion.BitBtn2Click(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT '+
' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR, '+
' A.STOCK  AS S ,A.STOCKALERTA SA, M.DESCRIPCION AS MARCA '+
' FROM    TARTICULOS a  '+
' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO   '+
' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
 ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
' WHERE A.STOCK <=A.STOCKALERTA  AND A.IDPROVEEDOR='+INTTOSTR(SELF.DBLookupComboBox2.KeyValue)+
' ORDER BY A.DESCRIPCION   ASC');
SELF.FDQUERY1.OPEN;
end;

procedure Tlistararticulosreposicion.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Tlistararticulosreposicion.BitBtn4Click(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT '+
' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR, '+
' A.STOCK  AS S ,A.STOCKALERTA SA, M.DESCRIPCION AS MARCA '+
' FROM    TARTICULOS a  '+
' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO   '+
' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
 ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
' WHERE A.STOCK <=A.STOCKALERTA   '+
' ORDER BY A.DESCRIPCION   ASC');
SELF.FDQUERY1.OPEN;
end;

procedure Tlistararticulosreposicion.FormShow(Sender: TObject);
begin

 self.FDQuery2.Close;
    self.FDQuery2.SQL.Clear;
    self.FDQuery2.SQL.Add('select idproveedor,razonsocial from tproveedores order by razonsocial asc')  ;
    FDQuery2.Open;

     self.FDQuery3.Close;
    self.FDQuery3.SQL.Clear;
    self.FDQuery3.SQL.Add('select idrubro,descripcion from trubros order by descripcion asc')  ;
    FDQuery3.Open;

SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT '+
' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR, '+
' A.STOCK  AS S ,A.STOCKALERTA SA, M.DESCRIPCION AS MARCA '+
' FROM    TARTICULOS a  '+
' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO   '+
' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
 ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
' WHERE A.STOCK <=A.STOCKALERTA   '+
' ORDER BY A.DESCRIPCION   ASC');
SELF.FDQUERY1.OPEN;
end;

end.
