unit Unit4buscarcliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons,UNIT1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tbuscarcliente = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    esDe:string;
  end;

var
  buscarcliente: Tbuscarcliente;

implementation

{$R *.dfm}

uses UnitbuscarDatosCliente;

procedure Tbuscarcliente.BitBtn1Click(Sender: TObject);
begin
MODALRESULT:=MRCANCEL;
end;

procedure Tbuscarcliente.BitBtn2Click(Sender: TObject);
begin
buscarDatosCliente.esDe:=ESdE;
buscarDatosCliente.Edit1.Clear;
buscarDatosCliente.Edit2.Clear;
buscarDatosCliente.Edit3.Clear;
buscarDatosCliente.Edit4.Clear;
buscarDatosCliente.Edit5.Clear;
buscarDatosCliente.Edit7.Clear;
buscarDatosCliente.CheckBox1.Checked:=FALSe;
buscarDatosCliente.buscaDatos:=true;
buscarDatosCliente.showmodal;
end;

procedure Tbuscarcliente.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure Tbuscarcliente.Edit1KeyPress(Sender: TObject; var Key: Char);
VAR BUSCA:STRING;
begin
BUSCA:='%'+TRIM(EDIT1.Text)+'%';

SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('select IDCLIENTE AS ID,APENOM AS CLIENTE,TIPODOC AS DOCUMENTOCUIT, NRODOC,IVA from tclientes where  apenom like '+#39+trim(busca)+#39) ;
FDQuery1.Open;
end;

procedure Tbuscarcliente.FormShow(Sender: TObject);
begin
EDIT1.Clear;
SELF.FDQuery1.Close;
end;

end.
