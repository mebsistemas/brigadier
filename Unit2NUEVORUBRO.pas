unit Unit2NUEVORUBRO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,UNIT1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TNUEVORUBRO = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NUEVORUBRO: TNUEVORUBRO;

implementation

{$R *.dfm}

procedure TNUEVORUBRO.BitBtn1Click(Sender: TObject);
begin
if TRIM(EDIT1.Text)='' then
BEGIN
  SHOWMESSAGE('DEBE INGRESAR LA DESCRIPCION DEL RUBRO');
  EXIT;
END;


FORM1.FDConnection1.StartTransaction;
TRY
       SELF.FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add('INSERT INTO TRUBROS (DESCRIPCION) VALUES ('+#39+TRIM(EDIT1.Text)+#39+')');
       FDQuery1.ExecSQL;

     FORM1.FDConnection1.Commit;
     Application.MessageBox( 'Se ha creado correctamente.', 'Atención',
  MB_ICONINFORMATION );
     CLOSE;
EXCEPT
    on E : Exception do
     begin
    FORM1.FDConnection1.Rollback;

      ShowMessage(E.ClassName+'. Error : '+E.Message);
   end;
END;
end;

procedure TNUEVORUBRO.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

end.
