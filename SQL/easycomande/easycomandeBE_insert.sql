--CATEGORIE
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (1, 'Sfizi e Capricci', 'sfizi-e-capricci');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (2, 'Non solo Griglia', 'non-solo-griglia');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (3, 'Primi', 'primi');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (4, 'Secondi', 'secondi');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (5, 'Panini', 'panini');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (6, 'Dolci', 'dolci');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (7, 'Bevande', 'bevande');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (8, 'Extra', 'extra');

--PRODOTTI per 'Sfizi e Capricci'
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O Casareccio', 'Parmigiana - Scarola con Fetta di Pane – Polpette al Sugo – Salsiccia Broccoli – Gattò di Patate','10','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'E Bruschette', 'Pachino ,Rucola e Grana – Pomodori Secchi e Pesto di Basilico – Pachino e Alici – Pachino con Provola e melanzane sotto olio','4.50','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O Sfizio', 'Polpette di Melanzane e Verdure Pastellate','6','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O vulij ro Chef', 'Melanzane a funghetti – Mozzarella d\'Agerola – Provola d\'Agerola – Insalata di Pomodoro- Pomodori Secchi – Crema di Basilico – Verdure Grigliate','9','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'E Pizzett Fritt', 'Gorgonzola – Crema di Basilico e Grana – Pomodoro e Mozzarella d\'Agerola con Insalata di Carciofi','4.50','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O Cico\'s','8.50','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O Ciurill', 'Fiori di Zucca con Crema al Pomodoro e Pesto di Basilico','4.50','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O Tagliere', 'Affettati Misti e Formaggio con Confetture','12','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O Gluten Free', 'Barchetta di Patate con Crema al Pomodoro , Barchetta di Patate con Gorgonzola e Barchetta di patate con Crema di Basilico e Grana -Rosti triangolo allo speck – Fagottino di Salmone e Formaggio','6','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O sapor e Mar', 'Conchiglia Gratinata con Gamberi e Zucchine – Provola d\'Agerola con Alici e Olive Nere – Salmone Affumicato con Cipolla Rossa e Limone – Parmigiana di Pesce – Tortino di Baccalà e Patate','10','0','1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'O Frittin', 'Olive Ascolane – Mozzarelline – Fiori di Zucca – Mini Crocchette con Prosciutto Frittelle di Alghe – Mozzarella in Carrozza con Speck e Provola – Supplì – Anelli di Cipolla','8.50','0','1');

--PRODOTTI per 'Non solo Griglia'

INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (1, 'Antipasto Misto', 'Prosciutto, Mozzarella, Sott\'olio', '10', '8', '1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (2, 'Caprese', 'Pomodori, Mozzarella', '5', '3', '2');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (3, 'Margherita', 'Pomodori, Mozzarella', '3', '4', '1');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (4, 'Gnocci alla sorrentina', 'Pomodori, Mozzarella', '12', '4', '3');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (5, 'Franco', 'Hamb, Cipolla, Formaggio', '8', '6', '5');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (6, 'Ricotta e pera', 'Ricotta, pera, zucchero', '5', '5', '6');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (7, 'Acqua', 'Acqua Minerale', '2', '2', '7');
INSERT INTO `menu` (`id`, `name`, `description`, `price`, `priceoffer`, `category_id`) VALUES (8, 'Hamburger', 'Hamburger', '2', '2', '8');

--STATI
INSERT INTO `state` (`state`) VALUES ('pending');
INSERT INTO `state` (`state`) VALUES ('completed');

--CONFIGURAZIONI
INSERT INTO `configurations` (`key`,`enable`,`label`,`value`) VALUES ('serviceenable','1','Servizio 10% del totale','10');
--INSERT INTO `configurations` (`key`,`enable`,`label`,`value`) VALUES ('coveredenable','0','Calcolo dei coperti','1.5');

--UTENTI
INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('admin@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','admin','admin','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf');
INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('manager@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','manager','manager','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxg');