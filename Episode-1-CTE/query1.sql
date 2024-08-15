SELECT id_client, first_name, last_name, email, total_orders
FROM (
    SELECT 
        c.id_client,
        c.first_name,
        c.last_name,
        c.email,
        (SELECT SUM(o.order_value) FROM orders o WHERE o.id_client = c.id_client) AS total_orders
    FROM clients c
) clients_orders
WHERE total_orders > 1000
ORDER BY total_orders DESC
LIMIT 10;
