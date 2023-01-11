CREATE TRIGGER new_id  /*allows to create new id+1*/
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    DECLARE last_id int;
    SET last_id = (SELECT MAX(product_id) FROM products);
    SET NEW.product_id = last_id + 1;
END //
DELIMITER ;
