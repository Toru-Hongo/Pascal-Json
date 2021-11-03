//------------------------------------------------------------
//
// Json file sample projects
//
//
//
// copyright 2021.11 Toru Hongo
//
//------------------------------------------------------------


unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.JSON,System.IOUtils,System.JSON.Serializers ;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    //procedure Button2Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;





var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  JSON, JSON_Form, JSON_LoopList_Node: TJSONObject;
  JSONArray_LoopList: TJSONArray;
  I: Integer;
  number: string;
  SLJson: TStringList; // �t�@�C���ۑ�
begin
  JSON               := TJSONObject.Create; // ��ԑ傫�Ȕ����쐬
  JSON_Form          := TJSONObject.Create; // �E�B���h�E�T�C�Y�ƈʒu�̔����쐬
  JSONArray_LoopList := TJSONArray.Create;  // LoopList �S�f�[�^����ꂽ�����쐬
  SLJson             := TStringList.Create; // �t�@�C���ۑ�

  try
    begin
      Memo1.Lines.Add('----------------');

      JSON_Form.AddPair('Top', Form1.Top.ToString);
      JSON_Form.AddPair('Left', Form1.Left.ToString);
      JSON_Form.AddPair('WindowWidth', Form1.Width.ToString);
      JSON_Form.AddPair('WindowHeight', Form1.Height.ToString);
      Memo1.Lines.Add(JSON_Form.ToString);
      Memo1.Lines.Add('----------------');
      Memo1.Lines.Add('');

      //JSON.AddPair('Form', JSON_Form);
      JSON.AddPair('LoopList', JSONArray_LoopList);
      for I := 1 to 32 - 1 do  // �T���v���f�[�^�쐬
      begin
        // LoopList ��1�s���̃f�[�^�̔����쐬����K�v������B
        // �ЂƂ����܂�����O��Create�����s���Ȃ��ƌq�������f�[�^�ɂȂ��Ă��܂��B
        JSON_LoopList_Node := TJSONObject.Create;

        number := Format('%.4d', [I]);
        JSON_LoopList_Node.AddPair('ID', number);
        JSON_LoopList_Node.AddPair('GruopID', Random(3).ToString);
        JSON_LoopList_Node.AddPair('Item', 'John Smith');
        JSON_LoopList_Node.AddPair('Day', Random(30).ToString + '��');
        JSON_LoopList_Node.AddPair('Time', '12:00');
        JSON_LoopList_Node.AddPair('backgroundColor', 'White');

        JSONArray_LoopList.Add(JSON_LoopList_Node);

//        Memo1.Lines.Add('-----');
//        Memo1.Lines.Add(JSON.ToString);
      end;

      Memo1.Lines.Add('----------------');
      Memo1.Lines.Add(JSON.ToString);

      // JSON�t�@�C���ɕۑ����鏈���B
      SLJson.Text := JSON_Form.ToString;
      SLJson.SaveToFile('test.json', TEncoding.UTF8);
    end;
  finally
     JSON.Free;
  end;
end;

//-----------------------------------------------------
//  Json File Read   �f�V���A���C�Y
//-----------------------------------------------------
procedure TForm1.Button2Click(Sender: TObject);

type
  // JSON ���\���̂Ƃ��Ē�`����
  // Field ���́AJSON �� Key ���Ɠ����ɂ���
  TSample = record
    Top: string;
    left: String;
    WindowWidth: string;
    WindowHeight: string
  end;
var
  serializer: TJsonSerializer;
begin
  if FileExists('test.json') then
  begin
    var s := TFile.ReadAllText('test.json',TEncoding.UTF8);

    serializer := TJsonSerializer.Create();
    try
      var Sample  := serializer.Deserialize<TSample>(s);
      Memo1.Lines.Add('----------------');
      Memo1.Lines.Add('Top :' + Sample.Top);
      Memo1.Lines.Add('Left :' + Sample.left);
      Memo1.Lines.Add('WindowWidth :' + Sample.WindowWidth);
      Memo1.Lines.Add('WindowHeight :' + Sample.WindowHeight);

    finally
      serializer.Free;
    end;
  end;

end;

//-----------------------------------------------------
//  init
//-----------------------------------------------------
procedure TForm1.FormShow(Sender: TObject);
begin
  Text := 'Json File R/W Demo ver 1.0';
  Button1.Caption := 'Write Json';
  Button2.Caption := 'Read Json';
  Label1.Caption  := 'Hello';

end;

end.
