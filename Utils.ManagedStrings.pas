unit Utils.ManagedStrings;

interface

uses
  System.Classes,
  System.SysUtils;

type
  TManagedStrings = record
  private
    fStringList: TStringList;
    procedure ClearObjects();
    procedure ZeroObjects();
  public
    class operator Initialize(out Dest: TManagedStrings);
    class operator Finalize(var Dest: TManagedStrings);
    class operator Assign(var Dest: TManagedStrings;
      const [ref] Src: TManagedStrings);
    procedure Add(const s: string);
    function Count(): integer;
    function GetItem(idx: integer): string;
    procedure SetItem(idx: integer; const s: string);
    function GetValue(const aKey: string): string;
    procedure SetValue(const aKey: string; const aValue: string);
    procedure AddObject(const aString: string; aObject: TObject);
    function GetObject(idx: integer): TObject; overload;
    function GetObject(const aString: string): TObject; overload;
    // ----
    property Items[idx: integer]: string read GetItem write SetItem;
    property Values[const aKey: string]: string read GetValue write SetValue;
  end;

var
  OnMnagedDiagnostics: TProc<string>;

implementation

uses
  System.RTLConsts;

function GetHexAddr(const Dest: TManagedStrings): string;
begin
  Result := '$' + IntToHex(integer(Pointer(@Dest)));
end;

class operator TManagedStrings.Initialize(out Dest: TManagedStrings);
begin
  Dest.fStringList := TStringList.Create();
  if Assigned(OnMnagedDiagnostics) then
    OnMnagedDiagnostics('----- created ' + GetHexAddr(Dest));
end;

class operator TManagedStrings.Finalize(var Dest: TManagedStrings);
begin
  Dest.ClearObjects();
  Dest.fStringList.Free();
  if Assigned(OnMnagedDiagnostics) then
    OnMnagedDiagnostics('----- destroyed ' + GetHexAddr(Dest));
end;

class operator TManagedStrings.Assign(var Dest: TManagedStrings;
  const [ref] Src: TManagedStrings);
begin
  Dest.fStringList.AddStrings(Src.fStringList);
  Src.ZeroObjects();
  if Assigned(OnMnagedDiagnostics) then
    OnMnagedDiagnostics(Format('----- assigned: %s := %s', [GetHexAddr(Dest),
      GetHexAddr(Src)]));
end;

procedure TManagedStrings.ClearObjects();
var
  idx: integer;
  obj: TObject;
begin
  for idx := 0 to fStringList.Count - 1 do
  begin
    obj := fStringList.Objects[idx];
    if obj <> nil then
      obj.Free;
    fStringList.Objects[idx] := nil;
  end;
end;

procedure TManagedStrings.ZeroObjects();
var
  idx: integer;
begin
  for idx := 0 to fStringList.Count - 1 do
    fStringList.Objects[idx] := nil;
end;

procedure TManagedStrings.Add(const s: string);
begin
  fStringList.Add(s);
end;

function TManagedStrings.Count(): integer;
begin
  Result := fStringList.Count;
end;

function TManagedStrings.GetItem(idx: integer): string;
begin
  if idx < fStringList.Count then
    Result := fStringList.Strings[idx]
  else
    raise EStringListError.Create(Format(SListIndexError, [idx]));
end;

procedure TManagedStrings.SetItem(idx: integer; const s: string);
begin
  if idx < fStringList.Count then
    fStringList.Strings[idx] := s
  else
    raise EStringListError.Create(Format(SListIndexError, [idx]));
end;

function TManagedStrings.GetValue(const aKey: string): string;
begin
  Result := fStringList.Values[aKey];
end;

procedure TManagedStrings.SetValue(const aKey: string; const aValue: string);
begin
  fStringList.Values[aKey] := aValue;
end;

procedure TManagedStrings.AddObject(const aString: string; aObject: TObject);
begin
  fStringList.AddObject(aString, aObject);
end;

function TManagedStrings.GetObject(idx: integer): TObject;
begin
  if idx < fStringList.Count then
    Result := fStringList.Objects[idx]
  else
    raise EStringListError.Create(Format(SListIndexError, [idx]));
end;

function TManagedStrings.GetObject(const aString: string): TObject;
var
  idx: integer;
begin
  idx := fStringList.IndexOf(aString);
  if idx >= 0 then
    Result := fStringList.Objects[idx]
  else
    raise EStringListError.Create(Format('String "%s" not found in the list',
      [aString]));
end;

end.
