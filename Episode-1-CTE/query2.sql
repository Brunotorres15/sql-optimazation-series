with sum_pedidos as (
SELECT id_cliente, SUM(valor_pedido) as total_pedidos
	FROM cap10.pedidos
	GROUP BY id_cliente
	having  SUM(valor_pedido) > 1000
)
select c.id_cliente, c.nome, c.sobrenome, c.email, sp.total_pedidos
from cap10.clientes c
inner join sum_pedidos sp on c.id_cliente = sp.id_cliente
ORDER BY total_pedidos DESC
LIMIT 10;