DROP TRIGGER `easycomandeBE`.`items_AFTER_INSERT`;

delimiter |
CREATE TRIGGER `easycomandeBE`.`items_AFTER_INSERT` AFTER INSERT ON `items` FOR EACH ROW
BEGIN
	/*INSERT INTO orders SET totalorder = NEW.total;*/
    UPDATE orders SET totalorder = NEW.total WHERE orders.id = NEW.orders_id;
END;
|
delimiter ;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO items (quantity, total, service, note, menu_id, orders_id) VALUES (5,50,0,'',1,1);