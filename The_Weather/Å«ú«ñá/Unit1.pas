// by brother
// www.brotherirk.narod.ru
// brotherirk@mail.ru
// icq -  322-231-225

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ActiveX, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Web: TWebBrowser;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure WebNavigateComplete2(Sender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

procedure TForm1.WebNavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  with Web do
  begin
    OleObject.document.body.Style.BorderStyle := 'none';
    OleObject.Document.Body.Style.OverflowX := 'hidden';
    OleObject.Document.Body.Style.OverflowY := 'hidden';
    OleObject.document.body.TOPMARGIN :='0';
    OleObject.document.body.LEFTMARGIN:='0';
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   left:=0;
   top:=0;
   timer1.Enabled:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if timer1.Interval<>4*60*1000 then timer1.Interval:=4*60*1000; //каждые 4 часа

  WB_LoadHTML(Web,
   '<html><head></head><body><script>URL=''http://img.gismeteo.Ru/flash/fw120x60.swf?index=30710'';w=''120'';h=''60'';value=''30710'';lang=''ru''</script><script src=''http://informer.gismeteo.Ru/flash/fcode.js''></script></body></html>');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  clientwidth:=120;
  clientheight:=60+StatusBar1.height;
end;

end.
