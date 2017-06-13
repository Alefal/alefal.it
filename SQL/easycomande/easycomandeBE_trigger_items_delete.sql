/*DROP TRIGGER `easycomandeBE`.`items_AFTER_DELETE`;*/

delimiter |
CREATE TRIGGER `easycomandeBE`.`items_AFTER_DELETE` AFTER DELETE ON `items` FOR EACH ROW
BEGIN
	UPDATE orders SET totalorder 	= (totalorder - OLD.total) 		WHERE orders.id = OLD.order_id;
	UPDATE orders SET totalservice 	= (totalservice - OLD.service) 	WHERE orders.id = OLD.order_id;
END;
|
delimiter ;

/*SET FOREIGN_KEY_CHECKS=0;*/