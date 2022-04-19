unit UniPideusario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tfrmpideusuario = class(TForm)
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FUNCTION EXISTE_USUARIO(COD:LONGINT):BOOLEAN;
  public
    { Public declarations }
  end;

var
  frmpideusuario: Tfrmpideusuario;

implementation

{$R *.dfm}

uses Unit1;

procedure Tfrmpideusuario.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if TRIM(EDIT1.Text)<>'' then
BEGIN
 if key in ['0','1','2','3','4','5','6','7','8','9',#13,#8]  then
   EDIT1.ReadOnly:=FALSE
   ELSE
   EDIT1.ReadOnly:=TRUE;

   if KEY=#13 then
   BEGIN
    IF EXISTE_USUARIO(STRTOINT(EDIT1.Text))=FALSE THEN
     EXIT;

   CLOSE;
   END;
  END;
end;
FUNCTION Tfrmpideusuario.EXISTE_USUARIO(COD:LONGINT):BOOLEAN;
BEGIN
EXISTE_USUARIO:=FALSe;
 FORM1.FDQuery2.Close;
 FORM1.FDQuery2.SQL.Clear;
 FORM1.FDQuery2.SQL.Add('SELECT * FROM TUSUARIOS WHERE CODIGO='+INTTOSTR(COD));
 FORM1.FDQuery2.Open;
 if FORM1.FDQuery2.IsEmpty=FALSE then
 BEGIN
   EDIT1.Text:=TRIM(FORM1.FDQuery2.FieldByName('IDUSUARIO').AsString);
   EXISTE_USUARIO:=TRUE;
  END;
END;

procedure Tfrmpideusuario.FormShow(Sender: TObject);
begin
frmpideusuario.Edit1.Clear;
frmpideusuario.Edit1.SetFocus;
end;

end.
