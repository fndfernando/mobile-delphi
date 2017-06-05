CREATE TABLE produto (
  cod_produto INTEGER  AUTO_INCREMENT,
  nome_produto VARCHAR(50),
  cod_grupo INTEGER,
  valor_compra DECIMAL(12,2),
  valor_venda DECIMAL(12,2),
  foto BLOB,
  PRIMARY KEY(cod_produto)
)


CREATE TABLE grupo_produto (
  cod_grupo INTEGER  AUTO_INCREMENT,
  nome_grupo VARCHAR(50),
  PRIMARY KEY(cod_grupo)
)