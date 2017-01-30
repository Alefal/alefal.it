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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dump dei dati per la tabella `p_agenti`
--

INSERT INTO `p_agenti` (`ID`, `ENTE`, `NOME_AGENT`, `NICK`, `PASS`, `MATR`, `EMAIL`, `TEL`) VALUES
(1, 'H198', 'Com. Alessandro Falcone       ', 'alefal', 'alefal', 1, '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_anagrafica`
--

CREATE TABLE IF NOT EXISTS `p_anagrafica` (
  `id` int(11) NOT NULL,
  `nome_ang` varchar(30) DEFAULT NULL,
  `cognome_ang` varchar(30) DEFAULT NULL,
  `luogo_nas_ang` varchar(50) DEFAULT NULL,
  `data_nas_ang` date DEFAULT NULL,
  `comune_res_ang` varchar(50) DEFAULT NULL,
  `via_res_ang` varchar(50) DEFAULT NULL,
  `cap_res_ang` varchar(10) DEFAULT NULL,
  `tel_res_ang` varchar(20) DEFAULT NULL,
  `email_res_ang` varchar(70) DEFAULT NULL,
  `id_tip_doc` int(11) DEFAULT NULL,
  `num_doc_ang` varchar(20) DEFAULT NULL,
  `id_ente` char(4) DEFAULT NULL,
  `codfis` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `p_anagrafica`
--

INSERT INTO `p_anagrafica` (`id`, `nome_ang`, `cognome_ang`, `luogo_nas_ang`, `data_nas_ang`, `comune_res_ang`, `via_res_ang`, `cap_res_ang`, `tel_res_ang`, `email_res_ang`, `id_tip_doc`, `num_doc_ang`, `id_ente`, `codfis`) VALUES
(1, 'ROSSI', 'MARIO', 'MAIORI', '1955-10-10', 'RAVELLO', 'VIA ROMA', '', '', '12345@gmail.com', 0, '', 'H198', '12345'),
(2, 'di bianco', 'antonio', '', NULL, '', '', '', '', '1111@gmail.com', 0, '', 'H198', '11111'),
(3, 'rispoli', 'luigi', '', NULL, '', '', '', '', '22222@gmail.com', 0, '', 'A487', '22222'),
(4, 'Marco', 'Aquila', 'Scala', '1990-05-03', 'Scala', 'G. Mansi, 4', '84010', '3391630851', 'marctusaquila@gmail.com', 0, '', 'H198', 'QLAMRC90E03H703E');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_articoli`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Dump dei dati per la tabella `p_articoli`
--

INSERT INTO `p_articoli` (`ID`, `COD_ART`, `COD_COM`, `COMMA`, `DES_ART1`, `DES_ART2`, `DES_RID`, `IMP_ART`, `PUNT_ART`, `ID_SANZ`) VALUES
(1, 7, '1.p', '1-14 ', 'Sostava nonostante la segnaletica lo vietasse                         ', '                                                                      ', 'DIVIETO SOSTA                                     ', '41.00', 0, 0),
(2, 6, '4h   ', '4-14 ', 'Circolava fuori c.a. nonostante il divieto di transito imposto dal-   ', 'la segnaletica verticale                                              ', 'DIVIETO CIRCOLAZIONE FUORI CENTRO ABITATO         ', '84.00', 0, 0),
(3, 6, '4i   ', '4-14 ', 'Lasciava in sosta il veicolo fuori c.a. nonostante il divieto impo-   ', 'sto con il prescritto segnale                                         ', 'DIVIETO SOSTA FUORI CENTRO ABITATO                ', '41.00', 0, 0),
(4, 7, '1a   ', '1-13 ', 'Circolava in c.a. nonostante sospensione della circolazione dispo-    ', 'sta con ordinanza del Sindaco per motivi di sicurezza pubblica        ', 'DIVIETO DI ACCESSO (ORD. SINDACO)                 ', '85.00', 0, 0),
(5, 7, '1b   ', '1-13 ', 'Circolava in c.a. nonostante sospensione della circolazione dispo-    ', 'sta con ordinanza del Sindaco per motivi tutela patrimonio stradale   ', 'DIVIETO DI ACCESSO (TUTELA STRADA)                ', '85.00', 0, 0),
(6, 7, '1c   ', '1-13 ', 'Circolava in c.a. nonostante sospensione della circolazione dispo-    ', 'sta con ordinanza del Sindaco per esigenze di carattere tecnico       ', 'DIVIETO DI CIRCOLAZIONE (CARATTERE TECNICO)       ', '85.00', 0, 0),
(7, 7, '1d   ', '1-14 ', 'Circolava in c.a. in senso contrario a quello consentito dalla se-    ', 'gnaletica verticale                                                   ', 'SENSO CONTRARIO                                   ', '41.00', 0, 0),
(8, 7, '1k   ', '1-14 ', 'Accedeva abusivamente in zona a traffico limitato                     ', '                                                                      ', 'ZTL                                               ', '81.00', 0, 0),
(9, 7, '1m   ', '1-14 ', 'Circolava in c.a. su corsia riservata ad altri veicoli                ', '                                                                      ', 'CORSIA RISERVATA ALTRI VEICOLI                    ', '41.00', 0, 0),
(10, 7, '1q   ', '1-14 ', 'In c.a. lasciava in sosta il veicolo nonostante il divieto con zona   ', 'rimozione imposto dalla segnaletica verticale                         ', 'DIVIETO DI SOSTA (RIMOZIONE)                      ', '41.00', 0, 18),
(11, 7, '1r   ', '1-14 ', 'In c.a. lasciava in sosta il veicolo nonostante il divieto di sosta   ', 'permanente imposto con segnaletica verticale                          ', 'DIVIETO DI SOSTA (PERMANENTE)                     ', '41.00', 0, 0),
(12, 7, '1s   ', '1-15 ', 'In c.a. lasciava in sosta il veicolo per 1 ora oltre il limite di     ', 'tempo consentito                                                      ', 'TICKET SCADUTO DA UNA ORA                         ', '24.00', 0, 0),
(13, 7, '1t   ', '1-15 ', 'In c.a. lasciava in sosta il veicolo per 2 ore oltre il limite di     ', 'tempo consentito                                                      ', 'TICKET SCADUTO DA DUE ORE                         ', '46.00', 0, 0),
(14, 7, '1u   ', '1-15 ', 'In c.a. lasciava in sosta il veicolo per 3 ore oltre il limite di     ', 'tempo consentito                                                      ', 'TICKET SCADUTO DA 3 ORE                           ', '77.00', 0, 0),
(15, 7, '1v   ', '1-14 ', 'In c.a. lasciava in sosta il veicolo su spazio riservato a veicoli    ', 'degli organi di polizia stradale                                      ', 'ZONA RISERVATA (POLIZIA STRADALE)                 ', '41.00', 0, 0),
(16, 7, '1w   ', '1-14 ', 'Accedeva abusivamente in area pedonale                                ', '                                                                      ', 'DIVIETO DI ACCESSO (AREA PEDONALE)                ', '81.00', 0, 0),
(17, 7, '1x   ', '1-14 ', 'In c.a. lasciava in sosta il veicolo su spazio riservato a veicoli    ', 'dei servizi di soccorso                                               ', 'AREA RISERVATA (SOCCORSO)                         ', '41.00', 0, 0),
(18, 7, '1z   ', '1-14 ', 'In c.a. lasciava in sosta il veicolo su spazio riservato a veicoli    ', 'dei vigili del fuoco                                                  ', 'AREA RISERVATA (VIGILI DEL FUOCO)                 ', '41.00', 0, 0),
(19, 7, '1z1  ', '1-14 ', 'Circolava abusivamente nella corsia dei mezzi pubblici                ', '                                                                      ', 'CIRCOLAVA ABUSIVAMENTE (CORS. MEZZI PUBB.)        ', '81.00', 0, 0),
(20, 7, '15a  ', '15bis', 'Esercitava abusivamente l''attivita'' di parcheggiatore                 ', '                                                                      ', 'PARCHEGGIATORE ABUSIVO                            ', '726.00', 0, 0),
(21, 7, '15b  ', '15bis', 'Utilizzava minori nell''esercizio abusivo dell''attivita'' di            ', 'parcheggiatore                                                        ', 'MINORE PARCHEGGIATORE                             ', '1452.00', 0, 0),
(22, 7, '1.s  ', '1-15 ', 'Sostava in zona parcometro con ticket di pagamento scaduto.           ', '                                                                      ', 'TICKET SCADUTO                                    ', '25.00', 0, 0),
(23, 157, '6.b  ', '6-8  ', 'Lasciava il veicolo in area a pagamento senza porre in funzione       ', 'dispositivo controllo durata sosta.                                   ', 'TICKET ASSENTE                                    ', '41.00', 0, 0),
(24, 7, '1p   ', '1-14 ', 'In c.a. lasciava in sosta il veicolo nonostante il divieto imposto    ', 'con segnaletica verticale.                                            ', 'DIVIETO DI SOSTA                                  ', '41.00', 0, 0),
(25, 158, '1.e  ', '1-5  ', 'Sostava in corrispomdenza di curva.                                   ', '                                                                      ', 'DIVIETO SOSTA (CURVA)                             ', '82.00', 0, 18),
(26, 7, '11   ', '1-14 ', 'Sostava in zona riservata residenti senza esporre autorizzazione.     ', '                                                                      ', 'SOSTA ZONA RESIDENTI                              ', '41.00', 0, 0),
(27, 7, '1.a  ', '1-14 ', 'Sostava in zona riservata ad altre categorie di veicoli.              ', '                                                                      ', 'ALTRE CATOGORIE DI VEICOLI                        ', '41.00', 0, 0),
(28, 7, '1e   ', '1-14 ', 'Sostava in zona riservata ai motocicli e ciclomotori.                 ', '                                                                      ', 'AREA RISERVATA (MOTO E CICLI)                     ', '41.00', 0, 0),
(29, 7, '2g   ', '1-14 ', 'Effettuava operazioni di carico o scarico merci oltre il tempo        ', 'consentito                                                            ', 'CARICO E SCARICO                                  ', '41.00', 0, 0),
(30, 157, '6.a  ', '6A   ', 'Lasciava il veicolo in sosta in area regolamentata senza esporre      ', 'il biglietto che attesta il pagamento                                 ', 'SPROVVISTO DI TICKET                              ', '41.00', 0, 0),
(31, 7, '1.f  ', '1-13 ', 'Sostava in area a pagamento senza esporre il ticket                   ', '                                                                      ', 'TICKET ASSENTE                                    ', '25.00', 0, 0),
(32, 158, '2.i  ', '2-6  ', 'Lasciava il veicolo in sosta negli spazi  riservati alla Polizia      ', 'Municipale                                                            ', 'AREA RISERVATA (POLIZIA MUNICIPALE)               ', '85.00', 0, 18),
(33, 7, '1F   ', '1f-14', 'Il veicolo indicato veniva lasciato in sosta in zona a pagamento senza', 'esporre il ticket di avvenuto pagamento.                              ', 'PARCHEGGIO - TICKET OMESSO                        ', '41.00', 0, 0),
(34, 141, '3b1  ', '3-8  ', 'Ometteva di regolare particolarmente la velocita'' del veicolo in      ', 'curva                                                                 ', 'ECCESSO VELOCITA'' IN CURVA                        ', '85.00', 5, 0),
(35, 146, '1a   ', '1-2  ', 'Quale conducente di veicolo non rispettava le prescrizioni imposte    ', 'dalla segnaletica verticale                                           ', 'NON RISPETTAVA SEGNALETICA VERTICALE              ', '41.00', 2, 0),
(36, 146, '2a   ', '1-2  ', 'Lasciava in sosta il veicolo su carreggiata i cui margini sono e-     ', 'videnziati da striscia continua nonostante vietato da art.39/10 c.    ', 'SOSTA SU STRISCIA CONTINUA                        ', '41.00', 2, 0),
(37, 146, '3a2  ', '3    ', 'Quale conducente di veicolo proseguiva la marcia sebbene la segna-    ', 'lazione del semaforo lo vietasse                                      ', 'PROSEGUIVA A SEMAFORO ROSSO                       ', '164.00', 6, 17),
(38, 148, '10a1 ', '10-16', 'Effettuava il sorpasso di un veicolo in prossimita'' di una curva      ', '                                                                      ', 'SORPASSO IN CURVA                                 ', '164.00', 10, 1),
(39, 148, '11c1 ', '11-16', 'Effettuava con invasione della carreggiata destinata al senso oppo-   ', 'sto di marcia il superamento di veicoli fermi ad un semaforo          ', 'SUPERAMENTO VEICOLI IN SOSTA A SEMAFORO           ', '164.00', 10, 1),
(40, 157, '7bis1', '7bis ', 'Durante la sosta/fermata del veicolo teneva motore acceso allo sco-   ', 'po di mantenere in funzione l''impianto di condizionamento             ', 'SOSTA CON MOTORE ACCESO (IMP. CONDIZIONAMENTO)(   ', '218.00', 0, 0),
(41, 157, '2b   ', '2-8  ', 'Lasciava in sosta il veicolo non in asse rispetto al margine dx della ', 'della carreggiata                                                     ', 'SOSTA NON IN ASSE (MARGINE DX)                    ', '41.00', 0, 0),
(42, 157, '2e   ', '2-8  ', 'Durante la sosta ometteva di spegnere il motore del veicolo           ', '                                                                      ', 'SOSTA CON MOTORE ACCESO                           ', '41.00', 0, 0),
(43, 157, '3a   ', '3-8  ', 'Fuori c.a. lasciava in sosta il veicolo sulla pista per velocipede    ', '                                                                      ', 'SOSTA SU PISTA VELOCIPEDE                         ', '41.00', 0, 0),
(44, 157, '3b   ', '3-8  ', 'Fuori c.a. lasciava in sosta il veicolo sulla banchina                ', '                                                                      ', 'SOSTA SU BANCHINA                                 ', '41.00', 0, 0),
(45, 157, '5a   ', '5-8  ', 'Lasciava il veicolo in zona di sosta collocandolo fuori degli spazi   ', 'previsti dalla segnaletica                                            ', 'SOSTA FUORI DAGLI SPAZI                           ', '41.00', 0, 0),
(46, 157, '6a   ', '6-8  ', 'Lasciava il veicolo in zona ove la sosta e'' permessa per un tempo     ', 'limitato senza segnalare in modo ben visibile orario inizio sosta     ', 'SOSTA CON DISCO ORARIO                            ', '41.00', 0, 0),
(47, 157, '6b   ', '6-8  ', 'Lasciava il veicolo in zona ove la sosta e'' permessa per un tempo     ', 'limitato senza porre in funzione disposit. controllo durata sosta     ', 'DISCO ORARIO NON ATTIVATO                         ', '41.00', 0, 0),
(48, 157, '7a   ', '7-8  ', 'Apriva improvvisamente la porta del veicolo senza assicurarsi che     ', 'cio'' non costituisse pericolo per gli altri utenti                    ', 'APERTURA IMPROVVISA PORTIERA                      ', '41.00', 0, 0),
(49, 158, '1a   ', '1-5  ', 'Lasciava il veicolo in sosta in corrispondenza di passaggio a li-     ', 'vello                                                                 ', 'DIVIETO DI SOSTA (PASSAGGIO A LIVELLO)            ', '85.00', 0, 18),
(50, 158, '1b   ', '1-5  ', 'Lasciava il veicolo in sosta in galleria                              ', '                                                                      ', 'DIVIETO SOSTA (GALLERIA)                          ', '83.00', 0, 18),
(51, 158, '1c   ', '1-5  ', 'Lasciava il veicolo in sosta sotto un portico                         ', '                                                                      ', 'DIVIETO DI SOSTA (PORTICO)                        ', '85.00', 0, 18),
(52, 158, '1d   ', '1-5  ', 'Lasciava il veicolo in sosta su un dosso                              ', '                                                                      ', 'DIVIETO SOSTA (DOSSO)                             ', '84.00', 0, 18),
(53, 158, '1e   ', '1-5  ', 'Lasciava il veicolo in sosta in curva                                 ', '                                                                      ', 'DIVIETO DI SOSTA (CURVA)                          ', '85.00', 0, 18),
(54, 158, '1f   ', '1-5  ', 'Lasciava il veicolo in sosta fuori centro abitato in prossimita'' di   ', 'una curva                                                             ', 'DIVIETO DI SOSTA (PROSSIMITA DI CURVA)            ', '85.00', 0, 18),
(55, 158, '1i   ', '1-5  ', 'Lasciava il veicolo in sosta sulla corrispondenza dell'' area di       ', 'intersezione                                                          ', 'INTERSEZIONE                                      ', '85.00', 0, 18),
(56, 158, '1l   ', '1-5  ', 'Lasciava il veicolo in sosta in c.a. in prossimita'' dell''area di      ', 'intersezione a meno di 5 m.                                           ', 'INTERSEZIONE (MENO 5 MT)                          ', '85.00', 0, 18),
(57, 158, '1m   ', '1-5  ', 'Lasciava il veicolo in sosta in corrispondenza/prossimita'' di         ', 'intersezione.                                                         ', 'DIVIETO SOSTA(INTERSEZIONE-MOTO)                  ', '40.00', 0, 18),
(58, 158, '1n   ', '1-5  ', 'Lasciava il veicolo in sosta su pista ciclabile                       ', '                                                                      ', 'DIVIETO DI SOSTA (PISTA CICLABILE)                ', '85.00', 0, 18),
(59, 158, '1o   ', '1-5  ', 'Lasciava il veicolo in sosta sul marciapiede                          ', '                                                                      ', 'DIVIETO SOSTA (MARCIAPIEDE)                       ', '83.00', 0, 18),
(60, 158, '1p   ', '1-5  ', 'Lasciava il veicolo in sosta sui binari di linea tramviaria           ', '                                                                      ', 'DIVIETO DI SOSTA (TRAM)                           ', '85.00', 0, 18),
(61, 158, '1q   ', '1-5  ', 'Lasciava il veicolo in sosta cosi'' vicino ai binari di linea tram-    ', 'viaria da intralciarne la marcia                                      ', 'INTRALCIO (TRAM)                                  ', '85.00', 0, 18),
(62, 158, '1r   ', '1-5  ', 'Lasciava il veicolo in sosta lungo la corsia di canalizzazione        ', '                                                                      ', 'DIVIETO DI SOSTA (CORSIA DI CANALIZZAZIONE)       ', '85.00', 0, 18),
(63, 158, '2a   ', '2-6  ', 'Lasciava il veicolo in sosta allo sbocco di passo carrabile           ', '                                                                      ', 'DIVIETO SOSTA (PASSO CARRABILE)                   ', '40.00', 0, 18),
(64, 158, '2b   ', '2-6  ', 'Lasciava il veicolo in sosta in posizione tale da impedire di acce-   ', 'dere ad altro veicolo regolarmente in sosta                           ', 'SOSTA IN POSIZIONE ERRATA                         ', '41.00', 0, 18),
(65, 158, '2c   ', '2-6  ', 'Lasciava il veicolo in sosta in seconda fila                          ', '                                                                      ', 'DIVIETO SOSTA (SECONDA FILA)                      ', '40.00', 0, 18),
(66, 158, '2d   ', '2-6  ', 'Lasciava il veicolo in sosta nello spazio riservato allo staziona-    ', 'mento degli autobus                                                   ', 'AREA RISERVATA (AUTOBUS)                          ', '85.00', 2, 18),
(67, 158, '2e   ', '2-6  ', 'Lasciava il veicolo in sosta nello spazio riservato alla fermata      ', 'degli autobus                                                         ', 'DIVIETO SOSTA (FERMATA AUTOBUS)                   ', '84.00', 2, 18),
(68, 158, '2f   ', '2-6  ', 'Lasciava il veicolo in sosta sull'' area destinata ai veicoli per il   ', 'carico e lo scarico delle cose                                        ', 'DIVIETO DI SOSTA (CARICO E SCARICO)               ', '41.00', 0, 18),
(69, 158, '2g   ', '2-6  ', 'Lasciava il veicolo in sosta sulla banchina                           ', '                                                                      ', 'DIVIETO DI SOSTA (BANCHINA)                       ', '41.00', 0, 18),
(70, 158, '2h   ', '2-6  ', 'Lasciava il veicolo in sosta nello spazio riservato alla sosta dei    ', 'veicoli per persone invalide                                          ', 'DIVIETO SOSTA (RISERVATO INVALIDI)                ', '84.00', 2, 18),
(71, 158, '2i   ', '2-6  ', 'Lasciava il veicolo in sosta nella corsia riservata ai mezzi pub-     ', 'blici                                                                 ', 'DIVIETO DI SOSTA (MEZZI PUBBLICI)                 ', '85.00', 2, 18),
(72, 158, '2l   ', '2-6  ', 'Lasciava il veicolo in sosta nell'' area pedonale urbana               ', '                                                                      ', ' DIVIETO SOSTA (AREA PEDONALE URBANA)             ', '41.00', 0, 18),
(73, 158, '2m   ', '2-6  ', 'Lasciava il veicolo in sosta nella zona a traffico limitato           ', '                                                                      ', 'DIVIETO DI SOSTA (ZTL)                            ', '41.00', 0, 18),
(74, 158, '2n   ', '2-6  ', 'Lasciava il veicolo in sosta in spazio riservato ad impianto per      ', 'servizio di emergenza                                                 ', 'DIVIETO SOSTA (RISERVATO SERVIZI EMERGENZA)       ', '40.00', 0, 18),
(75, 158, '2o   ', '2-6  ', 'Lasciava il veicolo in sosta davanti a un cassonetto dei rifiuti      ', 'urbani                                                                ', 'DIVIETO DI SOSTA (CASSONETTI DEI RIFIUTI)         ', '41.00', 0, 18),
(76, 158, '2p   ', '2-6  ', 'Lasciava il veicolo in sosta in corrispondenza di distributore di     ', 'carburante, su sede stradale, durante le ore di esercizio             ', 'DIVIETO DI SOSTA (DISTRUBUTORE CARBURANTE)        ', '41.00', 0, 18),
(77, 158, '2q   ', '2-6  ', 'Lasciava il veicolo in sosta in posizione tale da impedire lo spo-    ', 'stamento dei veicoli in sosta                                         ', 'SOSTA IN POSIZIONE ERRATA                         ', '41.00', 0, 18),
(78, 158, '2r   ', '2-6  ', 'Lasciava il veicolo in sosta nello spazio riservato allo staziona-    ', 'mento taxi                                                            ', 'DIVIETO DI SOSTA (TAXI)                           ', '85.00', 2, 18),
(79, 158, '2v   ', '2-6  ', 'Lasciava il veicolo in sosta sull'' area destinata al mercato          ', '                                                                      ', 'DIVIETO SOSTA (AREA MERCATO)                      ', '41.00', 0, 18),
(80, 158, '4a   ', '4-6  ', 'Lasciava in sosta il veicolo senza adottare le opportune cautele      ', 'atte ad evitare incidenti                                             ', 'SOSTA SENZA OPPORTUNE ATTENZIONI                  ', '41.00', 0, 0),
(81, 7, '1Aa  ', '1a-14', 'Quale conducente, circolava con il veicolo  indicato, nella strada so ', 'pracitata, dove vige il divieto di transito, come da segnale stradale.', 'DIVIETO DI ACCESSO                                ', '41.00', 0, 0),
(82, 7, '1Fs  ', '1f-15', 'Il veicolo indicato veniva lasciato in sosta in zona a pagamento      ', 'oltre il termine consentito                                           ', 'TICKET SCADUTO                                    ', '25.00', 0, 0),
(83, 157, '2.a  ', '2-8  ', 'LASCIAVA IN SOSTA IL VEICOLO OMETTENDO DI COLLOCARLO IN MANIERA DA NON', ' ARRECARE INTRALCIO ALLA CIRCOLAZIONE                                 ', 'POSIZIONE DEI VEICOLI                             ', '41.00', 0, 0),
(84, 7, '1.Aa ', '1-14 ', 'In C.a., in qualità di conducente, circolava senza osservare          ', 'il segnale stradale di divieto                                        ', 'DIVIETO DI CIRCOLAZIONE                           ', '41.00', 0, 0),
(85, 7, '1.z  ', '1-14 ', 'In c.a. lasciava in sosta il veicolo su spazio riservato ai veicoli   ', 'della Polizia Municipale.                                             ', 'SOSTA AREA RISERVATA (POLIZIA MUNICIPALE)         ', '41.00', 0, 0),
(86, 158, '2.q  ', '2-6  ', 'Lasciava il veicolo in sosta in posizione tale da impedire la         ', 'fluidità dell''accesso al Parcheggio.                                  ', 'SOSTA IN RAMPA                                    ', '41.00', 0, 18),
(87, 7, '1far ', '1-14 ', 'In c.a. lasciava in sosta il veicolo su spazio riservato              ', 'alla farmacia.                                                        ', 'AREA RISERVATA (FARMACIA)                         ', '41.00', 0, 0),
(88, 7, '1.x  ', '1-14 ', 'In c.a. lasciava in sosta il veicolo su spazio riservato ai veicoli   ', 'della Struttura Ospedaliera e Sanitaria.                              ', 'AREA RISERVATA (STRUTTURA OSPEDALIERA E SANITARIA)', '41.00', 0, 0),
(89, 180, '1a   ', '1-7  ', 'Circolava con veicolo a motore senza avere con se'' la carta di cir-   ', 'colazione del veicolo                                                 ', 'SPROVVISTO CARTA DI CIRCOLAZIONE                  ', '41.00', 0, 0),
(90, 180, '1c   ', '1-7  ', 'Circolava con veicolo a motore senza avere con se'' la patente di      ', 'guida valida per la corrispondente categoria del veicolo              ', 'SPROVVISTO PATENTE                                ', '41.00', 0, 0),
(91, 7, '1Fds ', '1f-15', 'Il veicolo indicato veniva lasciato in sosta in zona regolata da      ', 'disco orario, oltre il termine consentito.                            ', 'DISCO ORARIO(OLTRE IL LIMITE)                     ', '25.00', 0, 0),
(92, 180, '1f   ', '1-7  ', 'Circolava con veicolo a motore senza avere con se'' il certificato     ', 'di assicurazione obbligatoria                                         ', 'SPROVVISTO ASSICURAZIONE                          ', '41.00', 0, 0),
(93, 180, '8a   ', '8    ', 'Senza giustificato motivo non ottemperava all''invito di presentarsi   ', 'entro termine stabilito ad uffici di polizia per esibire documenti    ', 'NON ESIBISCE I DOCUMENTI                          ', '422.00', 0, 0),
(94, 180, '1.c  ', '1-7  ', 'Circolava senza avere con se'' la patente di guida.                    ', '                                                                      ', 'SPROVVISTO PATENTE                                ', '41.00', 0, 0),
(95, 7, '1FsN ', '1f-15', 'Il veicolo indicato veniva lasciato in sosta oltre il termine consento', 'di 60 Minuti.                                                         ', 'OLTRE TEMPO LIMITE - 60 MIN                       ', '25.00', 0, 0),
(96, 181, '1.a  ', '1-3  ', 'Sostava con autoveicolo senza che fosse esposto il contrassegno       ', 'attestante il pagamento dell''assicurazione obbligatoria               ', 'SPROVVISTO ASSICURAZIONE                          ', '25.00', 0, 0),
(97, 158, '2.r  ', '2-6  ', 'Lasciava il veicolo in sosta nello spazio riservato allo staziona-    ', 'mento taxi                                                            ', 'DIVIETO DI SOSTA (TAXI)                           ', '85.00', 2, 18),
(98, 7, '1Mb  ', '1a-14', 'Sostava con il veicolo indicato in area riservata, con apposita       ', 'segnaletica, alla manovra BUS.                                        ', 'DIVIETO SOSTA(AREA RISERVATA MANOVRA BUS)         ', '41.00', 0, 0),
(99, 7, '1.R  ', '1-14 ', 'In c.a. lasciava in sosta il veicolo su spazio riservato a veicoli    ', 'degli organi di polizia stradale                                      ', 'SOSTA IN AREA RISERVATA                           ', '41.00', 0, 0),
(100, 158, '1GM2 ', '1g-5 ', 'Lasciava il veicolo in sosta negli spazi riservati ai veicoli         ', 'di emergenza.                                                         ', 'DIVIETO SOSTA (riserv. EMERGENZA)                 ', '25.00', 0, 18),
(101, 158, '1Cm  ', '1g-5 ', 'Lasciava il veicolo in sosta in seconda fila.                         ', '                                                                      ', 'DIVIETO SOSTA (SECONDA FILA-MOTO)                 ', '24.00', 0, 18),
(102, 126, '2.a  ', '2bis ', 'Mancata comunicazione degli estremi del trasgressore per violazioni   ', 'con punti non contestata immediatamente                               ', 'PUNTI(MANCATA COMUNICAZIONE)                      ', '286.00', 0, 0),
(103, 158, '1GM  ', '1g-5 ', 'Lasciava il veicolo in sosta su passaggio pedonale                    ', '                                                                      ', 'DIVIETO SOSTA (PASSAGGIO PEDONALE-MOTO)           ', '24.00', 0, 18),
(104, 158, '1CcM ', '1c-5 ', 'Con il veicolo indicato sostava in corrispondenza o in prossimità di  ', 'curva.                                                                ', 'SOSTA IN CURVA (MOTO)                             ', '40.00', 0, 18),
(105, 7, 'Res11', '11-14', 'Sostava in zona riservata residenti senza esporre autorizzazione.     ', '                                                                      ', 'DIVIETO SOSTA (ZONA RESIDENTI)                    ', '41.00', 0, 0),
(106, 158, '1PsCm', '1g-5 ', 'Lasciava il veicolo in sosta davanti                                  ', 'un passo carrabile.                                                   ', 'DIVIETO SOSTA (PASSO CARRABILE-MOTO)              ', '24.00', 0, 18),
(107, 15, '1Pm  ', '1-2  ', 'Sulla strada sopra citata, creava stato di pericolo alla circolazione ', 'per effetto di una perdita di olio dal motore.                        ', 'PERDITA OLIO MOTORE                               ', '41.00', 0, 4),
(108, 158, '2mM  ', '1g-5 ', 'Lasciava il veicolo in sosta in Zona a Traffico Limitato.             ', '                                                                      ', 'ZTL -  (MOTO)                                     ', '24.00', 0, 18),
(109, 157, '2    ', '2-8  ', 'Sostava con il veicolo indicato senza lasciare uno spazio             ', 'sufficiente per il transito dei pedoni.                               ', 'SPAZIO PER I PEDONI                               ', '41.00', 0, 0),
(110, 23, '1Ca  ', '3 - 4', 'OMISSIONE RIPRISTINO STATO DEI LUOGHI.                                ', '                                                                      ', 'OMISSIONE RIPRISTINO STATO DEI LUOGHI.            ', '848.00', 0, 0),
(111, 157, '2Far ', '2-8  ', 'Fermava il veicolo in area riservata alla Farmacia, senza il titolo   ', 'di Pagamento.                                                         ', 'SOSTA IN AREA FARMACIA                            ', '41.00', 0, 0),
(112, 158, '1Mg  ', '1g-5 ', 'Lasciava il veicolo in sosta sulla banchina.                          ', '                                                                      ', 'DIVIETO SOSTA (BANCHINA-MOTO)                     ', '24.00', 0, 18),
(113, 158, '2.X  ', '1g-5 ', 'Per aver lasciato in sosta il ciclomotore (o motoveicolo a 2 ruote)   ', 'sulla carreggiata nelle zone a traffico limitato per i veicoli non    ', 'DIVIETO SOSTA (sosta in area vietata -MOTO)       ', '24.00', 0, 18),
(114, 6, '4.b  ', '4-14 ', 'circolava in violazione dell''ordinanza sindacale n. 32/2012 che       ', ' istituiva il divieto di transito ai bus in suddetta strada, senza    ', 'DIVIETO CIRCOLAZIONE ORD. SINDACO                 ', '85.00', 0, 0),
(115, 158, '1mA  ', '1-5  ', 'Per aver effettuato con il motociclo (mo motoveicolo a 2 ruote)       ', 'la sosta o fermata su di un attraversamento pedonale e/o ciclabile,   ', 'DIVIETO SOSTA(PEDON_CICLAB-MOTO)                  ', '40.00', 0, 18),
(116, 7, '1Mm  ', '1-14 ', 'SOSTAVA IN AREA RISERVATA AL MERCATO SETTIMANALE                      ', '                                                                      ', 'DIVIETO SOSTA (MERCATO)                           ', '41.00', 0, 0),
(117, 7, '1A14 ', '1a-14', 'Sostava con il veicolo indicato negli spazi riservati, con apposita   ', 'segnaletica, a determinati veicoli.                                   ', 'DIVIETO SOSTA(AREA RISERVATA)                     ', '41.00', 0, 0),
(118, 158, '1Pa  ', '2-6  ', 'Lasciava il veicolo in sosta in un area pedonale,                     ', 'senza autorizzazione.                                                 ', 'SOSTA IN AREA PEDONALE (ZTL)                      ', '41.00', 0, 18);

-- --------------------------------------------------------

--
-- Struttura della tabella `p_artpref`
--

CREATE TABLE IF NOT EXISTS `p_artpref` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTE` varchar(4) NOT NULL,
  `ID_ART` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `p_artpref`
--

INSERT INTO `p_artpref` (`ID`, `ENTE`, `ID_ART`) VALUES
(1, 'H198', 7);

-- --------------------------------------------------------

--
-- Struttura della tabella `p_autorizzati`
--

CREATE TABLE IF NOT EXISTS `p_autorizzati` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_ATRZ` int(11) NOT NULL,
  `TARGA_ATRZ` varchar(10) NOT NULL,
  `MODELLO_ATRZ` varchar(50) NOT NULL,
  `OBLG_ATRZ` varchar(50) NOT NULL,
  `TEL_OBLG_ATRZ` varchar(25) NOT NULL,
  `TIPO_ATRZ` varchar(8) NOT NULL,
  `id_anagraf` int(11) NOT NULL,
  `DataIn` date NOT NULL,
  `DataFi` date NOT NULL,
  `id_tipo_permesso` int(11) NOT NULL,
  `tipo_permesso` char(5) NOT NULL,
  `id_ente` char(4) NOT NULL,
  `id_richiesta` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `p_device`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;


-- --------------------------------------------------------

--
-- Struttura della tabella `p_ente`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `p_ente`
--

INSERT INTO `p_ente` (`ID`, `ENTE`, `DESC_ENTE`, `TEL_ENTE`, `EMAIL_ENTE`, `LOGO_ENTE`, `IBAN_ENTE`, `CCP_ENTE`, `RESP_ENTE`) VALUES
(1, 'H198', 'COMUNE DI RAVELLO', '089 857498', 'comandante@comune.ravello.sa.it', '', 'IT51A0103076030000000539001 BIC:PASCITMSAA', '12217840', 'Com. Biagio CIPOLLETTA');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_manc_cont`
--

CREATE TABLE IF NOT EXISTS `p_manc_cont` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESC_SANZ_ACC` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `p_manc_cont`
--

INSERT INTO `p_manc_cont` (`ID`, `DESC_SANZ_ACC`) VALUES
(0, ''),
(1, 'RIMOSSA PER MOTIVI DI VIABILITA'''),
(2, 'RIMOSSA PER MOTIVI TECNICI');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_marche`
--

CREATE TABLE IF NOT EXISTS `p_marche` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(2) NOT NULL,
  `MARCA` varchar(30) NOT NULL,
  `MODELLO` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `p_marche`
--

INSERT INTO `p_marche` (`ID`, `TIPO`, `MARCA`, `MODELLO`) VALUES
(1, 'A', 'FIAT', 'PANDA'),
(2, 'A', 'RENAULT', 'SCENIC');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_obbligato`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `p_permessi`
--

CREATE TABLE IF NOT EXISTS `p_permessi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anagraf` int(11) DEFAULT NULL,
  `targa_perms` varchar(10) DEFAULT NULL,
  `modello_perms` varchar(30) DEFAULT NULL,
  `id_tipo_perms` int(11) DEFAULT NULL,
  `id_stato_perms` int(11) DEFAULT NULL,
  `id_ente` char(4) DEFAULT NULL,
  `codfis` varchar(20) DEFAULT NULL,
  `tipo_perms` char(5) DEFAULT NULL,
  `nota` varchar(200) DEFAULT NULL,
  `documenti` varchar(100) DEFAULT NULL,
  `nomefile` varchar(100) DEFAULT NULL,
  `sizefile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `p_permessi`
--

INSERT INTO `p_permessi` (`id`, `id_anagraf`, `targa_perms`, `modello_perms`, `id_tipo_perms`, `id_stato_perms`, `id_ente`, `codfis`, `tipo_perms`, `nota`, `documenti`, `nomefile`, `sizefile`) VALUES
(1, 0, 'CG685JD', 'PEUGEOT', 0, 2, 'H198', 'qlamrc90e03h703e', 'R1', '', 'Nuovo documento 7.pdf', '', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `p_stato_permessi`
--

CREATE TABLE IF NOT EXISTS `p_stato_permessi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ente` char(4) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `p_stato_permessi`
--

INSERT INTO `p_stato_permessi` (`id`, `ente`, `descrizione`) VALUES
(1, 'H198', 'Richiesta Inoltrata'),
(2, 'H198', 'In Lavorazione'),
(3, 'H198', 'Attesa Documenti Integrativi'),
(4, 'H198', 'Completata (da Consegnare)'),
(5, 'H198', 'Completata (Consegnata)'),
(6, 'H198', 'Incompleta'),
(7, 'H198', 'Non Spettante'),
(8, 'H198', 'Errata');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_tipo_permessi`
--

CREATE TABLE IF NOT EXISTS `p_tipo_permessi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_perms` char(5) DEFAULT NULL,
  `descr_perms` varchar(100) DEFAULT NULL,
  `id_ente` char(4) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `nome_file` varchar(100) DEFAULT NULL,
  `size_file` int(11) DEFAULT NULL,
  `tipovalidita` tinyint(2) DEFAULT NULL,
  `TotVali` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `p_tipo_permessi`
--

INSERT INTO `p_tipo_permessi` (`id`, `cod_perms`, `descr_perms`, `id_ente`, `document`, `nome_file`, `size_file`, `tipovalidita`, `TotVali`) VALUES
(1, 'R1', 'Residente (Parcheggio Zona 1)', 'H198', 'Modulo_richiesta_collegamento.doc', 'Modulo_richiesta_collegamento.doc', 31744, NULL, NULL),
(2, 'L1', 'Lavoratore (Parcheggio Zona 1)', 'H198', 'domanda_accesso_utenti_pubblici_2009.doc', 'domanda_accesso_utenti_pubblici_2009.doc', 29696, NULL, NULL),
(3, 'Z1', 'Ztl Varco 1', 'H198', '', '', 0, NULL, NULL),
(4, 'Z2', 'Ztl Varco 2', 'H198', '', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `p_tip_veicolo`
--

CREATE TABLE IF NOT EXISTS `p_tip_veicolo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COD_VEI` varchar(1) NOT NULL,
  `DESC_VEIC` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `p_tip_veicolo`
--

INSERT INTO `p_tip_veicolo` (`ID`, `COD_VEI`, `DESC_VEIC`) VALUES
(1, 'A', 'AUTOVEICOLO'),
(2, 'M', 'MOTOCICLO'),
(5, 'C', 'CICLOMOTORE'),
(6, 'R', 'RIMORCHIO');

-- --------------------------------------------------------

--
-- Struttura della tabella `p_trasgres`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `p_verb`
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
  `Anno_Pro` int(4) NOT NULL,
  `Prot` int(11) NOT NULL,
  `Stato` tinyint(2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `p_vie`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=177 ;

--
-- Dump dei dati per la tabella `p_vie`
--

INSERT INTO `p_vie` (`ID`, `ENTE`, `QUART`, `COD_ENT`, `TOPON`, `DESCR_VIE`) VALUES
(1, 'H198', 1, 1, '     ', 'Via dell''Annunziata                               '),
(2, 'H198', 1, 2, '     ', 'Via Nevile Reid                                   '),
(3, 'H198', 1, 3, '     ', 'Via San Pietro Alla Costa                         '),
(4, 'H198', 1, 4, '     ', 'Via San Giovanni Alla Costa                       '),
(5, 'H198', 1, 5, '     ', 'Via Crocelle                                      '),
(6, 'H198', 1, 6, '     ', 'Via Traglio                                       '),
(7, 'H198', 1, 7, '     ', 'Via Torello                                       '),
(8, 'H198', 1, 8, '     ', 'Via Santa Croce                                   '),
(9, 'H198', 1, 9, '     ', 'Via Zia Marta                                     '),
(10, 'H198', 1, 10, '     ', 'Via Marino Frezza                                 '),
(11, 'H198', 1, 11, '     ', 'Via di Puntarulo                                  '),
(12, 'H198', 1, 12, '     ', 'Via Casa Rossa                                    '),
(13, 'H198', 1, 13, '     ', 'Via Famiglia Pironti                              '),
(14, 'H198', 1, 14, '     ', 'Via Famiglia Castaldo                             '),
(15, 'H198', 1, 15, '     ', 'Via della Rotonda                                 '),
(16, 'H198', 1, 16, '     ', 'Via della Cappella                                '),
(17, 'H198', 1, 17, '     ', 'Via Tuscarano                                     '),
(18, 'H198', 1, 18, '     ', 'Via Famiglia Coppola                              '),
(19, 'H198', 1, 19, '     ', 'Via di Torre Paradiso                             '),
(20, 'H198', 1, 20, '     ', 'Via Vallone                                       '),
(21, 'H198', 1, 21, '     ', 'Via Torretta a Marmorata                          '),
(22, 'H198', 1, 22, '     ', 'Via delle Repubbliche Marinare                    '),
(23, 'H198', 1, 23, '     ', 'Via Gradoni                                       '),
(24, 'H198', 1, 24, '     ', 'Via Casanova                                      '),
(25, 'H198', 1, 25, '     ', 'Via Reginola                                      '),
(26, 'H198', 1, 26, '     ', 'Via Giovanni XXIII                                '),
(27, 'H198', 1, 27, '     ', 'Via Famiglia Bove                                 '),
(28, 'H198', 1, 28, '     ', 'Via Petrito                                       '),
(29, 'H198', 1, 29, '     ', 'Via Grotta Petina                                 '),
(30, 'H198', 1, 30, '     ', 'Via Matteo Camera                                 '),
(31, 'H198', 1, 31, '     ', 'Via dello Scarpariello                            '),
(32, 'H198', 1, 32, '     ', 'Via Marmorata                                     '),
(33, 'H198', 1, 33, '     ', 'Via Carusiello                                    '),
(34, 'H198', 1, 34, '     ', 'Via Amalfi                                        '),
(35, 'H198', 1, 35, '     ', 'Via Bizantina                                     '),
(36, 'H198', 1, 36, '     ', 'Via Civita                                        '),
(37, 'H198', 1, 37, '     ', 'Via delle Cartiere                                '),
(38, 'H198', 1, 38, '     ', 'Via Cigliano                                      '),
(39, 'H198', 1, 39, '     ', 'Via Loggetta                                      '),
(40, 'H198', 1, 40, '     ', 'Via San Cosma                                     '),
(41, 'H198', 1, 41, '     ', 'Via Santa Barbara                                 '),
(42, 'H198', 1, 42, '     ', 'Via del Castagneto                                '),
(43, 'H198', 1, 43, '     ', 'Via Giovanni Boccaccio                            '),
(44, 'H198', 1, 44, '     ', 'Via della Repubblica                              '),
(45, 'H198', 1, 45, '     ', 'Via Valle del Dragone                             '),
(46, 'H198', 1, 46, '     ', 'Via Muscettola                                    '),
(47, 'H198', 1, 47, '     ', 'Via Fiume                                         '),
(48, 'H198', 1, 48, '     ', 'Via Sigilgaida                                    '),
(49, 'H198', 1, 49, '     ', 'Via Scala                                         '),
(50, 'H198', 1, 50, '     ', 'Via della Marra                                   '),
(51, 'H198', 1, 51, '     ', 'Via Santa Maria a Gradillo                        '),
(52, 'H198', 1, 52, '     ', 'Via Roma                                          '),
(53, 'H198', 1, 53, '     ', 'Via Madonna dell''Ospedale                         '),
(54, 'H198', 1, 54, '     ', 'Viale Parco della Rimembranza                     '),
(55, 'H198', 1, 55, '     ', 'Piazza Fontana Moresca                            '),
(56, 'H198', 1, 56, '     ', 'Viale Gioacchino d''Anna                           '),
(57, 'H198', 1, 57, '     ', 'Via Santa Margherita                              '),
(58, 'H198', 1, 58, '     ', 'Piazza San Giovanni del Toro                      '),
(59, 'H198', 1, 59, '     ', 'Via San Giovanni del Toro                         '),
(60, 'H198', 1, 60, '     ', 'Viale Richard Wagner                              '),
(61, 'H198', 1, 61, '     ', 'Piazza Duomo (PIAZZA VESCOVADO)                   '),
(62, 'H198', 1, 62, '     ', 'Via dei Rufolo                                    '),
(63, 'H198', 1, 63, '     ', 'Via Trinita''                                      '),
(64, 'H198', 1, 64, '     ', 'Via San Francesco                                 '),
(65, 'H198', 1, 65, '     ', 'Via Orso Papice                                   '),
(66, 'H198', 1, 66, '     ', 'Via dei Fusco                                     '),
(67, 'H198', 1, 67, '     ', 'Via Santa Chiara                                  '),
(68, 'H198', 1, 68, '     ', 'Piazza Pasquale Sacco                             '),
(69, 'H198', 1, 69, '     ', 'Via Lacco                                         '),
(70, 'H198', 1, 70, '     ', 'Piazza Andrea Mansi (P.zza Lacco)                 '),
(71, 'H198', 1, 71, '     ', 'Via Casa Bianca                                   '),
(72, 'H198', 1, 72, '     ', 'Via San Martino                                   '),
(73, 'H198', 1, 73, '     ', 'Via XXV Aprile                                    '),
(74, 'H198', 1, 74, '     ', 'Via San Trifone                                   '),
(75, 'H198', 1, 75, '     ', 'Via Monte Brusara                                 '),
(76, 'H198', 1, 76, '     ', 'Via Costantino Rogadeo                            '),
(77, 'H198', 1, 77, '     ', 'Via Sambuco                                       '),
(78, 'H198', 1, 78, '     ', 'Via de Pendolo                                    '),
(79, 'H198', 1, 79, '     ', 'Via Riola                                         '),
(80, 'H198', 1, 80, '     ', 'Via Valico di Chiunzi                             '),
(81, 'H198', 1, 81, '     ', 'Via Atrani                                        '),
(82, 'H198', 1, 82, '     ', 'Via dell''Episcopio                                '),
(83, 'H198', 1, 83, '     ', 'Via Casa Pisani                                   '),
(84, 'H198', 1, 84, '     ', 'Via Casa Marciano                                 '),
(85, 'H198', 1, 85, '     ', 'Via Castiglione                                   '),
(86, 'H198', 1, 86, '     ', 'Via Famiglia Acconciajoco                         '),
(87, 'H198', 1, 87, '     ', 'Via Porta la Terra                                '),
(88, 'H198', 1, 88, '     ', 'Via Sant''Andrea del Pendolo                       '),
(89, 'H198', 1, 89, '     ', 'Via Francesco d''Andrea                            '),
(90, 'H198', 1, 90, '     ', 'Via Grotta di Campo                               '),
(91, 'H198', 1, 91, '     ', 'Via Bartolomeo da Foggia                          '),
(92, 'H198', 1, 92, '     ', 'Via Famiglia d''Afflitto                           '),
(93, 'H198', 1, 93, '     ', 'Via Barisano da Trani                             '),
(94, 'H198', 1, 94, '     ', 'Via Minori                                        '),
(95, 'H198', 1, 95, '     ', 'Rampe Bonaventura Gambardella                     '),
(96, 'H198', 1, 96, '     ', 'RAMPA TERESA MASULLO                              '),
(97, 'H198', 1, 97, '     ', 'Parcheggio Auditorium (I Livello)                 '),
(98, 'H198', 1, 98, '     ', 'PARCHEGGIO AUDITORIUM (II LIVELLO)                '),
(99, 'H198', 1, 99, '     ', 'Parcheggio Piazza Duomo                           '),
(100, 'H198', 1, 100, '     ', 'SCALA SUPERIORE AUDITORIUM                        '),
(101, 'H198', 1, 102, '     ', 'Strada Provinciale 1 - SP1                        '),
(102, 'H198', 1, 103, '     ', 'SS 163 - Via Marmorata                            '),
(103, 'H198', 1, 104, '     ', ' S.S. 163 AMALFITANA                              '),
(104, 'H198', 1, 101, '     ', 'COMANDO POLIZIA LOCALE                            '),
(105, 'I486', 1, 1, '     ', 'PIAZZA MUNICIPIO                                  '),
(106, 'I486', 1, 2, '     ', 'LARGO MONASTERO                                   '),
(107, 'I486', 1, 3, '     ', 'VIA FRA GERARDO SASSO                             '),
(108, 'I486', 1, 4, '     ', 'VIA GAETANO MANSI                                 '),
(109, 'I486', 1, 5, '     ', 'PIAZZA S.PIETRO                                   '),
(110, 'I486', 1, 6, '     ', 'VIA CAVALIERI DI MALTA                            '),
(111, 'I486', 1, 7, '     ', 'VIA VESCOVADO                                     '),
(112, 'I486', 1, 8, '     ', 'VIA VINCENZO D''AMATO                              '),
(113, 'I486', 1, 9, '     ', 'VIA ROTABILE PONTONE                              '),
(114, 'I486', 1, 10, '     ', 'PROV.LOC.CASTIGLIONE                              '),
(115, 'I486', 1, 11, '     ', 'VIA TORRICELLA                                    '),
(116, 'I486', 1, 12, '     ', 'VIA VALLE DELLE FERRIERE                          '),
(117, 'I486', 1, 13, '     ', 'VIA G. BOTTONE                                    '),
(118, 'I486', 1, 14, '     ', 'Area Parcheggio S.Pietro                          '),
(119, 'I486', 1, 15, '     ', 'VIA BELVEDERE                                     '),
(120, 'I486', 1, 16, '     ', 'VIA CAMPIDOGLIO -BELVEDERE                        '),
(121, 'I486', 1, 17, '     ', '                                                  '),
(122, 'I486', 1, 18, '     ', 'VIA CAMPIDOGLIO -BELVEDERE                        '),
(123, 'I486', 1, 19, '     ', 'VIA CAMPIDOGLIO -BELVEDERE                        '),
(124, 'I486', 1, 20, '     ', 'VIA CAMPIDOGLIO -BELVEDERE                        '),
(125, 'I486', 1, 21, '     ', 'VIA CAMPIDOGLIO -BELVEDERE                        '),
(126, 'I486', 1, 22, '     ', 'VIA CASA BANDINO                                  '),
(127, 'I486', 1, 23, '     ', 'VIA CASA ROMANA                                   '),
(128, 'I486', 1, 24, '1    ', 'VIA CAMPOLAVIGNA                                  '),
(129, 'I486', 1, 25, '1    ', 'VIA ACQUACCIOLA                                   '),
(130, 'I486', 1, 26, '     ', 'VIA ANNUNZIATA                                    '),
(131, 'I486', 1, 27, '     ', 'Piazzetta delle Camelie                           '),
(132, 'I486', 1, 28, '     ', 'PORTA DI SCALA                                    '),
(133, 'I486', 1, 29, '     ', 'Piazza S.Caterina                                 '),
(134, 'I486', 1, 30, '     ', 'S. MARIA ALLA PORTA                               '),
(135, 'I486', 1, 31, '     ', 'VIA SAN GIOVANNI DECOLLATO                        '),
(136, 'A487', 1, 14, '     ', 'PUBBLICA SPIAGGIA                                 '),
(137, 'A487', 1, 1, '     ', 'PIAZZALE MARINELLA                                '),
(138, 'A487', 1, 2, '     ', 'CORSO VITTORIO EMANUELE- SS163                    '),
(139, 'A487', 1, 3, '     ', 'VIA DEI DOGI                                      '),
(140, 'A487', 1, 4, '     ', 'VIA DEI DOGI                                      '),
(141, 'A487', 1, 5, '     ', 'VIA GABRIELE DI BENEDETTO                         '),
(142, 'A487', 1, 6, '     ', 'LARGO ERCOLANO MARINI                             '),
(143, 'A487', 1, 7, '     ', 'LARGO CAV. ORLANDO BUONOCORE                      '),
(144, 'A487', 1, 8, '     ', 'LOCALITA'' ALAGNO                                  '),
(145, 'A487', 1, 9, '     ', 'PIAZZALE EUROPA                                   '),
(146, 'A487', 1, 10, '     ', 'LARGO VOLLARO DI LIETO                            '),
(147, 'A487', 1, 11, '     ', 'PIAZZA UMBERTO I                                  '),
(148, 'A487', 1, 12, '     ', 'EX S.S. 373                                       '),
(149, 'A487', 1, 13, '     ', 'STRADA STATALE 163                                '),
(150, 'G976', 1, 1, '     ', 'S.S.163 STRADA STATALE AMALF.                     '),
(151, 'G976', 1, 2, '     ', 'VIA GUGLIELMO MARCONI                             '),
(152, 'G976', 1, 3, '     ', 'VIA UMBERTO I                                     '),
(153, 'G976', 1, 4, '     ', 'VIA PISTIELLO I                                   '),
(154, 'G976', 1, 25, '     ', 'VIA MURICIELLO                                    '),
(155, 'G976', 1, 6, '     ', 'VIA ANTICO SEGGIO                                 '),
(156, 'G976', 1, 7, '     ', 'VIA ASCIOLA                                       '),
(157, 'G976', 1, 8, '     ', 'VIA G.CAPRIGLIONE                                 '),
(158, 'G976', 1, 9, '     ', 'VIA CASA CINQUE                                   '),
(159, 'G976', 1, 10, '     ', 'PIAZZA COSTANTINOPOLI                             '),
(160, 'G976', 1, 11, '     ', 'VIA FLAVIO GIOIA                                  '),
(161, 'G976', 1, 12, '     ', 'VIA GRADILLO                                      '),
(162, 'G976', 1, 13, '     ', 'VIA MIGLINA                                       '),
(163, 'G976', 1, 14, '     ', 'PIAZZA MORESSA                                    '),
(164, 'G976', 1, 15, '     ', 'PIAZZA S.LUCA                                     '),
(165, 'G976', 1, 16, '     ', 'VIA ROMA                                          '),
(166, 'G976', 1, 17, '     ', 'VIA S.TOMMASO                                     '),
(167, 'G976', 1, 18, '     ', 'VIA CAPOVETTICA                                   '),
(168, 'G976', 1, 19, '     ', 'VIA S.GIOVANNI                                    '),
(169, 'G976', 1, 20, '     ', 'VIA CELLA                                         '),
(170, 'G976', 1, 24, '     ', 'VIA COSTANTINOPOLI                                '),
(171, 'G976', 1, 22, '     ', 'VIA CROCE                                         '),
(172, 'G976', 1, 23, '     ', 'VIA DUOMO                                         '),
(173, 'G976', 1, 26, 'CAMPO', 'VIA CAMPO                                         '),
(174, 'G976', 1, 27, 'CIMIT', 'CIMITERO                                          '),
(175, 'G976', 1, 28, '     ', 'UFFICIO COMANDO PM PRAIANO                        '),
(176, 'G976', 1, 29, '     ', 'PRAIA - Via Terrazze                              ');
