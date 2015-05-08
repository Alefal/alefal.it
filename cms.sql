-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mag 08, 2015 alle 11:35
-- Versione del server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `introtext` varchar(255) NOT NULL,
  `introtext_en` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `numOfItems` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentIndex` (`parentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_en`, `order`, `introtext`, `introtext_en`, `image`, `numOfItems`, `parentId`) VALUES
(39, 'Monumenti', 'Monuments', 1, 'Monumenti ', 'Monuments', '', 0, NULL),
(40, 'Dormire', 'Sleep', 2, 'Dormire', 'Sleep', '', 0, NULL),
(41, 'Chiese', 'Churches', 1, 'Churches', 'Churches', '', 0, 39),
(42, 'Hotels', 'Hotels', 1, 'Hotels', 'Hotels', '', 0, 40),
(43, 'Ville', 'Ville', 2, 'Ville', 'Ville', '', 0, 39),
(44, 'Food & Drinks', 'Food & Drinks', 3, 'Food & Drinks', 'Food & Drinks', '', 0, NULL),
(45, 'Sport', 'Sport', 5, 'Sport', 'Sport', '', 0, NULL),
(46, 'Muoversi', 'Move', 4, 'Muoversi', 'Move', '', 0, NULL),
(47, 'Servizi', 'Services', 7, 'Servizi', 'Services', '', 0, NULL),
(48, 'Stabilimenti Balneari', 'Bathing Establishments', 6, 'Stabilimenti Balneari', 'Bathing Establishments', '', 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `extra_fields`
--

CREATE TABLE IF NOT EXISTS `extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `extra_fields`
--

INSERT INTO `extra_fields` (`id`, `name`, `name_en`, `alias`) VALUES
(1, 'Stelle', 'Stars', 'stars'),
(2, 'Latitude', 'Latitude', 'latitude'),
(3, 'Longitude', 'Longitude', 'longitude'),
(4, 'Servizi', 'Services', 'services'),
(5, 'Telefono', 'Phone', 'phone'),
(6, 'Email', 'Email', 'email'),
(7, 'Web', 'Web', 'web');

-- --------------------------------------------------------

--
-- Struttura della tabella `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `cap` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `introtext` varchar(255) NOT NULL,
  `fulltext` longtext NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `introtext_en` varchar(255) NOT NULL,
  `fulltext_en` longtext NOT NULL,
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `bgimage` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `votingPercentage` double NOT NULL,
  `numOfvotes` int(11) NOT NULL,
  `numOfComments` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `items`
--

INSERT INTO `items` (`id`, `name`, `address`, `cap`, `city`, `introtext`, `fulltext`, `name_en`, `introtext_en`, `fulltext_en`, `categoryId`, `categoryName`, `featured`, `bgimage`, `logo`, `votingPercentage`, `numOfvotes`, `numOfComments`) VALUES
(1, 'Palazzo Avino', 'Via Roma, 15', 84010, 'Ravello', '<p>Descrizione Palazzo Avino</p>', '<p>Descrizione Palazzo Avino<\\/p>', 'Palazzo Avino', 'Description', 'Description', 42, 'hotels', 0, 'http://10.80.18.107/alefal.it/ionic/sideMenu/img/palazzoAvino.jpg', 'http://www.palazzoavino.it/sites/www.palazzoavino.com/themes/palazzo_avino/img/logo.png', 12, 0, 2),
(2, 'Villa Cimbrone', 'Via Roma, 34', 84010, 'Ravello', '<p>Descrizione Villa Cimbrone</p>', '<p>Descrizione Villa Cimbrone</p>', 'Villa Cimbrone', 'Description', 'Description', 42, 'hotels', 0, 'http://www.villacimbrone.com/images/index/1.jpg', 'http://www.villacimbrone.com/images/varie/logo.png', 12, 3, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `items_pivot`
--

CREATE TABLE IF NOT EXISTS `items_pivot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) NOT NULL,
  `extraFieldsId` int(11) NOT NULL,
  `extraFieldsValue` varchar(255) NOT NULL,
  `extraFieldsValue_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dump dei dati per la tabella `items_pivot`
--

INSERT INTO `items_pivot` (`id`, `itemId`, `extraFieldsId`, `extraFieldsValue`, `extraFieldsValue_en`) VALUES
(1, 1, 1, '5', '5'),
(2, 1, 2, '40.651699', '40.651699'),
(3, 1, 3, '14.612878', '14.612878'),
(4, 1, 4, 'Ristorante, Piscina, Snack Bar, Ascensore', 'Restaurants'),
(5, 1, 5, '089858585', '089858585'),
(6, 1, 6, 'info@palazzoavino.it', 'info@palazzoavino.it'),
(8, 1, 7, 'http://www.palazzoavino.it', 'http://www.palazzoavino.it'),
(9, 2, 1, '5', '5'),
(10, 2, 2, '40.644204', '40.644204'),
(11, 2, 3, '14.610897', '14.610897'),
(12, 2, 4, 'Piscina', 'Swimming pool'),
(13, 2, 5, '2343', '2343'),
(14, 2, 6, 'info@villacimbrone.com', 'info@villacimbrone.com'),
(15, 2, 7, 'www.villacimbrone.com', 'www.villacimbrone.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumId` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `photos`
--

INSERT INTO `photos` (`id`, `albumId`, `image`) VALUES
(1, 1, 'http://placehold.it/50x50'),
(2, 1, 'http://placehold.it/50x50');

-- --------------------------------------------------------

--
-- Struttura della tabella `photos_albums`
--

CREATE TABLE IF NOT EXISTS `photos_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `itemId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `photos_albums`
--

INSERT INTO `photos_albums` (`id`, `name`, `description`, `itemId`) VALUES
(1, 'palazzoavino', 'palazzoavino', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `tags`
--

INSERT INTO `tags` (`id`, `name`, `name_en`) VALUES
(1, 'chiese', 'churches'),
(4, 'monumenti', 'monuments');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
