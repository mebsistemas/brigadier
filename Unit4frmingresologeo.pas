unit Unit4frmingresologeo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls,unit1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons;

type
  Tfrmingresologeo = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    FDQuery1: TFDQuery;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmingresologeo: Tfrmingresologeo;

implementation

{$R *.dfm}

procedure Tfrmingresologeo.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if KEY IN ['0','1','2','3','4','5','6','7','8','9',#13,#8] then
 EDIT1.ReadOnly:=FALSE
 ELSE
 EDIT1.ReadOnly:=TRUE;

if key=#13 then
begin
if trim(edit1.Text)='' then
  exit;

   self.FDQuery1.Close;
   self.FDQuery1.SQL.Clear;
   self.FDQuery1.SQL.Add('select * from tusuarios where codigo='+inttostr(strtoint(edit1.Text)));
   self.FDQuery1.Open;
   if self.FDQuery1.IsEmpty=false then
   begin
   FORM1.ESADMINISTRADOR:=FDQuery1.FieldByName('TIPO').AsInteger;
   form1.IDUSUARIOLOGEADO:=FDQuery1.FieldByName('IDUSUARIO').AsInteger;
     modalresult:=mrok;
   end else begin
     showmessage('USUARIO INCORRECTO');
     MODALRESULT:=MRNONE;
   end;

end;
end;

end.
