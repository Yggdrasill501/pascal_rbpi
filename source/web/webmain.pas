unit webmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, JS, Web, types, datastore;

procedure WebMain;

implementation

procedure LoadPasswords;
var
  DivElement: TJSHTMLElement;
  Entry: TPasswordEntry;
  EntryElement: TJSHTMLElement;
begin
  DivElement := TJSHTMLElement(document.getElementById('passwordList'));
  DivElement.innerHTML := ''; 

  for Entry in LoadData do
  begin
    EntryElement := document.createElement('div');
    EntryElement.innerHTML := Format('%s: %s', [Entry.ServiceName, Entry.Username]);
    DivElement.appendChild(EntryElement);
  end;
end;

procedure SavePassword;
var
  NewEntry: TPasswordEntry;
  ServiceInput, UserInput, PasswordInput: TJSHTMLInputElement;
  EncryptionKey: string;
begin
  ServiceInput := TJSHTMLInputElement(document.getElementById('serviceNameInput'));
  UserInput := TJSHTMLInputElement(document.getElementById('usernameInput'));
  PasswordInput := TJSHTMLInputElement(document.getElementById('passwordInput'));

  EncryptionKey := 'EncryptionKey';  //

  NewEntry.ServiceName := ServiceInput.value;
  NewEntry.Username := UserInput.value;
  NewEntry.Password := Encrypt(PasswordInput.value, EncryptionKey); 

  AddPassword(NewEntry);

  ServiceInput.value := '';
  UserInput.value := '';
  PasswordInput.value := '';
end;

procedure btnLoadClick(Event: TJSEvent);
begin
  LoadPasswords;
end;

procedure btnSaveClick(Event: TJSEvent);
begin
  SavePasswords;
end;

procedure WebMain;
begin
  document.getElementById('btnLoad').addEventListener('click', @btnLoadClick);
  document.getElementById('btnSave').addEventListener('click', @btnSaveClick);
end;

end.
