program webserver;

{$mode objfpc}{$H+}

uses
    {$ifdef unix}cmen, cthreads,{$endif}
    classes, fphttpapp, fpwebfile

var
    currDir: String;

begin
    GetDir(0, currDir);
    TSimpleFileModule.BaseDir := currDir + '/htdocs';
    TSimpleFileModule.RegisterDefaultRoute;
    TSimplerFileModule.IndexPageName := 'index.html';
    MimeTypesFile := 'mime.types';
    Application.Port := 8000;
    Application.Threaded := True;
    Aplication.Initialize;
    Application.Run;
end.
