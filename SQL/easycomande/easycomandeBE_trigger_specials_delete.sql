/*DROP TRIGGER `easycomandeBE`.`specials_AFTER_DELETE`;*/

delimiter |
CREATE TRIGGER `easycomandeBE`.`specials_AFTER_DELETE` AFTER DELETE ON `specials` FOR EACH ROW
BEGIN
	UPDATE orders SET totalorder 	= totalorder - OLD.price 					WHERE orders.id = OLD.order_id;
	UPDATE orders SET totalservice 	= totalservice - (OLD.price * 10 / 100) 	WHERE orders.id = OLD.order_id;
END;
|
delimiter ;