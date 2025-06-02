CREATE UNLOGGED TABLE clientes_em_memoria (
    id INT PRIMARY KEY,
    nome TEXT,
    saldo NUMERIC
);

CREATE TABLE log (
    id SERIAL PRIMARY KEY,
    id_transacao INT,
    operacao TEXT,
    id_cliente INT,
    nome TEXT,
    saldo NUMERIC
);

CREATE TABLE log_commit (
    id_transacao INT PRIMARY KEY
);