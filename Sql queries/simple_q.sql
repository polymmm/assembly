SELECT order_id, rating FROM 'feedback' ; /*2 attributes*/
SELECT DISTINCT order_id, rating FROM 'feedback';  /*2 attributes no duplicates*/
SELECT DISTINCT order_id, rating FROM 'feedback' LIMIT 1; /*1 row*/
SELECT order_id, rating FROM 'feedback' WHERE rating BETWEEN 3 AND 5; /*range*/
SELECT order_id, rating FROM 'feedback' WHERE review LIKE '%good%'; /*substring*/


