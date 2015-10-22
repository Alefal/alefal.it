-- --------------------------------------------------------

--
-- Table structure for table `p_agenti`
--

CREATE TABLE IF NOT EXISTS `p_agenti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTE` varchar(4) NOT NULL,
  `NOME_AGENT` varchar(30) NOT NULL,
  `NICK` varchar(20) NOT NULL,
  `PASS` varchar(20) NOT NULL,
  `MATR` int(11) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `TEL` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `age_ente` (`ENTE`,`MATR`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_agenti`
--

INSERT INTO `p_agenti` (`ID`, `ENTE`, `NOME_AGENT`, `NICK`, `PASS`, `MATR`, `EMAIL`, `TEL`) VALUES
(1, 'H198', 'A.P.M. Vincenzo SCHIAVO', 'VinSCHIAVO', '12345', 6, '', ''),
(2, 'H198', 'A.P.M.Raffaellina VINGIANI', 'RafVINGIANI', '12345', 13, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `p_articoli`
--

CREATE TABLE IF NOT EXISTS `p_articoli` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COD_ART` int(11) NOT NULL,
  `COD_COM` varchar(5) NOT NULL,
  `COMMA` varchar(10) NOT NULL,
  `DES_ART1` varchar(70) NOT NULL,
  `DES_ART2` varchar(70) NOT NULL,
  `DES_RID` varchar(50) NOT NULL,
  `IMP_ART` decimal(8,2) NOT NULL,
  `PUNT_ART` int(11) NOT NULL,
  `ID_SANZ` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `key_art` (`COD_ART`,`COD_COM`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_articoli`
--

INSERT INTO `p_articoli` (`ID`, `COD_ART`, `COD_COM`, `COMMA`, `DES_ART1`, `DES_ART2`, `DES_RID`, `IMP_ART`, `PUNT_ART`, `ID_SANZ`) VALUES
(1, 7, '1.p', '7-14', 'Sostava con il veicolo indicato in area Vietata', '', 'Sosta Vietata', '10.00', 5, 1),
(2, 157, '6.b', '2-3', 'Sostava con il veicolo indicato in area a pagamento senza mettere in f', '', 'TICKET OMESSO', '20.00', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `p_artpref`
--

CREATE TABLE IF NOT EXISTS `p_artpref` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTE` varchar(4) NOT NULL,
  `ID_ART` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_artpref`
--

INSERT INTO `p_artpref` (`ID`, `ENTE`, `ID_ART`) VALUES
(1, 'H198', 1),
(2, 'H198', 2);

-- --------------------------------------------------------

--
-- Table structure for table `p_autorizzati`
--

CREATE TABLE IF NOT EXISTS `p_autorizzati` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_ATRZ` int(11) NOT NULL,
  `TARGA_ATRZ` varchar(10) NOT NULL,
  `MODELLO_ATRZ` varchar(50) NOT NULL,
  `OBLG_ATRZ` varchar(50) NOT NULL,
  `TEL_OBLG_ATRZ` varchar(25) NOT NULL,
  `TIPO_ATRZ` varchar(8) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_autorizzati`
--

INSERT INTO `p_autorizzati` (`ID`, `NUM_ATRZ`, `TARGA_ATRZ`, `MODELLO_ATRZ`, `OBLG_ATRZ`, `TEL_OBLG_ATRZ`, `TIPO_ATRZ`) VALUES
(1, 654, 'CG685JD', 'PEUGEOT', 'MARCO AQUILA', '3391630851', 'R1-ZTL'),
(2, 655, 'ED558HT', 'DR5', 'SOFTWARE STUDIO SRL', '0898500000', 'R1-ZTL');

-- --------------------------------------------------------

--
-- Table structure for table `p_device`
--

CREATE TABLE IF NOT EXISTS `p_device` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COD_UID_DEVICE` varchar(50) NOT NULL,
  `DESC_DEVICE` varchar(50) NOT NULL,
  `COD_ENTE` varchar(4) NOT NULL,
  `NUM_VERB` int(11) NOT NULL,
  `STAMPANTE_BLUETOOTH` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `COD_UID_DEVICE` (`COD_UID_DEVICE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `p_device`
--

INSERT INTO `p_device` (`ID`, `COD_UID_DEVICE`, `DESC_DEVICE`, `COD_ENTE`, `NUM_VERB`, `STAMPANTE_BLUETOOTH`) VALUES
(27, '1234567890', 'HTC ONE', 'H198', 1017, 'BlueTooth Printer');

-- --------------------------------------------------------

--
-- Table structure for table `p_ente`
--

CREATE TABLE IF NOT EXISTS `p_ente` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTE` varchar(4) NOT NULL,
  `DESC_ENTE` varchar(50) NOT NULL,
  `TEL_ENTE` varchar(15) NOT NULL,
  `EMAIL_ENTE` varchar(50) NOT NULL,
  `LOGO_ENTE` blob NOT NULL,
  `IBAN_ENTE` varchar(50) NOT NULL,
  `CCP_ENTE` varchar(25) NOT NULL,
  `RESP_ENTE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ENTE` (`ENTE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `p_ente`
--

INSERT INTO `p_ente` (`ID`, `ENTE`, `DESC_ENTE`, `TEL_ENTE`, `EMAIL_ENTE`, `LOGO_ENTE`, `IBAN_ENTE`, `CCP_ENTE`, `RESP_ENTE`) VALUES
(1, 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', '0898500000', '0898500000', '', 'IT0000000000000000000000000000000', '171755566', 'Com. Biagio CIPOLLETTA');

-- --------------------------------------------------------

--
-- Table structure for table `p_manc_cont`
--

CREATE TABLE IF NOT EXISTS `p_manc_cont` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_SANZ_ACC` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `p_manc_cont`
--

INSERT INTO `p_manc_cont` (`ID`, `DESC_SANZ_ACC`) VALUES
(0, ''),
(1, 'RIMOSSA PER MOTIVI DI VIABILITA'''),
(2, 'RIMOSSA PER MOTIVI TECNICI');

-- --------------------------------------------------------

--
-- Table structure for table `p_marche`
--

CREATE TABLE IF NOT EXISTS `p_marche` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(2) NOT NULL,
  `MARCA` varchar(30) NOT NULL,
  `MODELLO` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_marche`
--

INSERT INTO `p_marche` (`ID`, `TIPO`, `MARCA`, `MODELLO`) VALUES
(1, 'A', 'FIAT', 'PUNTO'),
(2, 'M', 'HONDA', 'SH');

-- --------------------------------------------------------

--
-- Table structure for table `p_obbligato`
--

CREATE TABLE IF NOT EXISTS `p_obbligato` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_OBLG` varchar(50) NOT NULL,
  `LUOGO_NASC_OBLG` varchar(50) NOT NULL,
  `DATA_NASC_OBLG` date NOT NULL,
  `RESID_COMUN_OBLG` varchar(50) NOT NULL,
  `RESID_VIA_OBLG` varchar(50) NOT NULL,
  `RESID_CAP_OBLG` int(5) NOT NULL,
  `TIPO_DOC_OBLG` varchar(20) NOT NULL,
  `NUM_DOC_OBLG` varchar(50) NOT NULL,
  `DATA_RIL_DOC_OBLG` date NOT NULL,
  `ENTE_RIL_DOC_OBLG` varchar(50) NOT NULL,
  `IMG_DOC_OBLG` blob NOT NULL,
  `INFO_1` varchar(50) NOT NULL,
  `INFO_2` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_obbligato`
--

INSERT INTO `p_obbligato` (`ID`, `NOME_OBLG`, `LUOGO_NASC_OBLG`, `DATA_NASC_OBLG`, `RESID_COMUN_OBLG`, `RESID_VIA_OBLG`, `RESID_CAP_OBLG`, `TIPO_DOC_OBLG`, `NUM_DOC_OBLG`, `DATA_RIL_DOC_OBLG`, `ENTE_RIL_DOC_OBLG`, `IMG_DOC_OBLG`, `INFO_1`, `INFO_2`) VALUES
(1, 'MARCO AQUILA', 'SALERNO', '1990-05-03', 'SCALA', 'VIA G. MANSI, 4', 84010, 'PATENTE', 'SA548799654', '2009-07-29', 'MCTC-SA', '', '', ''),
(2, 'LORENZO AQUILA', 'SCALA', '1957-06-03', 'SCALA', 'VIA G. MANSI, 4', 84010, 'PATENTE', 'SA54878754452', '1972-03-15', 'PREFETTO-SA', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `p_tip_veicolo`
--

CREATE TABLE IF NOT EXISTS `p_tip_veicolo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COD_VEI` varchar(1) NOT NULL,
  `DESC_VEIC` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `p_tip_veicolo`
--

INSERT INTO `p_tip_veicolo` (`ID`, `COD_VEI`, `DESC_VEIC`) VALUES
(1, 'A', 'AUTOVEICOLO'),
(2, 'C', 'CICLOMOTORE'),
(3, 'M', 'MOTOCICLO'),
(4, 'I', 'AUTOCARRO'),
(5, 'R', 'RIMORCHIO');

-- --------------------------------------------------------

--
-- Table structure for table `p_trasgres`
--

CREATE TABLE IF NOT EXISTS `p_trasgres` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_TRGS` varchar(50) NOT NULL,
  `LUOGO_NASC_TRGS` varchar(50) NOT NULL,
  `DATA_NASC_TRGS` date NOT NULL,
  `RESID_COMUN_TRGS` varchar(50) NOT NULL,
  `RESID_VIA_TRGS` varchar(50) NOT NULL,
  `RESID_CAP_TRGS` int(5) NOT NULL,
  `TIPO_DOC_TRGS` varchar(50) NOT NULL,
  `NUM_DOC_TRGS` varchar(50) NOT NULL,
  `DATA_RIL_DOC_TRGS` date NOT NULL,
  `ENTE_RIL_DOC_TRGS` varchar(50) NOT NULL,
  `IMG_DOC_TRGS` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `p_trasgres`
--

INSERT INTO `p_trasgres` (`ID`, `NOME_TRGS`, `LUOGO_NASC_TRGS`, `DATA_NASC_TRGS`, `RESID_COMUN_TRGS`, `RESID_VIA_TRGS`, `RESID_CAP_TRGS`, `TIPO_DOC_TRGS`, `NUM_DOC_TRGS`, `DATA_RIL_DOC_TRGS`, `ENTE_RIL_DOC_TRGS`, `IMG_DOC_TRGS`) VALUES
(1, 'FRANCESCA AQUILA', 'SALERNO', '1988-04-06', 'SCALA', 'VIA G. MANSI, 4', 84010, 'PATENTE', 'SA5454878956511', '2009-07-29', 'MCTC-SA', '');

-- --------------------------------------------------------

--
-- Table structure for table `p_verb`
--

CREATE TABLE IF NOT EXISTS `p_verb` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_VERB` int(11) NOT NULL,
  `DATA_VERB` date NOT NULL,
  `ORA_VERB` varchar(5) NOT NULL,
  `ENTE_VERB` varchar(5) NOT NULL,
  `NOME_ENTE_VERB` varchar(256) NOT NULL,
  `CCP_ENTE_VERB` int(11) NOT NULL,
  `IBAN` varchar(100) NOT NULL,
  `TIPO_VEI_ID_VERB` varchar(3) NOT NULL,
  `TIPO_VEI_DESCR_VERB` varchar(50) NOT NULL,
  `TARGA_VERB` varchar(10) NOT NULL,
  `MODELLO_VERB` varchar(25) NOT NULL,
  `ID_VIA_VERB` int(11) NOT NULL,
  `VIA_DESCR_VERB` varchar(100) NOT NULL,
  `CIVICO_VERB` varchar(10) NOT NULL,
  `DESCR_VIA_VERB` varchar(70) NOT NULL,
  `ART1_VERB_ID` int(11) NOT NULL,
  `ART1_COD1_VERB` varchar(5) NOT NULL,
  `ART1_DESCR_VERB` varchar(70) NOT NULL,
  `ART1_PUNTI_VERB` int(11) NOT NULL,
  `ART1_IMPORTO_VERB` int(11) NOT NULL,
  `ART1_ID_SANZ_ACC_VERB` varchar(10) NOT NULL,
  `ART1_DESC_SANZ_ACC_VERB` varchar(256) NOT NULL,
  `ART2_VERB_ID` int(11) NOT NULL,
  `ART2_COD1_VERB` varchar(5) NOT NULL,
  `ART2_DESCR_VERB` varchar(70) NOT NULL,
  `ART2_PUNTI_VERB` int(11) NOT NULL,
  `ART2_IMPORTO_VERB` int(11) NOT NULL,
  `ART2_ID_SANZ_ACC_VERB` varchar(10) NOT NULL,
  `ART2_DESC_SANZ_ACC_VERB` varchar(256) NOT NULL,
  `NOTE_VERB` varchar(256) NOT NULL,
  `DESC_MANC_CONT_VERB` varchar(256) NOT NULL,
  `COD_OBLG_VERB` int(11) NOT NULL,
  `COD_TRSG_VERB` int(11) NOT NULL,
  `IMG_VERB` longblob NOT NULL,
  `FILE_PATH_IMG_VERB` varchar(200) NOT NULL,
  `LATI_VERB` varchar(50) NOT NULL,
  `LONG_VERB` varchar(50) NOT NULL,
  `ID_AGENTE1_VERB` int(11) NOT NULL,
  `ID_AGENTE2_VERB` int(50) NOT NULL,
  `NOME_AGENT1_VERB` varchar(50) NOT NULL,
  `NOME_AGENT2_VERB` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `p_verb`
--

INSERT INTO `p_verb` (`ID`, `NUM_VERB`, `DATA_VERB`, `ORA_VERB`, `ENTE_VERB`, `NOME_ENTE_VERB`, `CCP_ENTE_VERB`, `IBAN`, `TIPO_VEI_ID_VERB`, `TIPO_VEI_DESCR_VERB`, `TARGA_VERB`, `MODELLO_VERB`, `ID_VIA_VERB`, `VIA_DESCR_VERB`, `CIVICO_VERB`, `DESCR_VIA_VERB`, `ART1_VERB_ID`, `ART1_COD1_VERB`, `ART1_DESCR_VERB`, `ART1_PUNTI_VERB`, `ART1_IMPORTO_VERB`, `ART1_ID_SANZ_ACC_VERB`, `ART1_DESC_SANZ_ACC_VERB`, `ART2_VERB_ID`, `ART2_COD1_VERB`, `ART2_DESCR_VERB`, `ART2_PUNTI_VERB`, `ART2_IMPORTO_VERB`, `ART2_ID_SANZ_ACC_VERB`, `ART2_DESC_SANZ_ACC_VERB`, `NOTE_VERB`, `DESC_MANC_CONT_VERB`, `COD_OBLG_VERB`, `COD_TRSG_VERB`, `IMG_VERB`, `FILE_PATH_IMG_VERB`, `LATI_VERB`, `LONG_VERB`, `ID_AGENTE1_VERB`, `ID_AGENTE2_VERB`, `NOME_AGENT1_VERB`, `NOME_AGENT2_VERB`) VALUES
(40, 1010, '2015-10-22', '1:41:', 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', 171755566, 'IT0000000000000000000000000000000', 'A', 'AUTOVEICOLO', 'asdfasf', 'HONDA - SH', 1, 'Via Giovanni Boccaccio', '10', 'fdgfdsg', 7, '1.p', 'Sostava con il veicolo indicato in area Vietata', 5, 10, '1', 'RIMOSSA PER MOTIVI DI VIABILITA''', 7, '1.p', 'Sostava con il veicolo indicato in area Vietata', 5, 10, '1', 'RIMOSSA PER MOTIVI DI VIABILITA''', '', '', 0, 0, '', '', '', '', 1, 2, 'A.P.M. Vincenzo SCHIAVO', 'A.P.M.Raffaellina VINGIANI'),
(41, 1011, '2015-10-22', '1:42:', 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', 171755566, 'IT0000000000000000000000000000000', 'A', 'AUTOVEICOLO', 'aa123dd', 'FIAT - PUNTO', 1, 'Via Giovanni Boccaccio', '11', 'descr', 157, '6.b', 'Sostava con il veicolo indicato in area a pagamento senza mettere in f', 10, 20, '0', '', 7, '1.p', 'Sostava con il veicolo indicato in area Vietata', 5, 10, '1', 'RIMOSSA PER MOTIVI DI VIABILITA''', '', '', 0, 0, '', '', '', '', 1, 2, 'A.P.M. Vincenzo SCHIAVO', 'A.P.M.Raffaellina VINGIANI'),
(42, 1012, '2015-10-22', '2:08:', 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', 171755566, 'IT0000000000000000000000000000000', 'A', 'AUTOVEICOLO', 'asdfas', 'HONDA - SH', 1, 'Via Giovanni Boccaccio', '44', 'asdas', 7, '1.p', 'Sostava con il veicolo indicato in area Vietata', 5, 10, '1', 'RIMOSSA PER MOTIVI DI VIABILITA''', 7, '1.p', 'Sostava con il veicolo indicato in area Vietata', 5, 10, '1', 'RIMOSSA PER MOTIVI DI VIABILITA''', '', 'Assenza del Trasgressore', 0, 0, '', '', '', '', 1, 2, 'A.P.M. Vincenzo SCHIAVO', 'A.P.M.Raffaellina VINGIANI'),
(43, 1013, '2015-10-22', '2:09:', 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', 171755566, 'IT0000000000000000000000000000000', 'A', 'AUTOVEICOLO', 'sadfas', 'FIAT - PUNTO', 2, 'Via della MARRA', '', '', 7, '1.p', 'Sostava con il veicolo indicato in area Vietata', 5, 10, '1', 'RIMOSSA PER MOTIVI DI VIABILITA''', 0, '', '', 0, 0, '', '', '', '', 0, 0, '', '', '', '', 1, 2, 'A.P.M. Vincenzo SCHIAVO', 'A.P.M.Raffaellina VINGIANI'),
(44, 1014, '2015-10-22', '2:13:', 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', 171755566, 'IT0000000000000000000000000000000', 'A', 'AUTOVEICOLO', 'asds', 'FIAT - PUNTO', 1, 'Via Giovanni Boccaccio', '11', 'sdafasf', 7, '1.p', 'Sostava con il veicolo indicato in area Vietata', 5, 10, '1', 'RIMOSSA PER MOTIVI DI VIABILITA''', 157, '6.b', 'Sostava con il veicolo indicato in area a pagamento senza mettere in f', 10, 20, '0', '', '', 'Assenza del Trasgressore', 0, 0, '', '', '', '', 1, 2, 'A.P.M. Vincenzo SCHIAVO', 'A.P.M.Raffaellina VINGIANI'),
(45, 1015, '2015-10-22', '2:15:', 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', 171755566, 'IT0000000000000000000000000000000', 'A', 'AUTOVEICOLO', 'asdasd', '', 1, 'Via Giovanni Boccaccio', '', '', 157, '6.b', 'Sostava con il veicolo indicato in area a pagamento senza mettere in f', 10, 20, '0', '', 0, '', '', 0, 0, '', '', '', 'Assenza del Trasgressore', 0, 0, '', '', '', '', 1, 0, 'A.P.M. Vincenzo SCHIAVO', ''),
(46, 1016, '2015-10-22', '2:18:', 'H198', 'COMANDO POLIZIA LOCALE - Comune di RAVELLO', 171755566, 'IT0000000000000000000000000000000', 'A', 'AUTOVEICOLO', 'sdf', '', 2, 'Via della MARRA', '', '', 157, '6.b', 'Sostava con il veicolo indicato in area a pagamento senza mettere in f', 10, 20, '0', '', 0, '', '', 0, 0, '', '', 'asdfsadfasdf', 'Assenza del Trasgressore', 0, 0, '', '', '', '', 1, 0, 'A.P.M. Vincenzo SCHIAVO', '');

-- --------------------------------------------------------

--
-- Table structure for table `p_vie`
--

CREATE TABLE IF NOT EXISTS `p_vie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTE` varchar(4) NOT NULL,
  `QUART` int(11) NOT NULL,
  `COD_ENT` int(11) NOT NULL,
  `TOPON` varchar(10) NOT NULL,
  `DESCR_VIE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `via_ente` (`ENTE`,`QUART`,`COD_ENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `p_vie`
--

INSERT INTO `p_vie` (`ID`, `ENTE`, `QUART`, `COD_ENT`, `TOPON`, `DESCR_VIE`) VALUES
(1, 'H198', 1, 43, '', 'Via Giovanni Boccaccio'),
(2, 'H198', 1, 50, '', 'Via della MARRA');