object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Formul'#225'rio de Cadastro'
  ClientHeight = 173
  ClientWidth = 787
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 173
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 688
      Top = 128
      Width = 89
      Height = 29
      Cursor = crHandPoint
      Caption = 'Salvar'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 640
      Top = 63
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object Label2: TLabel
      Left = 240
      Top = 63
      Width = 96
      Height = 13
      Caption = 'Data de Vencimento'
    end
    object Edit1: TLabeledEdit
      Left = 8
      Top = 23
      Width = 769
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'Produto'
      TabOrder = 0
    end
    object Edit2: TLabeledEdit
      Left = 8
      Top = 78
      Width = 217
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor'
      TabOrder = 1
    end
    object Edit4: TLabeledEdit
      Left = 447
      Top = 78
      Width = 185
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Marca'
      TabOrder = 3
    end
    object ComboBox1: TComboBox
      Left = 638
      Top = 77
      Width = 139
      Height = 21
      ItemIndex = 0
      TabOrder = 4
      Text = 'Ativo'
      Items.Strings = (
        'Ativo'
        'Inativo')
    end
    object DateTimePicker1: TDateTimePicker
      Left = 240
      Top = 78
      Width = 186
      Height = 21
      Date = 44748.884266597220000000
      Time = 44748.884266597220000000
      TabOrder = 2
    end
  end
  object dsCadProdutos: TDataSource
    Left = 472
    Top = 8
  end
end
