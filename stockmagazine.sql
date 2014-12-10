-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dic 10, 2014 alle 15:37
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(32, 'vino bianco'),
(34, 'vino rosso');

-- --------------------------------------------------------

--
-- Struttura della tabella `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGuest` int(11) NOT NULL,
  `numFattura` varchar(255) NOT NULL,
  `dataFattura` date NOT NULL,
  `importoFattura` double NOT NULL,
  `dataCaricoMagazzino` date NOT NULL,
  `pagato` varchar(255) NOT NULL,
  `tipoPagamento` varchar(255) NOT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indexGuest` (`idGuest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dump dei dati per la tabella `guests`
--

INSERT INTO `guests` (`id`, `name`, `address`, `city`, `type`) VALUES
(1, 'Al pesce d''oro', 'Via SS 163, 10 ', 'Amalfi', 'cliente'),
(2, 'La Piccola California', 'Via Senite, 10', 'Scala (SA)', 'cliente'),
(5, 'Lo Straniero', 'Via Senite, 5', 'Scala (SA)', 'cliente'),
(11, 'Iovene', 'Via delle Repubbliche, 10', 'Gragnano', 'fornitore');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dump dei dati per la tabella `items`
--

INSERT INTO `items` (`id`, `name`, `quantity`, `categoryId`) VALUES
(23, 'aaa', 1, 32);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `idGuest`, `total`, `numFattura`, `datapagamento`, `tipopagamento`, `pagato`, `note`) VALUES
(46, 2, 456.78, '1', '2014-11-30', '', 'no', ''),
(47, 1, 1233, '2', '2014-11-13', 'altro', 'si', 'Pagato da Antonio il 22 novembre...');

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

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`idGuest`) REFERENCES `guests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `orderline`
--
ALTER TABLE `orderline`
  ADD CONSTRAINT `orderline_ibfk_2` FOREIGN KEY (`idItem`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orderline_ibfk_3` FOREIGN KEY (`numFattura`) REFERENCES `orders` (`numFattura`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
