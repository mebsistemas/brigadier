unit UnitfrmActualizaindivualARticulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,CLASS_DECIMALES;

type
  TfrmActualizaindivualARticulo = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActualizaindivualARticulo: TfrmActualizaindivualARticulo;

implementation

{$R *.dfm}

uses UnifrmActualizaPrecioporProveedor;

procedure TfrmActualizaindivualARticulo.BitBtn2Click(Sender: TObject);
begin
 if TRIM(EDIT1.Text)='' then
  BEGIN
    SHOWMESSAGE('DEBE INGRESAR EL PORCENT.');
    MODALRESULT:=MRNONE;
    EXIT;
  END;
end;

procedure TfrmActualizaindivualARticulo.BitBtn3Click(Sender: TObject);
VAR TD:TDECIMALES;   POR,PRECIO,PRECIOFINAL:REAL;  SPRECIOFINAL:sTRING;
 BEGIN
 if TRIM(EDIT1.Text)='' then
  BEGIN
    SHOWMESSAGE('DEBE INGRESAR EL PORCENT.');
    EXIT;
  END;
  TD:=TDECIMALES.Create;
      POR:=STRTOFLOAT(frmActualizaindivualARticulo.EDIT1.Text);
      PRECIO:=STRTOFLOAT(frmActualizaPrecioporProveedor.RxMemoryData1precio.Value);

      if frmActualizaindivualARticulo.COMBOBOX1.ItemIndex=0 then
             PRECIOFINAL:=PRECIO + ((PRECIO *POR)/100);

      if frmActualizaindivualARticulo.COMBOBOX1.ItemIndex=1 then
             PRECIOFINAL:=PRECIO - ((PRECIO *POR)/100);

            SPRECIOFINAL:=TD.arma_importe_para_mostrar(PRECIOFINAL);
           LABEL3.CAPTION:='NUEVO PRECIO: '+SPRECIOFINAL;
end;

procedure TfrmActualizaindivualARticulo.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','.',#13,#8] then
edit1.ReadOnly:=false
else
edit1.ReadOnly:=true;
end;

end.
