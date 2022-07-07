unit uCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, uEntidadeProduto, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastro = class(TForm)
    Panel1: TPanel;
    dsCadProdutos: TDataSource;
    SpeedButton1: TSpeedButton;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    Edit4: TLabeledEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    FProduto :  TProduto;
    procedure Salvar;
  public
    xcodigo : integer;
    procedure Atualizar;
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.Atualizar;
begin
     FProduto := TProduto.create;
     try
        FProduto.codigo := xcodigo;
        FProduto.Descricao := Edit1.Text;
        FProduto.valor := Edit2.Text;
        FProduto.data_venc := DateTimePicker1.Date;
        FProduto.marca := Edit4.Text;
        FProduto.ativo := ComboBox1.ItemIndex;
        FProduto.Atualizar(FProduto);
     finally
        FreeAndNil(FProduto);
        Self.Close;
     end;
end;

procedure TfrmCadastro.Salvar;
begin
  FProduto := TProduto.create;
  try
    FProduto.Descricao := Edit1.Text;
    FProduto.valor := Edit2.Text;
    FProduto.data_venc := DateTimePicker1.Date;
    FProduto.marca := Edit4.Text;
    FProduto.ativo := ComboBox1.ItemIndex;
    FProduto.add(FProduto);
  finally
    FreeAndNil(FProduto);
    Self.Close;
  end;
end;

procedure TfrmCadastro.SpeedButton1Click(Sender: TObject);
begin
     case SpeedButton1.Tag of
      0: Salvar;
      1: Atualizar;
     end;
end;

end.
