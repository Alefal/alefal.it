-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: 217.73.239.2:3306
-- Generation Time: Aug 25, 2015 at 04:44 PM
-- Server version: 5.5.43
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Sql679na`
--

-- --------------------------------------------------------

--
-- Table structure for table `aa_accesso`
--

CREATE TABLE IF NOT EXISTS `aa_accesso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `aa_accesso`
--

INSERT INTO `aa_accesso` (`id`, `username`, `password`) VALUES
(3, 'admin', 'admin321');

-- --------------------------------------------------------

--
-- Table structure for table `aa_appartamenti`
--

CREATE TABLE IF NOT EXISTS `aa_appartamenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `posti` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `aa_appartamenti`
--

INSERT INTO `aa_appartamenti` (`id`, `nome`, `posti`) VALUES
(1, 'ap1', 2),
(2, 'ap2', 2),
(3, 'ap3', 1),
(4, 'ap4', 2);

-- --------------------------------------------------------

--
-- Table structure for table `aa_news`
--

CREATE TABLE IF NOT EXISTS `aa_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(50) NOT NULL DEFAULT '',
  `testoIt` longtext NOT NULL,
  `testoEn` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `aa_news`
--

INSERT INTO `aa_news` (`id`, `data`, `testoIt`, `testoEn`) VALUES
(41, '04/06/2015', '<p>CERIMONIE IN AGRITURISMO, MATRIMONI IN CAMPAGNA</p>\r\n<p>Di frequente i nostri ospiti scelgono di festeggiare il loro giorno    pi&ugrave; importante presso i casali della Valle del Marta, Agriturismo e    Hotel a Tarquinia, immerso nella <a href="http://filme-porno.mobi/cu-natura"><strong>natura</strong></a>, luogo ideale per banchetti di   matrimonio, feste, eventi importanti e cerimonie in agriturismo.</p>\r\n<p>Il verde delle vallate e i colori della campagna fanno da cornice ad    un&rsquo;atmosfera particolarmente calda, elegante e al tempo stesso    familiare, che rivive appunto nell&rsquo;intensit&agrave; della famiglia, riscoprendo    la magia e la bellezza delle tradizioni contadine, in cui ogni evento    importante, dalla trebbiatura al matrimonio, era momento di incontro e    condivisione, dove gioia, amore &nbsp;e buoni auspici si fondevano in    un&rsquo;unica grande festa.</p>', '<p><span id="result_box" lang="en"><span class="hps">WEDDINGS</span> <span class="hps">and </span></span><span id="result_box" lang="en"><span class="hps"><span id="result_box" lang="en"><span class="hps">CEREMONIES</span> <span class="hps">IN</span> <span class="hps">OUR FARM</span></span></span><br /><br /> <span class="hps">Often</span> <span class="hps">our</span> <span class="hps">guests choose to</span> <span class="hps">celebrate their</span> <span class="hps">most important day</span> <span class="hps">in</span> <span class="hps">the hamlets</span> <span class="hps">of the</span> <span class="hps">Valle del</span> <span class="hps">Marta</span><span>,</span> <span class="hps">Discount</span> <span class="hps">Hotel</span> <span class="hps">in Tarquinia</span><span>,</span> <span class="hps">immersed in </span></span><span id="result_box" lang="en"><span class="hps"><a href="http://filme-porno.mobi/cu-natura"><strong>natura</strong></a></span><span>,</span> <span class="hps">ideal</span> <span class="hps">for</span> <span class="hps">wedding receptions</span><span>, parties</span><span>,</span> <span class="hps">important events</span> <span class="hps">and</span> <span class="hps">ceremonies</span> <span class="hps">at the farmhouse.</span><br /><br /> <span class="hps">The</span> <span class="hps">green</span> <span class="hps">of the valleys</span> <span class="hps">and the colors</span> <span class="hps">of the countryside</span> <span class="hps">are the setting for</span> <span class="hps">a particularly warm</span><span>,</span> <span class="hps">elegant</span> <span class="hps">and yet</span> <span class="hps">family</span><span>,</span> <span class="hps">which lives</span> <span class="hps">just</span> <span class="hps">in the intensity</span> <span class="hps">of the family</span><span>, discovering</span> <span class="hps">the</span> <span class="hps">magic and beauty</span> <span class="hps">of rural traditions</span><span>,</span> <span class="hps">where</span> <span class="hps">every important event</span><span>,</span> <span class="hps">threshing</span> <span class="hps">by</span> <span class="hps">marriage</span><span>,</span> <span class="hps">it was</span> <span class="hps">time</span> <span class="hps">to meet and share</span><span>,</span> <span class="hps">where</span> <span class="hps">joy</span><span>,</span> <span class="hps">love</span> <span class="hps">and</span> <span class="hps">good wishes</span> <span class="hps">merged</span> <span class="hps">into one</span> <span class="hps">big party</span><span>.</span></span></p>');

-- --------------------------------------------------------

--
-- Table structure for table `aa_prenotazioni`
--

CREATE TABLE IF NOT EXISTS `aa_prenotazioni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_ap` int(11) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `posti` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `aa_prenotazioni`
--

INSERT INTO `aa_prenotazioni` (`id`, `fk_ap`, `data`, `posti`) VALUES
(6, 3, '2009-04-26', 0),
(5, 2, '2009-04-26', 0),
(4, 1, '2009-04-26', 0),
(7, 4, '2009-04-26', 0),
(18, 3, '2009-07-15', 0),
(15, 1, '2009-07-11', 0),
(16, 2, '2009-07-11', 0),
(17, 3, '2009-07-14', 0),
(19, 3, '2009-07-16', 0),
(20, 1, '2009-08-17', 0),
(21, 2, '2009-08-17', 0),
(22, 3, '2009-08-17', 0),
(23, 4, '2009-08-17', 0),
(24, 1, '2009-08-20', 0),
(25, 1, '2009-08-21', 0),
(26, 1, '2009-08-18', 0),
(27, 1, '2009-08-22', 0),
(28, 2, '2009-08-22', 0),
(29, 2, '2009-08-21', 0),
(30, 2, '2009-08-20', 0),
(31, 2, '2009-08-19', 0),
(32, 4, '2009-08-18', 0),
(33, 4, '2009-08-19', 0),
(34, 4, '2009-08-20', 0),
(35, 4, '2009-08-21', 0),
(36, 4, '2009-08-22', 0),
(37, 3, '2009-08-22', 0),
(38, 3, '2009-08-21', 0),
(39, 3, '2009-08-20', 0),
(40, 3, '2009-08-19', 0),
(41, 3, '2009-08-18', 0),
(42, 2, '2009-08-18', 0),
(43, 1, '2009-08-19', 0),
(44, 3, '2009-07-10', 0),
(45, 2, '2012-02-24', 0),
(50, 1, '2013-03-09', 0),
(48, 1, '2013-01-09', 0),
(53, 1, '2013-03-11', 0),
(54, 1, '2013-03-12', 0),
(55, 2, '2013-03-17', 0),
(56, 2, '2013-03-19', 0),
(57, 1, '2013-06-01', 0),
(59, 1, '2013-07-05', 0),
(60, 2, '2009-01-16', 0),
(61, 2, '2009-01-16', 0),
(62, 1, '2013-11-01', 0),
(63, 1, '2013-12-15', 0),
(64, 1, '2013-12-14', 0),
(65, 1, '2013-12-05', 0),
(66, 1, '2014-11-12', 0),
(68, 1, '2015-06-09', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
