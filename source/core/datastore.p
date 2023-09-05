unit datastore;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, encryption;

const
  DATA_FILE = 'passwords.dat';

procedure SaveData(const Data: string);
function LoadData: string;

implementation

procedure SaveData(const Data: string);
var
  FileStream: TFileStream;
  EncryptedData: string;
begin
  EncryptedData := Encrypt(Data, 3); 

  FileStream := TFileStream.Create(DATA_FILE, fmCreate);
  try
    FileStream.Write(Pointer(EncryptedData)^, Length(EncryptedData));
  finally
    FileStream.Free;
  end;
end;

function LoadData: string;
var
  FileStream: TFileStream;
  EncryptedData: string;
begin
  if not FileExists(DATA_FILE) then Exit('');

  FileStream := TFileStream.Create(DATA_FILE, fmOpenRead);
  try
    SetLength(EncryptedData, FileStream.Size);
    FileStream.Read(Pointer(EncryptedData)^, FileStream.Size);
  finally
    FileStream.Free;
  end;

  Result := Decrypt(EncryptedData, 3);
end;

end.
