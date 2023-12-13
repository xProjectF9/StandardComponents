unit Error;

{$mode ObjFPC}{$H+}

interface

uses
  {$IFDEF pas2js}
  WEB, JS,
  {$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TfrmError = class(TForm)
    bClose: TButton;
    mError: TMemo;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmError: TfrmError;

implementation

{$R *.lfm}

procedure TfrmError.FormCreate(Sender: TObject);
begin
  {$IFDEF pas2js}
  Center;
  document.getElementById( 'frmError_bClose' ).addEventListener( 'click',
    procedure( e : TJSMouseEvent )
  begin
    Hide;
  end
    );
  {$ENDIF}
end;

initialization
  {$IFDEF pas2js}
  {$I 'Error.inc'}
  {$ENDIF}
end.

