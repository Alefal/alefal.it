-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dic 18, 2014 alle 12:18
-- Versione del server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stockmagazine`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(36, 'Vino rosso'),
(37, 'Vino bianco'),
(38, 'Rosato'),
(39, 'Prosecco');

-- --------------------------------------------------------

--
-- Struttura della tabella `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGuest` int(11) NOT NULL,
  `numFattura` int(255) NOT NULL,
  `dataFattura` date NOT NULL,
  `importoFattura` double NOT NULL,
  `dataCaricoMagazzino` date NOT NULL,
  `pagato` varchar(255) NOT NULL,
  `tipoPagamento` varchar(255) NOT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indexGuest` (`idGuest`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `documents`
--

INSERT INTO `documents` (`id`, `idGuest`, `numFattura`, `dataFattura`, `importoFattura`, `dataCaricoMagazzino`, `pagato`, `tipoPagamento`, `note`) VALUES
(1, 16, 1258, '2014-07-19', 809.74, '2014-12-17', 'si', '', ''),
(2, 16, 1274, '2014-07-25', 329.4, '2014-12-17', 'si', '', ''),
(3, 17, 14866, '2014-07-31', 1317.6, '2014-12-17', 'si', '', ''),
(4, 20, 1431407, '2014-07-17', 878.4, '2014-12-17', 'si', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dump dei dati per la tabella `guests`
--

INSERT INTO `guests` (`id`, `name`, `address`, `city`, `type`) VALUES
(16, 'Iovine', 'Via Nazionale, 46', 'Pimonte', 'fornitore'),
(17, 'AC S.r.l.', 'Crocetta del Montello', 'Treviso', 'fornitore'),
(18, 'L''Angolo della Spesa', 'Via Primo Maggio', 'Conca dei Marini', 'cliente'),
(19, 'Punto Pane di Baravoglia', 'Via Giovanni Amato', 'Minori', 'cliente'),
(20, 'Bortolotti', 'Valdobbiadene', 'Treviso', 'fornitore');

-- --------------------------------------------------------

--
-- Struttura della tabella `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`categoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dump dei dati per la tabella `items`
--

INSERT INTO `items` (`id`, `name`, `quantity`, `categoryId`) VALUES
(25, 'Cantinello Vino Rosso 5 lt', 16, 36),
(26, 'Cantinello Vino Bianco 5 lt', 16, 37),
(27, 'Falanghina beneventana IGT', 24, 37),
(28, 'Aglianico beneventano IGT', 24, 36),
(29, 'Don Luigi vino bianco', 36, 37),
(30, 'Don Luigi vino rosso', 36, 36),
(31, 'Fiano di Avellino DOCG', 24, 37),
(32, 'Lacrima Christi del Vesuvio Bianco', 30, 37),
(33, 'Lacrima Christi del Vesuvio Rosso', 30, 36),
(34, 'Greco beneventano IGT', 12, 37),
(35, 'Rosato piedirosso pompeiano', 18, 38),
(36, 'Penisola sorrentina rosso', 0, 36),
(37, 'Gragnano DOC', 18, 36),
(38, 'Pompeiano Bianco Frizzante', 18, 37),
(39, 'Prosecco DOC Treviso', 426, 39),
(40, 'Valdobbiadene DOCG Extra Dry', 144, 39);

-- --------------------------------------------------------

--
-- Struttura della tabella `orderline`
--

CREATE TABLE IF NOT EXISTS `orderline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numFattura` varchar(255) NOT NULL,
  `idItem` int(11) NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IndexNumFattura` (`numFattura`),
  KEY `IndexItem` (`idItem`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dump dei dati per la tabella `orderline`
--

INSERT INTO `orderline` (`id`, `numFattura`, `idItem`, `quantity`) VALUES
(7, '1', 27, 12),
(8, '1', 28, 12),
(9, '1', 32, 6),
(10, '1', 33, 6),
(11, '1', 36, 6),
(12, '2', 27, 12),
(13, '2', 28, 12),
(14, '2', 35, 6),
(15, '2', 40, 6),
(16, '2', 39, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGuest` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `numFattura` varchar(255) NOT NULL,
  `datapagamento` date DEFAULT NULL,
  `tipopagamento` text NOT NULL,
  `pagato` text NOT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numFattura` (`numFattura`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `idGuest`, `total`, `numFattura`, `datapagamento`, `tipopagamento`, `pagato`, `note`) VALUES
(52, 18, 142.02, '1', '0000-00-00', '', 'si', ''),
(53, 19, 164.7, '2', '0000-00-00', '', 'si', '');

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
(1, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
