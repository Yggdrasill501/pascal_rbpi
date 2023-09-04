unit types;

{$mode objfpc}{$H+}

interface

type
  TPasswordEntry = record
    ServiceName: string;
    Username: string;
    Password: string;
    Note: string;
  end;

  TPasswordList = array of TPasswordEntry;

implementation

end.
