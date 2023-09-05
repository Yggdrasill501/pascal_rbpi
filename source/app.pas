program PasswordManager;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils,
  core.encryption, core.datastore, core.types,
  {$IFDEF DESKTOP}
  ui.mainform, ui.settingsform,
  {$ENDIF}
  {$IFDEF WEB}
  web.webmain, web.webcomponents
  {$ENDIF}
;

begin
  try
    {$IFDEF DESKTOP}
    Application.Initialize;
    Application.CreateForm(TMainForm, MainForm);
    Application.CreateForm(TSettingsForm, SettingsForm);
    Application.Run;
    {$ENDIF}

    {$IFDEF WEB}
    WebMainInitialize;
    {$ENDIF}
  except
    on E: Exception do
    begin
      writeln('Error encountered: ', E.Message);
    end;
  end;
end.