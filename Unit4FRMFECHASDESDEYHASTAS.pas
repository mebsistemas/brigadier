unit Unit4FRMFECHASDESDEYHASTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFRMFECHASDESDEYHASTAS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMFECHASDESDEYHASTAS: TFRMFECHASDESDEYHASTAS;

implementation

{$R *.dfm}

procedure TFRMFECHASDESDEYHASTAS.FormShow(Sender: TObject);
begin
SELF.DateTimePicker1.DateTime:=NOW;
SELF.DateTimePicker2.DateTime:=NOW;
end;

end.
