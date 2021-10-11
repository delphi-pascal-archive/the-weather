// by brother
// www.brotherirk.narod.ru
// brotherirk@mail.ru
// icq -  322-231-225

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, ComCtrls, ExtCtrls,
  SHDocVw, activex, inifiles, Buttons;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel4: TPanel;
    Status: TLabel;
    Label6: TLabel;
    LabeledEdit1: TLabeledEdit;
    CheckBox1: TCheckBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Button3: TButton;
    Label5: TLabel;
    Label7: TLabel;
    WebBrowser1: TWebBrowser;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox2: TCheckBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    Bevel3: TBevel;
    Button5: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WebBrowser1NavigateComplete2(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReadINI;
    procedure WriteINI;
    procedure ProxyUse;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure WMNCHitTest(var M: TWMNCHitTest); message WM_NCHITTEST;
  public
    { Public declarations }
     procedure EnPanel4;
     procedure getinfo;
  end;

var
  Form1: TForm1;

  content:AnsiString;

  degrees:array[1..4] of string[3];

  Ini: Tinifile;
  inifile:string;

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

function Parser(from, txtsearch:AnsiString):string;
var p:longword;
    n,n2, res:integer;
    tmp:string;
begin
   result:='';
   p:=pos(txtsearch, from);
   if p>0 then
   begin
      n:=0;
      repeat
         inc(n); tmp:='';
         for n2:=0 to length('</span>')-1 do tmp:=tmp+from[p+n+n2];
         res:=p+n;
      until (tmp='</span>');

      tmp:='';
      repeat
        result:=tmp+result;
        dec(res);
        tmp:=from[res];
      until tmp='>';
   end else result:='???';
end;

procedure TForm1.WMNCHitTest(var M: TWMNCHitTest);
begin
  inherited;                  { вызов унаследованного обработчика      }
  if M.Result = htClient then { Мышь сидит на окне?                    }
     M.Result := htCaption;   { Если да - то пусть Windows думает, что }
                              { мышь на caption bar                    }
end;

procedure TForm1.ReadINI;
begin
// получаем настройки из ini или дефолтные
   if fileexists(inifile)
   then
   begin
     Ini:=TiniFile.Create(inifile);
     form1.Left:=Ini.ReadInteger('Window','X',0);
     form1.Top:=Ini.ReadInteger('Window','Y',0);
     if Ini.ReadBool('Panels','Right',false) then button2.Click;
     if Ini.ReadBool('Panels','Down',false)  then button1.Click;
     LabeledEdit1.Text:=Ini.ReadString('Proxy','Server','');
     LabeledEdit2.Text:=Ini.ReadString('Proxy','Port','8080');
     LabeledEdit3.Text:=Ini.ReadString('Proxy','UserName','');
     LabeledEdit4.Text:=Ini.ReadString('Proxy','Pass','');
     checkbox1.Checked:=Ini.ReadBool('Proxy','Enabled',false);
//     proxyuse;
     Ini.Free;
   end
   else
   begin
     // записываем дефолтные
     Ini:=TiniFile.Create(inifile);
     Ini.WriteInteger('Window','X',0);
     Ini.WriteInteger('Window','Y',0);
     Ini.WriteBool('Panels','Right',false);
     Ini.WriteBool('Panels','Down',false);
     Ini.WriteBool('Proxy','Enabled',false);
     Ini.WriteString('Proxy','Server','');
     Ini.WriteString('Proxy','Port','8080');
     Ini.WriteString('Proxy','UserName','');
     Ini.WriteString('Proxy','Pass','');
     Ini.Free;
     form1.left:=0;
     form1.top:=0;
   end;
end;

procedure TForm1.WriteINI;
begin
     Ini:=TiniFile.Create(inifile);
     Ini.WriteInteger('Window','X',left);
     Ini.WriteInteger('Window','Y',top);
     Ini.WriteBool('Panels','Right',panel3.Visible);
     Ini.WriteBool('Panels','Down',panel2.Visible);
     Ini.WriteBool('Proxy','Enabled',checkbox1.Checked);
     Ini.WriteString('Proxy','Server',LabeledEdit1.Text);
     Ini.WriteString('Proxy','Port',LabeledEdit2.Text);
     Ini.WriteString('Proxy','UserName',LabeledEdit3.Text);
     Ini.WriteString('Proxy','Pass',LabeledEdit4.Text);
     Ini.Free;
end;

procedure TForm1.ProxyUse;
begin
   if checkbox1.Checked then
   begin
     IdHTTP1.ProxyParams.ProxyServer:=LabeledEdit1.Text;
     IdHTTP1.ProxyParams.ProxyPort:=strtoint(LabeledEdit2.Text);
     IdHTTP1.ProxyParams.ProxyUsername:=LabeledEdit3.Text;
     IdHTTP1.ProxyParams.ProxyPassword:=LabeledEdit4.Text;
   end                  else
   begin
     IdHTTP1.ProxyParams.ProxyServer:='';
     IdHTTP1.ProxyParams.ProxyPort:=8080;
     IdHTTP1.ProxyParams.ProxyUsername:='';
     IdHTTP1.ProxyParams.ProxyPassword:='';
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
{var
  FromF, ToF: file;
  NumRead, NumWritten: Integer;
  Buf: array[1..2048] of Char;

  n:integer;
}  
begin
     degrees[1]:='???';
     degrees[2]:='???';
     degrees[3]:='???';
     degrees[4]:='???';

     status.Caption:='';
     status.Left:=1;
     status.Top:=panel1.Height+1;
     status.Width:=panel1.Width-button1.Width-1;

     button1.Left:=panel1.Width-button1.Width;
     button1.Top:=panel1.Height;
     button1.Caption:='+';

     button2.Left:=panel1.Width;
     button2.Top:=panel1.Height-button2.Height;
     button2.Caption:='+';

     button3.Top:=0;
     button3.Left:=button2.Left;

     button5.Top:=button3.Top+button3.Height+1;
     button5.Left:=button2.Left;

     button4.Top:=button5.Top+button5.Height+1;
     button4.Left:=button5.Left;

     panel2.Left:=0;
     panel2.Top:=button1.Top+button1.Height;
     panel2.Width:= panel1.Width+ button1.Width;

     panel3.Left:=button2.Left+button2.Width;
     panel3.Top:=0;
     panel3.AutoSize:=true;

     panel4.Left:=panel3.Left+1;
     panel4.Top:=webbrowser1.Height+1;
     panel4.Width:=webbrowser1.Width-1;
     panel4.Height:=panel2.height-2;

     panel2.Visible:=false;
     panel3.Visible:=false;
     panel4.Visible:=false;

     form1.AutoSize:=true;

{    AssignFile(FromF, '1.htm');
    Reset(FromF, 1);
    repeat
        BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
        content:=content+buf;
    until (NumRead = 0);
    CloseFile(FromF);
}
{     degrees[1]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Центр:</td>');
     degrees[2]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Аэропорт:</td>');
     degrees[3]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Академгородок:</td>');
     degrees[4]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Кэш & Керри, Трактовая 18:</td>');
}
     inifile:=extractfilepath(Application.ExeName)+'config.ini';
     readini;

end;

procedure TForm1.getinfo;
begin
   button1.SetFocus;

   label1.Caption:='Центр: ';
   label2.Caption:='Аэропорт: ';
   label3.Caption:='Академгородок: ';
   label4.Caption:='Кэш && Керри (Трактовая 18): ';

   WB_LoadHTML(WebBrowser1, ''); //<html><head></head><body></body></html>

   status.Caption:='Запрос данных...';
   application.ProcessMessages;
   try
     content:=IdHTTP1.Get('http://angara.net/meteo/?loc=irk');
     degrees[1]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Центр:</td>');
     degrees[2]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Аэропорт:</td>');
     degrees[3]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Академгородок:</td>');
     degrees[4]:=parser(content, '<td class="rt" nowrap="1" style="padding: 3px 4px 3px 40px;">Кэш & Керри, Трактовая 18:</td>');
   except
     status.Caption:='Запрос на angara.net не возможен';
     sleep(2000);
     application.ProcessMessages;
   end;

   WB_LoadHTML(WebBrowser1,
   '<html><head></head><body>'+
   '<style type=''text/css''>'+
   '.gmtbl {background-color: #ffffff; border: 1px solid #0000ff;}'+
   '.gmtdttl {font-size: 0; font-weight: normal;color: #ffffff; text-align:center; background-color: #0000ff;}'+
   '.gmtdtext {font-size: 9; font-weight: normal; color: #000000;text-align:center;'+
   '</style>'+
   '<table border=0 width=260><tr><td><script language=''JavaScript'' type=''text/javascript'' src=''http://informer.gismeteo.ru/html/informer.php?codepg=windows-1251&index=30710%C8%F0%EA%F3%F2%F1%EA&'+
   'par=4&lang=&vieinf=bgst&p=0&w=0&tblstl=gmtbl&tdttlstl=gmtdttl&tdtext=gmtdtext''></script></td></tr></table>'+
   '</body></html>');

   label1.Caption:='Центр: '+degrees[1]+chr(176)+'C';
   label2.Caption:='Аэропорт: '+degrees[2]+chr(176)+'C';
   label3.Caption:='Академгородок: '+degrees[3]+chr(176)+'C';
   label4.Caption:='Кэш && Керри (Трактовая 18): '+degrees[4]+chr(176)+'C';

   status.Caption:='Загружено в '+TimeToStr(Now);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   if timer1.Interval<>60*60*1000 then timer1.Interval:=60*60*1000;
   getinfo;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
        timer1.Enabled:=true;
end;

procedure TForm1.EnPanel4;
begin
  if (panel2.Visible) and (panel3.Visible)
    then panel4.Visible:=true
    else if panel4.Visible then panel4.Visible:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  panel2.Visible:=not panel2.Visible;
  if panel2.Visible then button1.Caption:='-'
                    else button1.Caption:='+';
  EnPanel4;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  panel3.Visible:=not panel3.Visible;
  if panel3.Visible then button2.Caption:='-'
                    else button2.Caption:='+';
  EnPanel4;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   close;
end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
   SC_DragMove = $F012; { a magic number }
begin
   ReleaseCapture;
   form1.perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TForm1.WebBrowser1NavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  with WebBrowser1 do
  begin
    OleObject.document.body.Style.BorderStyle := 'none';
    OleObject.Document.Body.Style.OverflowX := 'hidden';
    OleObject.Document.Body.Style.OverflowY := 'hidden';
    OleObject.document.body.TOPMARGIN :='0';
    OleObject.document.body.LEFTMARGIN:='0';
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        writeini;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
        proxyuse;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   getinfo;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
        form1.WindowState:=wsMinimized;
end;

end.
