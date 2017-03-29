Nome: Fernando Costa Campos
TAG: MySQL, Banco de Dados, SOAP

Exemplo simples de uma inserção de dados em uma tabela no MySQL via mobile.
Utilizando um Servidor quer irá esperar o comando o cliente que pode ser um Mobile ou Windows


SQL para crição da tabela

CREATE TABLE `test`.`usuario` (
  `cod_usuario` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(40),
  `senha` VARCHAR(20),
  `email` VARCHAR(100),
  `foto` MEDIUMBLOB,
  PRIMARY KEY(`cod_usuario`)
)
ENGINE = InnoDB;