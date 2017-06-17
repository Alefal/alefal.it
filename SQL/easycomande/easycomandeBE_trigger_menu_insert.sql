/*DROP TRIGGER `easycomandeBE`.`menu_AFTER_INSERT`;*/

delimiter |
CREATE TRIGGER `easycomandeBE`.`menu_AFTER_INSERT` AFTER INSERT ON `menu` FOR EACH ROW
BEGIN
	UPDATE categories SET count = count + 1 WHERE categories.id = NEW.category_id;
END;
|
delimiter ;