/*DROP TRIGGER `easycomandeBE`.`menu_AFTER_DELETE`;*/

delimiter |
CREATE TRIGGER `easycomandeBE`.`menu_AFTER_DELETE` AFTER DELETE ON `menu` FOR EACH ROW
BEGIN
	UPDATE categories SET count = count - 1 WHERE categories.id = OLD.category_id;
END;
|
delimiter ;