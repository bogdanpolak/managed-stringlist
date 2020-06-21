program ManagedStrings;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Utils.ManagedStrings in 'Utils.ManagedStrings.pas',
  Domain.User in 'Domain.User.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
