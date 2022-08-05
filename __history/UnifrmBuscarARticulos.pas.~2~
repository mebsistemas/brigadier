unit UnifrmBuscarARticulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TfrmBuscarARticulos = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarARticulos: TfrmBuscarARticulos;

implementation

{$R *.dfm}

uses Unit1;

procedure TfrmBuscarARticulos.BitBtn1Click(Sender: TObject);
begin
MODALRESULT:=MRCANCEL;
end;

procedure TfrmBuscarARticulos.DBGrid1DblClick(Sender: TObject);
begin
ModalResult:=MROK;

end;

procedure TfrmBuscarARticulos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
BEGIN
  FORM1.Edit1.Text:=TRIM(DBGRID1.Fields[0].ASSTRING);
  //FORM1.SpeedButton4Click(Sender);
    FORM1.Edit1.SetFocus;
  CLOSE;
END;
end;

procedure TfrmBuscarARticulos.Edit1KeyPress(Sender: TObject; var Key: Char);
var b:string;
begin
if key=#27  then
 EDIT1.SetFocus;

if KEY=#13 then
DBGRID1.SetFocus;

b:=trim(edit1.Text)+'%';
form1.FDQuery2.Close;
form1.FDQuery2.sql.Clear;
form1.FDQuery2.SQL.Add('SELECT   a.codigobarra as CODIGOBARRA,a.precioventa as PRECIOVENTA,'+
                   '   A.DESCRIPCION AS DESCRIPCION,   '+
                   '  M.DESCRIPCION AS MARCA  '+
                   '   FROM  TARTICULOS A   '+
                   '   LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA  '+
                  '   WHERE  A.descripcion  like '+#39+trim(b)+#39);
form1.FDQuery2.open;
self.DataSource1.DataSet:=form1.FDQuery2;

end;

procedure TfrmBuscarARticulos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27  then
close;
end;

procedure TfrmBuscarARticulos.FormShow(Sender: TObject);
begin
edit1.SetFocus;
FORM1.FDQuery2.Close;
end;

end.
