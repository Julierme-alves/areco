program Cadastro;

uses
  Vcl.Forms,
  uCadastroProduto in 'view\uCadastroProduto.pas' {frmCadastro},
  uPrincipal in 'view\uPrincipal.pas' {frmPrincipal},
  uConexao in 'model\connection\uConexao.pas',
  uEntidadeProduto in 'model\Entidades\uEntidadeProduto.pas',
  uQuery in 'model\connection\uQuery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
