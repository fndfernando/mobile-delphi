object ConexaoDtm: TConexaoDtm
  OldCreateOrder = False
  Height = 224
  Width = 315
  object conexao: TFDConnection
    Params.Strings = (
      'ConnectionDef=MySQLWebServer')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object qryUsuario: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT u.cod_usuario, u.nome_usuario, u.senha, u.email, u.foto'
      'FROM usuario u')
    Left = 152
    Top = 24
    object qryUsuariocod_usuario: TFDAutoIncField
      FieldName = 'cod_usuario'
      Origin = 'cod_usuario'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUsuarionome_usuario: TStringField
      FieldName = 'nome_usuario'
      Origin = 'nome_usuario'
      Size = 40
    end
    object qryUsuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
    object qryUsuarioemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object qryUsuariofoto: TBlobField
      FieldName = 'foto'
      Origin = 'foto'
    end
  end
end
