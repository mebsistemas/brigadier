unit Unit4ABMVENCIMIENTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,UNIT1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TABMVENCIMIENTOS = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn4: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    Label2: TLabel;
    Edit1: TEdit;
    FDQuery2: TFDQuery;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ABMVENCIMIENTOS: TABMVENCIMIENTOS;

implementation

{$R *.dfm}

uses UnitFRMAGREGARVENCIMIENTOS4;

procedure TABMVENCIMIENTOS.BitBtn1Click(Sender: TObject);
begin
FRMAGREGARVENCIMIENTOS.Edit1.Clear;
FRMAGREGARVENCIMIENTOS.Edit2.Clear;
FRMAGREGARVENCIMIENTOS.Edit3.Clear;
FRMAGREGARVENCIMIENTOS.SHOWMODAL;
end;

procedure TABMVENCIMIENTOS.BitBtn2Click(Sender: TObject);
begin
CLOSe;
end;

procedure TABMVENCIMIENTOS.BitBtn3Click(Sender: TObject);
VAR IDV:LONGINT;
begin
if Application.MessageBox( PCHAR('¿Desea continuar con la eliminación del vencimiento '+trim(dbgrid1.Fields[2].asstring)+'   LOTE: '+trim(dbgrid1.Fields[3].asstring)+'  ?'), 'Eliminar',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  BEGIN
    IDV:=dbgrid1.Fields[6].ASINTEGER;
    FORM1.FDConnection1.StartTransaction;
    TRY
    SELF.FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('DELETE FROM TVENCIMIENTOS WHERE IDVENCIMIENTO='+INTTOSTR(IDV));
    FDQuery2.ExecSQL;
    FORM1.FDConnection1.Commit;
    SHOWMESSAGE('PROCESO CORRECTO');
     EXCEPT
        FORM1.FDConnection1.Rollback;
            SHOWMESSAGE('SE PRODUJO UN ERROR');
    END;
  END;
  if TRIM(EDIT1.Text)<>'' then
    BitBtn5Click(Sender)
  ELSE
  BitBtn4Click(Sender);


end;

procedure TABMVENCIMIENTOS.BitBtn4Click(Sender: TObject);
VAR FE:sTRING;
begin
FE:=DATETOSTR(DATETIMEPICKER1.DateTime);
SELF.FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT  '+
' ta.CODIGOBARRA as tacodigobarra,   '+
' ta.idarticulo as taidarticulo,  '+
' TA.DESCRIPCION as tadescripcion, '+
' tv.lote as tvlote,  '+
' tv.fechaenvasado as tvfechaenvasado,  TV.IDVENCIMIENTO AS IDVEN, '+
' tv.fechavencimiento as tvfechavencimiento   '+
' FROM TVENCIMIENTOS TV, TARTICULOS TA '+
' WHERE TV.IDARTICULO=TA.IDARTICULO    '+
' AND TV.FECHAVENCIMIENTO='+#39+trim(fe)+#39+
' order by ta.descripcion asc');
FDQuery1.Open;
end;

procedure TABMVENCIMIENTOS.BitBtn5Click(Sender: TObject);
VAR BUSCA:STRING;
begin

BUSCA:=TRIM(EDIT1.Text);
    if COPY(BUSCA,1,1)=TRIM(FORM1.TCONFI.GET_FDIGITOCODIGOBARRA) then
         BEGIN
            BUSCA:=COPY(BUSCA,2,STRTOINT(TRIM(FORM1.TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)));

         END;

SELF.FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT  '+
' ta.CODIGOBARRA as tacodigobarra,   '+
' ta.idarticulo as taidarticulo,  '+
' TA.DESCRIPCION as tadescripcion, '+
' tv.lote as tvlote,  '+
' tv.fechaenvasado as tvfechaenvasado,  TV.IDVENCIMIENTO AS IDVEN, '+
' tv.fechavencimiento as tvfechavencimiento   '+
' FROM TVENCIMIENTOS TV, TARTICULOS TA '+
' WHERE TV.IDARTICULO=TA.IDARTICULO    '+
' AND ta.CODIGOBARRA='+#39+trim(BUSCA)+#39+
' order by ta.descripcion asc');
FDQuery1.Open;


end;

PRocedure TABMVENCIMIENTOS.Edit1KeyPress(Sender: TObject; var Key: Char);
VAR BUSCA:STRING;
begin
if KEY=#13  then
BEGIN
BUSCA:=TRIM(EDIT1.Text);
    if COPY(BUSCA,1,1)=TRIM(FORM1.TCONFI.GET_FDIGITOCODIGOBARRA) then
         BEGIN
            BUSCA:=COPY(BUSCA,2,STRTOINT(TRIM(FORM1.TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)));

         END;

SELF.FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT  '+
' ta.CODIGOBARRA as tacodigobarra,   '+
' ta.idarticulo as taidarticulo,  '+
' TA.DESCRIPCION as tadescripcion, '+
' tv.lote as tvlote,  '+
' tv.fechaenvasado as tvfechaenvasado,  TV.IDVENCIMIENTO AS IDVEN, '+
' tv.fechavencimiento as tvfechavencimiento   '+
' FROM TVENCIMIENTOS TV, TARTICULOS TA '+
' WHERE TV.IDARTICULO=TA.IDARTICULO    '+
' AND ta.CODIGOBARRA='+#39+trim(BUSCA)+#39+
' order by ta.descripcion asc');
FDQuery1.Open;
end;
end;

procedure TABMVENCIMIENTOS.FormShow(Sender: TObject);
begin
DATETIMEPICKER1.DateTime:=NOW;
EDIT1.Clear;
BitBtn4Click(Sender);
end;

end.
