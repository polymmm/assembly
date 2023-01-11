START TRANSACTION;
SET AUTOCOMMIT = 0;
SAVEPOINT sav;
UPDATE products SET products.price = products.price+10 WHERE products.product_id > 3;
SELECT* FROM products;
ROLLBACK TO sav;
SELECT * FROM products;
COMMIT;
