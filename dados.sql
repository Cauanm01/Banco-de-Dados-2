INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (1, 'INSERT', 1, 'Cliente 1', 100.00);
INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (1, 'UPDATE', 1, 'Cliente 1', 150.00);
INSERT INTO log_commit (id_transacao) VALUES (1);


INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (2, 'INSERT', 2, 'Cliente 2', 200.00);
INSERT INTO log_commit (id_transacao) VALUES (2);


INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (3, 'INSERT', 3, 'Cliente 3', 300.00);
INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (3, 'UPDATE', 3, 'Cliente 3', 350.00);
INSERT INTO log_commit (id_transacao) VALUES (3);


INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (4, 'INSERT', 4, 'Cliente 4', 400.00);
INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (4, 'DELETE', 4, NULL, NULL);
INSERT INTO log_commit (id_transacao) VALUES (4);


INSERT INTO log (id_transacao, operacao, id_cliente, nome, saldo)
VALUES (5, 'INSERT', 5, 'Cliente 5', 500.00);
INSERT INTO log_commit (id_transacao) VALUES (5);

