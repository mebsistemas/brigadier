unit UnitimprimirEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,UNIT1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RxMemDS,QuickRpt, QRCtrls;

type
  TfrmimprimirEtiquetas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1CODIGO: TStringField;
    RxMemoryData1DESCRIPCION: TStringField;
    RxMemoryData1PRECIO: TStringField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    function generaImprimeEtiquetas(cantiEti,renglon:longint):boolean;
  public
    { Public declarations }
  end;

var
  frmimprimirEtiquetas: TfrmimprimirEtiquetas;

implementation

{$R *.dfm}

uses udisenioetuiqeita;

procedure TfrmimprimirEtiquetas.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmimprimirEtiquetas.BitBtn2Click(Sender: TObject);
VAR B:sTRING;
begin
B:=TRIM(EDIT1.Text);
if CheckBox1.Checked=false then
begin
FDQuery1.Close;
FDQuery1.sql.Clear;
FDQuery1.SQL.Add('SELECT   a.codigobarra as CODIGOBARRA,a.precioventa as PRECIOVENTA,'+
                   '   A.DESCRIPCION AS DESCRIPCION, a.idarticulo as aidarticulo ,  '+
                   '  M.DESCRIPCION AS MARCA  '+
                   '   FROM  TARTICULOS A   '+
                   '   LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA  '+
                  '   WHERE  A.codigobarra='+#39+trim(b)+#39);
FDQuery1.open;
end else
begin
FDQuery1.Close;
FDQuery1.sql.Clear;
FDQuery1.SQL.Add('SELECT   codigo as CODIGOBARRA,precio as PRECIOVENTA,'+
                   '   nombre AS DESCRIPCION ,1 AS NADA, '''' AS NADA1 '+
                  '   FROM  TPROMOCIONES   '+
                  '   WHERE  codigo='+#39+trim(b)+#39);
FDQuery1.open;
end;
 if FDQUERY1.IsEmpty=FALSE then
 BEGIN
 SELF.RxMemoryData1.Append;
 SELF.RxMemoryData1CODIGO.Value:=TRIM(FDQUERY1.Fields[0].ASSTRING);
 SELF.RxMemoryData1DESCRIPCION.Value:=TRIM(FDQUERY1.Fields[2].ASSTRING)+' '+TRIM(FDQUERY1.Fields[4].ASSTRING);
 SELF.RxMemoryData1PRECIO.Value:=StringReplace(TRIM(FDQUERY1.Fields[1].ASSTRING), '.', ',',[rfReplaceAll, rfIgnoreCase]);
 SELF.RxMemoryData1.Post;

 END;


end;

procedure TfrmimprimirEtiquetas.BitBtn3Click(Sender: TObject);
var   cantEtiquetas:real;   posi:longint;
      ScantEtiquetas,parteEntera,parteDEcimal:String;
      lineas:real;
      cantEtiquetasI:longint;

begin
cantEtiquetasI:=self.RxMemoryData1.RecordCount;
 cantEtiquetas:=self.RxMemoryData1.RecordCount;
 lineas:=cantEtiquetas / 3;


 ScantEtiquetas:=floattostr(lineas);
 posi:=pos('.',trim(ScantEtiquetas));
 if posi > 0 then
  begin
     parteEntera:= copy(ScantEtiquetas,1,posi-1);
     parteDEcimal:=copy(ScantEtiquetas,posi+1,1);
     parteDEcimal:=floattostr(strtofloat(parteDEcimal) / 3);

     lineas:= strtoint(parteEntera) +  strtoint(parteDEcimal);
  end else
   begin
           parteEntera:= '0';
           parteDEcimal:='0';

   end;

  generaImprimeEtiquetas(cantEtiquetasI,1);
end;

function TfrmimprimirEtiquetas.generaImprimeEtiquetas(cantiEti,renglon:longint):boolean;
var     Detiqueta: TQRShape;
        i,abajo,posi,genera,izquierda,j:longint;
        QRLabel1,QRLabel2,QRLabel3,QRLabel4:TQRLabel;
begin
 disenioEtiqeuta.paso:=false;
 self.RxMemoryData1.Open;
 self.RxMemoryData1.First;
 i:=1;
 abajo:=8;
 posi:=5;
 genera:=1;
 izquierda:=2;
 renglon:=1;
 while not self.RxMemoryData1.Eof do
 begin

     Detiqueta:=TQRShape.Create(self);
     Detiqueta.Name:='eti'+IntToStr(I);
     Detiqueta.Width:=235;
     Detiqueta.Height:=73;
     Detiqueta.Top:=abajo;
     Detiqueta.Shape:=qrsRectangle;
     Detiqueta.Parent :=disenioEtiqeuta.pageheaderband1;
     Detiqueta.Left:=izquierda;//110-(NewDisk.Width Div 2);
     QRLabel1:=TQRLabel.Create(self);
     QRLabel1.Name:='producto1'+inttostr(i);
     QRLabel1.Top:=abajo + 2;
     QRLabel1.Left:=izquierda + 5;
     QRLabel1.Height:=16;
     QRLabel1.WordWrap:=true;
    // QRLabel1.AutoSize := False;
      // QRLabel1.Caption:=self.RxMemoryData1DESCRIPCION.Value;
     QRLabel1.Caption:=copy(self.RxMemoryData1DESCRIPCION.Value,1,30) ;
     //copy(self.RxMemoryData1DESCRIPCION.Value,31,length(self.RxMemoryData1DESCRIPCION.Value));

     QRLabel1.Parent:=disenioEtiqeuta.pageheaderband1;
     QRLabel1.Font.Size:=8;
     QRLabel1.Font.Color:=clblack;

     QRLabel1.Alignment:=taLeftJustify;
     QRLabel1.Visible:=true;

     QRLabel4:=TQRLabel.Create(self);
     QRLabel4.Name:='producto2'+inttostr(i);
     QRLabel4.Top:=abajo + 16;
     QRLabel4.Left:=izquierda + 5;
     QRLabel4.Height:=16;
     QRLabel4.WordWrap:=true;
    // QRLabel1.AutoSize := False;
      // QRLabel1.Caption:=self.RxMemoryData1DESCRIPCION.Value;
     QRLabel4.Caption:=copy(self.RxMemoryData1DESCRIPCION.Value,31,length(self.RxMemoryData1DESCRIPCION.Value));


     QRLabel4.Parent:=disenioEtiqeuta.pageheaderband1;
     QRLabel4.Font.Size:=8;
     QRLabel4.Font.Color:=clblack;

     QRLabel4.Alignment:=taLeftJustify;
     QRLabel4.Visible:=true;

     QRLabel2:=TQRLabel.Create(self);
     QRLabel2.Name:='precio1'+inttostr(i);
     QRLabel2.Top:=abajo + 28;
     QRLabel2.Left:=izquierda + 100;
     QRLabel2.Height:=35;
     QRLabel2.Caption:='$'+self.RxMemoryData1PRECIO.Value;
     if pos(',',QRLabel2.Caption)=0 then
       QRLabel2.Caption:=QRLabel2.Caption+',00';

     QRLabel2.Parent:=disenioEtiqeuta.pageheaderband1;
     QRLabel2.Font.Size:=20;
     QRLabel2.Font.Color:=clblack;
    // QRLabel2.Font.Style:=[fsbold];
     QRLabel2.Alignment:=taRightJustify;
     QRLabel2.Font.name:='Impact';
     QRLabel2.Visible:=true;

     QRLabel3:=TQRLabel.Create(self);
     QRLabel3.Name:='codigo1'+inttostr(i);
     QRLabel3.Top:=abajo + 55;
     QRLabel3.Left:=izquierda + 10;
     QRLabel3.Height:=12;
     QRLabel3.Caption:=self.RxMemoryData1CODIGO.Value;
     QRLabel3.Parent:=disenioEtiqeuta.pageheaderband1;
     QRLabel3.Font.Size:=8;
     QRLabel3.Font.Color:=clblack;
     QRLabel3.Font.Style:=[fsbold];
     QRLabel3.Alignment:=taCenter;
     QRLabel3.Font.name:='Calibri';
     QRLabel3.Visible:=true;

   //   Calibri

     Detiqueta.Visible:=True;
      if genera > 2  then
       begin
       renglon:= renglon + 1;
        genera:=1;
        izquierda:=2;
        abajo:= abajo + 73 + posi;
       end else begin
         genera:=genera + 1;
         if renglon=1 then
            abajo:=8 ;
           { else
             begin
               abajo:= abajo + 73 + posi;
             end;  }
         izquierda:= izquierda + 235 + posi;
       end;

    inc(i);

  self.RxMemoryData1.Next;
 end;
 // paso:=true;
disenioEtiqeuta.QuickRep1.Prepare;
disenioEtiqeuta.QuickRep1.Preview;
{
for i:=(disenioEtiqeuta.ComponentCount-1) downto 0 do
         begin
              //if disenioEtiqeuta.Components[i] is TQRLabel then
              //  begin
              // if InformeProveedores2.Components[i].name <>'QRLabelnew' then
                TQRLabel(disenioEtiqeuta.Components[i]).Destroy;
               // end;
         end;
{QRLabel3.Free;
QRLabel4.Free;
QRLabel2.Free;
QRLabel1.Free;
Detiqueta.Free; }

  FreeAndNil(QRLabel3);
  FreeAndNil(QRLabel2);
  FreeAndNil(QRLabel4);
  FreeAndNil(QRLabel1);
  FreeAndNil(Detiqueta);

end;

procedure TfrmimprimirEtiquetas.BitBtn4Click(Sender: TObject);
 var    Detiqueta: TQRShape;
        i:longint;
begin
generaImprimeEtiquetas(1,1);

end;

procedure TfrmimprimirEtiquetas.DBGrid1DblClick(Sender: TObject);
begin
SELF.RxMemoryData1.Delete;
end;

end.
