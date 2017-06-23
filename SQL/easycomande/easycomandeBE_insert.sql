INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (1, 'Antipasti', 'antipasti');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (2, 'Pizze', 'pizze');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (3, 'Primi', 'primi');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (4, 'Secondi', 'secondi');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (5, 'Panini', 'panini');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (6, 'Dolci', 'dolci');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (7, 'Bevande', 'bevande');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (8, 'Extra', 'extra');

INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'Antipasto Misto', 'Prosciutto, Mozzarella, Sott\'olio', '10', '8', '1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (2, 'Caprese', 'Pomodori, Mozzarella', '5', '3', '2');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (3, 'Margherita', 'Pomodori, Mozzarella', '3', '4', '1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (4, 'Gnocci alla sorrentina', 'Pomodori, Mozzarella', '12', '4', '3');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (5, 'Franco', 'Hamb, Cipolla, Formaggio', '8', '6', '5');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (6, 'Ricotta e pera', 'Ricotta, pera, zucchero', '5', '5', '6');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (7, 'Acqua', 'Acqua Minerale', '2', '2', '7');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (8, 'Hamburger', 'Hamburger', '2', '2', '8');

INSERT INTO `state` (`state`) VALUES ('pending');
INSERT INTO `state` (`state`) VALUES ('completed');

INSERT INTO `configurations` (`key`,`enable`,`label`,`value`) VALUES ('serviceenable','1','Servizio 10% del totale','10');
INSERT INTO `configurations` (`key`,`enable`,`label`,`value`) VALUES ('coveredenable','0','Calcolo dei coperti','1.5');

INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('admin@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','admin','admin','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf');
INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('manager@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','manager','manager','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxg');