DROP TRIGGER `easycomandeBE`.`items_AFTER_UPDATE`;

delimiter |
CREATE TRIGGER `easycomandeBE`.`items_AFTER_UPDATE` AFTER UPDATE ON `items` FOR EACH ROW
BEGIN
	UPDATE orders SET totalorder 	= (totalorder - OLD.total) 		+ NEW.total WHERE orders.id = NEW.order_id;
	UPDATE orders SET totalservice 	= (totalservice - OLD.service) 	+ NEW.service WHERE orders.id = NEW.order_id;
END;
|
delimiter ;

/*SET FOREIGN_KEY_CHECKS=0;*/
/*UPDATE items SET quantity = 3, total = 21, service = 2.10 WHERE id = 7;*/