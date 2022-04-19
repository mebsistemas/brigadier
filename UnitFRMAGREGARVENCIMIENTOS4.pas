unit UnitFRMAGREGARVENCIMIENTOS4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,unit1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFRMAGREGARVENCIMIENTOS = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMAGREGARVENCIMIENTOS: TFRMAGREGARVENCIMIENTOS;

implementation

{$R *.dfm}

procedure TFRMAGREGARVENCIMIENTOS.BitBtn1Click(Sender: TObject);
var idarti:longint;
posi:longint;
begin
if TRIM(EDIT3.Text)='' then
  BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL ARTICULO');
  EXIT;
  END;

  if TRIM(EDIT2.Text)='' then
  BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL LOTE');
  EXIT;
  END;
posi:=pos('-',trim(edit3.Text));

idarti:=strtoint(trim(copy(trim(edit3.Text),1,posi-1)));

form1.FDConnection1.StartTransaction;
try
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('insert into tvencimientos (idarticulo,lote,fechaenvasado,fechavencimiento) '+
' values ('+inttostr(idarti)+','+#39+trim(edit1.Text)+#39+
','+#39+trim(datetostr(datetimepicker1.DateTime))+#39+','+#39+trim(datetostr(datetimepicker2.DateTime))+#39+')');
self.FDQuery1.ExecSQL;
 form1.FDConnection1.Commit;
 showmesSage('PROCESO CORRECTO');
 CLOSE;
except
 form1.FDConnection1.Rollback;
  showmesSage('ERROR AL REGISTRAR EL VENCIMIENTO');
end;

end;

procedure TFRMAGREGARVENCIMIENTOS.BitBtn2Click(Sender: TObject);
begin
CLOSe;
end;

procedure TFRMAGREGARVENCIMIENTOS.Edit2KeyPress(Sender: TObject; var Key: Char);
VAR BUSCA:STRING;
begin
if KEY=#13  then
BEGIN
BUSCA:=TRIM(EDIT2.Text);
    if COPY(BUSCA,1,1)=TRIM(FORM1.TCONFI.GET_FDIGITOCODIGOBARRA) then
         BEGIN
            BUSCA:=COPY(BUSCA,2,STRTOINT(TRIM(FORM1.TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)));

         END;

SELF.FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT  '+
' ta.idarticulo as taidarticulo,  '+
' TA.DESCRIPCION as tadescripcion '+
' FROM  TARTICULOS TA '+
' WHERE '+
'  ta.CODIGOBARRA='+#39+trim(BUSCA)+#39);
FDQuery1.Open;
if FDQUERY1.IsEmpty=FALSE then
EDIT3.Text:=TRIM(FDQUERY1.Fields[0].AsString)+'-'+TRIM(FDQUERY1.Fields[1].AsString);
end;

end;

procedure TFRMAGREGARVENCIMIENTOS.FormShow(Sender: TObject);
begin
edit2.SetFocus;
end;

end.
