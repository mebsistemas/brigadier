unit Unit4AGREGARDESCUENTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls,UNIT1, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons;

type
  TAGREGARDESCUENTOS = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox2: TCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Label2: TLabel;
    CheckBox4: TCheckBox;
    Edit2: TEdit;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    DataSource2: TDataSource;
    FDQuery2: TFDQuery;
    DataSource3: TDataSource;
    FDQuery3: TFDQuery;
    Label3: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DataSource4: TDataSource;
    FDQuery4: TFDQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox5: TCheckBox;
    FDQuery5: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AGREGARDESCUENTOS: TAGREGARDESCUENTOS;

implementation

{$R *.dfm}

procedure TAGREGARDESCUENTOS.BitBtn1Click(Sender: TObject);
Var sql,rubro,marca:String;    fp,idt,idr,idm:longint;
begin

fp:=self.DBLookupComboBox1.KeyValue;
if trim(self.DBLookupComboBox4.Text)='' then
begin
  idt:=self.DBLookupComboBox4.KeyValue;
end
else
idt:=0;

 if self.CheckBox1.Checked=true then
    begin
      idr:=self.DBLookupComboBox2.KeyValue;
      rubro:='S';
    end else begin
       idr:=0;
       rubro:='N';
    end;


SQL:='insert into tdescuentos ';
end;

procedure TAGREGARDESCUENTOS.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TAGREGARDESCUENTOS.CheckBox1Click(Sender: TObject);
begin
if self.CheckBox1.Checked=true then
  self.DBLookupComboBox2.Enabled:=true
  else
  begin
     self.DBLookupComboBox2.Enabled:=false;
     DBLookupComboBox2.KeyValue:=-1;
  end;
end;

procedure TAGREGARDESCUENTOS.CheckBox2Click(Sender: TObject);
begin
if self.CheckBox2.Checked=true then
  self.DBLookupComboBox3.Enabled:=true
  else
  begin
     self.DBLookupComboBox3.Enabled:=false;
      DBLookupComboBox3.KeyValue:=-1;
  end;
end;

procedure TAGREGARDESCUENTOS.CheckBox3Click(Sender: TObject);
begin
if self.CheckBox3.Checked=true then
  self.edit1.Enabled:=true
  else
  begin
     self.edit1.Enabled:=false;
     edit1.Clear;
  end;
end;

procedure TAGREGARDESCUENTOS.CheckBox4Click(Sender: TObject);
begin
if self.CheckBox4.Checked=true then
  self.edit2.Enabled:=true
  else
    begin
     self.edit2.Enabled:=false;
     edit2.Clear;
    end;
end;

procedure TAGREGARDESCUENTOS.DBLookupComboBox1CloseUp(Sender: TObject);
begin
if TRIM(SELF.DBLookupComboBox1.Text)<>'' then
   BEGIN
    if (DBLookupComboBox1.KeyValue=2) or (DBLookupComboBox1.KeyValue=3)  then
     begin
       label3.Visible:=true;
       self.DBLookupComboBox4.Visible:=true;
      SELF.FDQuery4.Close;
      SELF.FDQuery4.SQL.Clear;
      SELF.FDQuery4.SQL.Add('SELECT IDTARJETAS, NOMBRE FROM TTARJETAS ORDER BY NOMBRE ASC') ;
      SELF.FDQuery4.Open;
     end;
   END;
end;

procedure TAGREGARDESCUENTOS.FormShow(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT * FROM TFORMAPAGO ORDER BY DESCRIPCION ASC') ;
SELF.FDQuery1.Open;


SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT * FROM TRUBROS ORDER BY DESCRIPCION ASC') ;
SELF.FDQuery2.Open;

SELF.FDQuery3.Close;
SELF.FDQuery3.SQL.Clear;
SELF.FDQuery3.SQL.Add('SELECT * FROM TMARCAS ORDER BY DESCRIPCION ASC') ;
SELF.FDQuery3.Open;
end;

end.
