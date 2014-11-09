-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2014 alle 12:51
-- Versione del server: 5.6.20
-- PHP Version: 5.5.15

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
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(32, 'vino bianco'),
(34, 'vino rosso');

-- --------------------------------------------------------

--
-- Struttura della tabella `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

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
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dump dei dati per la tabella `items`
--

INSERT INTO `items` (`id`, `name`, `quantity`, `categoryId`) VALUES
(22, 'bbb', 250, 32);

-- --------------------------------------------------------

--
-- Struttura della tabella `orderline`
--

CREATE TABLE IF NOT EXISTS `orderline` (
`id` int(11) NOT NULL,
  `numFattura` varchar(255) NOT NULL,
  `idItem` int(11) NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` int(11) NOT NULL,
  `idGuest` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `numFattura` varchar(255) NOT NULL,
  `datapagamento` date DEFAULT NULL,
  `tipopagamento` text NOT NULL,
  `pagato` text NOT NULL,
  `note` longtext NOT NULL
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
`id` tinyint(4) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`), ADD KEY `category` (`categoryId`);

--
-- Indexes for table `orderline`
--
ALTER TABLE `orderline`
 ADD PRIMARY KEY (`id`), ADD KEY `IndexNumFattura` (`numFattura`), ADD KEY `IndexItem` (`idItem`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `numFattura` (`numFattura`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `orderline`
--
ALTER TABLE `orderline`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Limiti per le tabelle scaricate
--

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
