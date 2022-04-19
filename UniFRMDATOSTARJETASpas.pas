unit UniFRMDATOSTARJETASpas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TFRMDATOSTARJETAS = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMDATOSTARJETAS: TFRMDATOSTARJETAS;

implementation

{$R *.dfm}

procedure TFRMDATOSTARJETAS.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TFRMDATOSTARJETAS.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

end.
