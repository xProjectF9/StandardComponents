unit Main;

{$mode objfpc}{$H+}

interface

uses
  //{$IFNDEF Desktop}
  {$IFDEF pas2js}
  WEB, JS,
  {$ENDIF}
  Classes, SysUtils, StdCtrls, Forms, ExtCtrls, DateTimePicker, StrUtils,
  Dialogs, Buttons, DateUtils, Controls;

type
  TForm1 = class( TForm )
    Button1 : TButton;
    Button2 : TButton;
    Button3 : TButton;
    CheckBox1 : TCheckBox;
    CheckBox2 : TCheckBox;
    CheckBox3 : TCheckBox;
    CheckGroup1 : TCheckGroup;
    ComboBox1 : TComboBox;
    DateTimePicker1 : TDateTimePicker;
    Edit1 : TEdit;
    Edit2 : TEdit;
    Edit3 : TEdit;
    Edit4 : TEdit;
    Edit5 : TEdit;
    GroupBox1 : TGroupBox;
    Image1: TImage;
    Label1 : TLabel;
    Label2 : TLabel;
    Memo1 : TMemo;
    Memo2 : TMemo;
    Panel1 : TPanel;
    RadioGroup1 : TRadioGroup;
    rb1 : TRadioButton;
    rb2 : TRadioButton;
    SpeedButton1 : TSpeedButton;
    Timer1 : TTimer;
    procedure Button1Click( Sender : TObject );
    procedure Button2Click( Sender : TObject );
    procedure Button3Click( Sender : TObject );
    procedure CheckBox1Click( Sender : TObject );
    procedure CheckBox2Click( Sender : TObject );
    procedure CheckBox3Click( Sender : TObject );
    procedure CheckGroup1ItemClick( Sender : TObject; Index : Integer );
    procedure ComboBox1Change( Sender : TObject );
    procedure ComboBox1Click( Sender : TObject );
    procedure DateTimePicker1Change( Sender : TObject );
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Change( Sender : TObject );
    procedure FormCreate( Sender : TObject );
    procedure FormShow( Sender : TObject );
    procedure SpeedButton1Click( Sender : TObject );
    procedure Timer1Timer( Sender : TObject );
  private
    procedure ShowCheckBoxState;
  public

  end;

var
  Form1 : TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click( Sender : TObject );
begin
  if rb1.Checked then
    Memo1.Lines.Add( Edit1.Text )
  else
    Memo2.Lines.Add( Edit1.Text );
  Edit1.Text := '';
end;

procedure TForm1.Button2Click( Sender : TObject );
begin
  {$IFDEF pas2js}
//  debugger;
    {$ENDIF}
  //  DateTimePicker1.Date := DateTimePicker1.Date + 3;
  DateTimePicker1.Date := Now;
end;

procedure TForm1.Button3Click( Sender : TObject );
begin
  DateTimePicker1.Time := Now;
end;

procedure TForm1.ShowCheckBoxState;
begin
  Edit2.Text := IfThen( CheckBox1.Checked, 'CheckBox1 ' ) + IfThen( CheckBox2.Checked, 'CheckBox2' );
end;

procedure TForm1.CheckBox1Click( Sender : TObject );
begin
  ShowCheckBoxState;
end;

procedure TForm1.CheckBox2Click( Sender : TObject );
begin
  ShowCheckBoxState;
end;

procedure TForm1.CheckBox3Click( Sender : TObject );
begin
  Timer1.Enabled := CheckBox3.Checked;
end;

procedure TForm1.CheckGroup1ItemClick( Sender : TObject; Index : Integer );
begin
  {$IFNDEF pas2js}
  WriteLn( Index, CheckGroup1.Checked[Index] );
  {$ENDIF}
end;

procedure TForm1.ComboBox1Change( Sender : TObject );
begin
  {
  Button2.Enabled := True;
  Button3.Enabled := True;
  case ComboBox1.ItemIndex of
    1 :
    begin
      DateTimePicker1.Kind := dtkDate;
      Button3.Enabled := False;
    end;
    2 :
    begin
      DateTimePicker1.Kind := dtkTime;
      Button2.Enabled := False;
    end;
    3 :
    begin
      DateTimePicker1.Kind := dtkDateTime;
    end;
  end;
  }
end;

procedure TForm1.ComboBox1Click( Sender : TObject );
begin
  Button2.Enabled := True;
  Button3.Enabled := True;
  case ComboBox1.ItemIndex of
    1 :
    begin
      DateTimePicker1.Kind := dtkDate;
      Button3.Enabled := False;
    end;
    2 :
    begin
      DateTimePicker1.Kind := dtkTime;
      Button2.Enabled := False;
    end;
    3 :
    begin
      DateTimePicker1.Kind := dtkDateTime;
    end;
  end;
end;

procedure TForm1.DateTimePicker1Change( Sender : TObject );
begin
  case DateTimePicker1.Kind of
    dtkDate : Edit3.Text := DateToStr( DateTimePicker1.Date );
    dtkTime : Edit3.Text := TimeToStr( DateTimePicker1.Time );
    dtkDateTime : Edit3.Text := DateToStr( DateTimePicker1.Date ) + ' ' + TimeToStr( DateTimePicker1.Time );
  end;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  WriteLn( 'KeyDown ', Key );
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  WriteLn( 'KeyPress ', Key );
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  WriteLn( 'KeyUp ', Key );
end;

procedure TForm1.Edit4Change( Sender : TObject );
begin
  Timer1.Interval := StrToInt( Edit4.Text );
end;

procedure TForm1.FormCreate( Sender : TObject );
begin
  ComboBox1.ItemIndex := 3;
  {$IFDEF pas2js}
  //Resizeable := False;
  if window.screen.width < 600 then
  begin
    Top := 10;
    Left := 10;
    Right := 10;
    Bottom := 10;
  end
  else
  begin
    Top := 10;
    Left := 10;
    //Width := Width + 200;
    //Height := Height + 100;
    //DBGrid1.Width := DBGrid1.Width + 100;
  end;
    {$ENDIF}
end;

procedure TForm1.FormShow( Sender : TObject );
begin
  {$IFDEF pas2js}
  asm
    console.log( "You can write even double quotes" );
  end;
    {$ENDIF}
  ShowCheckBoxState;
end;

procedure TForm1.SpeedButton1Click( Sender : TObject );
begin
  {$IFNDEF pas2js}
  //SpeedButton1.ClassInfo;
  CheckGroup1.Checked[0] := True;
  RadioGroup1.ItemIndex := 0;
  {$ENDIF}
end;

procedure TForm1.Timer1Timer( Sender : TObject );
begin
  //WriteLn( Now );
  Edit5.Text := IntToStr( MilliSecondOfTheDay( Now ) );
end;

initialization
  {$IFDEF pas2js}
  {$I 'Main.inc'}
  {$ENDIF}
end.
