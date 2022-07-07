unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,uConexao, uEntidadeProduto, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    dsProdutos: TDataSource;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
     FProduto :  TProduto;
     procedure Listar;
  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadastroProduto;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FreeAndNil(FProduto);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  FConexao : TConexao;
begin
  FConexao := TConexao.create;
  try
     FConexao.getconexao;
  finally
      FreeAndNIl(FConexao);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
     FProduto := TProduto.create;
     Listar;
end;

procedure TfrmPrincipal.Listar;
begin
     FProduto
          .Listar(dsProdutos);
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
     Application.CreateForm(TfrmCadastro, frmCadastro);
     frmCadastro.SpeedButton1.Tag := 0;
     frmCadastro.ShowModal;
     Listar;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
     Application.CreateForm(TfrmCadastro, frmCadastro);
     frmCadastro.xcodigo                  := dsProdutos.DataSet.FieldByName('codigo').AsInteger;
     frmCadastro.Edit1.Text               := dsProdutos.DataSet.FieldByName('descricao').AsString;
     frmCadastro.Edit2.Text               := dsProdutos.DataSet.FieldByName('valor').AsString;
     frmCadastro.DateTimePicker1.DateTime := dsProdutos.DataSet.FieldByName('data_venc').AsDateTime;
     frmCadastro.Edit4.Text               := dsProdutos.DataSet.FieldByName('marca').AsString;
     frmCadastro.ComboBox1.ItemIndex      := dsProdutos.DataSet.FieldByName('ativo').AsInteger;
     frmCadastro.SpeedButton1.Tag := 1;
     frmCadastro.ShowModal;
     Listar;
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
     FProduto
      .Deletar(dsProdutos.DataSet.FieldByName('codigo').AsInteger);
      Listar;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
