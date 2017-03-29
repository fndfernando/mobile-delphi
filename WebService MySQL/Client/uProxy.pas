// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8080/wsdl/IBancoMySQL
// Version  : 1.0
// (20/03/2017 16:22:25 - - $Rev: 86412 $)
// ************************************************************************ //

unit uProxy;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:BancoMySQLIntf-IBancoMySQL
  // soapAction: urn:BancoMySQLIntf-IBancoMySQL#NovoUsuario
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IBancoMySQLbinding
  // service   : IBancoMySQLservice
  // port      : IBancoMySQLPort
  // URL       : http://localhost:8080/soap/IBancoMySQL
  // ************************************************************************ //
  IBancoMySQL = interface(IInvokable)
  ['{3C31D5A3-A36A-E35D-4987-9A55A4694BE4}']
    function  NovoUsuario(const Codigo: Integer; const Usuario: string; const Senha: string; const Email: string; var msgErro: string): Boolean; stdcall;
  end;

function GetIBancoMySQL(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IBancoMySQL;


implementation
  uses System.SysUtils;

function GetIBancoMySQL(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IBancoMySQL;
const
  defWSDL = 'http://localhost:8080/wsdl/IBancoMySQL';
  defURL  = 'http://localhost:8080/soap/IBancoMySQL';
  defSvc  = 'IBancoMySQLservice';
  defPrt  = 'IBancoMySQLPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IBancoMySQL);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { IBancoMySQL }
  InvRegistry.RegisterInterface(TypeInfo(IBancoMySQL), 'urn:BancoMySQLIntf-IBancoMySQL', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IBancoMySQL), 'urn:BancoMySQLIntf-IBancoMySQL#NovoUsuario');

end.