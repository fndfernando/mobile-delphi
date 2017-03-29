program WebServerMySQL;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  PrincipalForm in 'PrincipalForm.pas' {PrincipalFrm},
  WBDM in 'WBDM.pas' {WMDtm: TWebModule},
  BancoMySQLImpl in 'BancoMySQLImpl.pas',
  BancoMySQLIntf in 'BancoMySQLIntf.pas',
  ConexaoDM in 'ConexaoDM.pas' {ConexaoDtm: TDataModule},
  uProxy in '..\Client\uProxy.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TConexaoDtm, ConexaoDtm);
  Application.CreateForm(TPrincipalFrm, PrincipalFrm);
  Application.Run;
end.