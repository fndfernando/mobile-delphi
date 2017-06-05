unit ConexaoDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TConexaoDtm = class(TDataModule)
    conexao: TFDConnection;
    updProduto: TFDUpdateSQL;
    qryProduto: TFDQuery;
    qryGrupo: TFDQuery;
    updGrupo: TFDUpdateSQL;
    qryGerarID: TFDQuery;
    qryProdutocod_produto: TWideStringField;
    qryProdutonome_produto: TStringField;
    qryProdutocod_grupo: TWideStringField;
    qryProdutonome_grupo: TStringField;
    qryProdutovalor_compra: TBCDField;
    qryProdutovalor_venda: TBCDField;
    qryProdutofoto: TBlobField;
    procedure conexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID(tabela:string):integer;
    function PegarCodGrupo(NomeGrupo:string):integer;
  end;

var
  ConexaoDtm: TConexaoDtm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;

procedure TConexaoDtm.conexaoBeforeConnect(Sender: TObject);
begin
  {$IFDEF ANDROID}
  conexao.Params.Values['Database'] := TPath.GetDocumentsPath +
   PathDelim + 'CRUD.db'
   {$ENDIF}
end;

function TConexaoDtm.GerarID(tabela: string): integer;
var
  ID:integer;
begin
  ID:=0;
  qryGerarID.Close;
  qryGerarID.SQL.Clear;
  qryGerarID.SQL.Add('SELECT id');
  qryGerarID.SQL.Add('FROM '+tabela);
  qryGerarID.Open();
  if (qryGerarID.RecordCount=0) then
  begin
    ID:=ID+1;
    qryGerarID.Append;
    qryGerarID.FieldByName('id').AsInteger:=ID;
    qryGerarID.Post;
  end
  else
  begin
    ID:=qryGerarID.FieldByName('id').AsInteger+1;
    qryGerarID.Edit;
    qryGerarID.FieldByName('id').AsInteger:=ID;
    qryGerarID.Post;
  end;
  Result:=ID;
end;

function TConexaoDtm.PegarCodGrupo(NomeGrupo: string): integer;
begin
  Result:=1;
  if (qryGrupo.Locate('nome_grupo',NomeGrupo,[locaseInsensitive])) then
    Result:=qryGrupo.FieldByName('cod_grupo').AsInteger;
end;

end.
