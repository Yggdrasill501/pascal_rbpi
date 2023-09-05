unit settingsform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TSettingsForm = class(TForm)
    btnSave: TButton;
    btnCancel: TButton;
    edtDataPath: TEdit;
    edtEncryptionKey: TEdit;
    lblDataPath: TLabel;
    lblEncryptionKey: TLabel;

    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    procedure LoadSettings;
    procedure SaveSettings;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.lfm}

constructor TSettingsForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  LoadSettings;
end;

procedure TSettingsForm.btnCancelClick(Sender: TObject);
begin
  Close;  
end;

procedure TSettingsForm.btnSaveClick(Sender: TObject);
begin
  SaveSettings;
  Close;
end;

procedure TSettingsForm.LoadSettings;
begin

  edtDataPath.Text := GetPasswordDataPath();
  edtEncryptionKey.Text := GetEncryptionKey();
end;

procedure TSettingsForm.SaveSettings;
begin

  SetPasswordDataPath(edtDataPath.Text);
  SetEncryptionKey(edtEncryptionKey.Text);
end;

end.
