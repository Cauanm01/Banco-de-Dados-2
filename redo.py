import psycopg2

def aplicar_redo():
    conn = psycopg2.connect(
        dbname="banco",
        user="postgres",
        password="1234",
        host="localhost",
        port=5433
    )
    cur = conn.cursor()


    cur.execute("""
        SELECT l.id_transacao, l.operacao, l.id_cliente, l.nome, l.saldo
        FROM log l
        JOIN log_commit lc ON l.id_transacao = lc.id_transacao
        ORDER BY l.id;
    """)
    operacoes = cur.fetchall()

    transacoes_redo = set()

    for id_transacao, operacao, id_cliente, nome, saldo in operacoes:
        transacoes_redo.add(id_transacao)

        if operacao == 'INSERT':
            cur.execute("""
                INSERT INTO clientes_em_memoria (id, nome, saldo)
                VALUES (%s, %s, %s)
                ON CONFLICT (id) DO NOTHING;
            """, (id_cliente, nome, saldo))

        elif operacao == 'UPDATE':
            cur.execute("""
                UPDATE clientes_em_memoria
                SET saldo = %s
                WHERE id = %s;
            """, (saldo, id_cliente))

        elif operacao == 'DELETE':
            cur.execute("""
                DELETE FROM clientes_em_memoria
                WHERE id = %s;
            """, (id_cliente,))

    conn.commit()

    if not transacoes_redo:
        print("Nenhuma operação de transação commitada encontrada no log.")
    else:
        print("REDO aplicado para as seguintes transações:", sorted(transacoes_redo))


    cur.execute("SELECT * FROM clientes_em_memoria ORDER BY id;")
    clientes = cur.fetchall()
    print("\nEstado atual da tabela 'clientes_em_memoria':")
    for cliente in clientes:
        print(f"ID: {cliente[0]}, Nome: {cliente[1]}, Saldo: {cliente[2]}")

    conn.close()

if __name__ == "__main__":
    aplicar_redo()
