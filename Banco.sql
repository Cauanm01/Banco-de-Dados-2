CREATE UNLOGGED TABLE clientes_em_memoria (
  id SERIAL PRIMARY KEY,
  nome TEXT,
  saldo NUMERIC
);


CREATE TABLE log (
  operacao TEXT,
  id_cliente INT,
  nome TEXT,
  saldo NUMERIC
);

BEGIN;
INSERT INTO clientes_em_memoria (nome, saldo) VALUES ('Cliente 1', 100.00);
INSERT INTO log (operacao, id_cliente, nome, saldo) VALUES ('INSERT', 1, 'Cliente 1', 100.00);
UPDATE clientes_em_memoria SET saldo = saldo + 50 WHERE id = 1;
INSERT INTO log (operacao, id_cliente, nome, saldo) VALUES ('UPDATE', 1, 'Cliente 1', 150.00);
COMMIT;
