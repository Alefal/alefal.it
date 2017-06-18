/*DROP TRIGGER `items_AFTER_UPDATE`;*/

delimiter |
CREATE TRIGGER `items_AFTER_UPDATE` AFTER UPDATE ON `items` FOR EACH ROW
BEGIN
	UPDATE orders SET totalorder 	= (totalorder - OLD.total) 		+ NEW.total WHERE orders.id = NEW.order_id;
	UPDATE orders SET totalservice 	= (totalservice - OLD.service) 	+ NEW.service WHERE orders.id = NEW.order_id;
END;
|
delimiter ;