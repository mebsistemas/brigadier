unit Unit4FRMINGRESARINVENTARIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFRMINGRESARINVENTARIO = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMINGRESARINVENTARIO: TFRMINGRESARINVENTARIO;

implementation

{$R *.dfm}

procedure TFRMINGRESARINVENTARIO.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

end.
