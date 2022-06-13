program prSysGestion;

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
  UFMIMPRESIONVARIOS in 'UFMIMPRESIONVARIOS.pas' {FRMIMPRESIONVARIOS},
  Unit2verStock in 'Unit2verStock.pas' {verStock},
  Unit2cargarStock in 'Unit2cargarStock.pas' {cargarStock},
  Unit2acercade in 'Unit2acercade.pas' {acercade},
  Unit2NUEVORUBRO in 'Unit2NUEVORUBRO.pas' {NUEVORUBRO},
  Unit2configuracion in 'Unit2configuracion.pas' {configuracion},
  TCConfiguracion in 'TCConfiguracion.pas',
  Unitseleccioneimprsora in 'Unitseleccioneimprsora.pas' {seleccioneimpresora},
  Unitcuentascorrientesclientes in 'Unitcuentascorrientesclientes.pas' {cuentascorrientesclientes},
  unifrmusuarios in 'unifrmusuarios.pas' {frmusuarios},
  Unit2NUEVOUSUARIO in 'Unit2NUEVOUSUARIO.pas' {NUEVOUSUARIO},
  Unit2buscar_clientes in 'Unit2buscar_clientes.pas' {buscar_clientes},
  Unitfrmenviarmail in 'Unitfrmenviarmail.pas' {frmenviarmail},
  DISENIOTICKET in 'DISENIOTICKET.pas' {FRMDISENIOTICKET},
  Unit2COBRARCC in 'Unit2COBRARCC.pas' {COBRARCC},
  Unit2FRMINFOPAGOS in 'Unit2FRMINFOPAGOS.pas' {FRMINFOPAGOS},
  Unitfrmproveedores in 'Unitfrmproveedores.pas' {dbr},
  Unit3INFOCOSTOS in 'Unit3INFOCOSTOS.pas' {INFOCOSTOS},
  Unitfrfiltro in 'Unitfrfiltro.pas' {frfiltro},
  Unitlistarasrticulosvendod3 in 'Unitlistarasrticulosvendod3.pas' {listarasrticulosvendod},
  Unitlistararticulosreposicion3 in 'Unitlistararticulosreposicion3.pas' {listararticulosreposicion},
  UnitanalisisRentabilidad in 'UnitanalisisRentabilidad.pas' {analisisRentabilidad},
  Unit3ABMPROVEDORES in 'Unit3ABMPROVEDORES.pas' {Form3},
  Unitnuevoproveedor4 in 'Unitnuevoproveedor4.pas' {nuevoproveedor},
  Unit4frmcompras in 'Unit4frmcompras.pas' {frmcompras},
  Unitneuvacompra in 'Unitneuvacompra.pas' {neuvacompra},
  Unit4BUSCARARTICULSCOMPRA in 'Unit4BUSCARARTICULSCOMPRA.pas' {BUSCARARTICULSCOMPRA},
  Unit4pidecantidadyprecio in 'Unit4pidecantidadyprecio.pas' {pidecantidadyprecio},
  Unit4fromtarjetas in 'Unit4fromtarjetas.pas' {fromtarjetas},
  UnFRMAGREGrtarjetait4 in 'UnFRMAGREGrtarjetait4.pas' {FRMAGREGrtarjeta},
  Unifmdescuentost4 in 'Unifmdescuentost4.pas' {fmdescuentos},
  Unit4AGREGARDESCUENTOS in 'Unit4AGREGARDESCUENTOS.pas' {AGREGARDESCUENTOS},
  Unitinventario4 in 'Unitinventario4.pas' {inventario},
  UnFRMNUEVAMARCAit4 in 'UnFRMNUEVAMARCAit4.pas' {FRMNUEVAMARCA},
  UnitFRMAGREGARVENCIMIENTOS4 in 'UnitFRMAGREGARVENCIMIENTOS4.pas' {FRMAGREGARVENCIMIENTOS},
  Unit4ABMVENCIMIENTOS in 'Unit4ABMVENCIMIENTOS.pas' {ABMVENCIMIENTOS},
  Unit4frmingresologeo in 'Unit4frmingresologeo.pas' {frmingresologeo},
  UnitPIDECOMENTARIOS4 in 'UnitPIDECOMENTARIOS4.pas' {PIDECOMENTARIOS},
  UnitMESYANIO in 'UnitMESYANIO.pas' {MESYANIO},
  Unit4FRMFECHASDESDEYHASTAS in 'Unit4FRMFECHASDESDEYHASTAS.pas' {FRMFECHASDESDEYHASTAS},
  Unitfrrubromasvendido4 in 'Unitfrrubromasvendido4.pas' {frrubromasvendido},
  Unit4FRMBUSCAFACTPARANC in 'Unit4FRMBUSCAFACTPARANC.pas' {FRMBUSCAFACTPARANC},
  UniFRMIVAVENTAt4 in 'UniFRMIVAVENTAt4.pas' {FRMIVAVENTA},
  Unit4FRMINGRESARINVENTARIO in 'Unit4FRMINGRESARINVENTARIO.pas' {FRMINGRESARINVENTARIO},
  Unit4altavendedores in 'Unit4altavendedores.pas' {altavendedores},
  Unit4NUEVOVENDEDOR in 'Unit4NUEVOVENDEDOR.pas' {NUEVOVENDEDOR},
  Unit4buscarcliente in 'Unit4buscarcliente.pas' {buscarcliente},
  UnitcomisionesVendedores4 in 'UnitcomisionesVendedores4.pas' {comisionesVendedores},
  Unit4verventas in 'Unit4verventas.pas' {verventas},
  Unit4ventaporvendedor in 'Unit4ventaporvendedor.pas' {ventaporvendedor},
  Unitbuscaryverfacturas4 in 'Unitbuscaryverfacturas4.pas' {buscaryverfacturas},
  Unidetallefacturat4 in 'Unidetallefacturat4.pas' {detallefactura},
  UnilistarClientesDeudorest4 in 'UnilistarClientesDeudorest4.pas' {listarClientesDeudores},
  UnitREALIZARDEVOLUCIONES4 in 'UnitREALIZARDEVOLUCIONES4.pas' {REALIZARDEVOLUCIONES},
  Unit4frmProgreso in 'Unit4frmProgreso.pas' {frmProgreso},
  disenioticketa4 in 'disenioticketa4.pas' {frmDisenioTicketA4},
  Unit2FRMDEVOLCUIONESTOTT in 'Unit2FRMDEVOLCUIONESTOTT.pas' {FRMDEVOLCUIONESTOTT},
  UnitIMPRIMIRSTOCKCARGA2 in 'UnitIMPRIMIRSTOCKCARGA2.pas' {IMPRIMIRSTOCKCARGA},
  UIMPRIMIRARTICULOS in 'UIMPRIMIRARTICULOS.PAS' {IMPRIMIRARTICULOS},
  UnitimprimeVentasVendedor2 in 'UnitimprimeVentasVendedor2.pas' {imprimeVentasVendedor},
  Unit2listadeprecio in 'Unit2listadeprecio.pas' {listadeprecio},
  Unit2CONSULTARPRECIO in 'Unit2CONSULTARPRECIO.pas' {CONSULTARPRECIO},
  UudisenioTicket58 in 'UudisenioTicket58.pas' {frmTicket58},
  UImprimeFActura58 in 'UImprimeFActura58.pas' {disenioimprimirFactura58},
  UnitfrmConsultarPrecioDescrip in 'UnitfrmConsultarPrecioDescrip.pas' {frmConsultarPrecioDescrip},
  UnifrmActualizaPrecioporProveedor in 'UnifrmActualizaPrecioporProveedor.pas' {frmActualizaPrecioporProveedor},
  UnitfrmActualizaindivualARticulo in 'UnitfrmActualizaindivualARticulo.pas' {frmActualizaindivualARticulo},
  ufimformex80 in 'ufimformex80.pas' {frminformex80},
  Ufrmcierrex58mm2 in 'Ufrmcierrex58mm2.pas' {frmcierrex58mm},
  Udiseniocierrecaja58 in 'Udiseniocierrecaja58.pas' {frmdiseniocierreCaja58};

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
  Application.CreateForm(TverStock, verStock);
  Application.CreateForm(TcargarStock, cargarStock);
  Application.CreateForm(Tacercade, acercade);
  Application.CreateForm(TNUEVORUBRO, NUEVORUBRO);
  Application.CreateForm(Tconfiguracion, configuracion);
  Application.CreateForm(Tseleccioneimpresora, seleccioneimpresora);
  Application.CreateForm(Tcuentascorrientesclientes, cuentascorrientesclientes);
  Application.CreateForm(Tfrmusuarios, frmusuarios);
  Application.CreateForm(TNUEVOUSUARIO, NUEVOUSUARIO);
  Application.CreateForm(Tbuscar_clientes, buscar_clientes);
  Application.CreateForm(Tfrmenviarmail, frmenviarmail);
  Application.CreateForm(TFRMDISENIOTICKET, FRMDISENIOTICKET);
  Application.CreateForm(TCOBRARCC, COBRARCC);
  Application.CreateForm(TFRMINFOPAGOS, FRMINFOPAGOS);
  Application.CreateForm(Tdbr, dbr);
  Application.CreateForm(TINFOCOSTOS, INFOCOSTOS);
  Application.CreateForm(Tfrfiltro, frfiltro);
  Application.CreateForm(Tlistarasrticulosvendod, listarasrticulosvendod);
  Application.CreateForm(Tlistararticulosreposicion, listararticulosreposicion);
  Application.CreateForm(TanalisisRentabilidad, analisisRentabilidad);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(Tnuevoproveedor, nuevoproveedor);
  Application.CreateForm(Tfrmcompras, frmcompras);
  Application.CreateForm(Tneuvacompra, neuvacompra);
  Application.CreateForm(TBUSCARARTICULSCOMPRA, BUSCARARTICULSCOMPRA);
  Application.CreateForm(Tpidecantidadyprecio, pidecantidadyprecio);
  Application.CreateForm(Tfromtarjetas, fromtarjetas);
  Application.CreateForm(TFRMAGREGrtarjeta, FRMAGREGrtarjeta);
  Application.CreateForm(Tfmdescuentos, fmdescuentos);
  Application.CreateForm(TAGREGARDESCUENTOS, AGREGARDESCUENTOS);
  Application.CreateForm(Tinventario, inventario);
  Application.CreateForm(TFRMNUEVAMARCA, FRMNUEVAMARCA);
  Application.CreateForm(TFRMAGREGARVENCIMIENTOS, FRMAGREGARVENCIMIENTOS);
  Application.CreateForm(TABMVENCIMIENTOS, ABMVENCIMIENTOS);
  Application.CreateForm(Tfrmingresologeo, frmingresologeo);
  Application.CreateForm(TPIDECOMENTARIOS, PIDECOMENTARIOS);
  Application.CreateForm(TMESYANIO, MESYANIO);
  Application.CreateForm(TFRMFECHASDESDEYHASTAS, FRMFECHASDESDEYHASTAS);
  Application.CreateForm(Tfrrubromasvendido, frrubromasvendido);
  Application.CreateForm(TFRMBUSCAFACTPARANC, FRMBUSCAFACTPARANC);
  Application.CreateForm(TFRMIVAVENTA, FRMIVAVENTA);
  Application.CreateForm(TFRMINGRESARINVENTARIO, FRMINGRESARINVENTARIO);
  Application.CreateForm(Taltavendedores, altavendedores);
  Application.CreateForm(TNUEVOVENDEDOR, NUEVOVENDEDOR);
  Application.CreateForm(Tbuscarcliente, buscarcliente);
  Application.CreateForm(TcomisionesVendedores, comisionesVendedores);
  Application.CreateForm(Tverventas, verventas);
  Application.CreateForm(Tventaporvendedor, ventaporvendedor);
  Application.CreateForm(Tbuscaryverfacturas, buscaryverfacturas);
  Application.CreateForm(Tdetallefactura, detallefactura);
  Application.CreateForm(TlistarClientesDeudores, listarClientesDeudores);
  Application.CreateForm(TREALIZARDEVOLUCIONES, REALIZARDEVOLUCIONES);
  Application.CreateForm(TfrmProgreso, frmProgreso);
  Application.CreateForm(TfrmDisenioTicketA4, frmDisenioTicketA4);
  Application.CreateForm(TFRMDEVOLCUIONESTOTT, FRMDEVOLCUIONESTOTT);
  Application.CreateForm(TIMPRIMIRSTOCKCARGA, IMPRIMIRSTOCKCARGA);
  Application.CreateForm(TIMPRIMIRARTICULOS, IMPRIMIRARTICULOS);
  Application.CreateForm(TimprimeVentasVendedor, imprimeVentasVendedor);
  Application.CreateForm(Tlistadeprecio, listadeprecio);
  Application.CreateForm(TCONSULTARPRECIO, CONSULTARPRECIO);
  Application.CreateForm(TfrmTicket58, frmTicket58);
  Application.CreateForm(TdisenioimprimirFactura58, disenioimprimirFactura58);
  Application.CreateForm(TfrmConsultarPrecioDescrip, frmConsultarPrecioDescrip);
  Application.CreateForm(TfrmActualizaPrecioporProveedor, frmActualizaPrecioporProveedor);
  Application.CreateForm(TfrmActualizaindivualARticulo, frmActualizaindivualARticulo);
  Application.CreateForm(Tfrminformex80, frminformex80);
  Application.CreateForm(Tfrmcierrex58mm, frmcierrex58mm);
  Application.CreateForm(TfrmdiseniocierreCaja58, frmdiseniocierreCaja58);
  Application.Run;
end.
