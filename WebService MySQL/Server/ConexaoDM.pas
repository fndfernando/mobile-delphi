unit ConexaoDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TConexaoDtm = class(TDataModule)
    conexao: TFDConnection;
    qryUsuario: TFDQuery;
    qryUsuariocod_usuario: TFDAutoIncField;
    qryUsuarionome_usuario: TStringField;
    qryUsuariosenha: TStringField;
    qryUsuarioemail: TStringField;
    qryUsuariofoto: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    function NovoUsuario(Codigo:integer;Usuario,Senha,Email:string;
      var msgErro:string):boolean;
  end;

var
  ConexaoDtm: TConexaoDtm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TConexaoDtm }

function TConexaoDtm.NovoUsuario(Codigo: integer; Usuario, Senha,
  Email: string; var msgErro:string): boolean;
begin
  Result:=false;
  msgErro:='';
  qryUsuario.Close;
  qryUsuario.Open();

  try
    qryUsuario.Append;
    qryUsuario.FieldByName('nome_usuario').AsString:=Usuario;
    qryUsuario.FieldByName('senha').AsString:=Senha;
    qryUsuario.FieldByName('email').AsString:=Email;
    qryUsuario.Post;
    Result:=true;
  except
    on e:Exception do
    begin
      msgErro:=e.Message;
      Result:=false;
    end;
  end;
end;

end.
