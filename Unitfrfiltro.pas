unit Unitfrfiltro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons,unit1, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrfiltro = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox2: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frfiltro: Tfrfiltro;

implementation

{$R *.dfm}

procedure Tfrfiltro.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrfiltro.CheckBox1Click(Sender: TObject);
begin
if self.CheckBox1.Checked=true then
begin
    self.DBLookupComboBox1.Enabled:=true;
    self.FDQuery1.Close;
    self.FDQuery1.SQL.Clear;
    self.FDQuery1.SQL.Add('select idrubro,descripcion from trubros order by descripcion asc')  ;
    FDQuery1.Open;
end else
begin
 self.FDQuery1.Close;
    self.DBLookupComboBox1.Enabled:=false;
end;
end;

procedure Tfrfiltro.CheckBox2Click(Sender: TObject);
begin
if self.CheckBox2.Checked=true then
begin
    self.DBLookupComboBox2.Enabled:=true;
    self.FDQuery2.Close;
    self.FDQuery2.SQL.Clear;
    self.FDQuery2.SQL.Add('select idproveedor,razonsocial from tproveedores order by razonsocial asc')  ;
    FDQuery2.Open;
end else
begin
 self.FDQuery2.Close;
    self.DBLookupComboBox2.Enabled:=false;
end;
end;

procedure Tfrfiltro.FormShow(Sender: TObject);
begin
self.CheckBox1.Checked:=false;
self.CheckBox2.Checked:=falsE;
self.DBLookupComboBox1.Enabled:=false;
self.DBLookupComboBox2.Enabled:=falsE;
end;

end.
