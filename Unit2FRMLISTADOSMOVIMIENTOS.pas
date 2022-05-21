unit Unit2FRMLISTADOSMOVIMIENTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls,UNIT1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Menus, Vcl.Buttons;

type
  TFRMLISTADOSMOVIMIENTOS = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    DateTimePicker1: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    REIMPRIMIR1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    FDQuery2: TFDQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure REIMPRIMIR1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMLISTADOSMOVIMIENTOS: TFRMLISTADOSMOVIMIENTOS;

implementation

{$R *.dfm}

uses Uterminar, UnitFRMMENSAJE;

procedure TFRMLISTADOSMOVIMIENTOS.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TFRMLISTADOSMOVIMIENTOS.BitBtn2Click(Sender: TObject);
var fecha,sql:String;
begin
fecha:=DATETOSTR(self.DateTimePicker1.DateTime);
 SQL:='select tm.IDMOVIMIENTO AS TMDIMOVIMIENTO, '+
 ' TM.FECHA AS  TMFECHA, TC.apenom  AS TCCLIENTE, tm.TOTAL AS TMTOTAL,   '+
' case tm.TIPOMOVIMIENTO  '+
 '  when 0 then ''TICKET''    '+
 '  when 1 then ''FACTURA A'' '+
 '  When 2 then ''FACTURA B'' '+
 '  When 3 then ''FACTURA C'' '+
 '  When 4 then ''NOTA CREDITO A''   '+
 '  When 5 then ''NOTA CREDITO B''  '+
 '  When 6 then ''NOTA CREDITO C''  '+
  '  When 7 then ''NC TICKET''  '+
 '  ELSE  ''ERROR''  '+
 '  END AS FACTU,  '+
 '  TM.NROFACTURA AS NRO ,TF.DESCRIPCION  AS FORMAPAGO, tm.TIPOMOVIMIENTO as tmTIPOMOVIMIENTO  '+
 'FROM tmovimientos  tm , tclientes tc , TFORMAPAGO TF  '+
' where tm.IDCLIENTE=tc.IDCLIENTE  '+
' AND TM.IDFORMAPAGO=TF.IDFORMAPAGO  '+
 ' AND TM.fecha='+#39+trim(fecha)+#39+
'order by tm.IDMOVIMIENTO DESC';

 SELF.FDQuery1.Close;
 SELF.FDQuery1.SQL.Clear;
 SELF.FDQuery1.SQL.Add(SQL);
 SELF.FDQuery1.Open;


end;

procedure TFRMLISTADOSMOVIMIENTOS.BitBtn3Click(Sender: TObject);
   var fecha,sql:String;
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;

if trim(dbgrid1.Fields[3].AsString)<>'TICKET' then
 begin
   showmessage('SOLO SE PUEDE ELIMIANAR MOVIMIENTOS DE TIPO TICKET');
   exit;
 end;

if Application.MessageBox( pchar('�Desea eliminar  el movimiento  '+trim(dbgrid1.Fields[3].AsString)+'  nro: '+trim(dbgrid1.Fields[4].AsString)+'?'), 'Eliminar',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  begin
   form1.FDConnection1.StartTransaction;
   try
     self.FDQuery2.Close;
     self.FDQuery2.SQL.Clear;
     self.FDQuery2.SQL.Add('delete from tmovimientos where idmovimiento='+inttostr(dbgrid1.Fields[0].asinteger));
     self.FDQuery2.ExecSQL;
     form1.FDConnection1.Commit;
     showmessage('Proceso Correcto');
   except
       form1.FDConnection1.Rollback;
       showmessage('Se produjo un error al intentar eliminar el movimiento');
   end;

fecha:=DATETOSTR(self.DateTimePicker1.DateTime);
 SQL:='select tm.IDMOVIMIENTO AS TMDIMOVIMIENTO, '+
 ' TM.FECHA AS  TMFECHA, TC.apenom  AS TCCLIENTE, tm.TOTAL AS TMTOTAL,   '+
' case tm.TIPOMOVIMIENTO  '+
 '  when 0 then ''TICKET''    '+
 '  when 1 then ''FACTURA A'' '+
 '  When 2 then ''FACTURA B'' '+
 '  When 3 then ''FACTURA C'' '+
 '  When 4 then ''NOTA CREDITO A''   '+
 '  When 5 then ''NOTA CREDITO B''  '+
  '  When 6 then ''NOTA CREDITO C''  '+
  '  When 7 then ''NC TICKET''  '+
 '  ELSE  ''ERROR''  '+
 '  END AS FACTU,  '+
 '  TM.NROFACTURA AS NRO ,TF.DESCRIPCION  AS FORMAPAGO  '+
 'FROM tmovimientos  tm , tclientes tc , TFORMAPAGO TF  '+
' where tm.IDCLIENTE=tc.IDCLIENTE  '+
' AND TM.IDFORMAPAGO=TF.IDFORMAPAGO  '+
 ' AND TM.fecha='+#39+trim(fecha)+#39+
'order by tm.IDMOVIMIENTO DESC';

 SELF.FDQuery1.Close;
 SELF.FDQuery1.SQL.Clear;
 SELF.FDQuery1.SQL.Add(SQL);
 SELF.FDQuery1.Open;

  end;


end;

procedure TFRMLISTADOSMOVIMIENTOS.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFRMLISTADOSMOVIMIENTOS.FormShow(Sender: TObject);
 VAR   SQL,fecha:STRING;
 BEGIN

    FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;

 self.DateTimePicker1.DateTime:=strtodate(fecha);
 BitBtn2Click(Sender);

end;

procedure TFRMLISTADOSMOVIMIENTOS.REIMPRIMIR1Click(Sender: TObject);
begin
   FRMMENSAJE.Label1.Caption:='IMPRIMIENDO...';
   FRMMENSAJE.SHOW;
                      APPLICATION.ProcessMessages;
if (self.DataSource1.DataSet.FieldByName('tmTIPOMOVIMIENTO').AsInteger<>0) and (self.DataSource1.DataSet.FieldByName('tmTIPOMOVIMIENTO').AsInteger<>7) then
begin
    if Trim(form1.TIPOPAPEL)='80' then
       frmterminar.imprimir(DBGRID1.Fields[0].ASINTEGER,'N');
     if Trim(form1.TIPOPAPEL)='58' then
        frmterminar.imprimirFacturaFormato58(DBGRID1.Fields[0].ASINTEGER,'N');
     if Trim(form1.TIPOPAPEL)='A4' then
        SHOWMESSAGE('SIN FORMATO A4');
end
else
 begin

      if Trim(form1.TIPOPAPEL)='80' then
          frmterminar.imprimirTICKET(DBGRID1.Fields[0].ASINTEGER,'N');

      if Trim(form1.TIPOPAPEL)='A4' then
          frmterminar.imprimirTICKETA4(DBGRID1.Fields[0].ASINTEGER,'R');

       if Trim(form1.TIPOPAPEL)='58' then
           frmterminar.imprimirTICKET_58(DBGRID1.Fields[0].ASINTEGER,'N');

 end;
  FRMMENSAJE.close;

end;

end.
