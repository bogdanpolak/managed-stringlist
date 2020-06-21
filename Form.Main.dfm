object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 289
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 283
    Align = alLeft
    Caption = 'GroupBox1'
    TabOrder = 0
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 175
      Height = 25
      Align = alTop
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object GridPanel1: TGridPanel
      Left = 2
      Top = 46
      Width = 181
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      Caption = ' '
      ColumnCollection = <
        item
          Value = 49.721302953803500000
        end
        item
          Value = 50.828729281767960000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = btnMinus
          Row = 0
        end
        item
          Column = 1
          Control = btnPlus
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 1
      object btnMinus: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 83
        Height = 29
        Align = alClient
        Caption = '-'
        TabOrder = 0
        OnClick = btnMinusClick
        ExplicitLeft = 56
        ExplicitTop = 8
        ExplicitWidth = 75
        ExplicitHeight = 25
      end
      object btnPlus: TButton
        AlignWithMargins = True
        Left = 92
        Top = 3
        Width = 86
        Height = 29
        Align = alClient
        Caption = '+'
        TabOrder = 1
        OnClick = btnPlusClick
        ExplicitLeft = 56
        ExplicitTop = 8
        ExplicitWidth = 75
        ExplicitHeight = 25
      end
    end
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 510
    Height = 283
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
