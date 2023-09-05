unit encryption;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function Encrypt(const APlainText: string; Shift: Integer): string;
function Decrypt(const ACipherText: string; Shift: Integer): string;

implementation

function Encrypt(const APlainText: string; Shift: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(APlainText) do
  begin
    Result := Result + Chr(Ord(APlainText[i]) + Shift);
  end;
end;

function Decrypt(const ACipherText: string; Shift: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(ACipherText) do
  begin
    Result := Result + Chr(Ord(ACipherText[i]) - Shift);
  end;
end;

end.