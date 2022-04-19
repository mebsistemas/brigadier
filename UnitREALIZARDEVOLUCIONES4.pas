unit UnitREALIZARDEVOLUCIONES4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,UNIT1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TREALIZARDEVOLUCIONES = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    FDQuery1: TFDQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IDMOVIMIENTONC,IDVENDEDOR,IDCLIENTE:LONGINT;

  end;

var
  REALIZARDEVOLUCIONES: TREALIZARDEVOLUCIONES;

implementation

{$R *.dfm}

procedure TREALIZARDEVOLUCIONES.BitBtn1Click(Sender: TObject);
VAR POSI,TIPOMOVIMIENTO:LONGINT;
begin

posi:=pos('-',trim(ComboBox1.Text));
TIPOMOVIMIENTO:=strtoint(trim(copy(trim(ComboBox1.TEXT),0,posi-1)));
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT IDMOVIMIENTO  FROM TMOVIMIENTOS WHERE IDCLIENTE='+INTTOSTR(IDCLIENTE)+' AND TIPOMOVIMIENTO='+INTTOSTR(TIPOMOVIMIENTO)+' AND NROFACTURA='+INTTOSTR(STRTOINT(EDIT1.Text)));
SELF.FDQuery1.Open;   //FALTA FILTRAR POR VENDEDOR TVENTAS_VENDEDOR
if FDQuery1.RecordCount >0 then
BEGIN
  IDMOVIMIENTONC:=FDQuery1.FieldByName('IDMOVIMIENTO').AsInteger;
  MODALRESULT:=MROK;
END ELSE
BEGIN
   MODALRESULT:=MRNONE;
   SHOWMESSAGE('NO SE ENCONTRÓ NINGUN COMPROBANTE');
END;

end;

procedure TREALIZARDEVOLUCIONES.BitBtn2Click(Sender: TObject);
begin
IDMOVIMIENTONC:=0;
end;

procedure TREALIZARDEVOLUCIONES.FormShow(Sender: TObject);
begin
IDMOVIMIENTONC:=0;
end;

end.
