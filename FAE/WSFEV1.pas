unit WSFEV1;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  INIFILES,
  Dialogs, SQLEXPR,StdCtrls, Grids, DBGrids, DB, Buttons, ExtCtrls,ActiveX, ComObj,Registry,xmldom, XMLIntf, msxmldom, XMLDoc,
       MSXML, InvokeRegistry, Rio, SOAPHTTPClient,
       {OraCall,} DateUtils, {Data.Win.ADODB, }
 DBAccess, {Ora,}  RxMemDS, MemDS,
  Vcl.Menus,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

 type
tfacturaE = class
  protected
  sql:string;
  public
  PARAR_SERVICIO_FACTURACION:BOOLEAN;
   sistema_operativo,CUIT_EMPRESA_CONEXION,MODO_FAE,carpeta,SE_FACTURA:string;
   CERTIFICADO_PRODUCCION,CLAVE_PRODUCCION ,CERTIFICADO_HOMOLOGACION ,CLAVE_HOMOLOGACION:string;
     FA_SMTP:STRING;
     FA_FROM_NAME,FA_FROM_ADDRESS:STRING;
     FA_USUARIO:STRING;
     FA_PASSWORD:STRING;
     FA_PUERTO:STRING;

  ESTA_CONECTADO_CON_AFIP:BOOLEAN;
  Autenticacion_Autorizacion_CONTROL:BOOLEAN;
       Token ,Sign:string;
   Rcupera_Fecha_Comprobante:string;
  Recupera_Fecha_Vencimiento:string;
  Recupera_Importe_Total:string;

   cae_recuperado:string;

   estado_servidor1,estado_servidor2,estado_servidor3,error_cae,mensaje_de_conexion:string;
   numero_facA,numero_facB,numero_facC,numero_ndA,numero_ndB,numero_ndC,numero_NCA,numero_ncB,numero_NcC:longint;
    vencimiento_autori:string;
  resultado_autori:string;
  motivo_autori:string;
  reprocesado,resultado_fae:string;
  numero_devuelto_factura,NRO_COMPROBANTE_APROBADO:longint;
        Estado_autentica, estado_bd,estado_servidor:String;
   fecha_vence:string;
  ARCHI_FIRMA:TEXTFILE;
   numero_fac,punto_fac:longint;   modifico_numero:string;
  WSAA, WSFE,WSFEv1: Variant;
  tra, path, Certificado, ClavePrivada, cms, ta, estado_codigo: String;
  qty, LastId, LastCBTE, cae, ok : Variant;
  tipo_cbte, punto_vta, tipo_doc, presta_serv, id,
  cbt_desde, cbt_hasta : Integer;
  fecha, nro_doc, imp_total, imp_tot_conc, imp_neto, impto_liq,
    impto_liq_rni, imp_op_ex, fecha_cbte, fecha_venc_pago,
    fecha_serv_desde, fecha_serv_hasta, venc,error_motivo,error_recha : String;
    cbte_nro:longint;
     cache,VERSION:string;    proxima_ncb_3,proxima_nca_3,proxima_ncb_2 ,proxima_nca_2:longint;
wsdl:string;
proxy,service:string;
           ttl,PUNTOVENTAFAE:longint;
      AUTOMATICO:STRING;
  TIEMPO_CONTRO:LONGINT;
    OBSERVACIONES_CAE:STRING;
    concepto,ULTIMO :longint;
imp_iva :string;
imp_trib :string;
moneda_id :string;
moneda_ctz :string;
DIRFAE:string;
 mensaje_autenticacion:string;
 respuesta:string;
base_imp :string;
importeiva_10,importeiva_21:string;
importe,alic :string;
proxima_Fa_2:LONGINT;
  proxima_Fb_2:LONGINT;

   proxima_Fa_3:LONGINT;
  proxima_Fb_3:LONGINT;
archi:textfile;
 HORA_EXPIRA_TIEMPO:LONGINT;
CUIT_EMPRESA,RAZON_SOCIAL:STRING;
function actualizar_numero(tipo,punto,numero:longint;CUIT:STRING):boolean;
 PROCEDURE Inicializar;
 PROCEDURE  FinFae;
 Function Autenticar(modo,carpeta,cuit,certificado_produ,key_produ:string):boolean;
 function Control_servidores(token,sign,modo,cuit:string):boolean;
 FUNCTION LEER_PARAMETROS(planta:longint):BOOLEAN;
 function Conexion_Servidor_facturacion(token,sign,modo:string):boolean;
 function crea_archivo(nro_movimiento:longint;letra_tipo:string; p_punto_vta :longint;p_presta_serv :longint; p_tipo_doc :string;p_nro_doc :string;p_imp_total :string;p_imp_tot_conc :string; p_imp_neto :string;
  p_impto_liq :string; p_impto_liq_rni :string;p_imp_op_ex :string; p_fecha_cbte :string;p_fecha_venc_pago :string; p_fecha_serv_desde :string;p_fecha_serv_hasta :string ;nro_comprobante_valida:longint;iva10,iva21,
  iva27, IVA0,IMPORTE_PARA10_s,IMPORTE_PARA21_s,IMPORTE_PARA27_s, IMPORTE_PARA0_S,SIN_IVA,CARPETA:string
):boolean;
 function CONSULTA_COMPROBANRTES_APROBADOS(PVvv,numero,tipo:string):boolean;
function Envio_factura(nro_movimiento:longint;modo,iva10,iva21,iva27,IMPORTE_PARA10_s,IMPORTE_PARA21_s,IMPORTE_PARA27_s:string):boolean;
 function  consultas_numeros_FACTURAS(modo:string):boolean;

function  consultas_numeros(modo:string):boolean;


 function procesar_comprobantepANADERIA(CODFACTU:LONGINT;fecha,moneda_id,moneda_ct,token,sign,cuit_empresa:STRING;Connection1: TFDConnection;imp_total,imp_neto,imp_iva,MODO,NRONC:STRING;ES_FACTURA_C:BOOLEAN):boolean;

 end;


implementation

function tfacturaE.actualizar_numero(tipo,punto,numero:longint;CUIT:STRING):boolean;
begin


end;



function  tfacturaE.consultas_numeros(modo:string):boolean;
begin

   WSFEv1 := CreateoleObject('WSFEv1');
   VErsion:=WSFEv1.version;

   WSFEv1.Token :=token ;
   WSFEv1.Sign := sign ;


   WSFEv1.Cuit :=TRIM(cuit_empresa);

  //' Conectar al Servicio Web de Facturación
  IF sistema_operativo='32' THEN
      BEGIN
            if modo='P' then
               //  ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
               // ok := WSFEv1.Conectar('','file:///C:/Archivos de programa/WSFEV1/wsfev1_wsdl.xml')
              ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
    END ELSE
    BEGIN
       if modo='P' then
                 //ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
                   ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
   END;


 if not ok then
    begin
        respuesta:='Error de Comunicación. No se puede conectar con AFIP con WSFEv1.';
      exit;
  end;

  proxima_nca_2:=WSFEv1.CompUltimoAutorizado(3, 2) + 1;
  proxima_ncb_2:=WSFEv1.CompUltimoAutorizado(8, 2) + 1;

   proxima_nca_3:=WSFEv1.CompUltimoAutorizado(3, 3) + 1;
  proxima_ncb_3:=WSFEv1.CompUltimoAutorizado(8, 3) + 1;

end;



function  tfacturaE.consultas_numeros_FACTURAS(modo:string):boolean;
begin

   WSFEv1 := CreateoleObject('WSFEv1');
   VErsion:=WSFEv1.version;

   WSFEv1.Token :=token ;
   WSFEv1.Sign := sign ;


   WSFEv1.Cuit :=TRIM(cuit_empresa);

  //' Conectar al Servicio Web de Facturación
  IF sistema_operativo='32' THEN
      BEGIN
            if modo='P' then
               //  ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
               // ok := WSFEv1.Conectar('','file:///C:/Archivos de programa/WSFEV1/wsfev1_wsdl.xml')
              ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
    END ELSE
    BEGIN
       if modo='P' then
                 //ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
                   ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
   END;


 if not ok then
    begin
        respuesta:='Error de Comunicación. No se puede conectar con AFIP con WSFEv1.';
      exit;
  end;

  proxima_Fa_2:=WSFEv1.CompUltimoAutorizado(1, 2) + 1;
  proxima_Fb_2:=WSFEv1.CompUltimoAutorizado(6, 2) + 1;

   proxima_Fa_3:=WSFEv1.CompUltimoAutorizado(1, 3) + 1;
  proxima_Fb_3:=WSFEv1.CompUltimoAutorizado(6, 3) + 1;

end;





function tfacturaE.procesar_comprobantepANADERIA(CODFACTU:LONGINT;fecha,moneda_id,moneda_ct,token,sign,cuit_empresa:STRING; Connection1: TFDConnection;imp_total,imp_neto,imp_iva,MODO,NRONC:STRING;ES_FACTURA_C:BOOLEAN):boolean;
    VAR OK:BOOLEAN;
       aQ:TSQLQuery;    direct1,direct2,facturaBuscar,tipofacbuscar:string;
       { aqQ:TORAQUERY;}   numfa:longint;
       xml_enviado,xml_recibo:textfile;    cae_recupero,doc_recupero,tipodco_recupero,fechavence_recupero:string;
    {   OraQuery1: TOraQuery; }     EJERCICI:longint;
        { ADOQuery1: TADOQuery;  }
         pto_vta_fact_ASOC,OBSERVACIONES_CAE:STRING;
         IMPORTE_PARA21_s,IVA21:STRING;
          FDQuery4: TFDQuery;   procesar_comprobante:BOOLEAN;

          IDCLIENTE:LONGINT;
          tipo_cbte_fact_aSOC:LONGINT;nro_fact_ASO:STRING;
    begin
  FDQuery4:=TFDQuery.Create(NIL);
  FDQuery4.Connection:=Connection1;
  FDQuery4.Close;
  FDQuery4.SQL.Clear;
  FDQuery4.SQL.Add('SELECT SUM(PUNI) AS PU, SUM(IVA) AS IV, SUM(PTOTAL) AS PT FROM TITEM_FACTURA WHERE IDFACTURA ='+INTTOSTR(CODFACTU));
  FDQuery4.Open;

  imp_total:= imp_total;

  imp_tot_conc  := '0.00';

  imp_neto  := imp_neto;


  imp_iva  := imp_iva;

  imp_trib  :='0.00';

  imp_op_ex  := '0.00';

  FDQuery4.Free;


    FDQuery4:=TFDQuery.Create(NIL);
  FDQuery4.Connection:=Connection1;
  FDQuery4.Close;
  FDQuery4.SQL.Clear;
  FDQuery4.SQL.Add('SELECT * FROM TMOVIMIENTOS WHERE IDMOVIMIENTO ='+INTTOSTR(CODFACTU));
  FDQuery4.Open;
  IDCLIENTE:=FDQuery4.FieldByName('IDCLIENTE').ASINTEGER;
  if TRIM(FDQuery4.FieldByName('TIPOMOVIMIENTO').AsString)='1' then
     tipo_cbte:=1;
   if TRIM(FDQuery4.FieldByName('TIPOMOVIMIENTO').AsString)='2' then
     tipo_cbte:=6;
   if TRIM(FDQuery4.FieldByName('TIPOMOVIMIENTO').AsString)='4' then
     tipo_cbte:=3;
     if TRIM(FDQuery4.FieldByName('TIPOMOVIMIENTO').AsString)='5' then
     tipo_cbte:=8;
       if TRIM(FDQuery4.FieldByName('TIPOMOVIMIENTO').AsString)='3' then
     tipo_cbte:=11;
         if TRIM(FDQuery4.FieldByName('TIPOMOVIMIENTO').AsString)='6' then
     tipo_cbte:=13;



   FDQuery4:=TFDQuery.Create(NIL);
  FDQuery4.Connection:=Connection1;
  FDQuery4.Close;
  FDQuery4.SQL.Clear;
  FDQuery4.SQL.Add('SELECT   puntoventa FROM tconfiguracion');
  FDQuery4.Open;

     FDQuery4.Free;
   if MODO='P' then
       punto_vta:=FDQuery4.FieldByName('puntoventa').Asinteger
       ELSE
       punto_vta:=1998;

   id:=3;
TRY

  { if (tipo_cbte=1) or (tipo_cbte=3) then
   begin
        if tipo_doc<>80 then
        begin
            procesar_comprobantepANADERIA:=false;
          OBSERVACIONES_CAE:='GRAVE. NO PUEDE GENERAR COMPROBANTES TIPO (A) SIN CUIT.';
          PARAR_SERVICIO_FACTURACION:=true;
          EXIT;
        end;
   end;  }


     pto_vta_fact_ASOC:=inttostr(punto_vta);

     PARAR_SERVICIO_FACTURACION:=FALSE;
     direct1:=getcurrentdir+'\xml_recibido.xml';
     direct2:=getcurrentdir+'\xml_enviado.xml';

     assignfile(xml_enviado,direct1);
     assignfile(xml_recibo,direct2);

     WSFEv1 := CreateoleObject('WSFEv1');
     VErsion:=WSFEv1.version;

     WSFEv1.Token :=token ;
     WSFEv1.Sign :=sign ;
     WSFEv1.Cuit :=TRIM(cuit_empresa);

  //' Conectar al Servicio Web de Facturación
     IF sistema_operativo='32' THEN
       BEGIN
            if modo='P' then
                     ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
       END ELSE
        BEGIN
            if modo='P' then
                       ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
        END;


     if not ok then
       begin

            PARAR_SERVICIO_FACTURACION:=TRUE;
           respuesta:='Error de Comunicación. No se puede conectar con AFIP con WSFEv1.';
            exit;
       end;



       try
         ULTIMO:=WSFEv1.CompUltimoAutorizado(tipo_cbte, punto_vta) + 1;
       except
         respuesta:='Error de AFIP al invocar compultimoautorizado.';
         OBSERVACIONES_CAE:=trim(WSFEv1.ErrMsg)+' '+trim(wsfev1.Obs)+'.'+respuesta;
         PARAR_SERVICIO_FACTURACION:=TRUE;

       end;


     numfa:=ULTIMO - 1;




   fecha_cbte:=fecha;
   fecha_venc_pago:=fecha;
   fecha_serv_desde:=fecha;
   fecha_serv_hasta:=fecha;






  if  PARAR_SERVICIO_FACTURACION=false then
  begin
       cbt_desde:=ultimo;
       cbt_hasta:=ultimo;
       imp_total  := StringReplace(imp_total, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

       imp_tot_conc  := StringReplace(imp_tot_conc, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

       imp_neto  := StringReplace(imp_neto, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);


       imp_iva  := StringReplace(imp_iva, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

        imp_trib  := StringReplace(imp_trib, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

       imp_op_ex  := StringReplace(imp_op_ex, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

  {if IDCLIENTE=0 then
      IDCLIENTE:=2; }

  FDQuery4:=TFDQuery.Create(NIL);
  FDQuery4.Connection:=Connection1;
  FDQuery4.Close;
  FDQuery4.SQL.Clear;
  FDQuery4.SQL.Add('SELECT * FROM TCLIENTES WHERE IDCLIENTE ='+INTTOSTR(IDCLIENTE));
  FDQuery4.Open;
  tipo_doc:=FDQuery4.FieldByName('TIPODOC').AsInteger;
  nro_doc:=TRIM(FDQuery4.FieldByName('NRODOC').AsSTRING);

 FDQuery4.Free;

       ok := WSFEv1.CrearFactura(id, tipo_doc, nro_doc, tipo_cbte, punto_vta,
                                 cbt_desde, cbt_hasta, imp_total, imp_tot_conc, imp_neto,
                                 imp_iva, imp_trib, imp_op_ex, fecha_cbte, fecha_venc_pago,
                                 fecha_serv_desde, fecha_serv_hasta,
                                 moneda_id, '1.000');





      if not OK then
      begin
        procesar_comprobantepANADERIA:=false;
         respuesta:='No se pudo enviar la Factura a AFIP.';
          EXIT;
     end;



    { if trim(iibbCaba)<>'0' then
     begin
       base_imp := IMPORTE_PARA21_s ;
       base_imp  := StringReplace(base_imp, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

       importe  := StringReplace(iibbCaba, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

       alic:=TASA_IIBB_CABA;
        alic:=StringReplace(alic, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]) ;

      id:=7;
      ok :=WSFEv1.AgregarTributo(id, 'Percep. IIBB CABA', base_imp, alic, importe)
     end;

     if trim(iibbProv)<>'0' then
     begin
        base_imp := IMPORTE_PARA21_s ;
        base_imp  := StringReplace(base_imp, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

       importe  := StringReplace(iibbProv, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

        alic:=TASA_IIBB_PROV;
        alic:=StringReplace(alic, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]) ;
         id:=7;
        ok := WSFEv1.AgregarTributo(id, 'Percep. IIBB PROV BS AS.', base_imp, alic, importe)
     end  ;  }


 if ES_FACTURA_C=FALSE then
 BEGIN

     importeiva_10:='0';
     importeiva_21:='0';
    // IVA 21%
  FDQuery4:=TFDQuery.Create(NIL);
  FDQuery4.Connection:=Connection1;
  FDQuery4.Close;
  FDQuery4.SQL.Clear;
  FDQuery4.SQL.Add('SELECT SUM(PUNI) AS PU, SUM(IVA) AS IV, SUM(PTOTAL) AS PT FROM TITEM_FACTURA WHERE IDFACTURA ='+INTTOSTR(CODFACTU)+' AND POR_IVA=''21'' ');
  FDQuery4.Open;
  IMPORTE_PARA21_s:=TRIM(FDQuery4.FieldByName('PU').AsString);
  iva21:=TRIM(FDQuery4.FieldByName('IV').AsString);
     if (trim(IMPORTE_PARA21_s)<>'') and  (trim(IMPORTE_PARA21_s)<>'0.00')  then
      begin



         id := 5; //
         base_imp := IMPORTE_PARA21_s ;
         importe :=  iva21;
          importe  := StringReplace(importe, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

         importeiva_21:=importe;

       base_imp  := StringReplace(base_imp, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

         ok := WSFEv1.AgregarIva(id, base_imp, importe);
     end;



       // IVA 10%
  FDQuery4:=TFDQuery.Create(NIL);
  FDQuery4.Connection:=Connection1;
  FDQuery4.Close;
  FDQuery4.SQL.Clear;
  FDQuery4.SQL.Add('SELECT SUM(PUNI) AS PU, SUM(IVA) AS IV, SUM(PTOTAL) AS PT FROM TITEM_FACTURA WHERE IDFACTURA ='+INTTOSTR(CODFACTU)+' AND POR_IVA=''10.5'' ');
  FDQuery4.Open;
  IMPORTE_PARA21_s:=TRIM(FDQuery4.FieldByName('PU').AsString);
  iva21:=TRIM(FDQuery4.FieldByName('IV').AsString);
     if (trim(IMPORTE_PARA21_s)<>'') and  (trim(IMPORTE_PARA21_s)<>'0.00')  then
      begin



         id := 4; //
         base_imp := IMPORTE_PARA21_s ;
         importe :=  iva21;
          importe  := StringReplace(importe, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

        importeiva_10:=importe;

       base_imp  := StringReplace(base_imp, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]);

         ok := WSFEv1.AgregarIva(id, base_imp, importe);
     end;

 END;



     if ((tipo_cbte=3) or (tipo_cbte=8) OR (tipo_cbte=13)) then
      begin
          if tipo_cbte=3 then
            tipo_cbte_fact_aSOC:=1;
           if tipo_cbte=8 then
             tipo_cbte_fact_aSOC:=6;
            if tipo_cbte=13 then
               tipo_cbte_fact_aSOC:=11;

         ok:= WSFEv1.AgregarCmpAsoc(tipo_cbte_fact_aSOC, pto_vta_fact_ASOC,strtoint(NRONC) );
      end;


      try
         cae := WSFEv1.CAESolicitar;

          rewrite(xml_enviado) ;
          writeln(xml_enviado,WSFEv1.XmlResponse);
          closefile(xml_enviado);


          rewrite(xml_recibo) ;
          writeln(xml_recibo,WSFEv1.XmlRequest);
          closefile(xml_recibo);
              OBSERVACIONES_CAE:=trim(WSFEv1.ErrMsg)+' '+trim(wsfev1.Obs);
          // SHOWMESSAGE(OBSERVACIONES_CAE);

          if (WSFEv1.Resultado='R') or (cae='') then
           begin



              procesar_comprobante:=false;
              OBSERVACIONES_CAE:=trim(WSFEv1.ErrMsg)+' '+trim(wsfev1.Obs);

              rewrite(xml_enviado) ;
              writeln(xml_enviado,WSFEv1.XmlResponse);
              closefile(xml_enviado);


              rewrite(xml_recibo) ;
              writeln(xml_recibo,WSFEv1.XmlRequest);
              closefile(xml_recibo);
              SHOWMESSAGE(OBSERVACIONES_CAE);
          end
          ELSE
             BEGIN
                 fecha_vence:=WSFEv1.Vencimiento;



                  FDQuery4:=TFDQuery.Create(NIL);
                   Connection1.StartTransaction;
                   TRY
                  FDQuery4.Connection:=Connection1;
                  FDQuery4.Close;
                  FDQuery4.SQL.Clear;
                    if ((tipo_cbte=3) OR (tipo_cbte=8) OR (tipo_cbte=13)) then
                    BEGIN

                  FDQuery4.SQL.Add('UPDATE TMOVIMIENTOS SET iva='+floattostr(strtofloat(importeiva_21)*-1)+', NROFACTURA='+INTTOSTR(ULTIMO)+', CAE='+#39+CAE+#39+', FECHAVENCE='+#39+TRIM(fecha_vence)+#39+', iva10='+floattostr(strtofloat(importeiva_10)*-1)+' WHERE IDMOVIMIENTO ='+INTTOSTR(CODFACTU));
                   END ELSE BEGIN
                       FDQuery4.SQL.Add('UPDATE TMOVIMIENTOS SET iva='+floattostr(strtofloat(importeiva_21))+', NROFACTURA='+INTTOSTR(ULTIMO)+', CAE='+#39+CAE+#39+', FECHAVENCE='+#39+TRIM(fecha_vence)+#39+', iva10='+floattostr(strtofloat(importeiva_10))+' WHERE IDMOVIMIENTO ='+INTTOSTR(CODFACTU));
                   END;
                  FDQuery4.ExecSQL;
                  Connection1.Commit;
                   EXCEPT
                     Connection1.Rollback;
                   END;

                  FDQuery4.Free;

                  procesar_comprobantepANADERIA:=TRUE;

                  OBSERVACIONES_CAE:='APROBADA';
                 SHOWMESSAGE(OBSERVACIONES_CAE);
            END;


      except
       procesar_comprobantepANADERIA:=false;
       OBSERVACIONES_CAE:='Error Grave de funcion de CAE';

       rewrite(xml_enviado) ;
       writeln(xml_enviado,WSFEv1.XmlResponse);
       closefile(xml_enviado);


       rewrite(xml_recibo) ;
       writeln(xml_recibo,WSFEv1.XmlRequest);
       closefile(xml_recibo);
     end;


    end;


   // end;//control numero
   EXCEPT
      procesar_comprobantepANADERIA:=false;
     OBSERVACIONES_CAE:=trim(WSFEv1.ErrMsg)+' '+trim(wsfev1.Obs);
   END;

 end;



function tfacturaE.CONSULTA_COMPROBANRTES_APROBADOS(PVvv,numero,tipo:string):boolean;
VAR OK:BOOLEAN;
    sxml,cadena:string;

  HTTPRIO: THTTPRIO;
  defWSDL:string;
  defURL :string;
  defSvc:string;
  defPrt,xml:string;
  err, str: string;
    req: TStringStream;
    strings: TStringList;
    recieveID: integer;
    request, response: TStringStream;
   FECHADESDE,FECHAHASTA,FDesde,fHasta:string;
   MyText: TStringlist;
    fecha : string;
  Tfecha1 : TDateTime;
  Tfecha2 : TDateTime;


   mdate, mdate1:tdatetime;
   hora:integer;

begin
    HTTPRIO:=THTTPRIO.Create(application);

    defWSDL:='https://servicios1.afip.gov.ar/wsfev1/service.asmx?WSDL';
    defURL :='https://servicios1.afip.gov.ar/wsfev1/service.asmx';
    defSvc:= 'Service';
    defPrt:= 'ServiceSoap';  //ServiceSoap12
    HTTPRIO.WSDLLocation:=defWSDL;
    HTTPRIO.Service:=defSvc;
    HTTPRIO.Port:=defPrt;
    HTTPRIO.URL:=defURL;
    HTTPRIO.HTTPWebNode.SoapAction :='http://ar.gov.afip.dif.FEV1/FECompUltimoAutorizado';



sxml:='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ar="http://ar.gov.afip.dif.FEV1/">'+
   '<soapenv:Header/>'+
   '<soapenv:Body>'+
      '<ar:FECompConsultar>'+
          '<ar:Auth>'+
            '<ar:Token>'+trim(token)+'</ar:Token>'+
            '<ar:Sign>'+trim(Sign)+'</ar:Sign>'+
            '<ar:Cuit>30714930490</ar:Cuit>'+
         '</ar:Auth>'+
         '<ar:FeCompConsReq>'+
            '<ar:CbteTipo>6</ar:CbteTipo>'+
            '<ar:CbteNro>26611</ar:CbteNro>'+
            '<ar:PtoVta>2</ar:PtoVta>'+
         '</ar:FeCompConsReq>'+
      '</ar:FECompConsultar>'+
   '</soapenv:Body>'+
'</soapenv:Envelope>';


 sxml:='<?xml version="1.0" encoding="utf-8"?>'+
'<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'+
  '<soap:Body>'+
    '<FECompConsultar xmlns="http://ar.gov.afip.dif.FEV1/">'+
      '<Auth>'+
        '<Token>'+trim(token)+'</Token>'+
        '<Sign>'+trim(Sign)+'</Sign>'+
        '<Cuit>30714930490</Cuit>'+
      '</Auth>'+
      '<FeCompConsReq>'+
        '<CbteTipo>6</CbteTipo>'+
        '<CbteNro>26611</CbteNro>'+
        '<PtoVta>2</PtoVta>'+
      '</FeCompConsReq>'+
    '</FECompConsultar>'+
  '</soap:Body>'+
'</soap:Envelope>';



strings := TStringList.Create;
strings.Text := sxml;

request := TStringStream.Create(strings.GetText);
response := TStringStream.Create('');

MyText:= TStringlist.create;
MyText.LoadFromStream(request);
MyText.SaveToFile(ExtractFilePath(Application.ExeName)  +'CONSULTA_COMPROBANTE_AFIP.xml');
MyText.Free;



 {
recieveID :=HTTPRIO.HTTPWebNode.Send(request);           //Request

HTTPRIO.HTTPWebNode.Receive(recieveID,response,false);    //Response

  }
response.Position := 0;


MyText:= TStringlist.create;
MyText.LoadFromStream(response);
MyText.SaveToFile(ExtractFilePath(Application.ExeName)   +'RESPUESTA_COMPROBANTE.xml');
MyText.Free;




strings.Free;
request.Free;
response.Free;

 end;


function tfacturaE.Envio_factura(nro_movimiento:longint;modo,iva10,iva21,iva27,IMPORTE_PARA10_s,IMPORTE_PARA21_s,IMPORTE_PARA27_s:string):boolean;
var fe:tdate;
F1,F2,F3:STRING;
type
Tresquet=record
  R_tipo_cbte:longint;     //001 A, 002 ND A , 003 NC A , 006 B, 007 ND B, 008 NC B, 011  c , 012 ND c, 013 NC c,
  R_punto_vta :longint;
  R_presta_serv :longint; // tipo de producto q factura 1: productos
  R_tipo_doc :longint;
  R_nro_doc :string[50];   //cuit cliente
  R_imp_total :string[50];  // importe con iva
  R_imp_tot_conc :string[50];
  R_imp_neto :string[50];   // importe sin iva
  R_impto_liq :string[50];  // importe iva
  R_impto_liq_rni :string[50];             // importe tributario
  R_imp_op_ex :string[50];
  R_fecha_cbte :string[50];
  R_fecha_venc_pago :string[50];
  R_fecha_serv_desde :string[50];
  R_fecha_serv_hasta :string[50];
    r_iva10:string[20];
  r_iva21:string[20];
  r_iva27:string[20];
   r_iva0:string[20];
    R_IMPORTE_PARA10_s:string[50];
  R_IMPORTE_PARA21_s:string[50];
  R_IMPORTE_PARA27_s:string[50];
  R_IMPORTE_PARA0_s:string[50];
  R_SIN_IVA:STRING[3];
  end;

  var r_archivo: file of Tresquet;
    ra:Tresquet;
    directorio:string;
    XMLRESp,XMLREq:TEXTFILE;
    directorio1,directorio2:STRING;
 begin
IF Conexion_Servidor_facturacion(token,sign,modo)=TRUE THEN
  BEGIN
  // leo el archivo
   directorio:=GetCurrentDir + '\Fe\Dat\'+inttostr(nro_movimiento)+'.dat';
      directorio1:=GetCurrentDir + '\XmlRequest.txt';
      directorio2:=GetCurrentDir + '\XmlResponse.txt';



    assignfile(XMLRESp,directorio2);
    assignfile(XMLREq,directorio1);

   assignfile(r_archivo,directorio);
   reset(r_archivo);
   read(r_archivo,ra);

  tipo_cbte := ra.R_tipo_cbte;     //001 A, 002 ND A , 003 NC A , 006 B, 007 ND B, 008 NC B, 011  c , 012 ND c, 013 NC c,
  punto_vta := ra.R_punto_vta;

      punto_vta := 6;


  // Recupero último número de comprobante para un punto de venta y tipo (opcional)
    //LastCBTE := WSFE.RecuperaLastCMP(punto_vta, tipo_cbte);
    LastCBTE :=WSFEv1.CompUltimoAutorizado(tipo_cbte, punto_vta) + 1;
    NRO_COMPROBANTE_APROBADO:=LastCBTE;
  // Establezco los valores de la factura o lote a autorizar:
 // fe:=strtodate(ra.R_fecha_cbte);

  F1:=COPY(ra.R_fecha_cbte,1,4);
  F2:=COPY(ra.R_fecha_cbte,6,2);
  F3:=COPY(ra.R_fecha_cbte,9,2);
  FECHA:=F1+F2+F3;
  DateTimeToString(Fecha, 'yyyymmdd', date);
  id :=  ra.R_presta_serv;//3
  presta_serv := ra.R_presta_serv; // tipo de producto q factura 1: productos
  tipo_doc := ra.R_tipo_doc;
  nro_doc := ra.R_nro_doc;   //cuit cliente
  numero_devuelto_factura:= LastCBTE;
  cbt_desde := LastCBTE;  // numero fact
  cbt_hasta := LastCBTE;  // numero fact
  imp_total := ra.R_imp_total;  // importe con iva
  imp_tot_conc := ra.R_imp_tot_conc;
  imp_neto := ra.R_imp_neto;   // importe sin iva
  imp_iva := ra.R_impto_liq;  // importe iva
  impto_liq_rni :=ra.R_impto_liq_rni;             // importe tributario
  imp_op_ex :=ra.R_imp_op_ex;
  fecha_cbte := Fecha;
  fecha_venc_pago := Fecha;
  // Fechas del período del servicio facturado (solo si presta_serv = 1)
  fecha_serv_desde := Fecha;
  fecha_serv_hasta := Fecha;
  moneda_id := 'PES';
moneda_ctz := '1.000';
  // Llamo al WebService de Autorización para obtener el CAE




 {
imp_total:='121.00';
imp_tot_conc:= '0.00';
imp_neto:= '100.00';
imp_iva:= '21.00';
imp_trib:='0.00';
imp_op_ex:= '0.00';  }


  imp_tot_conc:='0.00';
  imp_trib:='0.00';



    ok := WSFEv1.CrearFactura(id, tipo_doc, nro_doc, tipo_cbte, punto_vta,
    cbt_desde, cbt_hasta, imp_total, imp_tot_conc, imp_neto,
     imp_iva, imp_trib, imp_op_ex, fecha_cbte, fecha_venc_pago,
    fecha_serv_desde, fecha_serv_hasta,
    moneda_id, moneda_ctz);





   if not OK then
    begin
      Envio_factura:=false;
      respuesta:='No se pudo enviar la Factura a AFIP.';
       EXIT;
   end;






 // IVA 21%
 if (trim(IMPORTE_PARA21_s)<>'') and  (trim(IMPORTE_PARA21_s)<>'0.00')  then
 begin
id := 5; //
base_imp := IMPORTE_PARA21_s ;
importe :=  iva21;
ok := WSFEv1.AgregarIva(id, base_imp, importe);

end;
   
{
 // IVA 0%
id := 3; //
base_imp := imp_neto;
importe := imp_iva;
ok := WSFEv1.AgregarIva(id, base_imp, importe);
}

 // IVA 10.5%
  if (trim(IMPORTE_PARA10_s)<>'') and  (trim(IMPORTE_PARA10_s)<>'0.00')  then
 begin
id := 4; //
base_imp := IMPORTE_PARA10_s;
importe :=  iva10;
ok := WSFEv1.AgregarIva(id, base_imp, importe);
end;


 // IVA 27%
  if (trim(IMPORTE_PARA27_s)<>'') and  (trim(IMPORTE_PARA27_s)<>'0.00')  then
 begin
id := 6; //
base_imp := IMPORTE_PARA27_s;
importe :=  iva27;
ok := WSFEv1.AgregarIva(id, base_imp, importe);
end;






try
cae := WSFEv1.CAESolicitar;

except
 rewrite(XMLRESp);
writeln(XMLRESp,WSFEv1.XmlResponse);
closefile(XMLRESp);


rewrite(XMLREq);
writeln(XMLREq,WSFEv1.XmlRequest);
closefile(XMLREq);
end;







   if (WSFEv1.Resultado='R') or (cae='') then
    begin

     { case   WSFEv1.Motivo of
    00: error_motivo:='no hay error';
    01: error_motivo:='CUIT informada no es R.I. ';
    02: error_motivo:='CUIT no autorizada a facturar electrónicamente?WSFE.Motivo = "03": CUIT registra inconvenientes con domicilio fiscal ';
    04: error_motivo:='Punto de venta no se encuentra declarado ';
    05: error_motivo:='Fecha del comprobante incorrecta';
    06: error_motivo:='CUIT no puede emitir comprobantes clase A';
    07: error_motivo:='para comprobantes clase A debe indicar CUIT ';
    08: error_motivo:='CUIT informada es inválida';
    09: error_motivo:='CUIT informada no existe en el padrón';
    10: error_motivo:='CUIT informada no corresponde a un R.I.';
    11: error_motivo:='el nº de comprobante no es correlativo o fecha no corresponde';
    12: error_motivo:='el rango informado se encuentra autorizado';
     end;  }


       Envio_factura:=false;
       SHOWMESSAGE('LA AFIP NO AUTORIZO LA FACTURA.'+trim(WSFEv1.ErrMsg)+' '+trim(wsfev1.Obs));
       EXIT;
   end;

 Envio_factura:=TRUE;
  fecha_vence:=WSFEv1.Vencimiento;
  vencimiento_autori:='Vencimiento ' +  WSFEv1.Vencimiento; // Fecha de vencimiento o vencimiento de la autorización
  resultado_autori:='Resultado: ' + WSFEv1.Resultado; // A=Aceptado, R=Rechazado
 // 00= No hay error
  //error_recha:=WSFEv1.Motivo;
 // reprocesado:='Reprocesado? ' +  WSFEv1.Reproceso; // S=Si, N=No
  resultado_fae:=WSFEv1.Resultado;
  estado_codigo:='';
  {

   }
  IF  WSFEv1.Resultado='R' THEN
  BEGIN
  
  END;

  error_cae:='';
  // Verifico que no haya rechazo o advertencia al generar el CAE
  If cae = '' then
   error_cae:='La página esta caida o la respuesta es inválida'
  Else
    If (cae = 'NULL') or not (WSFEv1.Resultado = 'A') Then
      error_cae:='No se asignó CAE (Rechazado). ' ;//+ WSFEv1.Motivo
    {Else
      If (WSFEv1.Motivo <> 'NULL') and (WSFEv1.Motivo <> '00') Then
         error_cae:='Se asignó CAE pero con advertencias.';// + WSFEv1.Motivo;
  }
  // Imprimo respuesta XML para depuración (errores de formato)
  //WriteLn(WSFE.XmlResponse);

  //ShowMessage('CAE: ' + cae);



  //WriteLn('Presione Enter para terminar');
  //ReadLn;

   closefile(r_archivo);

END ELSE
BEGIN


   
       Envio_factura:=false;
       mensaje_de_conexion:='Error en Comunicación con la AFIP.';
      // EXIT;
END;





   end;




function tfacturaE.crea_archivo(nro_movimiento:longint;letra_tipo:string; p_punto_vta :longint;p_presta_serv :longint; p_tipo_doc :string;p_nro_doc :string;p_imp_total :string;p_imp_tot_conc :string; p_imp_neto :string;
  p_impto_liq :string; p_impto_liq_rni :string;p_imp_op_ex :string; p_fecha_cbte :string;p_fecha_venc_pago :string; p_fecha_serv_desde :string;p_fecha_serv_hasta :string ;nro_comprobante_valida:longint;iva10,iva21,
  iva27, IVA0,IMPORTE_PARA10_s,IMPORTE_PARA21_s,IMPORTE_PARA27_s, IMPORTE_PARA0_S,SIN_IVA,CARPETA:string
):boolean;
type
Tresquet=record
  R_tipo_cbte:longint;     //001 A, 002 ND A , 003 NC A , 006 B, 007 ND B, 008 NC B, 011  c , 012 ND c, 013 NC c,
  R_punto_vta :longint;
  R_presta_serv :longint; // tipo de producto q factura 1: productos
  R_tipo_doc :longint;
  R_nro_doc :string[50];   //cuit cliente
  R_imp_total :string[50];  // importe con iva
  R_imp_tot_conc :string[50];
  R_imp_neto :string[50];   // importe sin iva
  R_impto_liq :string[50];  // importe iva
  R_impto_liq_rni :string[50];             // importe tributario
  R_imp_op_ex :string[50];
  R_fecha_cbte :string[50];
  R_fecha_venc_pago :string[50];
  R_fecha_serv_desde :string[50];
  R_fecha_serv_hasta :string[50];
  r_nro_comprobante_valida:longint;
  r_iva10:string[20];
  r_iva21:string[20];
  r_iva27:string[20];
   r_iva0:string[20];
    R_IMPORTE_PARA10_s:string[50];
  R_IMPORTE_PARA21_s:string[50];
  R_IMPORTE_PARA27_s:string[50];
  R_IMPORTE_PARA0_s:string[50];
  R_SIN_IVA:STRING[3];
  end;




var r_archivo: file of Tresquet;
    ra:Tresquet;
    directorio:string;
begin

 if letra_tipo='A' then
    ra.R_tipo_cbte:=1;

 if letra_tipo='NDA' then
    ra.R_tipo_cbte:=2;

 if letra_tipo='NCA' then
    ra.R_tipo_cbte:=3;

 if letra_tipo='B' then
    ra.R_tipo_cbte:=6;

 if letra_tipo='NDB' then
    ra.R_tipo_cbte:=7;

 if letra_tipo='NCB' then
    ra.R_tipo_cbte:=8;

 if letra_tipo='C' then
    ra.R_tipo_cbte:=11;

 if letra_tipo='NDC' then
    ra.R_tipo_cbte:=12;

 if letra_tipo='NCC' then
    ra.R_tipo_cbte:=33;


   ra.R_punto_vta:=p_punto_vta;
   ra.R_presta_serv:=p_presta_serv;

   if p_tipo_doc='CUIT' THEN
   ra.R_tipo_doc:=80;

   if p_tipo_doc='DNI' THEN
   ra.R_tipo_doc:=96;





   ra.R_nro_doc:=p_nro_doc;
   ra.R_imp_total:=p_imp_total;
   ra.R_imp_tot_conc:=p_imp_tot_conc;
   ra.R_imp_neto:=p_imp_neto;
   ra.R_impto_liq:=p_impto_liq;
   ra.R_impto_liq_rni:=p_impto_liq_rni;
   ra.R_imp_op_ex:=p_imp_op_ex;
   ra.R_fecha_cbte:=p_fecha_cbte;
   ra.R_fecha_venc_pago:=p_fecha_venc_pago;
   ra.R_fecha_serv_desde:=p_fecha_serv_desde;
   ra.R_fecha_serv_hasta:=p_fecha_serv_hasta;
   ra.r_nro_comprobante_valida:= nro_comprobante_valida;
    ra.r_iva10:=iva10;
  ra.r_iva21:=iva21;
  ra.r_iva27:=iva27;
  RA.r_iva0:=IVA0;
    ra.R_IMPORTE_PARA10_s:=IMPORTE_PARA10_s;
  ra.R_IMPORTE_PARA21_s:=IMPORTE_PARA21_s;
  ra.R_IMPORTE_PARA27_s:=IMPORTE_PARA27_s;
  RA.R_IMPORTE_PARA0_s:=IMPORTE_PARA0_S;
  RA.R_SIN_IVA:=SIN_IVA;
directorio:=GetCurrentDir +'\'+CARPETA+'\Fe\Dat\'+inttostr(nro_movimiento)+'.dat';
assignfile(r_archivo,directorio);
rewrite(r_archivo);
write(r_archivo,ra);
closefile(r_archivo);

end;

function tfacturaE.Conexion_Servidor_facturacion(token,sign,modo:string):boolean;
begin
  WSFEv1 := CreateoleObject('WSFEv1');
   VErsion:=WSFEv1.version;

   WSFEv1.Token :=token ;
   WSFEv1.Sign := sign ;

   //' CUIT del emisor (debe estar registrado en la AFIP)
     WSFEv1.Cuit :=TRIM(CUIT_EMPRESA); //'30708601086';

  //' Conectar al Servicio Web de Facturación
   //' Conectar al Servicio Web de Facturación
  IF sistema_operativo='32' THEN
      BEGIN
            if modo='P' then
               //  ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
                ok := WSFEv1.Conectar('','file:///C:/Archivos de programa/WSFEV1/wsfev1_wsdl.xml')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
    END ELSE
    BEGIN
       if modo='P' then
                 ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
   END;

 if not ok then
    begin
        respuesta:='Error de Comunicación. No se puede conectar con AFIP con WSFEv1.';
      exit;
  end;








end;

FUNCTION tfacturaE.LEER_PARAMETROS(planta:longint):BOOLEAN;
var INI: TIniFile;
c:string;
begin
  // Creamos el archivo INI

  INI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');


  c:=ExtractFilePath( Application.ExeName);

    // Guardamos las opciones
  CUIT_EMPRESA := INI.ReadString( 'CONFIGURACION', 'CUIT', '' );
 // RAZON_SOCIAL:= INI.ReadString( 'FAE', 'RAZON_SOCIAL', '');
  HORA_EXPIRA_TIEMPO:=INI.ReadINTEGER( 'CONFIGURACION', 'HORA_EXPIRA', 1);
  AUTOMATICO:=INI.ReadString( 'CONFIGURACION', 'AUTOMATICO', 'SI');
  TIEMPO_CONTRO:=INI.ReadINTEGER( 'CONFIGURACION', 'TIEMPO_CONTRO', 5);
  sistema_operativo:=TRIM(INI.ReadString( 'CONFIGURACION', 'SO', '32'));
  MODO_FAE:=TRIM(INI.ReadString( 'CONFIGURACION', 'MODO', 'T'));

  CERTIFICADO_PRODUCCION:=TRIM(INI.ReadString( 'CONFIGURACION', 'CERTIFICADO', ''));
  CLAVE_PRODUCCION:=TRIM(INI.ReadString( 'CONFIGURACION', 'KEY', '')) ;

  DIRFAE:=TRIM(INI.ReadString( 'CONFIGURACION', 'DIRFAE', c));


  SE_FACTURA:=TRIM(INI.ReadString( 'CONFIGURACION', 'FACTURA', 'N'));

  if trim(DIRFAE)='' then
    DIRFAE:=trim(c);
  {MAIL}
 {  FA_SMTP:=TRIM(INI.ReadString( 'MAIL', 'SMTP', ''));
   FA_FROM_NAME:=TRIM(INI.ReadString( 'MAIL', 'FROM_NAME', ''));
   FA_FROM_ADDRESS:=TRIM(INI.ReadString( 'MAIL', 'FROM_ADDRESS', ''));
   FA_USUARIO:=TRIM(INI.ReadString( 'MAIL', 'USUARIO', ''));
   FA_PASSWORD:=TRIM(INI.ReadString( 'MAIL', 'PASSWORD', ''));
   FA_PUERTO:=TRIM(INI.ReadString( 'MAIL', 'PUERTO', ''));
    }


  // Al liberar el archivo INI se cierra el archivo opciones.ini
  INI.Free
END;


PROCEDURE  tfacturaE.Inicializar;
 begin
  CoInitialize(nil);
 end;


PROCEDURE  tfacturaE.FinFae;
 begin
  CoUninitialize;
 end;


Function tfacturaE.Autenticar(modo,carpeta,cuit,certificado_produ,key_produ:string):boolean;
VAR  XML : TXMLDocument;  VALIDO_OK:BOOLEAN;  tipo:string;
     ChildNode : IXMLNode;  DESDE,HASTA,corta:LONGINT; FECHA_HOY:STRING;
     I,J,POSI:LONGINT; P,FECHA_EXPIRATON,DIA,MES,ANIO,cadena_fecha,HORA_EXPIRATON,FIRMA,TRA:STRING;
     error_wssa:textfile;
begin
try


Autenticar:=FALSE;
Inicializar;
path := ExtractFilePath(Application.ExeName);
if modo='T' then
  FIRMA:='FIRMA_H.TXT'
  else
    FIRMA:='FIRMA_P.TXT';


 if modo='T' then
   TRA:='TRA_H.TXT'
   else
       TRA:='TRA_P.TXT';


 {ASSIGNFILE(ARCHI,path+FIRMA);
ASSIGNFILE(ARCHI_FIRMA,path+TRA);
rewrite(ARCHI);
rewrite(ARCHI_FIRMA);
closefile(ARCHI);
closefile(ARCHI_FIRMA);     }

ASSIGNFILE(error_wssa,ExtractFilePath(Application.ExeName)+'ERROR_WSAA.TXT');
ASSIGNFILE(ARCHI,path+FIRMA);
ASSIGNFILE(ARCHI_FIRMA,path+TRA);
VALIDO_OK:=FALSE;
IF FILEEXISTS(path+FIRMA)=TRUE THEN
   BEGIN
      RESET(ARCHI);
         WHILE NOT EOF(ARCHI) DO
            BEGIN
                 READLN(ARCHI,P);
                   IF POS('expirationTime',TRIM(P))>0 THEN
                    BEGIN
                      DESDE:=POS('<expirationTime>',TRIM(P));
                      HASTA:=POS('</expirationTime>',TRIM(P));
                     corta:=hasta - desde;
                      FECHA_EXPIRATON:=TRIM(COPY(TRIM(P),DESDE+length('<expirationTime>'),corta-length('</expirationTime>')+1));
                       cadena_fecha:=FECHA_EXPIRATON;
                      HASTA:=pos('T',trim(cadena_fecha));
                      FECHA_EXPIRATON:=copy(cadena_fecha,0,hasta-1);
                      HORA_EXPIRATON:=copy(cadena_fecha,HASTA + 1 ,LENGTH(cadena_fecha));


                      anio:=copy(trim(FECHA_EXPIRATON),0,4);
                      mes:=copy(trim(FECHA_EXPIRATON),6,2);
                      dia:=copy(trim(FECHA_EXPIRATON),9,2);
                      FECHA_EXPIRATON:=DIA+'/'+MES+'/'+ANIO+' '+ HORA_EXPIRATON;
                       FECHA_HOY:=DATETIMETOSTR(NOW);
                       IF  NOW < STRTODATETIME(FECHA_EXPIRATON) THEN
                            VALIDO_OK:=TRUE;





                    END;

              END;
          CLOSEFILE(ARCHI);


      END;

   // recupera token y sign
   if  VALIDO_OK=TRUE then
   begin
       reset(ARCHI_FIRMA);
           WHILE NOT EOF(ARCHI_FIRMA) DO
              BEGIN
                 READLN(ARCHI_FIRMA,P);
                 posi:=pos('=',p);
                 tipo:=copy(p,0,posi-1);
                 if TRIM(tipo)='TOKEN' THEN
                   TOKEN:=copy(p,posi+1,length(p));
                   if TRIM(tipo)='SIGN' THEN
                   SIGN:=copy(p,posi+1,length(p));

               end;
            CLOSEFILE(ARCHI_FIRMA);
             respuesta:='Acceso y Autenticación de  WebServices OK';
           //  showmessage('acceso ok');
              Autenticar:=TRUE;
   end;


  IF VALIDO_OK=FALSE THEN
  BEGIN
   //  showmessage('generando wass');
    WSAA:= CreateoleObject('WSAA');
   //  showmessage('generado ttl');
    ttl:=2400;

  //  showmessage('generado wsfe');
    tra := WSAA.CreateTRA('wsfe',ttl);



     // REWRITE(ARCHI);
    //  WRITELN(ARCHI,TRA);
   //   CLOSEFILE(ARCHI);






   if modo='P' then
   begin
    Certificado :=certificado_produ; // certificado de prueba
    ClavePrivada :=key_produ; // clave privada de prueba' +
   end else
   begin
  Certificado := ExtractFilePath(Application.ExeName)+'FAE.crt'; // certificado de prueba
    ClavePrivada := ExtractFilePath(Application.ExeName)+'appluskey.key'; // clave privada de prueba' +


   end;

  // Certificado:='C:\Program Files (x86)\WSAA\testfae.crt';
  // ClavePrivada:='C:\Program Files (x86)\WSAA\seba1.key';

    //showmessage(certificado+'|'+claveprivada);


    //firma mensaje
    cms := WSAA.SignTRA(tra, Certificado,  ClavePrivada);
      // showmessage('firmo mensaje');

    //conecta servidor
    if modo='P' then
     ok:= WSAA.Conectar('', 'https://wsaa.afip.gov.ar/ws/services/LoginCms', '')
    else
     OK := WSAA.Conectar('', 'https://wsaahomo.afip.gov.ar/ws/services/LoginCms');// Hologación


    //  showmessage('modo: '+modo);

    if not ok then
     begin
      //    showmessage('Error de Comunicación. No se puede conectar con AFIP con WSAA.');
         respuesta:='Error de Comunicación. No se puede conectar con AFIP con WSAA.';
         exit;
     end;

     //showmessage('generando TA');
    ta:= WSAA.LoginCMS(cms); //' otener ticket de acceso


    if trim(ta)='' then
    begin
   // showmessage('Error de Acceso. No se obtener el permiso de acceso al webservice.');
      respuesta:='Error de Acceso. No se obtener el permiso de acceso al webservice.';
      exit;
    end;


     If WSAA.Excepcion <> '' then
    begin
     REWRITE(error_wssa);
     WRITELN(error_wssa,'EXCEPTION: '+WSAA.Excepcion);
     WRITELN(error_wssa,'----------------------------------------------------------------');
     WRITELN(error_wssa,'Traceback: '+WSAA.Traceback);
     WRITELN(error_wssa,'----------------------------------------------------------------');

     WRITELN(error_wssa,'XmlRequest: '+WSAA.XmlRequest);
     WRITELN(error_wssa,'----------------------------------------------------------------');

     WRITELN(error_wssa,'XmlResponse: '+WSAA.XmlResponse);
     WRITELN(error_wssa,'----------------------------------------------------------------');
    

     CLOSEFILE(error_wssa);


         
      respuesta:='Error: ' +WSAA.Excepcion;
      exit;
    end else
    begin
    //      showmessage('generar archivos token');
       REWRITE(ARCHI);
      WRITELN(ARCHI,TRA);
      CLOSEFILE(ARCHI);


       Token:= WSAA.Token;
       Sign:=WSAA.Sign;
       REWRITE(ARCHI_FIRMA);
       WRITELN(ARCHI_FIRMA,'TOKEN='+TRIM(TOKEN));
       WRITELN(ARCHI_FIRMA,'SIGN='+TRIM(Sign));
       WRITELN(ARCHI_FIRMA,'');
       WRITELN(ARCHI_FIRMA,'TRA');
       WRITELN(ARCHI_FIRMA,ta);
       CLOSEFILE(ARCHI_FIRMA);
      respuesta:='Acceso WebServices OK';
     // showmessage(respuesta+'   token: '+token+'   sign: '+sign);
     Autenticar:=TRUE;
    end;

END;

 except
    respuesta:='ERROR. PRUEBE MAS TARDE.';
    Autenticar:=FALSe;
 end;

end;

 function  tfacturaE.Control_servidores(token,sign,modo,cuit:string):boolean;
 begin
  TRY
   WSFEv1 := CreateoleObject('WSFEv1');
   VErsion:=WSFEv1.version;

   WSFEv1.Token :=token ;
   WSFEv1.Sign := sign ;

   //' CUIT del emisor (debe estar registrado en la AFIP)
     WSFEv1.Cuit :=TRIM(CUIT_EMPRESA_CONEXION); //'30708601086';

     IF sistema_operativo='32' THEN
      BEGIN
            if modo='P' then
               //  ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
                //ok := WSFEv1.Conectar('','file:///C:/Archivos de programa/WSFEV1/wsfev1_wsdl.xml')
                  ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación
    END ELSE
    BEGIN
       if modo='P' then
                // ok := WSFEv1.Conectar('','file:///C:/Program Files (x86)/WSFEV1/wsfev1_wsdl.xml')
                  ok:= WSFEv1.Conectar('','https://servicios1.afip.gov.ar/wsfev1/service.asmx')
            else
                ok := WSFEv1.Conectar('','https://wswhomo.afip.gov.ar/wsfev1/service.asmx'); // homologación


    END;

 if not ok then
    begin
        respuesta:='Error de Comunicación. No se puede conectar con AFIP con WSFEv1.';
      exit;
  end;

    //' Llamo a un servicio nulo, para obtener el estado del servidor (opcional)
   WSFEv1.Dummy ;

 estado_servidor:=WSFEv1.AppServerStatus;

 estado_bd:=WSFEv1.DbServerStatus;

Estado_autentica:= WSFEv1.AuthServerStatus;



    if (WSFEv1.AppServerStatus='OK') and (WSFEv1.AuthServerStatus='OK') and (WSFEv1.DbServerStatus='OK')  then
    begin

       respuesta:='ESTADO OK PARA FACTURACION ELECTRONICA.';
         Control_servidores:=TRUE;
    end else
    begin

       respuesta:='ESTADO NO OK PARA FACTURACION ELECTRONICA.';
       Control_servidores:=FALSE;
    end;

 EXCEPT
    estado_servidor:='NO OK';

 estado_bd:='NO OK';

Estado_autentica:= 'NO OK';
   respuesta:='ESTADO NO OK PARA FACTURACION ELECTRONICA.';
       Control_servidores:=FALSE;
 END;


 end;



end.
