# TManagedStrings

RAD Studio 10.4 Sydney - Custom Managed Records - Demo

Demo of a usage new features of the recodds in RAD Studio 10.4 Sydney

1. Delphi record type now supports custom initialization, finalization, and copy operations
1. Customise how records get created, copied, and destroyed, by writing the code to be executed at the various steps
1. This adds additional power to records in Delphi, a construct used to achieve better efficiency compared to classes

```pas
type
  TManagedStrings = record
  private
    fStringList: TStringList;
    fObjects: TObjectList<TObject>;
    procedure ClearObjects();
    procedure ZeroObjects();
  public
    class operator Initialize(out Dest: TManagedStrings);
    class operator Finalize(var Dest: TManagedStrings);
    class operator Assign(var Dest: TManagedStrings;
      const [ref] Src: TManagedStrings);
  end;
```
