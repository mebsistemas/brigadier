unit Unit2frmclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls,unit1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons;

type
  Tfrmclientes = class(TForm)
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmclientes: Tfrmclientes;

implementation

{$R *.dfm}

uses UnitbuscarDatosCliente;

procedure Tfrmclientes.BitBtn1Click(Sender: TObject);
begin
buscarDatosCliente.Edit1.Clear;
buscarDatosCliente.Edit2.Clear;
buscarDatosCliente.Edit3.Clear;
buscarDatosCliente.Edit4.Clear;
buscarDatosCliente.Edit5.Clear;
buscarDatosCliente.Edit7.Clear;
buscarDatosCliente.CheckBox1.Checked:=FALSe;
buscarDatosCliente.buscaDatos:=false;
buscarDatosCliente.showmodal;
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select * from tclientes order by apenom asc');
self.FDQuery1.Open;

end;

procedure Tfrmclientes.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmclientes.BitBtn3Click(Sender: TObject);
begin
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select * from tclientes   order by apenom asc');
self.FDQuery1.Open;
end;

procedure Tfrmclientes.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tfrmclientes.DBGrid1DblClick(Sender: TObject);
VAR NRO, TIPO:STRING;
begin
buscarDatosCliente.Edit1.Clear;
buscarDatosCliente.Edit2.Clear;
buscarDatosCliente.Edit3.Clear;
buscarDatosCliente.Edit4.Clear;
buscarDatosCliente.Edit5.Clear;
buscarDatosCliente.Edit7.Clear;
buscarDatosCliente.CheckBox1.Checked:=FALSe;
buscarDatosCliente.buscaDatos:=false;
NRO:=TRIM(DBGRID1.Fields[2].ASSTRING);
TIPO:=TRIM(DBGRID1.Fields[5].ASSTRING);

 if Trim(TIPO)='96' then
    buscarDatosCliente.ComboBox1.ItemIndex:=0;

 if Trim(TIPO)='80' then
    buscarDatosCliente.ComboBox1.ItemIndex:=1;

  if Trim(TIPO)='86' then
    buscarDatosCliente.ComboBox1.ItemIndex:=2;


  if Trim(TIPO)='87' then
    buscarDatosCliente.ComboBox1.ItemIndex:=3;

  if Trim(TIPO)='89' then
    buscarDatosCliente.ComboBox1.ItemIndex:=24;

  if Trim(TIPO)='90' then
    buscarDatosCliente.ComboBox1.ItemIndex:=5;

  if Trim(TIPO)='91' then
    buscarDatosCliente.ComboBox1.ItemIndex:=6;

  if Trim(TIPO)='92' then
    buscarDatosCliente.ComboBox1.ItemIndex:=7;

  if Trim(TIPO)='93' then
    buscarDatosCliente.ComboBox1.ItemIndex:=8;


  if Trim(TIPO)='95' then
    buscarDatosCliente.ComboBox1.ItemIndex:=9;


  if Trim(TIPO)='99' then
    buscarDatosCliente.ComboBox1.ItemIndex:=10;


 buscarDatosCliente.Edit1.Text:=TRIM(NRO);
buscarDatosCliente.BitBtn1Click(Sender);
buscarDatosCliente.showmodal;
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select * from tclientes order by apenom asc');
self.FDQuery1.Open;

end;

procedure Tfrmclientes.Edit1KeyPress(Sender: TObject; var Key: Char);
var busca:String;
begin
busca:='%'+trim(edit1.Text)+'%';
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select * from tclientes  where apenom like '+#39+trim(busca)+#39+' order by apenom asc');
self.FDQuery1.Open;
end;

procedure Tfrmclientes.FormShow(Sender: TObject);
begin
edit1.Clear;
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select * from tclientes order by apenom asc');
self.FDQuery1.Open;
end;

end.
