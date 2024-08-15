WITH sum_orders AS (
    SELECT id_client, SUM(order_value) AS total_orders
    FROM orders
    GROUP BY id_client
    HAVING SUM(order_value) > 1000
)
SELECT c.id_client, c.first_name, c.last_name, c.email, so.total_orders
FROM clients c
INNER JOIN sum_orders so ON c.id_client = so.id_client
ORDER BY total_orders DESC
LIMIT 10;
