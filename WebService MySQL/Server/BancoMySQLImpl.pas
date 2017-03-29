{ Invokable implementation File for TBancoMySQL which implements IBancoMySQL }

unit BancoMySQLImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, BancoMySQLIntf;

type

  { TBancoMySQL }
  TBancoMySQL = class(TInvokableClass, IBancoMySQL)
  public
    function NovoUsuario(Codigo:integer;Usuario,Senha,Email:string; var msgErro:string):boolean; stdcall;
  end;

implementation


{ TBancoMySQL }

uses PrincipalForm, ConexaoDM;


function TBancoMySQL.NovoUsuario(Codigo: integer; Usuario, Senha,
  Email: string; var msgErro:string): boolean;
begin
  result := ConexaoDtm.NovoUsuario(Codigo,Usuario,Senha,Email,msgErro);
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TBancoMySQL);
end.

