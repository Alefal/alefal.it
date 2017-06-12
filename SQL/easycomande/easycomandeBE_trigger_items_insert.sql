DROP TRIGGER `easycomandeBE`.`items_AFTER_INSERT`;

delimiter |
CREATE TRIGGER `easycomandeBE`.`items_AFTER_INSERT` AFTER INSERT ON `items` FOR EACH ROW
BEGIN
	UPDATE orders SET totalorder = totalorder + NEW.total WHERE orders.id = NEW.order_id;
	UPDATE orders SET totalservice = totalservice + NEW.service WHERE orders.id = NEW.order_id;
END;
|
delimiter ;

/*SET FOREIGN_KEY_CHECKS=0;*/
/*INSERT INTO items (quantity, total, service, note, menu_id, orders_id,state_id) VALUES (5,50,10,'noteeeee',1,2,1);*/