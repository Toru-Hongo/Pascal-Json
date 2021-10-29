object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 334
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  DesignSize = (
    589
    334)
  PixelsPerInch = 96
  TextHeight = 15
  object Memo1: TMemo
    Left = 24
    Top = 24
    Width = 417
    Height = 289
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 464
    Top = 265
    Width = 105
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 464
    Top = 24
    Width = 105
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
end
