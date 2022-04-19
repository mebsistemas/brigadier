unit UnFRMNUEVAMARCAit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,UNIT1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFRMNUEVAMARCA = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMNUEVAMARCA: TFRMNUEVAMARCA;

implementation

{$R *.dfm}

procedure TFRMNUEVAMARCA.BitBtn1Click(Sender: TObject);
begin
if TRIM(EDIT1.Text)='' then
BEGIN
  SHOWMESSAGE('DEBE INGRESAR LA MARCA');
  EXIT;
END;
FORM1.FDConnection1.StartTransaction;
TRY
   self.FDQuery1.Close;
   self.FDQuery1.SQL.Clear;
   self.FDQuery1.SQL.Add('insert into tmarcas (descripcion) values ('+#39+trim(edit1.Text)+#39+')');
   self.FDQuery1.ExecSQL;

  FORM1.FDConnection1.Commit;
  showmessage('MARCA CREADA CON EXITO');
EXCEPT
  FORM1.FDConnection1.Rollback;
  showmessage('SE PRODUJO UN ERROR AL CREAR LA MARCA');
END;

end;

procedure TFRMNUEVAMARCA.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TFRMNUEVAMARCA.FormShow(Sender: TObject);
begin
EDIT1.Clear;
end;

end.
