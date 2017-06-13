INSERT INTO `easycomandebe`.`categories` (`id`, `name`, `slug`) VALUES (1, 'Antipasti', 'antipasti');
INSERT INTO `easycomandebe`.`categories` (`id`, `name`, `slug`) VALUES (2, 'Primi', 'primi');
INSERT INTO `easycomandebe`.`categories` (`id`, `name`, `slug`) VALUES (3, 'Secondi', 'secondi');
INSERT INTO `easycomandebe`.`categories` (`id`, `name`, `slug`) VALUES (4, 'Panini', 'panini');
INSERT INTO `easycomandebe`.`categories` (`id`, `name`, `slug`) VALUES (5, 'Dolci', 'dolci');
INSERT INTO `easycomandebe`.`categories` (`id`, `name`, `slug`) VALUES (6, 'Bevande', 'bevande');

INSERT INTO `easycomandebe`.`menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'Antipasto Misto', 'Prosciutto, Mozzarella, Sott\'olio', '10', '8', '1');
INSERT INTO `easycomandebe`.`menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (2, 'Caprese', 'Pomodori, Mozzarella', '5', '4', '1');
INSERT INTO `easycomandebe`.`menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (3, 'Gnocci alla sorrentina', 'Pomodori, Mozzarella', '12', '4', '2');
INSERT INTO `easycomandebe`.`menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (4, 'Franco', 'Hamb, Cipolla, Formaggio', '8', '6', '4');
INSERT INTO `easycomandebe`.`menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (5, 'Ricotta e pera', 'Ricotta, pera, zucchero', '5', '5', '5');
INSERT INTO `easycomandebe`.`menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (6, 'Acqua', 'Acqua Minerale', '2', '2', '6');

INSERT INTO `easycomandebe`.`state` (`state`) VALUES ('pending');
INSERT INTO `easycomandebe`.`state` (`state`) VALUES ('completed');