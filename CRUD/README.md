# CRUD - Android

Exemplo simples de CRUD para cadastrar Produto e Grupo de Produto usando SQLite

## Tabelas 

CREATE TABLE produto (
  cod_produto INTERGER NOT NULL,
  nome_produto VARCHAR(30),
  cod_grupo INTERGER NOT NULL,
  valor_compra DECIMAL(12,2),
  valor_venda DECIMAL(12,2),
  PRIMARY KEY (cod_produto)
)

CREATE TABLE idproduto (
  id INTERGER NOT NULL
)

CREATE TABLE grupo_produto (
  cod_grupo INTERGER NOT NULL,
  nome_grupo VARCHAR(30),
  PRIMARY KEY (cod_grupo)
)

CREATE TABLE idgrupo (
  id INTERGER NOT NULL
)

_Adicionar arquivo do Banco_
- Acessar Project -> Deployment
- Clicar em Add Files -> Selecionar o arquivo CRUD.db
- Alterar coluna "Remote Path" para ".\assets\internal"