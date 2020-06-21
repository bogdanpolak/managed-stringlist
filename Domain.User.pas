unit Domain.User;

interface

type
  TUser = class
    fUserName: string;
    fUserGroups: TArray<string>;
    constructor Create(const aUserName: string; const aUserGroups: TArray<string>);
    function IsAdmin(): boolean;
  end;

implementation

constructor TUser.Create(const aUserName: string; const aUserGroups: TArray<string>);
begin
  fUserName:= aUserName;
  fUserGroups:= aUserGroups;
end;

function TUser.IsAdmin(): boolean;
var
  i: Integer;
begin
  for i := 0 to High(fUserGroups)-1 do
    if fUserGroups[i]='admin' then
      Exit(true);
  Result := False;
end;


end.
