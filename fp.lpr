program fp;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, Main, Error;

const
  VERSION = 'v1.0 build 1';

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title := 'Green Hill srl - Components demo 1 - ' + VERSION;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmError, frmError);
  Application.Run;
end.

