unit Ufrmsalidacaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrmsalidacaja = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsalidacaja: Tfrmsalidacaja;

implementation

{$R *.dfm}

uses Unit1, UnifrmRegistrarSalida;

procedure Tfrmsalidacaja.BitBtn1Click(Sender: TObject);
var fecha:String;
begin
  FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;
   if trim(fecha)='' then
   begin
     showmessage('NO SE ENCONTRO CAJA ABIERTA');
     EXIT;
   end;
frmRegistrarSalida.Edit1.Text:=fecha;
frmRegistrarSalida.Edit2.Clear;
frmRegistrarSalida.Edit3.Clear;
frmRegistrarSalida.Edit4.Clear;
frmRegistrarSalida.RichEdit1.Clear;

frmRegistrarSalida.showmodal;
end;

procedure Tfrmsalidacaja.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmsalidacaja.DBGrid1DblClick(Sender: TObject);
var fecha:string;
begin
if Application.MessageBox( '¿Desea eliminar la salida de caja ?', 'Eliminar Salida',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  begin
form1.FDConnection1.StartTransaction;
try
frmsalidacaja.FDQuery2.Close;
frmsalidacaja.FDQuery2.SQL.Clear;
frmsalidacaja.FDQuery2.SQL.Add('delete from tsalidas where idsalida='+inttostr(dbgrid1.Fields[0].asinteger));
frmsalidacaja.FDQuery2.ExecSQL;

form1.FDConnection1.Commit;
showmessage('Se ha eliminado correctamente');
except
   on E: Exception do
   begin
      ShowMessage (E.ClassName + 'error generado, con mensaje:' + E.Message);
   form1.FDConnection1.Rollback;
   end;
end;

   frmsalidacaja.FDQuery1.Close;
   frmsalidacaja.FDQuery1.SQL.Clear;
   frmsalidacaja.FDQuery1.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   frmsalidacaja.FDQuery1.Open;
   fecha:= frmsalidacaja.FDQuery1.FieldByName('fecha').AsString;

 frmsalidacaja.FDQuery1.Close;
 frmsalidacaja.FDQuery1.SQL.Clear;
 frmsalidacaja.FDQuery1.SQL.Add('select * from tsalidas where fecha='+#39+trim(fecha)+#39);
 frmsalidacaja.FDQuery1.Open
  end;
end;

procedure Tfrmsalidacaja.FormShow(Sender: TObject);
var fecha:string;
begin
   FDQuery1.Close;
   FDQuery1.SQL.Clear;
   FDQuery1.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery1.Open;
   fecha:= FDQuery1.FieldByName('fecha').AsString;

 self.FDQuery1.Close;
 FDQuery1.SQL.Clear;
 FDQuery1.SQL.Add('select * from tsalidas where fecha='+#39+trim(fecha)+#39+' AND CIERRE=0');
 FDQuery1.Open;
end;

end.
