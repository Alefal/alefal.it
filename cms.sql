-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Ott 30, 2014 alle 10:01
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
-- Struttura della tabella `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(21, 'Vino bianco'),
(26, 'Champagne');

-- --------------------------------------------------------

--
-- Struttura della tabella `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `guests`
--

INSERT INTO `guests` (`id`, `name`, `address`, `city`) VALUES
(1, 'Al pesce d''oro', 'Via SS 163, 10 ', 'Amalfi'),
(2, 'La Piccola California', 'Via Senite, 10', 'Scala (SA)'),
(5, 'Lo Straniero', 'Via Senite, 5', 'Scala (SA)');

-- --------------------------------------------------------

--
-- Struttura della tabella `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`categoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dump dei dati per la tabella `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `quantity`, `categoryId`) VALUES
(4, 'Marlot', 25, 5, 22),
(6, 'Brunello di Montalcino', 55.8, -20, 22),
(13, 'Aglianico', 34, 90, 22),
(14, 'Cinzano', 21, 67, 23),
(15, 'Aglianico', 1, 1, 21);

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idItem` int(11) NOT NULL,
  `idGuest` int(11) NOT NULL,
  `idState` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `idItem`, `idGuest`, `idState`, `quantity`, `total`) VALUES
(5, 4, 1, 1, 12, 1),
(6, 4, 1, 1, 1, 1),
(8, 14, 5, 4, 33, 0),
(9, 4, 1, 1, 3, 0),
(12, 6, 1, 1, 70, 0),
(13, 4, 1, 1, 90, 0),
(14, 4, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `state`
--

INSERT INTO `state` (`id`, `type`) VALUES
(1, 'bozza'),
(4, 'evaso');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
