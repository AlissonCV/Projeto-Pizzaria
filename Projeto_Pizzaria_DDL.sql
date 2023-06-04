CREATE SCHEMA pizzaria;

SET search_path TO filme;
SET datestyle TO 'DMY';

CREATE TABLE <tabela> (
	<atributo> <tipo_atributo> <restrição_atributo>,
	CONSTRAINT <nome_restrição>
		PRIMARY KEY (<atributo>),
	CONSTRAINT <nome_restrição>
		FOREIGN KEY (<atributo>) REFERENCES <tabela>
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

INSERT INTO <tabela> VALUES (<atributos>),
							(<atributos>);