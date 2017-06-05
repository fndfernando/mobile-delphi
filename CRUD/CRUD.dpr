program CRUD;

uses
  System.StartUpCopy,
  FMX.Forms,
  PrincipalForm in 'PrincipalForm.pas' {PrincipalFrm},
  ConexaoDM in 'ConexaoDM.pas' {ConexaoDtm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TConexaoDtm, ConexaoDtm);
  Application.CreateForm(TPrincipalFrm, PrincipalFrm);
  Application.Run;
end.
