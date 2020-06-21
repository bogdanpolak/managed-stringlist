unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Memo1: TMemo;
    GridPanel1: TGridPanel;
    btnMinus: TButton;
    btnPlus: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
  private
  public
    procedure ConsoleWrite(const aMessage: string;
      const aParams: array of const);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Utils.ManagedStrings,
  Domain.User;

procedure TForm1.ConsoleWrite(const aMessage: string;
  const aParams: array of const);
begin
  Memo1.Lines.Add(Format(aMessage, aParams));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  OnMnagedDiagnostics := procedure(msg: string)
    begin
      ConsoleWrite(msg, []);
    end;
end;

procedure TForm1.btnMinusClick(Sender: TObject);
begin
  Memo1.Font.Height := Memo1.Font.Height + 1;
end;

procedure TForm1.btnPlusClick(Sender: TObject);
begin
  Memo1.Font.Height := Memo1.Font.Height - 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  aUserName: string;
  aUserGroups: TArray<string>;
  isAdmin: boolean;
begin
  ReportMemoryLeaksOnShutdown := true;
  // ----------
  var aStringsOne: TManagedStrings;
  ConsoleWrite('-----------------------------------------------', []);
  aStringsOne.Add('Test line');
  aStringsOne.GetItem(0);
  // ----------
  aStringsOne.AddObject('bogdan.polak', TUser.Create('bogdan.polak',
    ['admin', 'manager']));
  aStringsOne.AddObject('jan.kowalski', TUser.Create('jan.kowalski',
    ['manager', 'sales']));
  // ----------
  aStringsOne.Values['CurrentUser'] := 'bogdan.polak';
  // ----------
  for var idx := 0 to aStringsOne.Count - 1 do
    ConsoleWrite('[%d] %s', [idx, aStringsOne.Items[idx]]);
  ConsoleWrite('-----------------------------------------------', []);
  // ----------
  var aStringsTwo: TManagedStrings := aStringsOne;
  var aCurrentUser := aStringsOne.Values['CurrentUser'];
  ConsoleWrite('Current user: %s', [aCurrentUser]);
  // ----------
  var aUserOne := aStringsOne.GetObject(aCurrentUser) as TUser;
  var aUserTwo := aStringsTwo.GetObject(aCurrentUser) as TUser;
  if aUserOne=nil then
    ConsoleWrite('User one is nil', []);
  isAdmin := aUserTwo.isAdmin();
  ConsoleWrite('Current user is admin: %s', [IfThen(isAdmin, 'yes', '---')]);
  // ----------

end;

end.
