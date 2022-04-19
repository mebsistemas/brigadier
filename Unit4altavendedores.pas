unit Unit4altavendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons,UNIT1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Taltavendedores = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  altavendedores: Taltavendedores;

implementation

{$R *.dfm}

uses Unit4NUEVOVENDEDOR;

procedure Taltavendedores.BitBtn1Click(Sender: TObject);
begin
NUEVOVENDEDOR.EDIT1.CLEAr;
NUEVOVENDEDOR.EDIT2.CLEAr;
NUEVOVENDEDOR.Caption:='NUEVO VENDEDOR';
NUEVOVENDEDOR.SHOWMODAL;
if NUEVOVENDEDOR.ModalResult=MROK then
BEGIN
FORM1.FDConnection1.StartTransaction;
TRY
  SELF.FDQuery2.Close;
  SELF.FDQuery2.SQL.Clear;
  SELF.FDQuery2.SQL.Add('INSERT INTO TVENDEDORES (NOMBRE,COMISION) VALUES ('+#39+TRIM(NUEVOVENDEDOR.Edit1.Text)+#39+','+FLOATTOSTR(STRTOFLOAT(NUEVOVENDEDOR.Edit2.Text))+')');
  SELF.FDQuery2.ExecSQL;
   FORM1.FDConnection1.Commit;
   SHOWMESSAGE('SE HA GUARDADO CORRECTAMENTE');
EXCEPT
   FORM1.FDConnection1.Rollback;
    SHOWMESSAGE('SE PRODUJO UN ERROR AL GUARDAR EL VENDEDOR');
END;

END;

FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT IDVENDEDOR,NOMBRE,COMISION FROM TVENDEDORES ORDER BY NOMBRE ASC');
FDQuery1.Open;
end;

procedure Taltavendedores.BitBtn2Click(Sender: TObject);
begin
if SELF.FDQuery1.RecordCount=0 then
    EXIT;

if SELF.DataSource1.DataSet.FieldByName('IDVENDEDOR').AsINTEGER=1 then
BEGIN
  SHOWMESSAGE('NO SE PUEDE MODIFICAR ESTE VENDEDOR') ;
  EXIT;
END;

NUEVOVENDEDOR.EDIT1.TEXT:=TRIM(SELF.DataSource1.DataSet.FieldByName('NOMBRE').AsSTRING);
NUEVOVENDEDOR.EDIT2.TEXT:=TRIM(SELF.DataSource1.DataSet.FieldByName('COMISION').AsSTRING);
NUEVOVENDEDOR.Caption:='MODIFICAR VENDEDOR';
NUEVOVENDEDOR.IDVENDE:=SELF.DataSource1.DataSet.FieldByName('IDVENDEDOR').AsINTEGER;
NUEVOVENDEDOR.SHOWMODAL;
if NUEVOVENDEDOR.ModalResult=MROK then
BEGIN
FORM1.FDConnection1.StartTransaction;
TRY
  SELF.FDQuery2.Close;
  SELF.FDQuery2.SQL.Clear;
  SELF.FDQuery2.SQL.Add('UPDATE TVENDEDORES  SET NOMBRE='+#39+TRIM(NUEVOVENDEDOR.Edit1.Text)+#39+
                         ', COMISION='+FLOATTOSTR(STRTOFLOAT(NUEVOVENDEDOR.Edit2.Text))+' WHERE IDVENDEDOR='+INTTOSTR(NUEVOVENDEDOR.IDVENDE));

  SELF.FDQuery2.ExecSQL;
   FORM1.FDConnection1.Commit;
   SHOWMESSAGE('SE HA GUARDADO CORRECTAMENTE');
EXCEPT
   FORM1.FDConnection1.Rollback;
    SHOWMESSAGE('SE PRODUJO UN ERROR AL GUARDAR EL VENDEDOR');
END;

END;

FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT IDVENDEDOR,NOMBRE,COMISION FROM TVENDEDORES ORDER BY NOMBRE ASC');
FDQuery1.Open;

end;

procedure Taltavendedores.BitBtn3Click(Sender: TObject);
begin
if Application.MessageBox(pchar('¿Desea eliminar a '+trim(self.DataSource1.DataSet.FieldByName('nombre').AsString)+' ?'), 'Eliminar Vendedor',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  begin
     fORM1.FDConnection1.StartTransaction;
    TRY
      SELF.FDQuery2.Close;
      SELF.FDQuery2.SQL.Clear;
      SELF.FDQuery2.SQL.Add('DELETE FROM TVENDEDORES WHERE IDVENDEDOR='+INTTOSTR(SELF.DataSource1.DataSet.FieldByName('IDVENDEDOR').AsInteger));

      SELF.FDQuery2.ExecSQL;
       FORM1.FDConnection1.Commit;
        SHOWMESSAGE('SE HA ELIMINADO CORRECTAMENTE');
     EXCEPT
        FORM1.FDConnection1.Rollback;
        SHOWMESSAGE('SE PRODUJO UN ERROR AL ELIMINAR EL VENDEDOR');
     END;
  end;

  FDQuery1.Close;
FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('SELECT IDVENDEDOR,NOMBRE,COMISION FROM TVENDEDORES ORDER BY NOMBRE ASC');
FDQuery1.Open;
end;

procedure Taltavendedores.BitBtn4Click(Sender: TObject);
begin
CLOSE;
end;

end.
