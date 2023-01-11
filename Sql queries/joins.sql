SELECT * FROM orders CROSS JOIN feedback; /* cross join*/
SELECT * FROM orders INNER JOIN feedback ON orders.order_id=feedback.order_id; /* cross join*/
SELECT orders.order_id, orders.customer_id FROM orders INNER JOIN feedback ON orders.order_id=feedback.order_id WHERE feedback.order_id=3; /* semi join*/
SELECT feedback.order_id, feedback.courier_id, feedback.rating, feedback.review FROM feedback WHERE NOT EXISTS (SELECT orders.order_id FROM orders WHERE orders.order_id = feedback.order_id); /* anti semi join*/
SELECT * FROM orders O LEFT JOIN feedback F ON O.order_id = F.order_id UNION SELECT * FROM orders O RIGHT JOIN feedback F ON O.order_id = F.order_id; /* full join*/
