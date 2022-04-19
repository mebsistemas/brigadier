unit Unitseleccioneimprsora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,PrinterS;

type
  Tseleccioneimpresora = class(TForm)
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  seleccioneimpresora: Tseleccioneimpresora;

implementation

{$R *.dfm}

procedure Tseleccioneimpresora.FormShow(Sender: TObject);

var
  i: longint;
begin
  ComboBox1.Clear;
  for i := 0 to Printer.Printers.Count - 1 do

  begin

    ComboBox1.Items.Add(Printer.Printers.Strings[i])

  end;
end;

end.
