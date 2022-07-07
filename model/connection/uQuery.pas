unit uQuery;

interface
uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,uConexao;
Type
  TQuery = class
    private
      FConexao : TConexao;
      FQuery  : TFDQuery;
    public
      constructor Create;
      destructor Destroy; override;

      function Query : TFDQuery;
  end;

implementation

uses
  System.SysUtils;

{ TQuery }

constructor TQuery.Create;
begin
    FQuery  := TFDQuery.Create(nil);

    if Not Assigned(FConexao) then
      FConexao := TConexao.create;
    FQuery.Connection := FConexao.getconexao;
end;

destructor TQuery.Destroy;
begin
    FreeAndNil(FConexao);
    FreeAndNil(FQuery);
  inherited;
end;

function TQuery.Query: TFDQuery;
begin
     Result := FQuery;
end;

end.
