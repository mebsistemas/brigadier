unit Exportar2PDF;

interface

uses
  QuickRpt;

type
  TExportar2PDFSyn = class
  private
    ruta:string;
    procedure setRuta(ruta:string);
    function getRuta:string;
  public
    //constructor create(ruta:string); overload;
    constructor create;
    property rutaPDF:string read getRuta write setRuta;
    procedure exportar2PDF(reporte:TQuickRep);
  end;

implementation

uses
  SysUtils, SynPdf, Graphics, Windows;

procedure TExportar2PDFSyn.exportar2PDF(reporte:TQuickRep);
var
  Pdf: TPdfDocument;
  aMeta: TMetaFile;
  i: integer;
begin
  Pdf := TPdfDocument.Create;
  reporte.Prepare;
  for i:= 1 to reporte.QRPrinter.PageCount do
  begin
    aMeta := reporte.QRPrinter.GetPage(i);
    try
      Pdf.DefaultPageWidth := MulDiv(aMeta.Width, 72, Pdf.ScreenLogPixels);
      Pdf.DefaultPageHeight := MulDiv(aMeta.Height, 72, Pdf.ScreenLogPixels);
      Pdf.AddPage;
    //Dibujamos el contenido de la p�gina.
      Pdf.Canvas.RenderMetaFile(aMeta, 1, 0, 0);
    finally
     aMeta.Free;
    end;
   end;
    Pdf.SaveToFile(getRuta);
    Pdf.free;
   // deletefile(pchar(getRuta)); martin 16.03.2016
 // end;
//  Application.MessageBox('Lo hice bien.', PAnsiChar(self.Caption),
//    MB_OK + MB_ICONINFORMATION);
end;

function TExportar2PDFSyn.getRuta:string ;
begin
  Result:=Self.ruta;
end;

procedure TExportar2PDFSyn.setRuta(ruta:string);
begin
  Self.ruta:=ruta;
end;

//constructor exportarPDFSyn.create(ruta:string);
//begin
//  inherited create();
//  setRuta(GetCurrentDir + '\qrp' + '\aPDF.pdf');
//end;

constructor TExportar2PDFSyn.create;
begin
  inherited;
  setRuta(GetCurrentDir + '\qrpPDF' + '\aPDF.pdf');
end;

end.
