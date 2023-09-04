unit webcomponents;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, JS, Web;

type
  TLabeledInput = class(TObject)
  private
    FLabel: string;
    FInputElement: TJSHTMLInputElement;
    FLabelElement: TJSHTMLLabelElement;
  public
    constructor Create(const AParent: TJSHTMLElement; const ALabel: string);
    property Value: string read (FInputElement.value) write (FInputElement.value :=);
  end;

  TWebButton = class(TObject)
  private
    FButtonElement: TJSHTMLButtonElement;
  public
    constructor Create(const AParent: TJSHTMLElement; const ALabel: string; AOnClick: TJSEventHandler);
  end;

implementation

constructor TLabeledInput.Create(const AParent: TJSHTMLElement; const ALabel: string);
begin
  FLabel := ALabel;
  FLabelElement := TJSHTMLLabelElement(document.createElement('label'));
  FLabelElement.innerHTML := FLabel;
  AParent.appendChild(FLabelElement);

  FInputElement := TJSHTMLInputElement(document.createElement('input'));
  AParent.appendChild(FInputElement);
end;

constructor TWebButton.Create(const AParent: TJSHTMLElement; const ALabel: string; AOnClick: TJSEventHandler);
begin
  FButtonElement := TJSHTMLButtonElement(document.createElement('button'));
  FButtonElement.innerHTML := ALabel;
  FButtonElement.addEventListener('click', AOnClick);
  AParent.appendChild(FButtonElement);
end;

end.
