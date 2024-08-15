SELECT id_cliente, nome, sobrenome, email, total_pedidos
FROM (
    SELECT 
        c.id_cliente,
        c.nome,
        c.sobrenome,
        c.email,
        (SELECT SUM(p.valor_pedido) FROM pedidos p WHERE p.id_cliente = c.id_cliente) AS total_pedidos
    FROM clientes c
) pedidos_clientes
WHERE total_pedidos > 1000
ORDER BY total_pedidos DESC
LIMIT 10;