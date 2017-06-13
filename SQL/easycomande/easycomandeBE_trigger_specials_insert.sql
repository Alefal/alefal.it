DROP TRIGGER `easycomandeBE`.`specials_AFTER_INSERT`;

delimiter |
CREATE TRIGGER `easycomandeBE`.`specials_AFTER_INSERT` AFTER INSERT ON `specials` FOR EACH ROW
BEGIN
	UPDATE orders SET totalorder 	= totalorder + NEW.price 				WHERE orders.id = NEW.order_id;
	UPDATE orders SET totalservice 	= totalservice + (NEW.price * 10 / 100) WHERE orders.id = NEW.order_id;
END;
|
delimiter ;

/*SET FOREIGN_KEY_CHECKS=0;*/
/*INSERT INTO items (quantity, total, service, note, menu_id, orders_id,state_id) VALUES (5,50,10,'noteeeee',1,2,1);*/