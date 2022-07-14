unit Unit2frmIngresosaCaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls,unit1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons;

type
  TfrmIngresosaCaja = class(TForm)
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;

    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIngresosaCaja: TfrmIngresosaCaja;

implementation

{$R *.dfm}

uses UnitregistarIngresosCaja2, Ufrmsalidacaja;

procedure TfrmIngresosaCaja.BitBtn1Click(Sender: TObject);

var fecha:String;
begin
   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC)+' order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;
  registarIngresosCaja.Edit1.Text:=fecha;
  registarIngresosCaja.Edit2.Clear;
  registarIngresosCaja.Edit3.Clear;
registarIngresosCaja.showmodal;
if registarIngresosCaja.ModalResult=mrok then
 begin
     form1.FDConnection1.StartTransaction;
     try
         self.FDQuery2.Close;
         FDQuery2.SQL.Clear;
         FDQuery2.SQL.Add('insert into tingresos (motivo,fecha,importe,CIERRE,PC)  '+
         ' values ('+#39+trim(registarIngresosCaja.Edit2.Text)+#39+
                      ','+#39+trim(registarIngresosCaja.Edit1.Text)+#39+
                      ','+floattostr(strtofloat(registarIngresosCaja.Edit3.Text))+
                      ',0,'+INTTOSTR(FORM1.PUESTO_PC)+')');
         FDQuery2.ExecSQL;
        form1.FDConnection1.Commit;
        Application.MessageBox( 'Registro con éxito.', 'Atención',
  MB_ICONINFORMATION );
  close;
     except
        form1.FDConnection1.Rollback;
        Application.MessageBox( 'Se profujo un error.',
                'Acceso denegado', MB_ICONSTOP );
     end;

 end;

   FDQuery1.Close;
   FDQuery1.SQL.Clear;
   FDQuery1.SQL.Add('SELECT * FROM TCAJA WHERE estado=1  AND PC='+INTTOSTR(FORM1.PUESTO_PC)+' order by idcaja desc');
   FDQuery1.Open;
   fecha:= FDQuery1.FieldByName('fecha').AsString;

FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('select * from TINGRESOS where fecha='+#39+trim(fecha)+#39+' AND CIERRE=0  AND PC='+INTTOSTR(FORM1.PUESTO_PC));
FDQuery1.Open;
end;

procedure TfrmIngresosaCaja.BitBtn2Click(Sender: TObject);
begin
close;
end;



procedure TfrmIngresosaCaja.FormShow(Sender: TObject);
VAR FECHA:STRING;
begin
  FDQuery1.Close;
   FDQuery1.SQL.Clear;
   FDQuery1.SQL.Add('SELECT * FROM TCAJA WHERE estado=1  AND PC='+INTTOSTR(FORM1.PUESTO_PC)+' order by idcaja desc');
   FDQuery1.Open;
   fecha:= FDQuery1.FieldByName('fecha').AsString;

FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('select * from TINGRESOS where fecha='+#39+trim(fecha)+#39+' AND CIERRE=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
FDQuery1.Open
end;

end.
