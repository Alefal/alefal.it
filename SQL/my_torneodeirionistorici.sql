-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2015 at 10:41 AM
-- Server version: 5.1.71-community-log
-- PHP Version: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `my_torneodeirionistorici`
--

-- --------------------------------------------------------

--
-- Table structure for table `tor_clas_giocat`
--

CREATE TABLE IF NOT EXISTS `tor_clas_giocat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_SQUADRA` int(3) NOT NULL,
  `NOME_COGNOME` varchar(70) NOT NULL,
  `G1` int(11) NOT NULL,
  `G2` int(11) NOT NULL,
  `G3` int(11) NOT NULL,
  `G4` int(11) NOT NULL,
  `G5` int(11) NOT NULL,
  `G6` int(11) NOT NULL,
  `G7` int(11) NOT NULL,
  `G8` int(11) NOT NULL,
  `G9` int(11) NOT NULL,
  `G10` int(11) NOT NULL,
  `G11` int(11) NOT NULL,
  `G12` int(11) NOT NULL,
  `G13` int(11) NOT NULL,
  `G14` int(11) NOT NULL,
  `G15` int(11) NOT NULL,
  `G16` int(11) NOT NULL,
  `G17` int(11) NOT NULL,
  `G18` int(11) NOT NULL,
  `G19` int(11) NOT NULL,
  `G20` int(11) NOT NULL,
  `GOAL_TOT` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tor_clas_giocat`
--

INSERT INTO `tor_clas_giocat` (`ID`, `ID_SQUADRA`, `NOME_COGNOME`, `G1`, `G2`, `G3`, `G4`, `G5`, `G6`, `G7`, `G8`, `G9`, `G10`, `G11`, `G12`, `G13`, `G14`, `G15`, `G16`, `G17`, `G18`, `G19`, `G20`, `GOAL_TOT`) VALUES
(1, 2, 'Alessandro Falcone', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
(2, 3, 'Pasquale Mansi', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tor_squadre`
--

CREATE TABLE IF NOT EXISTS `tor_squadre` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_SQUADRA` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tor_squadre`
--

INSERT INTO `tor_squadre` (`ID`, `NOME_SQUADRA`) VALUES
(1, 'San Pietro'),
(2, 'Santa Caterina'),
(3, 'Minuta'),
(4, 'Sambuco'),
(5, 'San Cosma'),
(6, 'Monte Brusara'),
(7, 'Lacco');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
