unit Unifmdescuentost4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfmdescuentos = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmdescuentos: Tfmdescuentos;

implementation

{$R *.dfm}

uses Unit4AGREGARDESCUENTOS;

procedure Tfmdescuentos.BitBtn1Click(Sender: TObject);
begin
AGREGARDESCUENTOS.CheckBox1.Checked:=false;
AGREGARDESCUENTOS.DBLookupComboBox2.Enabled:=false;

AGREGARDESCUENTOS.CheckBox2.Checked:=false;
AGREGARDESCUENTOS.DBLookupComboBox3.Enabled:=false;


AGREGARDESCUENTOS.CheckBox3.Checked:=false;
AGREGARDESCUENTOS.edit1.Enabled:=false;

AGREGARDESCUENTOS.CheckBox4.Checked:=false;
AGREGARDESCUENTOS.edit2.Enabled:=false;

AGREGARDESCUENTOS.edit2.Clear;
AGREGARDESCUENTOS.edit1.Clear;

AGREGARDESCUENTOS.Label3.Visible:=false;
AGREGARDESCUENTOS.DBLookupComboBox4.Visible:=false;
AGREGARDESCUENTOS.SHOWMODAL;
end;

end.
