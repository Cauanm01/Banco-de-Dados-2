import psycopg2

conn = psycopg2.connect("dbname=teste user=postgres password=1234")
cur = conn.cursor()

cur.execute("SELECT * FROM log ORDER BY id_cliente")
logs = cur.fetchall()

for op, id_cliente, nome, saldo in logs:
    if op == 'INSERT':
        cur.execute("INSERT INTO clientes_em_memoria (id, nome, saldo) VALUES (%s, %s, %s)",
                    (id_cliente, nome, saldo))
    elif op == 'UPDATE':
        cur.execute("UPDATE clientes_em_memoria SET saldo = %s WHERE id = %s",
                    (saldo, id_cliente))

conn.commit()
conn.close()
