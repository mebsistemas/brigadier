unit Unit2frmPideCantidadPromocion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPideCantidadPromocion = class(TForm)
    Edit1: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPideCantidadPromocion: TfrmPideCantidadPromocion;

implementation

{$R *.dfm}

procedure TfrmPideCantidadPromocion.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if KEY=#13 then
 BEGIN
   if TRIM(EDIT1.Text)='' then
      EXIt;

 MODALRESULT:=MROK;
 END;
 end;

procedure TfrmPideCantidadPromocion.FormShow(Sender: TObject);
begin
EDIT1.SetFocus;
end;

end.


