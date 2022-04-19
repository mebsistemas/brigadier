unit Unit2FRMINFOPAGOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids,unit1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFRMINFOPAGOS = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    BitBtn4: TBitBtn;
    FDQuery1: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMINFOPAGOS: TFRMINFOPAGOS;

implementation

{$R *.dfm}

procedure TFRMINFOPAGOS.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFRMINFOPAGOS.BitBtn4Click(Sender: TObject);
var idm,idcc:longint; total:real;
begin
if fdquery1.RecordCount=0 then
    exit;

  if Application.MessageBox( '¿Desea continuar con la eliminación del pago?', 'Eliminar Pago',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  begin
idm:=self.DataSource1.DataSet.FieldByName('idm').AsInteger;
idcc:=self.DataSource1.DataSet.FieldByName('tpidcc').AsInteger;
total:=self.DataSource1.DataSet.FieldByName('Total').asfloat;

form1.FDConnection1.StartTransaction ;
try
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('update tmovimientos set pago=pago -'+floattostr(total)+' where idmovimiento='+inttostr(idm));
  FDQuery1.ExecSQL;

  self.FDQuery1.Close;
  self.FDQuery1.SQL.Clear;
  self.FDQuery1.SQL.Add('delete from TPAGOSCUENTACORRIENTES where idcc='+inttostr(idcc)+' and idmovimiento='+inttostr(idm));
  self.FDQuery1.ExecSQL;
  form1.FDConnection1.commit;
except
      on E : Exception do
      begin
        form1.FDConnection1.Rollback;
        ShowMessage(E.ClassName+' error : '+E.Message);
      end;
end;

close;
end;

end;

end.
