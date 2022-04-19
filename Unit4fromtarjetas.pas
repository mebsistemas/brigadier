unit Unit4fromtarjetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,unit1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfromtarjetas = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    FDQuery2: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FUNCTION  CARGAR:BOOLEAN;
  end;

var
  fromtarjetas: Tfromtarjetas;

implementation

{$R *.dfm}

uses UnFRMAGREGrtarjetait4;

procedure Tfromtarjetas.BitBtn1Click(Sender: TObject);
VAR TIPO:STRING;
begin
FRMAGREGrtarjeta.Edit1.Clear;
FRMAGREGrtarjeta.ComboBox1.ItemIndex:=-1;
FRMAGREGrtarjeta.OP:='N';
FRMAGREGrtarjeta.showmodal;
if FRMAGREGrtarjeta.ModalResult=MROK then
BEGIN
  FORM1.FDConnection1.StartTransaction;
  TRY
     TIPO:=TRIM(COPY(TRIM(FRMAGREGrtarjeta.ComboBox1.Text),1,1));
     SELF.FDQuery2.Close;
     SELF.FDQuery2.SQL.CLEAR;
     SELF.FDQuery2.SQL.Add('INSERT INTO TTARJETAS (NOMBRE,TIPO)  '+
       'VALUES ('+#39+TRIM(FRMAGREGrtarjeta.EDIT1.TEXT)+#39+','+#39+TRIM(TIPO)+#39+')');
     FDQUERY2.ExecSQL;

    FORM1.FDConnection1.Commit;
    SHOWMESSAGE('SE HA GUARDADO CORRECTAMENTE');
  EXCEPT
   on E : Exception do
    BEGIN ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
     FORM1.FDConnection1.Close;
    END;
  END;

END;
  CARGAR;
end;

procedure Tfromtarjetas.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure Tfromtarjetas.BitBtn3Click(Sender: TObject);
VAR ID:LONGINT;
TIPO:STRING;
begin
FRMAGREGrtarjeta.Edit1.TEXT:=TRIM(DBGRID1.Fields[1].ASSTRING);
FRMAGREGrtarjeta.Edit2.TEXT:=TRIM(DBGRID1.Fields[0].ASSTRING);
if TRIM(DBGRID1.Fields[2].ASSTRING)='D' then
FRMAGREGrtarjeta.ComboBox1.ItemIndex:=0;
if TRIM(DBGRID1.Fields[2].ASSTRING)='C' then
FRMAGREGrtarjeta.ComboBox1.ItemIndex:=1;
FRMAGREGrtarjeta.OP:='M';
FRMAGREGrtarjeta.showmodal;
if FRMAGREGrtarjeta.ModalResult=MROK then
BEGIN
  FORM1.FDConnection1.StartTransaction;
  TRY
     ID:=STRTOINT(FRMAGREGrtarjeta.EDIT2.TEXT);
     TIPO:=TRIM(COPY(TRIM(FRMAGREGrtarjeta.ComboBox1.Text),1,1));
     SELF.FDQuery2.Close;
     SELF.FDQuery2.SQL.CLEAR;
     SELF.FDQuery2.SQL.Add('UPDATE TTARJETAS SET NOMBRE='+#39+TRIM(FRMAGREGrtarjeta.EDIT1.TEXT)+#39+
     ', TIPO='+#39+TRIM(TIPO)+#39+' WHERE IDTARJETAS='+INTTOSTR(ID)) ;
     FDQUERY2.ExecSQL;

    FORM1.FDConnection1.Commit;
    SHOWMESSAGE('SE HA GUARDADO CORRECTAMENTE');
  EXCEPT
   on E : Exception do
    BEGIN ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
     FORM1.FDConnection1.Close;
    END;
  END;

END;
SELF.CARGAR;
end;

FUNCTION  Tfromtarjetas.CARGAR:BOOLEAN;
BEGIN
   SELF.FDQuery1.Close;
   SELF.FDQuery1.SQL.Clear;
   SELF.FDQuery1.SQL.Add('SELECT IDTARJETAS, NOMBRE AS DENOMINACION, TIPO FROM TTARJETAS ORDER BY NOMBRE ASC');
   SELF.FDQuery1.Open;
END;
procedure Tfromtarjetas.FormShow(Sender: TObject);
begin
CARGAR;
end;

end.
