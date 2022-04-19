unit Unit2FRMDEVOLCUIONESTOTT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,unit1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFRMDEVOLCUIONESTOTT = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    FDQuery1: TFDQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idfactura:longint;
  end;

var
  FRMDEVOLCUIONESTOTT: TFRMDEVOLCUIONESTOTT;

implementation

{$R *.dfm}

procedure TFRMDEVOLCUIONESTOTT.BitBtn1Click(Sender: TObject);
var TIPOMOVIMIENTO, posi:longint;
begin
if combobox1.ItemIndex=-1 then
   begin
       Application.MessageBox( 'Debe seleccionar el tipo comprobante',
           'Atención', MB_ICONSTOP );
      modalresult:=MRNONE;
     exit
   end;

   if trim(edit1.Text)='' then
   begin
       Application.MessageBox( 'Debe ingresar el nro comprobante',
           'Atención', MB_ICONSTOP );
      modalresult:=MRNONE;
     exit
   end;

   posi:=pos('-',trim(ComboBox1.Text));
   TIPOMOVIMIENTO:=strtoint(trim(copy(trim(ComboBox1.TEXT),0,posi-1)));

self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select  idmovimiento as ID  '+
      ' from tmovimientos  '+
' where '+
'  tipomovimiento='+INTTOSTR(TIPOMOVIMIENTO)+
' AND nrofactura='+INTTOSTR(STRTOINT(EDIT1.Text)));
self.FDQuery1.Open;
if FDQuery1.RecordCount=0 then
  begin
    Application.MessageBox( 'No se ha encontrando ningún comprobante con los datos ingresados.',
  'Atención', MB_ICONSTOP );
  end else begin
    idfactura:=FDQuery1.FieldByName('id').AsInteger;
  end;

end;

procedure TFRMDEVOLCUIONESTOTT.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TFRMDEVOLCUIONESTOTT.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6',#13,#8,'-'] then
edit1.ReadOnly:=false
else
edit1.ReadOnly:=true;
end;

procedure TFRMDEVOLCUIONESTOTT.FormShow(Sender: TObject);
begin
edit1.Clear;
end;

end.
