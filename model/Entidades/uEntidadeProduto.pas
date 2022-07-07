unit uEntidadeProduto;

interface
uses
  System.SysUtils, Data.DB, System.Classes, uQuery;
type
  TProduto = class
  private
    FQuery : TQuery;
    FDescricao: string;
    Fvalor: String;
    Fdata_venc: TDateTime;
    Fmarca: string;
    Fativo: integer;
    FCodigo: integer;
  public
    constructor create;
    destructor destroy; override;

    property codigo: integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property valor: String read Fvalor write Fvalor;
    property data_venc: TDateTime read Fdata_venc write Fdata_venc;
    property marca: string read Fmarca write Fmarca;
    property ativo: integer read Fativo write Fativo;

    function add(pDados : TProduto) : boolean;
    function Listar(pDataSet : TDataSource): TDataSet;
    function Deletar(pCodigo: integer): boolean;
    function Atualizar(pDados : TProduto): boolean;
  end;

implementation

{ TProduto }

function TProduto.add(pDados : TProduto) : boolean;
var
  xSQL : String;
begin
      try
        xSQL := 'insert into tproduto '+
                'values ('+
                  QuotedStr(pDados.FDescricao)
                  +','+QuotedStr(pDados.Fvalor)
                  +','+QuotedStr(DateToStr(pDados.Fdata_venc))
                  +','+QuotedStr(pDados.Fmarca)
                  +','+QuotedStr(IntToStr(pDados.Fativo))+
                ')';
        FQuery.Query.ExecSQL(xSQL);

      except on e: Exception do
        raise Exception.Create('Erro ao cadastrar Produto.'+e.Message);
      end;
end;

function TProduto.Atualizar(pDados : TProduto): boolean;
begin
      try
        FQuery.Query.SQL.Add('update tproduto set');
        FQuery.Query.SQL.Add('  descricao =:descricao,');
        FQuery.Query.SQL.Add('  valor=:valor,');
        FQuery.Query.SQL.Add('  data_venc=:data_venc,');
        FQuery.Query.SQL.Add('  marca=:marca,');
        FQuery.Query.SQL.Add('  ativo=:ativo ');
        FQuery.Query.SQL.Add('where codigo=:codigo');

        FQuery.Query.ParamByName('descricao').AsString := pDados.FDescricao;
        FQuery.Query.ParamByName('valor').AsString :=  pDados.Fvalor;
        FQuery.Query.ParamByName('data_venc').AsDateTime := pDados.Fdata_venc;
        FQuery.Query.ParamByName('marca').AsString := pDados.Fmarca;
        FQuery.Query.ParamByName('ativo').AsInteger := pDados.Fativo;
        FQuery.Query.ParamByName('codigo').AsInteger := pDados.Codigo;
        FQuery.Query.Execute;
        result := True;
      except on e: Exception do
        raise Exception.Create('Erro ao Atualizar Produto.'+e.Message);
      end;

end;

constructor TProduto.create;
begin
     FQuery := TQuery.Create;
end;

function TProduto.Deletar(pCodigo: integer): boolean;
begin
     try
        FQuery.Query.ExecSQL('delete from tproduto where codigo =:codigo',[pcodigo]);
     except on e: Exception do
        raise Exception.Create('Erro ao Excluir Produto.'+e.Message);
     end;
end;

destructor TProduto.destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TProduto.Listar(pDataSet: TDataSource): TDataSet;
begin
     FQuery.Query.Open('select * from tproduto');
     pDataSet.DataSet := FQuery.Query;
     Result := pDataSet.DataSet;
end;


end.
