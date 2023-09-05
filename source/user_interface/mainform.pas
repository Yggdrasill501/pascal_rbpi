unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  types, datastore;

type
  TMainForm = class(TForm)
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    btnLoad: TButton;
    lstServices: TListBox;

    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
  private
    FPasswordList: TPasswordList;
    procedure UpdateServiceList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TMainForm.Destroy;
begin
  inherited Destroy;
end;

procedure TMainForm.btnAddClick(Sender: TObject);
begin
end;

procedure TMainForm.btnEditClick(Sender: TObject);
begin
end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin

end;

procedure TMainForm.btnSaveClick(Sender: TObject);
begin

end;

procedure TMainForm.btnLoadClick(Sender: TObject);
begin

end;

procedure TMainForm.UpdateServiceList;
var
  Entry: TPasswordEntry;
begin
  lstServices.Clear;
  for Entry in FPasswordList do
    lstServices.Items.Add(Entry.ServiceName);
end;

end.