unit uConexao;

interface
uses
  System.sysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;
type
  TConexao = class
  private
    FConexao : TFDConnection;
    procedure Configurar_db;
  public
    constructor create;
    destructor destroy; override;

    function getconexao : TFDConnection;

  end;

implementation

{ TConexao }

function TConexao.getconexao: TFDConnection;
begin
     Result := FConexao;
end;

procedure TConexao.Configurar_db;
begin
    FConexao.Params.DriverID := 'MSSQL';
    FConexao.Params.Database := 'areco_teste';
    FConexao.Params.Add('server=localhost');
    FConexao.Params.UserName := 'sa';
    FConexao.Params.Password := 'masterkey';
    FConexao.Connected       := true;
end;

constructor TConexao.create;
begin
     FConexao := TFDConnection.Create(nil);
     Configurar_db;
end;

destructor TConexao.destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

end.
