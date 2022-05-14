unit Unit2configuracion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,unit1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,   inifiles,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tconfiguracion = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label11: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    ComboBox1: TComboBox;
    Label16: TLabel;
    Edit14: TEdit;
    Label17: TLabel;
    ComboBox2: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    TabSheet4: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    TabSheet5: TTabSheet;
    BitBtn6: TBitBtn;
    FDQuery1: TFDQuery;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  configuracion: Tconfiguracion;

implementation

{$R *.dfm}

uses Unitseleccioneimprsora;

procedure Tconfiguracion.BitBtn1Click(Sender: TObject);
begin
seleccioneimpresora.SHOWMODAL;
if seleccioneimpresora.ModalResult=MROK then
EDIT1.Text:=TRIM(seleccioneimpresora.ComboBox1.Text);

end;

procedure Tconfiguracion.BitBtn2Click(Sender: TObject);
var  Ini :TIniFile;
begin
TRY
FORM1.tconfi.POST_FNOMBRE:=TRIM(EDIT6.Text);
form1.tconfi.POST_FIVA:=TRIM(edit7.Text);
form1.tconfi.POST_FIIBB:=TRIM(edit8.Text);
form1.tconfi.POST_FDOMICILIO:=TRIM(EDIT9.Text) ;
FORM1.tconfi.POST_FTELEFONO:=TRIM(EDIT10.Text);
FORM1.tconfi.POST_FECHAINICIO:=DATETOSTR(datetimepicker1.DateTime);
FORM1.tconfi.POST_FIMPRESORA:=TRIM(EDIT1.Text);
FORM1.tconfi.POST_FCUENTAMAIL:=TRIM(edit2.Text);
FORM1.tconfi.POST_FSMTP:=TRIM(edit3.Text);
FORM1.tconfi.POST_FUSUARIOMAIL:=TRIM(edit4.Text);
FORM1.tconfi.POST_FPASSWORDMAIL:=TRIM(edit5.Text);
  if  self.CheckBox1.Checked then
      FORM1.tconfi.POST_FIMPRIME:='S'
      ELSE
        FORM1.tconfi.POST_FIMPRIME:='N' ;

  if COMBOBOX2.ItemIndex=1 then
      FORM1.tconfi.POST_FSOLOTICKET:='S'
      ELSE
       FORM1.tconfi.POST_FSOLOTICKET:='N' ;




     if  self.CheckBox2.Checked then
      FORM1.tconfi.POST_FENVIAMAIL:='S'
      ELSE
        FORM1.tconfi.POST_FENVIAMAIL:='N' ;



        if COMBOBOX1.ItemIndex=1 then
           FORM1.tconfi.POST_FMODO:='P'
           ELSE
            FORM1.tconfi.POST_FMODO:='T';


  FORM1.tconfi.POST_FPUNTOVENTA:=TRIM(EDIT11.Text);
  FORM1.tconfi.POST_FCERTIFICADO:=TRIM(EDIT12.Text);
  FORM1.tconfi.POST_FLLAVE:=TRIM(EDIT13.Text);
  FORM1.tconfi.POST_FCUITFACTURA:=TRIM(EDIT14.Text);


  FORM1.tconfi.POST_FDIGITOCODIGOBARRA:=TRIM(COMBOBOX3.Text);
  FORM1.tconfi.POST_FCANTIDADIGITOCODIGOBARRA:=TRIM(COMBOBOX4.Text);
  if RADIOBUTTON1.Checked=TRUE then
     FORM1.tconfi.POST_FDIGITOHASTA:='0'
    ELSE
       if RADIOBUTTON2.Checked=TRUE then
          FORM1.tconfi.POST_FDIGITOHASTA:='1' ;



   if self.RadioButton3.Checked=true then
   FORM1.TIPOPAPEL:='58'
    else
           if self.RadioButton4.Checked=true then
               FORM1.TIPOPAPEL:='80'
               else
                if self.RadioButton5.Checked=true then
                FORM1.TIPOPAPEL:='A4'
                else
                  FORM1.TIPOPAPEL:='A4';


  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'\config.ini');
  INI.WriteString('PAPEL', 'TIPO', FORM1.TIPOPAPEL);
 Ini.Free;


FORM1.tconfi.PostDatos(FORM1.PUESTO_PC);
CLOSE;
SHOWMESSAGE('CONFIGURACION GUARDADA');
EXCEPT
on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);

END;

end;

procedure Tconfiguracion.BitBtn3Click(Sender: TObject);
begin
CLOSE;
end;

procedure Tconfiguracion.BitBtn4Click(Sender: TObject);
begin
if SELF.OpenDialog1.Execute then
EDIT12.Text:=TRIM(OPENDIALOG1.FileName);
end;

procedure Tconfiguracion.BitBtn5Click(Sender: TObject);
begin
if SELF.OpenDialog1.Execute then
EDIT13.Text:=TRIM(OPENDIALOG1.FileName);
end;

procedure Tconfiguracion.BitBtn6Click(Sender: TObject);
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;

form1.FDConnection1.StartTransaction;
try
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TMOVIMIENTOS WHERE IDMOVIMIENTO > 1');
SELF.FDQuery1.ExecSQL;

SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TITEM_FACTURA WHERE IDitem > 1');
SELF.FDQuery1.ExecSQL;


SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TCAJA');
SELF.FDQuery1.ExecSQL;

SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TCOMPRAS');
SELF.FDQuery1.ExecSQL;


SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TDEVOLCIONES');
SELF.FDQuery1.ExecSQL;



SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM THISTORIAL_COSTO');
SELF.FDQuery1.ExecSQL;

SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TINGRESOS');
SELF.FDQuery1.ExecSQL;

 SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM tsalidas');
SELF.FDQuery1.ExecSQL;

 SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TPAGOSCUENTACORRIENTES');
SELF.FDQuery1.ExecSQL;

 SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('DELETE FROM TITEMCOMPRAS');
SELF.FDQuery1.ExecSQL;
 form1.FDConnection1.Commit;
 showmessage('PROCESO TERMINADO');
 except
   form1.FDConnection1.Rollback;
    showmessage('SE PRODUJO UN ERROR AL PROCESAR EL BORRADO');
end;


end;

procedure Tconfiguracion.ComboBox1Change(Sender: TObject);
begin

if COMBOBOX1.ItemIndex=0 then
BEGIN
  EDIT14.Text:='30685200143';
  EDIT14.Enabled:=FALSe;
  EDIT12.Enabled:=FALSe;
  EDIT13.Enabled:=FALSE;
  EDIT11.Enabled:=FALSE;
  EDIT11.TEXT:='1998';
  SELF.BitBtn4.Enabled:=FALSE;
  SELF.BitBtn5.Enabled:=FALSE;

END ELSE
 BEGIN
  EDIT14.Clear;
  EDIT14.Enabled:=TRUE;
  EDIT12.Enabled:=TRUE;
  EDIT13.Enabled:=TRUE;
  SELF.BitBtn4.Enabled:=TRUE;
  SELF.BitBtn5.Enabled:=TRUE;
  EDIT11.Enabled:=TRUE;
  EDIT11.Clear;
 END;

end;

procedure Tconfiguracion.FormShow(Sender: TObject);
var  Ini :TIniFile;
begin
edit6.Text:=form1.tconfi.GET_FNOMBRE;
edit7.Text:=form1.tconfi.GET_FIVA;
edit8.Text:=form1.tconfi.GET_FIIBB;
edit9.Text:=form1.tconfi.GET_FDOMICILIO;
edit10.Text:=form1.tconfi.GET_FTELEFONO;
if trim(form1.tconfi.GET_FECHAINICIO)='' then
  datetimepicker1.DateTime:=now
  else
datetimepicker1.DateTime:=strtodate(form1.tconfi.GET_FECHAINICIO);


edit1.Text:=form1.tconfi.GET_FIMPRESORA;
edit2.Text:=form1.tconfi.GET_FCUENTAMAIL;
edit3.Text:=form1.tconfi.GET_FSMTP;
edit4.Text:=form1.tconfi.GET_FUSUARIOMAIL;
edit5.Text:=form1.tconfi.GET_FPASSWORDMAIL;

 Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'\config.ini');

 form1.TIPOPAPEL:=TRIM(INI.ReadString('PAPEL', 'TIPO', 'A4'));
 Ini.Free;

   if trim(form1.TIPOPAPEL)='58' then
      self.RadioButton3.Checked:=true
      else
           if trim(form1.TIPOPAPEL)='80' then
            self.RadioButton4.Checked:=true
            else
               if trim(form1.TIPOPAPEL)='A4' then
                self.RadioButton5.Checked:=true
               else
                 self.RadioButton5.Checked:=true;


if trim(form1.tconfi.GET_FIMPRIME)='S'  then
   self.CheckBox1.Checked:=true
    else
    self.CheckBox1.Checked:=falsE;

    if trim(form1.tconfi.GET_FSOLOTICKET)='S'  then
         COMBOBOX2.ItemIndex:=1
       ELSE
        COMBOBOX2.ItemIndex:=0;

        if form1.demo=true then
         begin
           COMBOBOX2.ItemIndex:=1;
           combobox2.Enabled:=false;
         end else
             combobox2.Enabled:=true;


    if trim(form1.tconfi.GET_FENVIAMAIL)='S'  then
   self.CheckBox2.Checked:=true
    else
    self.CheckBox2.Checked:=falsE;

    EDIT11.Text:=FORM1.tconfi.GET_FPUNTOVENTA;
    EDIT12.Text:=FORM1.tconfi.GET_FCERTIFICADO;
    EDIT13.Text:=FORM1.tconfi.GET_FLLAVE;
    EDIT14.Text:=FORM1.tconfi.GET_FCUITFACTURA;

    if TRIM(FORM1.tconfi.GET_FMODO)='P' then
       COMBOBOX1.ItemIndex:=1
       ELSE
        COMBOBOX1.ItemIndex:=0;

          ComboBox1Change(Sender);

     if FORM1.demo=TRUE then
         COMBOBOX1.Enabled:=FALSE
         ELSE
         COMBOBOX1.Enabled:=TRUE;



   COMBOBOX3.ItemIndex:=STRTOINT(FORM1.tconfi.GET_FDIGITOCODIGOBARRA);
   COMBOBOX4.ItemIndex:=STRTOINT(FORM1.tconfi.GET_FCANTIDADIGITOCODIGOBARRA);
   if TRIM(FORM1.tconfi.GET_FDIGITOHASTA)='0' then
         SELF.RadioButton1.Checked:=TRUE
         ELSE
            if TRIM(FORM1.tconfi.GET_FDIGITOHASTA)='1' then
               SELF.RadioButton2.Checked:=TRUE;

  SELF.PageControl1.ActivePageIndex:=2;

end;

end.
