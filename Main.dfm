object MainForm: TMainForm
  Left = 685
  Top = 240
  BorderStyle = bsDialog
  Caption = 'ISZ Delay Calculator'
  ClientHeight = 557
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 24
  object gbCode: TGroupBox
    Left = 12
    Top = 12
    Width = 290
    Height = 314
    Caption = 'Code:'
    TabOrder = 0
    object meCode: TMemo
      Left = 12
      Top = 48
      Width = 266
      Height = 182
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'delay:  fim P0,0FFH'
        '        fim P1,0FFH'
        'loop:   isz R0,loop'
        '        isz R1,loop'
        '        isz R2,loop'
        '        isz R3,loop'
        '        bbl 0')
      ParentFont = False
      TabOrder = 0
    end
    object btnCopy: TButton
      Left = 89
      Top = 252
      Width = 112
      Height = 38
      Caption = 'Copy'
      TabOrder = 1
      OnClick = btnCopyClick
    end
  end
  object gbDelay: TGroupBox
    Left = 696
    Top = 12
    Width = 326
    Height = 278
    Caption = 'Delay'
    TabOrder = 1
    object lbCycles: TLabel
      Left = 44
      Top = 50
      Width = 61
      Height = 24
      Caption = 'Cycles:'
    end
    object lbDelay: TLabel
      Left = 44
      Top = 146
      Width = 52
      Height = 24
      Caption = 'Delay:'
    end
    object lbMicroseconds: TLabel
      Left = 168
      Top = 192
      Width = 119
      Height = 24
      Caption = 'Microseconds'
    end
    object edCycles: TEdit
      Left = 44
      Top = 86
      Width = 114
      Height = 32
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edDelay: TEdit
      Left = 44
      Top = 186
      Width = 114
      Height = 32
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object gbRegisters: TGroupBox
    Left = 318
    Top = 12
    Width = 362
    Height = 533
    Caption = 'Registers'
    TabOrder = 2
    object R0Label: TLabel
      Left = 60
      Top = 48
      Width = 23
      Height = 24
      Caption = 'R0'
    end
    object R1Label: TLabel
      Left = 132
      Top = 48
      Width = 23
      Height = 24
      Caption = 'R1'
    end
    object R2Label: TLabel
      Left = 204
      Top = 48
      Width = 23
      Height = 24
      Caption = 'R2'
    end
    object R3Label: TLabel
      Left = 276
      Top = 48
      Width = 23
      Height = 24
      Caption = 'R3'
    end
    object edR0: TEdit
      Left = 51
      Top = 84
      Width = 44
      Height = 32
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object VrTrackBarR0: TVrTrackBar
      Left = 39
      Top = 122
      Width = 68
      Height = 400
      MaxValue = 15
      Orientation = voVertical
      Frequency = 1
      GutterBevel.InnerShadow = clBtnShadow
      GutterBevel.InnerHighlight = clBtnHighlight
      GutterBevel.InnerWidth = 1
      GutterBevel.InnerStyle = bsNone
      GutterBevel.InnerSpace = 0
      GutterBevel.InnerColor = clBtnFace
      GutterBevel.OuterShadow = clBtnShadow
      GutterBevel.OuterHighlight = clBtnHighlight
      GutterBevel.OuterStyle = bsLowered
      GutterBevel.OuterOutline = osNone
      TickMarks = tmBottomRight
      OnChange = VrTrackBarR0Change
      TabOrder = 1
    end
    object edR1: TEdit
      Left = 123
      Top = 84
      Width = 44
      Height = 32
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 5
      Text = '0'
    end
    object VrTrackBarR1: TVrTrackBar
      Left = 111
      Top = 122
      Width = 68
      Height = 400
      MaxValue = 15
      Orientation = voVertical
      Frequency = 1
      GutterBevel.InnerShadow = clBtnShadow
      GutterBevel.InnerHighlight = clBtnHighlight
      GutterBevel.InnerWidth = 1
      GutterBevel.InnerStyle = bsNone
      GutterBevel.InnerSpace = 0
      GutterBevel.InnerColor = clBtnFace
      GutterBevel.OuterShadow = clBtnShadow
      GutterBevel.OuterHighlight = clBtnHighlight
      GutterBevel.OuterStyle = bsLowered
      GutterBevel.OuterOutline = osNone
      TickMarks = tmBottomRight
      OnChange = VrTrackBarR1Change
      TabOrder = 2
    end
    object edR2: TEdit
      Left = 195
      Top = 84
      Width = 44
      Height = 32
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 6
      Text = '0'
    end
    object VrTrackBarR2: TVrTrackBar
      Left = 183
      Top = 122
      Width = 68
      Height = 400
      MaxValue = 15
      Orientation = voVertical
      Frequency = 1
      GutterBevel.InnerShadow = clBtnShadow
      GutterBevel.InnerHighlight = clBtnHighlight
      GutterBevel.InnerWidth = 1
      GutterBevel.InnerStyle = bsNone
      GutterBevel.InnerSpace = 0
      GutterBevel.InnerColor = clBtnFace
      GutterBevel.OuterShadow = clBtnShadow
      GutterBevel.OuterHighlight = clBtnHighlight
      GutterBevel.OuterStyle = bsLowered
      GutterBevel.OuterOutline = osNone
      TickMarks = tmBottomRight
      OnChange = VrTrackBarR2Change
      TabOrder = 3
    end
    object edR3: TEdit
      Left = 267
      Top = 84
      Width = 44
      Height = 32
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 7
      Text = '0'
    end
    object VrTrackBarR3: TVrTrackBar
      Left = 255
      Top = 122
      Width = 68
      Height = 400
      MaxValue = 15
      Orientation = voVertical
      Frequency = 1
      GutterBevel.InnerShadow = clBtnShadow
      GutterBevel.InnerHighlight = clBtnHighlight
      GutterBevel.InnerWidth = 1
      GutterBevel.InnerStyle = bsNone
      GutterBevel.InnerSpace = 0
      GutterBevel.InnerColor = clBtnFace
      GutterBevel.OuterShadow = clBtnShadow
      GutterBevel.OuterHighlight = clBtnHighlight
      GutterBevel.OuterStyle = bsLowered
      GutterBevel.OuterOutline = osNone
      TickMarks = tmBottomRight
      OnChange = VrTrackBarR3Change
      TabOrder = 4
    end
  end
  object gbCalculate: TGroupBox
    Left = 696
    Top = 324
    Width = 326
    Height = 218
    Caption = 'Calculate'
    TabOrder = 3
    object Label1: TLabel
      Left = 56
      Top = 50
      Width = 52
      Height = 24
      Caption = 'Delay:'
    end
    object Label2: TLabel
      Left = 168
      Top = 96
      Width = 119
      Height = 24
      Caption = 'Microseconds'
    end
    object edCalculate: TEdit
      Left = 44
      Top = 98
      Width = 114
      Height = 32
      TabOrder = 0
    end
    object btnCalculate: TButton
      Left = 107
      Top = 156
      Width = 112
      Height = 38
      Caption = 'Calculate'
      TabOrder = 1
      OnClick = btnCalculateClick
    end
  end
  object gbCrystal: TGroupBox
    Left = 16
    Top = 352
    Width = 289
    Height = 169
    Caption = 'Crystal Frequency'
    TabOrder = 4
    object Label3: TLabel
      Left = 176
      Top = 72
      Width = 23
      Height = 24
      Caption = 'Hz'
    end
    object edFreq: TEdit
      Left = 48
      Top = 72
      Width = 105
      Height = 32
      TabOrder = 0
      Text = '5068000'
      OnExit = edFreqExit
    end
  end
end
