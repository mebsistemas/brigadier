program prPanaderia;

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Buttons,
  RxMemDS,
  Unit1 in 'Unit1.pas' {Form1},
  Uterminar in 'Uterminar.pas' {frmterminar},
  CLASS_DECIMALES in 'CLASS_DECIMALES.pas',
  Ufrmdatosclientes in 'Ufrmdatosclientes.pas' {frmdatosclientes},
  UniPideusario in 'UniPideusario.pas' {frmpideusuario},
  UniFRMDATOSTARJETASpas in 'UniFRMDATOSTARJETASpas.pas' {FRMDATOSTARJETAS},
  UnifrmBuscarARticulos in 'UnifrmBuscarARticulos.pas' {frmBuscarARticulos},
  UnifrmabmArticulos in 'UnifrmabmArticulos.pas' {frmABMARticulos},
  UniFRMNUEVOARTICULO in 'UniFRMNUEVOARTICULO.pas' {FRMNUEVOARTICULO},
  UDisenioPDF in 'PDF\UDisenioPDF.pas' {frmpdf},
  UnPRPRECIOVARIABLE in 'UnPRPRECIOVARIABLE.pas' {PRPRECIOVARIABLE},
  UnitFRMMENSAJE in 'UnitFRMMENSAJE.pas' {FRMMENSAJE},
  unicierrexs in 'unicierrexs.pas' {cierrex},
  UnAPERTURACAJA in 'UnAPERTURACAJA.pas' {APERTURACAJA},
  UnitFRMCIERRECAJA in 'UnitFRMCIERRECAJA.pas' {FRMCIERRECAJA},
  Ufrmsalidacaja in 'Ufrmsalidacaja.pas' {frmsalidacaja},
  UnifrmRegistrarSalida in 'UnifrmRegistrarSalida.pas' {frmRegistrarSalida},
  UnitbuscarDatosCliente in 'UnitbuscarDatosCliente.pas' {buscarDatosCliente},
  Unidiseniocierrecaja in 'Unidiseniocierrecaja.pas' {frmdiseniocierrecaja},
  WSFEV1 in 'FAE\WSFEV1.pas',
  Unit2FRMFECHA in 'Unit2FRMFECHA.pas' {FRMFECHA},
  Unit2frmIngresosaCaja in 'Unit2frmIngresosaCaja.pas' {frmIngresosaCaja},
  UnitregistarIngresosCaja2 in 'UnitregistarIngresosCaja2.pas' {registarIngresosCaja},
  Exportar2PDF in '..\SynPDF\Exportar2PDF.pas',
  SynPdf in '..\SynPDF\SynPdf.pas',
  mORMotReport in '..\SynPDF\mORMotReport.pas',
  SynCommons in '..\SynPDF\SynCommons.pas',
  SynCrypto in '..\SynPDF\SynCrypto.pas',
  SynGdiPlus in '..\SynPDF\SynGdiPlus.pas',
  SynLZ in '..\SynPDF\SynLZ.pas',
  SynTable in '..\SynPDF\SynTable.pas',
  SynZip in '..\SynPDF\SynZip.pas',
  Unit2frmclientes in 'Unit2frmclientes.pas' {frmclientes},
  Unit2FRMLISTADOSMOVIMIENTOS in 'Unit2FRMLISTADOSMOVIMIENTOS.pas' {FRMLISTADOSMOVIMIENTOS},
  UFMIMPRESIONVARIOS in 'UFMIMPRESIONVARIOS.pas' {FRMIMPRESIONVARIOS};

{$R *.res}

begin
 Application.UpDateFormatSettings := false;
  FormatSettings.DateSeparator := '/';
  FormatSettings.CurrencyDecimals := 2;

 // ShortDateFormat := 'dd/mm/AAAA';
  FormatSettings.DecimalSeparator := '.' ;
  Application.Name:='SISTEMA';
   Application.Title := 'SISTEMA';
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrmterminar, frmterminar);
  Application.CreateForm(Tfrmdatosclientes, frmdatosclientes);
  Application.CreateForm(Tfrmpideusuario, frmpideusuario);
  Application.CreateForm(TFRMDATOSTARJETAS, FRMDATOSTARJETAS);
  Application.CreateForm(TfrmBuscarARticulos, frmBuscarARticulos);
  Application.CreateForm(TfrmABMARticulos, frmABMARticulos);
  Application.CreateForm(TFRMNUEVOARTICULO, FRMNUEVOARTICULO);
  Application.CreateForm(Tfrmpdf, frmpdf);
  Application.CreateForm(TPRPRECIOVARIABLE, PRPRECIOVARIABLE);
  Application.CreateForm(TFRMMENSAJE, FRMMENSAJE);
  Application.CreateForm(Tcierrex, cierrex);
  Application.CreateForm(TAPERTURACAJA, APERTURACAJA);
  Application.CreateForm(TFRMCIERRECAJA, FRMCIERRECAJA);
  Application.CreateForm(Tfrmsalidacaja, frmsalidacaja);
  Application.CreateForm(TfrmRegistrarSalida, frmRegistrarSalida);
  Application.CreateForm(TbuscarDatosCliente, buscarDatosCliente);
  Application.CreateForm(Tfrmdiseniocierrecaja, frmdiseniocierrecaja);
  Application.CreateForm(TFRMFECHA, FRMFECHA);
  Application.CreateForm(TfrmIngresosaCaja, frmIngresosaCaja);
  Application.CreateForm(TregistarIngresosCaja, registarIngresosCaja);
  Application.CreateForm(Tfrmclientes, frmclientes);
  Application.CreateForm(TFRMLISTADOSMOVIMIENTOS, FRMLISTADOSMOVIMIENTOS);
  Application.CreateForm(TFRMIMPRESIONVARIOS, FRMIMPRESIONVARIOS);
  Application.Run;
end.
