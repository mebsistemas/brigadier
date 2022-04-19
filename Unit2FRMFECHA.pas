unit Unit2FRMFECHA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFRMFECHA = class(TForm)
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMFECHA: TFRMFECHA;

implementation

{$R *.dfm}

procedure TFRMFECHA.FormCreate(Sender: TObject);
begin
datetimepicker1.DateTime:=now;
end;

end.
