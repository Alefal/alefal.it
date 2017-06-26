#CATEGORIE
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (1, 'Sfizi e Capricci', 'sfizi-e-capricci');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (2, 'Non solo Griglia', 'non-solo-griglia');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (3, 'Insalate', 'insalate');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (4, 'Contorni', 'contorni');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (5, 'Panini', 'panini');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (6, 'Speciali', 'speciali');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (7, 'Extra', 'extra');
INSERT INTO `categories` (`id`, `name`, `slug`) VALUES (8, 'Bevande', 'bevande');

#PRODOTTI per 'Sfizi e Capricci'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O Casareccio', 'Parmigiana - Scarola con Fetta di Pane – Polpette al Sugo – Salsiccia Broccoli – Gattò di Patate','10','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('E Bruschette', 'Pachino ,Rucola e Grana – Pomodori Secchi e Pesto di Basilico – Pachino e Alici – Pachino con Provola e melanzane sotto olio','4.50','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O Sfizio', 'Polpette di Melanzane e Verdure Pastellate','6','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O vulij ro Chef', 'Melanzane a funghetti – Mozzarella d\'Agerola – Provola d\'Agerola – Insalata di Pomodoro- Pomodori Secchi – Crema di Basilico – Verdure Grigliate','9','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('E Pizzett Fritt', 'Gorgonzola – Crema di Basilico e Grana – Pomodoro e Mozzarella d\'Agerola con Insalata di Carciofi','4.50','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O Cico\'s','','8.50','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O Ciurill', 'Fiori di Zucca con Crema al Pomodoro e Pesto di Basilico','4.50','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O Tagliere', 'Affettati Misti e Formaggio con Confetture','12','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O Gluten Free', 'Barchetta di Patate con Crema al Pomodoro , Barchetta di Patate con Gorgonzola e Barchetta di patate con Crema di Basilico e Grana -Rosti triangolo allo speck – Fagottino di Salmone e Formaggio','6','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O sapor e Mar', 'Conchiglia Gratinata con Gamberi e Zucchine – Provola d\'Agerola con Alici e Olive Nere – Salmone Affumicato con Cipolla Rossa e Limone – Parmigiana di Pesce – Tortino di Baccalà e Patate','10','0','1');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('O Frittin', 'Olive Ascolane – Mozzarelline – Fiori di Zucca – Mini Crocchette con Prosciutto Frittelle di Alghe – Mozzarella in Carrozza con Speck e Provola – Supplì – Anelli di Cipolla','8.50','0','1');

#PRODOTTI per 'Non solo Griglia'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Filetto', 'con salsa al formaggio e cipolla alla birra','13.50','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Filetto al Pepe Verde','','14.50','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Filetto dello Chef','','16.50','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Tagliata', 'Rucola- Grana – Pachino','14.50','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Tagliata', 'Funghi -Insalata – Graniglie di Noce','15.50','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Tagliata', 'Carciofi – Asparagi al Vapore – Grana','15','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Entrecote Francese','per etto','5','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Entrecote Irlandese','per etto','6','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Entrecote Argentina','per etto','5','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Tagliata di Pollo','con Verdure Grigliate','8.50','0','2');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Salsiccia e Patate','','8','0','2');

#PRODOTTI per 'Insalate'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Taturiello', '','7','0','3');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Fonzo', '','6','0','3');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Abby', '','6','0','3');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Elisa', '','6','0','3');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Melissa', '','6.50','0','3');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Raffaella', '','7.50','0','3');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Agnese', '','8','0','3');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Effeeffe', '','9','0','3');

#PRODOTTI per 'Contorni'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Patate Fritte', '','3.50','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Patate Dippers', '','4','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Patate Onion & Black Peppers', '','4.50','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Patate Novelle', '','3','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Crocchettone', '','6','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Verdure Pastellate', '','2.50','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Verdure Grigliate', '','3.50','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Insalata', '','2.50','0','4');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Insalata Mista', '','3','0','4');

#PRODOTTI per 'Panini'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Checco', 'Pomodoro- Insalata - Cipolla di Tropea – Cheddar – Bacon','4.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Giotto', 'Scamorza d\'Agerola – Bacon – Cipolla e Peperoni Grigliati','6','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Da Vinci', 'Scamorza d\'Agerola – Bacon- Melanzane a funghetti','6','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Pinturicchio', 'Salsa al Pepe Verde – Zucchine Grigliate – Cipolla di Tropea','6','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Michelangelo', 'Pomodori secchi – Pesto – Bacon – Cipolla di Tropea','6','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Modigliani', 'Peperoni – Cipolle fritte – Pomodoro – Insalata – Cheddar','6','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Totò', 'Provola d\'Agerola – Mortadella – Formaggio fuso','5','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Sofia Loren', 'Provola d\'Agerola – Broccoli','5.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Alberto Sordi', 'Porchetta d\'Ariccia – Provola d\'Agerola – Melanzane a funghetti','6.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Benigni', 'Verdure pastellate – Mozzarela d\'Agerola – Crema di Pomodoro','5.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Rossellini', 'Mozzarella d\'Agerola – Grattugiata di Limone-Verdure Grigliate – Bacon','6.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Gassman', 'Formaggio Fuso – Lardo di Patanegra – Occhio di Bue','6','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Mennea', 'Funghi e Asparagi – Scamorza d\'Agerola- Crema di Datterini','6.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Rossi', 'Insalata – Pomodoro – Crema di Basilico','5.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Pantani', 'Scamorza – Crema di Broccoli – Cipolla di Tropea','5','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Totti', ' Gamberetti – Crudo – Insalata e Salsa U.S.A.','7','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Campioni del Mondo', 'Lardo di Patanegra – Provola d\'Agerola – Pomodorini secchi – Pesto','7','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Testa Rossa', 'Tonno – Formaggio Fuso – Anelli di Cipolla – Scaglie di Parmigiano','7','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Simoncelli', 'Crudo – Mozzarella d\'Agerola – pomodoro -Insalata – Cipolla -Patate Fritte','6.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('DelPezo', 'Provola d\'Agerola – Crema di Pomodoro Piccante– Bacon','5','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Antonella', 'Mozzarrella d\'Agerola – insalata – Crocchè di patate – Prosciutto Cotto','6','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Nunzia', 'Crema di Funghi – Scamorza d\'Agerola','6.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Franco', 'Verdure grigliate- Crema di Basilico- Grana – Stracciatella d\'uovo','6.50','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Elisabetta', 'Pomodoro – Insalata – Cipolla di Tropea – Cheddar – Bacon – Occhio di Bue','7','0','5');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Nazario', 'Lardo di Patanegra – Mozzarella -Bacon – Crema di Broccoli','6.50','0','5');

#PRODOTTI per 'Speciali'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Abbuffata', 'Frittata di maccheroni in tempura farcite e burrata','13','0','6'); 
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Speedy Pollo', 'Mucho gusto - Speedy pollo - Birbe di pollo - Mozzarella Stick - Ebi fry','9.50','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Maialata', 'Tris di patate e wurstel','7','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Troisi', 'Pomodoro - Mozzarella - Insalata - Crudo','6','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Pino Daniele', 'Salsiccia - Broccoli - Provola','7','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Il Marchese del Grillo', 'Porchetta - Provola - Melanzane a funghetti','6.50','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Sgarbi', 'Salsiccia - Rucola - Pepe nero - Limone','7','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Clerici', 'Parmigiana di melanzane','6','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('La Banda degli Onesti', 'Pollo - Insalata - Patate fritte','7','0','6');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Mina e Celenatno', 'Pomodoro - Tonno - Insalata - Cipolla di tropea','6.50','0','6');


#PRODOTTI per 'Extra'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('hamburger da 200gr', '','2.50','0','7');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('hamburger di Chianina', '','4.50','0','7');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('hamburger di Scottona', '','4','0','7');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('hamburger di Black Angus', '','4','0','7');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('hamburgher vegani', '','2.50','0','7');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('hamburgher di pollo', '','2.50','0','7');

#PRODOTTI per 'Bevande'
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra Pilsner Urquell', '33cl','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra Grolsch', '45cl','6.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra London Pride', '33cl','5.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra Golden Pride', '33cl','6','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra India Pale Ale', '33cl','6.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra Stefanus', '75cl','23','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Birra London Porter', '50cl','9','0','8');

INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Caffè','','1','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Acqua 1\2','','1','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Acqua grande','','2','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Coca Cola','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Coca Cola Zero','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Fanta & Sprite','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Succo di frutta','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Schweppes','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Tassoni','','3','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Cocktail San Pellegrino','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Red Bull','','3','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('The Estathe Limone','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('The Estate Pesca','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Crodino','','2','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Crodino Twist','','2','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Spritz','','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Corona','','3','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Tennens','','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Guinnes','','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Ichnusa','','2.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Amari','','3','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Whisky','','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Vodka','','4','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Rum','','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Tequila','','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Absenta','','3.50','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Analcolico','','4','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Cocktail','','5','0','8');
INSERT INTO `menu` (`name`, `description`, `price`, `priceoffer`, `category_id`) VALUES ('Shottini','','2.50','0','8');

#STATI
INSERT INTO `state` (`state`) VALUES ('pending');
INSERT INTO `state` (`state`) VALUES ('completed');

#CONFIGURAZIONI
INSERT INTO `configurations` (`key`,`enable`,`label`,`value`) VALUES ('serviceenable','1','Servizio 10% del totale','10');
#INSERT INTO `configurations` (`key`,`enable`,`label`,`value`) VALUES ('coveredenable','0','Calcolo dei coperti','1.5');

#UTENTI
INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('admin@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','admin','admin','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf');
INSERT INTO `users` (`email`,`password`,`name`,`role`,`api_token`) VALUES ('manager@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','manager','manager','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxg');