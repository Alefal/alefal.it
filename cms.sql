-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2015 alle 17:38
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
  `order` int(11) DEFAULT NULL,
  `introtext` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `numOfItems` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentIndex` (`parentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`id`, `name`, `order`, `introtext`, `image`, `numOfItems`, `parentId`) VALUES
(39, 'Monumenti', 1, 'Monumenti ', '', 0, NULL),
(40, 'Dormire', 2, 'Dormire', '', 0, NULL),
(41, 'Chiese', 1, 'Chiese', '', 0, 39),
(42, 'Hotels', 1, 'Hotels', '', 0, 40),
(43, 'Ville', 2, 'Ville', '', 0, 39),
(44, 'Food & Drinks', 3, 'Food & Drinks', '', 0, NULL),
(45, 'Sport', 5, 'Sport', '', 0, NULL),
(46, 'Muoversi', 4, 'Muoversi', '', 0, NULL),
(47, 'Servizi', 7, 'Servizi', '', 0, NULL),
(48, 'Stabilimenti Balneari', 6, 'Stabilimenti Balneari', '', 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `extra_fields`
--

CREATE TABLE IF NOT EXISTS `extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `extra_fields`
--

INSERT INTO `extra_fields` (`id`, `name`, `alias`) VALUES
(1, 'Stelle', 'stars'),
(2, 'Latitude', 'latitude'),
(3, 'Longitude', 'longitude'),
(4, 'Servizi', 'services'),
(5, 'Telefono', 'phone'),
(6, 'Email', 'email'),
(7, 'Web', 'web');

-- --------------------------------------------------------

--
-- Struttura della tabella `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `introtext` varchar(255) NOT NULL,
  `fulltext` longtext NOT NULL,
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

INSERT INTO `items` (`id`, `name`, `introtext`, `fulltext`, `categoryId`, `categoryName`, `featured`, `bgimage`, `logo`, `votingPercentage`, `numOfvotes`, `numOfComments`) VALUES
(1, 'Palazzo Avino', '<p>Descrizione Palazzo Avino</p>', '<p>Descrizione Palazzo Avino<\\/p>', 42, 'Test', 0, '', 'http://www.palazzoavino.it/sites/www.palazzoavino.com/themes/palazzo_avino/img/logo.png', 12, 3, 4),
(2, 'Villa Cimbrone', '<p>Descrizione Villa Cimbrone</p>', '<p>Descrizione Villa Cimbrone</p>', 42, 'Test', 0, 'http://www.villacimbrone.com/images/index/1.jpg', 'http://www.villacimbrone.com/images/varie/logo.png', 12, 3, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `items_pivot`
--

CREATE TABLE IF NOT EXISTS `items_pivot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemId` int(11) NOT NULL,
  `extraFieldsId` int(11) NOT NULL,
  `extraFieldsValue` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dump dei dati per la tabella `items_pivot`
--

INSERT INTO `items_pivot` (`id`, `itemId`, `extraFieldsId`, `extraFieldsValue`) VALUES
(1, 1, 1, '5'),
(2, 1, 2, '40.651699'),
(3, 1, 3, '14.612878'),
(4, 1, 4, 'Ristorante, Piscina, Snack Bar, Ascensore'),
(5, 1, 5, '089858585'),
(6, 1, 6, 'info@palazzoavino.it'),
(8, 1, 7, 'http://www.palazzoavino.it'),
(9, 2, 1, '5'),
(10, 2, 2, '40.644204'),
(11, 2, 3, '14.610897'),
(12, 2, 4, 'Piscina'),
(13, 2, 5, '2343'),
(14, 2, 6, 'info@villacimbrone.com'),
(15, 2, 7, 'www.villacimbrone.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'chiese'),
(4, 'monumenti');

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
