#CATEGORIE
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (1, 'Antipasti', 'antipasti');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (2, 'Primi', 'primi');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (3, 'Secondi', 'secondi');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (4, 'Pizze', 'pizze');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (5, 'Panini', 'panini');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (6, 'Speciali', 'speciali');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (7, 'Extra', 'extra');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (8, 'Bevande', 'bevande');

#PRODOTTI per 'Sfizi e Capricci'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Antipasto', 'Parmigiana - Scarola con Fetta di Pane – Polpette al Sugo – Salsiccia Broccoli – Gattò di Patate','10','0','1');

#PRODOTTI per 'Non solo Griglia'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Primo', 'con salsa al formaggio e cipolla alla birra','13.50','0','2');

#PRODOTTI per 'Insalate'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Secondo', '','7','0','3');

#PRODOTTI per 'Contorni'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Patate Fritte', '','3.50','0','4');

#PRODOTTI per 'Panini'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Panino', 'Pomodoro- Insalata - Cipolla di Tropea – Cheddar – Bacon','4.50','0','5');

#PRODOTTI per 'Speciali'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Abbuffata', 'Frittata di maccheroni in tempura farcite e burrata','13','0','6'); 

#PRODOTTI per 'Extra'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Hamburger da 200gr', '','2.50','0','7');

#PRODOTTI per 'Bevande'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra Pilsner Urquell', '33cl','3.50','0','8');

#STATI
INSERT INTO `state` (`state`) VALUES ('pending');
INSERT INTO `state` (`state`) VALUES ('completed');

#CONFIGURAZIONI
INSERT INTO `configurations` (`id`, `key`, `enable`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'serviceenable', 1, 'Servizio 10% del totale', '10', NULL, NULL),
(2, 'coveredenable','0','Calcolo dei coperti','1.5', NULL, NULL),
(3, 'printtitle', 0, 'Titolo della stampa', 'Easy Comande', '2017-06-29 16:15:44', '2017-06-29 16:39:30'),
(4, 'printmessageline1', 1, 'Primo messaggio nella stampa della ricevuta', 'Grazie per averci preferitoooooo', '2017-06-29 16:21:47', '2017-06-29 16:34:23'),
(5, 'printmessageline2', 1, 'Secondo messaggio nella stampa della ricevuta', 'Tornate prestooooooooo!', '2017-06-29 16:22:19', '2017-06-29 16:34:17'),
(6, 'printtablecomandefont', 1, 'Font per la stampa della comanda per la cucina', '38px', '2017-06-29 16:29:07', '2017-06-29 16:33:21'),
(7, 'printtablericevutafont', 1, 'Font per la stampa della comanda per il cliente', '16px', '2017-06-29 16:29:38', '2017-06-29 16:29:38');

#UTENTI
INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('admin@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','admin','admin','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf');
INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('manager@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','manager','manager','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxg');