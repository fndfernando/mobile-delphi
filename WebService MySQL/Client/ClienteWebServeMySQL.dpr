program ClienteWebServeMySQL;

uses
  System.StartUpCopy,
  FMX.Forms,
  PrincipalForm in 'PrincipalForm.pas' {PrincipalFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalFrm, PrincipalFrm);
  Application.Run;
end.
