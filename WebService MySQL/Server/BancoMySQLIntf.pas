{ Invokable interface IBancoMySQL }

unit BancoMySQLIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  IBancoMySQL = interface(IInvokable)
    ['{86B36F07-502E-44C4-9732-1FCF544DC006}']
    function NovoUsuario(Codigo:integer;Usuario,Senha,Email:string; var msgErro:string):boolean; stdcall;
    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IBancoMySQL));

end.
