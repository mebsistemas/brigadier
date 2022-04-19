unit UnitbuscarDatosCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.OleServer, Excel2010;

type
  TbuscarDatosCliente = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox2: TComboBox;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    FDQuery1: TFDQuery;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    Edit7: TEdit;
    BitBtn4: TBitBtn;
    Excel: TExcelApplication;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    esDe:STRING;
    existe:boolean;
    buscaDatos:boolean;
  end;

var
  buscarDatosCliente: TbuscarDatosCliente;

implementation

{$R *.dfm}

uses Unit1, Uterminar;

procedure TbuscarDatosCliente.BitBtn1Click(Sender: TObject);
var tipo,posi,tipoiva:longint;
begin
posi:=pos('-',trim(combobox1.Text));
tipo:=strtoint(trim(copy(trim(combobox1.Text),0,posi-1)));




self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select * from tclienteS where tipodoc='+inttostr(TIPO)+' and nrodoc='+#39+trim(EDIT1.Text)+#39);
self.FDQuery1.Open;
if self.FDQuery1.IsEmpty=true then
begin
    showmessage('NO SE ENCUENTRA CLIENTE');
    existe:=false;
end else begin
        posi:=pos('-',trim(FDQuery1.FieldByName('iva').asstring));
        tipoiva:=strtoint(trim(copy(trim(FDQuery1.FieldByName('iva').asstring),0,posi-1)));

       existe:=true;
       edit6.Text:=trim(FDQuery1.FieldByName('idcliente').asstring);
       edit2.Text:=trim(FDQuery1.FieldByName('apenom').asstring);
       edit3.Text:=trim(FDQuery1.FieldByName('domicilio').asstring);
       edit4.Text:=trim(FDQuery1.FieldByName('telefono').asstring);
       edit5.Text:=trim(FDQuery1.FieldByName('correo').asstring);
       edit7.Text:=trim(FDQuery1.FieldByName('IIBB').asstring);
       self.ComboBox2.ItemIndex:=tipoiva;
       if trim(FDQuery1.FieldByName('TIENE_IIBB').asstring)='S' then
          CHECKBOX1.Checked:=TRUE
       ELSE
            CHECKBOX1.Checked:=FALSE;
end;
end;

procedure TbuscarDatosCliente.BitBtn2Click(Sender: TObject);
var tipo,posi,idcliente:longint;   sale:boolean;
iibb:real;
tieneiibb,tiiva:string;
begin
sale:=true;

  if combobox1.ItemIndex=-1 then
   begin
     showmessage('Debe seleccionar el tipo documento');
     exit;
   end;

   if  trim(edit1.Text)='' then
    begin
     showmessage('Debe ingresar el nro de documento');
      exit;
    end;

   if  trim(edit2.Text)='' then
   begin
     showmessage('Debe ingresar el Apellido y Nombre');
      exit;
   end;

   if combobox2.ItemIndex=-1 then
     begin
      showmessage('Debe seleccionar el tipo IVA');
      exit;
     end;

   if  trim(edit3.Text)='' then
    begin
       showmessage('Debe ingresar el domicilio');
       exit;
    end;


   if  trim(edit5.Text)='' then
    begin
      showmessage('Debe ingresar el telefono');
      exit;
   end;
   if  trim(edit5.Text)='' then
   begin
     showmessage('Debe ingresar el correo');
     exit;
   end;


   if SELF.CheckBox1.Checked=TRUE then
       BEGIN
           if TRIM(EDIT7.Text)='' then
             begin
                 showmessage('Debe ingresar el porc. de IIBB');
                exit;
              end;
       END;

       if SELF.CheckBox1.Checked=TRUE then
        begin
            tieneIIBB:='S';
            iibb:=strtofloat(edit7.Text);
        end else
        begin
          tieneIIBB:='N';
          iibb:=0;
         end;

 if existe=false then
begin
   posi:=pos('-',trim(combobox1.Text));
   tipo:=strtoint(trim(copy(trim(combobox1.Text),0,posi-1)));
   FORM1.FDConnection1.StartTransaction;
   TRY
   tiiva:=inttostr(combobox2.ItemIndex) +'-'+ TRIM(COMBOBOX2.Text);
       SELF.FDQuery1.Close;
    SELF.FDQuery1.SQL.Clear;
    SELF.FDQuery1.SQL.Add('select max(idcliente) as maximo from TCLIENTEs');
    SELF.FDQuery1.open;
    idcliente:=FDQuery1.FieldByName('maximo').AsInteger + 1;
    SELF.FDQuery1.Close;
    SELF.FDQuery1.SQL.Clear;
    SELF.FDQuery1.SQL.Add('INSERT INTO TCLIENTEs (idcliente,APENOM,TIPODOC,NRODOC,IVA,DOMICILIO,TELEFONO, CORREO,IIBB, TIENE_IIBB) '+
      ' VALUES ('+inttostr(idcliente)+','+#39+TRIM(EDIT2.Text)+#39+','+INTTOSTR(TIPO)+','+#39+TRIM(EDIT1.Text)+#39+
       ','+#39+TRIM(tiiva)+#39+','+#39+TRIM(EDIT3.Text)+#39+
       ','+#39+TRIM(EDIT4.Text)+#39+','+#39+TRIM(EDIT5.Text)+#39+','+FLOATTOSTR(IIBB)+','+#39+TRIM(TIENEIIBB)+#39+')');
   SELF.FDQuery1.ExecSQL;
   FORM1.FDConnection1.Commit;
   SHOWMESSAGE('Se ha guardado correctamente');
   EXCEPT
     on E: Exception do
     begin
       sale:=false;
       FORM1.FDConnection1.Rollback;
        ShowMessage (E.ClassName + 'error generado, con mensaje:'   +e.Message);
       close;
     end;
   END;
 end else begin

   if SELF.CheckBox1.Checked=TRUE then
       BEGIN
           if TRIM(EDIT7.Text)='' then
             begin
                 showmessage('Debe ingresar el porc. de IIBB');
                exit;
              end;
       END;

       if SELF.CheckBox1.Checked=TRUE then
        begin
            tieneIIBB:='S';
            iibb:=strtofloat(edit7.Text);
        end else
        begin
          tieneIIBB:='N';
          iibb:=0;
         end;


 idcliente:=strtoint(edit6.Text);
  posi:=pos('-',trim(combobox1.Text));
   tipo:=strtoint(trim(copy(trim(combobox1.Text),0,posi-1)));
   FORM1.FDConnection1.StartTransaction;
   TRY
     tiiva:=inttostr(combobox2.ItemIndex) +'-'+ TRIM(COMBOBOX2.Text);
    SELF.FDQuery1.Close;
    SELF.FDQuery1.SQL.Clear;
    SELF.FDQuery1.SQL.Add('update TCLIENTEs  set APENOM='+#39+TRIM(EDIT2.Text)+#39+
                                             ', TIPODOC='+INTTOSTR(TIPO)+
                                             ',  NRODOC='+#39+TRIM(EDIT1.Text)+#39+
                                             ', IVA='+#39+TRIM(tiiva)+#39+
                                             ', DOMICILIO='+#39+TRIM(EDIT3.Text)+#39+
                                             ', TELEFONO='+#39+TRIM(EDIT4.Text)+#39+
                                             ', CORREO='+#39+TRIM(EDIT5.Text)+#39+
                                             ', IIBB='+FLOATTOSTR(IIBB)+
                                             ', TIENE_IIBB='+#39+TRIM(TIENEIIBB)+#39+
                          ' where idcliente='+inttostr(idcliente));


   SELF.FDQuery1.ExecSQL;
   FORM1.FDConnection1.Commit;
   SHOWMESSAGE('Se ha guardado correctamente');
   EXCEPT
     on E: Exception do
     begin
       sale:=false;
       FORM1.FDConnection1.Rollback;
        ShowMessage (E.ClassName + 'error generado, con mensaje:'   +e.Message);

     end;
   END;

 end;
 {if buscaDatos=true then
   begin
     frmterminar.Label7.Caption:=trim(edit6.Text)+' - '+trim(edit2.Text);
     if TRIM(FORM1.tconfi.GET_FSOLOTICKET)='N' then
       BEGIN
           if combobox2.ItemIndex=0 then
              frmterminar.ComboBox1.ItemIndex:=1
               ELSE
                   frmterminar.ComboBox1.ItemIndex:=2;

       END ELSE
              frmterminar.ComboBox1.ItemIndex:=0;

    close;
   end;   }



    if sale=true then
   begin

    close;
   end;

end;

procedure TbuscarDatosCliente.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TbuscarDatosCliente.BitBtn4Click(Sender: TObject);
var tipo,posi,idcliente:longint;   sale:boolean;
iibb:real;
tieneiibb,tiiva,APENOM:string;
 i: Integer;
  si: String;
  Hoja: _WorkSheet;
begin
sale:=true;

  if combobox1.ItemIndex=-1 then
   begin
     showmessage('Debe seleccionar el tipo documento');
     exit;
   end;

   if  trim(edit1.Text)='' then
    begin
     showmessage('Debe ingresar el nro de documento');
      exit;
    end;

   if  trim(edit2.Text)='' then
   begin
     showmessage('Debe ingresar el Apellido y Nombre');
      exit;
   end;

   if combobox2.ItemIndex=-1 then
     begin
      showmessage('Debe seleccionar el tipo IVA');
      exit;
     end;

   if  trim(edit3.Text)='' then
    begin
       showmessage('Debe ingresar el domicilio');
       exit;
    end;


   if  trim(edit5.Text)='' then
    begin
      showmessage('Debe ingresar el telefono');
      exit;
   end;
   if  trim(edit5.Text)='' then
   begin
     showmessage('Debe ingresar el correo');
     exit;
   end;


   if SELF.CheckBox1.Checked=TRUE then
       BEGIN
           if TRIM(EDIT7.Text)='' then
             begin
                 showmessage('Debe ingresar el porc. de IIBB');
                exit;
              end;
       END;

       if SELF.CheckBox1.Checked=TRUE then
        begin
            tieneIIBB:='S';
            iibb:=strtofloat(edit7.Text);
        end else
        begin
          tieneIIBB:='N';
          iibb:=0;
         end;



  Excel.Workbooks.Open( 'C:\DESARROLLOS\Clientes.csv',
  EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0 );
Hoja := Excel.Worksheets.Item[1] as _WorkSheet;
i := 2;
si := IntToStr( i );
repeat
    APENOM:=Hoja.Range['A'+si,'A'+si].Value2 ;
    posi:=pos(',',trim(APENOM));
    APENOM:=trim(copy(APENOM,1,posi-1));

   posi:=pos('-',trim(combobox1.Text));
   tipo:=strtoint(trim(copy(trim(combobox1.Text),0,posi-1)));
   FORM1.FDConnection1.StartTransaction;
   TRY
   tiiva:=inttostr(combobox2.ItemIndex) +'-'+ TRIM(COMBOBOX2.Text);
    SELF.FDQuery1.Close;
    SELF.FDQuery1.SQL.Clear;
    SELF.FDQuery1.SQL.Add('INSERT INTO TCLIENTEs (APENOM,TIPODOC,NRODOC,IVA,DOMICILIO,TELEFONO, CORREO,IIBB, TIENE_IIBB) '+
      ' VALUES ('+#39+TRIM(APENOM)+#39+','+INTTOSTR(TIPO)+','+#39+TRIM(EDIT1.Text)+#39+
       ','+#39+TRIM(tiiva)+#39+','+#39+TRIM(EDIT3.Text)+#39+
       ','+#39+TRIM(EDIT4.Text)+#39+','+#39+TRIM(EDIT5.Text)+#39+','+FLOATTOSTR(IIBB)+','+#39+TRIM(TIENEIIBB)+#39+')');
   SELF.FDQuery1.ExecSQL;
   FORM1.FDConnection1.Commit;

   EXCEPT
     on E: Exception do
     begin
       sale:=false;
       FORM1.FDConnection1.Rollback;
        ShowMessage (E.ClassName + 'error generado, con mensaje:'   +e.Message);
       close;
     end;
   END;

   Inc( i );
  si := IntToStr( i );
until ( VarType( Excel.Range['A'+si,'A'+si].Value2 ) = VarEmpty );

SHOWMESSAGE('FIN ');

    if sale=true then
   begin

    close;
   end;

end;

procedure TbuscarDatosCliente.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if key in ['0','1','2','3','4','5','6','7','8','9',#13,#8,'.']  then
 EDIT7.ReadOnly:=FALSE
 ELSE
 EDIT7.ReadOnly:=TRUE;

end;

end.
