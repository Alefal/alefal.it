INSERT INTO `easycomandebe`.`categories` (`name`, `slug`) VALUES ('Antipasto', 'antipasto');

INSERT INTO `easycomandebe`.`menu` (`name`, `description`, `price`, `priceoffer`, `categories_id`) VALUES ('Antipasto Misto', 'Prosciutto, Mozzarella, Sott\'olio', '10', '8', '1');

INSERT INTO `easycomandebe`.`state` (`state`) VALUES ('pending');
INSERT INTO `easycomandebe`.`state` (`state`) VALUES ('completed');

INSERT INTO `easycomandebe`.`orders` (`date`, `client`, `totalorder`, `totalservice`, `state_id`) VALUES ('2017-06-12 11:17:00', 'Tavolo 1, coperti 2', '0', '0', '1');

INSERT INTO `easycomandebe`.`specials` (`special`, `price`, `orders_id`) VALUES ('speciale', '10', '1');

INSERT INTO `easycomandebe`.`notes` (`note`, `orders_id`) VALUES ('Piatti abbondanti', '1');