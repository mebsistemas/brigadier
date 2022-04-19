unit Unitlistarasrticulosvendod3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,unit1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tlistarasrticulosvendod = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  listarasrticulosvendod: Tlistarasrticulosvendod;

implementation

{$R *.dfm}

uses Unitfrfiltro;

procedure Tlistarasrticulosvendod.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tlistarasrticulosvendod.BitBtn2Click(Sender: TObject);
begin
 frfiltro.showmodal;
 if frfiltro.ModalResult=mrok then
 begin
     self.FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add(' SELECT   '+
                     ' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR,  '+
                     ' SUM(TI.CANTIDAD)  AS VENDIDO, M.DESCRIPCION AS MARCA '+
                     ' FROM     TITEM_FACTURA TI   '+
                     ' INNER JOIN TMOVIMIENTOS TM ON TM.IDMOVIMIENTO = TI.IDFACTURA  '+
                     ' INNER JOIN TARTICULOS A ON A.IDARTICULO=TI.IDARTICULO  '+
                     ' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO '+
                     ' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
                       ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
                     ' WHERE TM.FECHA BETWEEN '+#39+trim(datetostr(frfiltro.DateTimePicker1.DateTime))+#39+' AND '+#39+trim(datetostr(frfiltro.DateTimePicker2.DateTime))+#39);
      if frfiltro.CheckBox1.Checked=true then
        FDQuery1.SQL.Add(' and a.idrubro='+inttostr(frfiltro.DBLookupComboBox1.KeyValue));

      if frfiltro.CheckBox2.Checked=true then
        FDQuery1.SQL.Add(' and a.idproveedor='+inttostr(frfiltro.DBLookupComboBox2.KeyValue));


     FDQuery1.SQL.Add(' GROUP BY A.DESCRIPCION  '+
                     ' ORDER BY VENDIDO DESC') ;
    FDQuery1.Open;
 end;

end;

end.
