unit Class_decimales;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, Buttons, ExtCtrls,math;

 type
tdecimales = class
  protected
  sql:string;
  public
    function arma_importe_para_mostrar(importe:real):string;

  end;


implementation


 function tdecimales.arma_importe_para_mostrar(importe:real):string;
  var resultado,deci,enteros:string;
  importe_final, aux_importe:real;
  posi,digito:longint;
  importe_S:string;
  FORMATO:STRING;
  red:longint;
  begin

     FORMATO:='##########.##';


     importe_s:=floattostr(RoundTo(importe,-2));


    importe_s:=formatfloat(FORMATO,strtofloat(importe_s));

   importe_s:=StringReplace(trim(importe_s), ',', '.', [rfReplaceAll] ) ;

 // aux_importe:=importe;
 // importe_s:=floattostr(importe);

   //if importe < 0 then
 //  begin
  //  importe_s:=copy(importe_s,2,length(importe_s));
   // importe:=strtofloat(importe_s);
  // end;



 // resultado:=formatfloat('##########.##',importe);

  if trim(importe_s)=''     then
  begin
      resultado:='0.00';
  end
   else
     begin
      posi:=pos('.',trim(importe_s));

       if posi=0 then
          begin
             resultado:=importe_s+'.00';
          end else
          begin
            if posi=1 then
                importe_s:='0'+importe_s;

            posi:=pos('.',trim(importe_s));
           enteros:=trim(copy(importe_s, 0, posi-1));
           deci:=trim(copy(importe_s, posi+1,length(importe_s)));


           if length(deci)=1 then
              deci:=deci+'0';

           resultado:=enteros+'.'+deci;
          end;

     {
           if strtofloat(resultado) < 1 then
                 resultado:='0'+resultado;


                 posi:=pos('.',resultado);
                       if posi=0 then
                              deci:=''
                             else
                                deci:=trim(copy(resultado, posi+1, length(resultado)));

                            if length(deci)=0 then
                                  resultado:=resultado+'.00';

                         if length(deci)=1 then
                             resultado:=resultado+'0';
     }




     end;

     arma_importe_para_mostrar:=resultado;
  // if  aux_importe < 0 then
    // arma_importe_para_mostrar:='-'+resultado
 //   else
   //  arma_importe_para_mostrar:=resultado;

  end;






{
 function tdecimales.arma_importe_para_mostrar(importe:real):string;
  var resultado,deci:string;
  importe_final, aux_importe:real;
  posi,cant_decimal:longint;
  importe_S:string;
  begin

  modulo.sql_borrado2.Close;
  modulo.sql_borrado2.SQL.Clear;
  modulo.sql_borrado2.SQL.Add('select decimales from tparamentros where idparametro=1');
  modulo.sql_borrado2.ExecSQL;
  modulo.sql_borrado2.Open;
  cant_decimal:=modulo.sql_borrado2.Fields[0].AsInteger;


  aux_importe:=importe;
  importe_s:=floattostr(importe);

   if importe < 0 then
   begin
    importe_s:=copy(importe_s,cant_decimal,length(importe_s));
    importe:=strtofloat(importe_s);
   end;


 if cant_decimal=1 then
     resultado:=formatfloat('##########.#',importe);

  if cant_decimal=2 then
     resultado:=formatfloat('##########.##',importe);

   if cant_decimal=3 then
     resultado:=formatfloat('##########.###',importe);

     if cant_decimal=4 then
     resultado:=formatfloat('##########.####',importe);



  if trim(resultado)=''     then
  begin
     if cant_decimal=1 then
        resultado:='0.0';

       if cant_decimal=2 then
           resultado:='0.00';

        if cant_decimal=3 then
             resultado:='0.000';

         if cant_decimal=4 then
             resultado:='0.0000';
  end
   else
     begin

       if strtofloat(resultado) < 1 then
          resultado:='0'+resultado;


      posi:=pos('.',resultado);
      if posi=0 then
         deci:=''
          else
            deci:=trim(copy(resultado, posi+1, length(resultado)));

      if length(deci)=0 then
      begin
           if cant_decimal=1 then
              resultado:=resultado+'.0';
           if cant_decimal=2 then
              resultado:=resultado+'.00';
           if cant_decimal=3 then
              resultado:=resultado+'.000';

           if cant_decimal=4 then
              resultado:=resultado+'.0000';
      end;

      if length(deci)=1 then
      begin

         if cant_decimal=1 then
           resultado:=resultado;

          if cant_decimal=2 then
           resultado:=resultado+'0';

          if cant_decimal=3 then
           resultado:=resultado+'00';

            if cant_decimal=4 then
           resultado:=resultado+'000';
      end;

     end;


   if  aux_importe < 0 then
     arma_importe_para_mostrar:='-'+resultado
    else
     arma_importe_para_mostrar:=resultado;

  end;





}




end.



