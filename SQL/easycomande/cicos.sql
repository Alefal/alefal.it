-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cicos
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `slug` varchar(45) NOT NULL,
  `count` int(11) DEFAULT '0',
  `hasextra` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sfizi e Capricci',NULL,'sfizi-e-capricci',11,0,'0000-00-00 00:00:00','2017-06-26 20:41:50'),(2,'Non solo Griglia',NULL,'non-solo-griglia',11,0,'0000-00-00 00:00:00','2017-06-26 20:42:10'),(3,'Insalate',NULL,'insalate',8,0,'0000-00-00 00:00:00','2017-06-26 20:42:25'),(4,'Contorni',NULL,'contorni',9,0,'0000-00-00 00:00:00','2017-06-26 20:42:40'),(5,'Panini',NULL,'panini',25,0,'0000-00-00 00:00:00','2017-06-26 20:43:03'),(6,'Speciali',NULL,'speciali',10,0,'0000-00-00 00:00:00','2017-06-26 20:43:20'),(7,'Extra',NULL,'extra',6,0,'0000-00-00 00:00:00','2017-06-26 20:43:32'),(8,'Bevande',NULL,'bevande',36,0,'0000-00-00 00:00:00','2017-06-26 20:44:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `label` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'serviceenable',1,'Servizio 10% del totale','10',NULL,NULL);
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra`
--

DROP TABLE IF EXISTS `extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `priceoffer` double DEFAULT '0',
  `hasextra` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra`
--

LOCK TABLES `extra` WRITE;
/*!40000 ALTER TABLE `extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `total` double NOT NULL DEFAULT '0',
  `service` double NOT NULL DEFAULT '0',
  `note` varchar(500) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `menuname` varchar(45) NOT NULL,
  `statename` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_menu1_idx` (`menu_id`),
  KEY `fk_items_orders1_idx` (`order_id`),
  KEY `fk_items_state1_idx` (`state_id`),
  CONSTRAINT `fk_items_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_items_state1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,12,1.2,'',13,1,1,'2017-06-26 20:45:11','2017-06-26 20:45:11','O Tagliere','pending'),(2,2,17,1.7,'',16,1,1,'2017-06-26 20:45:11','2017-06-26 20:45:11','O Frittin','pending'),(3,1,10,1,'',6,1,1,'2017-06-26 20:45:11','2017-06-26 20:45:11','O Casareccio','pending'),(4,2,9,0.9,'',10,1,1,'2017-06-26 20:45:11','2017-06-26 20:45:11','E Pizzett Fritt','pending'),(5,1,5,0.5,'',25,1,1,'2017-06-26 20:45:11','2017-06-26 20:45:11','Entrecote Argentina','pending'),(6,1,6,0.6,'',40,1,1,'2017-06-26 20:45:11','2017-06-26 20:45:11','Crocchettone','pending'),(7,1,2.5,0.25,'dfsgd',43,1,1,'2017-06-26 20:45:11','2017-06-26 20:45:11','Insalata','pending'),(8,1,8.5,0.85,'aaa',11,2,2,'2017-06-26 20:56:23','2017-06-26 20:56:29','O Cico\'s','completed'),(9,1,16.5,1.65,'bbb',19,2,1,'2017-06-26 20:56:23','2017-06-26 20:56:23','Filetto dello Chef','pending'),(10,1,6,0.6,'ccc',29,2,1,'2017-06-26 20:56:23','2017-06-26 20:56:23','Fonzo','pending'),(11,1,4,0.4,'',82,2,1,'2017-06-26 20:56:23','2017-06-26 20:56:23','hamburger di Scottona','pending');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laradrop_files`
--

DROP TABLE IF EXISTS `laradrop_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laradrop_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_thumbnail` smallint(6) NOT NULL DEFAULT '0',
  `meta` text COLLATE utf8mb4_unicode_ci,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_resource_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laradrop_files_parent_id_index` (`parent_id`),
  KEY `laradrop_files_lft_index` (`lft`),
  KEY `laradrop_files_rgt_index` (`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laradrop_files`
--

LOCK TABLES `laradrop_files` WRITE;
/*!40000 ALTER TABLE `laradrop_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `laradrop_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `priceoffer` double DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_categories_idx` (`category_id`),
  CONSTRAINT `fk_menu_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (6,'O Casareccio','Parmigiana - Scarola con Fetta di Pane – Polpette al Sugo – Salsiccia Broccoli – Gattò di Patate',10,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'E Bruschette','Pachino ,Rucola e Grana – Pomodori Secchi e Pesto di Basilico – Pachino e Alici – Pachino con Provola e melanzane sotto olio',4.5,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'O Sfizio','Polpette di Melanzane e Verdure Pastellate',6,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'O vulij ro Chef','Melanzane a funghetti – Mozzarella d\'Agerola – Provola d\'Agerola – Insalata di Pomodoro- Pomodori Secchi – Crema di Basilico – Verdure Grigliate',9,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'E Pizzett Fritt','Gorgonzola – Crema di Basilico e Grana – Pomodoro e Mozzarella d\'Agerola con Insalata di Carciofi',4.5,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'O Cico\'s','',8.5,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'O Ciurill','Fiori di Zucca con Crema al Pomodoro e Pesto di Basilico',4.5,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'O Tagliere','Affettati Misti e Formaggio con Confetture',12,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'O Gluten Free','Barchetta di Patate con Crema al Pomodoro , Barchetta di Patate con Gorgonzola e Barchetta di patate con Crema di Basilico e Grana -Rosti triangolo allo speck – Fagottino di Salmone e Formaggio',6,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'O sapor e Mar','Conchiglia Gratinata con Gamberi e Zucchine – Provola d\'Agerola con Alici e Olive Nere – Salmone Affumicato con Cipolla Rossa e Limone – Parmigiana di Pesce – Tortino di Baccalà e Patate',10,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'O Frittin','Olive Ascolane – Mozzarelline – Fiori di Zucca – Mini Crocchette con Prosciutto Frittelle di Alghe – Mozzarella in Carrozza con Speck e Provola – Supplì – Anelli di Cipolla',8.5,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'Filetto','con salsa al formaggio e cipolla alla birra',13.5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'Filetto al Pepe Verde','',14.5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'Filetto dello Chef','',16.5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'Tagliata','Rucola- Grana – Pachino',14.5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'Tagliata','Funghi -Insalata – Graniglie di Noce',15.5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'Tagliata','Carciofi – Asparagi al Vapore – Grana',15,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'Entrecote Francese','per etto',5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'Entrecote Irlandese','per etto',6,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'Entrecote Argentina','per etto',5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'Tagliata di Pollo','con Verdure Grigliate',8.5,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'Salsiccia e Patate','',8,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,'Taturiello','',7,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'Fonzo','',6,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'Abby','',6,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'Elisa','',6,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'Melissa','',6.5,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,'Raffaella','',7.5,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,'Agnese','',8,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,'Effeeffe','',9,0,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,'Patate Fritte','',3.5,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,'Patate Dippers','',4,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,'Patate Onion & Black Peppers','',4.5,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,'Patate Novelle','',3,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,'Crocchettone','',6,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,'Verdure Pastellate','',2.5,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,'Verdure Grigliate','',3.5,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,'Insalata','',2.5,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,'Insalata Mista','',3,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,'Checco','Pomodoro- Insalata - Cipolla di Tropea – Cheddar – Bacon',4.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,'Giotto','Scamorza d\'Agerola – Bacon – Cipolla e Peperoni Grigliati',6,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,'Da Vinci','Scamorza d\'Agerola – Bacon- Melanzane a funghetti',6,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,'Pinturicchio','Salsa al Pepe Verde – Zucchine Grigliate – Cipolla di Tropea',6,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,'Michelangelo','Pomodori secchi – Pesto – Bacon – Cipolla di Tropea',6,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,'Modigliani','Peperoni – Cipolle fritte – Pomodoro – Insalata – Cheddar',6,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,'Totò','Provola d\'Agerola – Mortadella – Formaggio fuso',5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,'Sofia Loren','Provola d\'Agerola – Broccoli',5.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,'Alberto Sordi','Porchetta d\'Ariccia – Provola d\'Agerola – Melanzane a funghetti',6.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,'Benigni','Verdure pastellate – Mozzarela d\'Agerola – Crema di Pomodoro',5.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,'Rossellini','Mozzarella d\'Agerola – Grattugiata di Limone-Verdure Grigliate – Bacon',6.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,'Gassman','Formaggio Fuso – Lardo di Patanegra – Occhio di Bue',6,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,'Mennea','Funghi e Asparagi – Scamorza d\'Agerola- Crema di Datterini',6.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,'Rossi','Insalata – Pomodoro – Crema di Basilico',5.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,'Pantani','Scamorza – Crema di Broccoli – Cipolla di Tropea',5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,'Totti',' Gamberetti – Crudo – Insalata e Salsa U.S.A.',7,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,'Campioni del Mondo','Lardo di Patanegra – Provola d\'Agerola – Pomodorini secchi – Pesto',7,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,'Testa Rossa','Tonno – Formaggio Fuso – Anelli di Cipolla – Scaglie di Parmigiano',7,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,'Simoncelli','Crudo – Mozzarella d\'Agerola – pomodoro -Insalata – Cipolla -Patate Fritte',6.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,'DelPezo','Provola d\'Agerola – Crema di Pomodoro Piccante– Bacon',5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,'Antonella','Mozzarrella d\'Agerola – insalata – Crocchè di patate – Prosciutto Cotto',6,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,'Nunzia','Crema di Funghi – Scamorza d\'Agerola',6.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,'Franco','Verdure grigliate- Crema di Basilico- Grana – Stracciatella d\'uovo',6.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,'Elisabetta','Pomodoro – Insalata – Cipolla di Tropea – Cheddar – Bacon – Occhio di Bue',7,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,'Nazario','Lardo di Patanegra – Mozzarella -Bacon – Crema di Broccoli',6.5,0,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,'Abbuffata','Frittata di maccheroni in tempura farcite e burrata',13,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,'Speedy Pollo','Mucho gusto - Speedy pollo - Birbe di pollo - Mozzarella Stick - Ebi fry',9.5,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,'Maialata','Tris di patate e wurstel',7,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,'Troisi','Pomodoro - Mozzarella - Insalata - Crudo',6,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,'Pino Daniele','Salsiccia - Broccoli - Provola',7,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,'Il Marchese del Grillo','Porchetta - Provola - Melanzane a funghetti',6.5,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,'Sgarbi','Salsiccia - Rucola - Pepe nero - Limone',7,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,'Clerici','Parmigiana di melanzane',6,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,'La Banda degli Onesti','Pollo - Insalata - Patate fritte',7,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,'Mina e Celenatno','Pomodoro - Tonno - Insalata - Cipolla di tropea',6.5,0,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,'hamburger da 200gr','',2.5,0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,'hamburger di Chianina','',4.5,0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,'hamburger di Scottona','',4,0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,'hamburger di Black Angus','',4,0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,'hamburgher vegani','',2.5,0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,'hamburgher di pollo','',2.5,0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,'Birra Pilsner Urquell','33cl',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,'Birra Grolsch','45cl',6.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,'Birra London Pride','33cl',5.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,'Birra Golden Pride','33cl',6,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,'Birra India Pale Ale','33cl',6.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,'Birra Stefanus','75cl',23,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,'Birra London Porter','50cl',9,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,'Caffè','',1,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,'Acqua 12','',1,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,'Acqua grande','',2,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,'Coca Cola','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,'Coca Cola Zero','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,'Fanta & Sprite','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,'Succo di frutta','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,'Schweppes','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,'Tassoni','',3,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,'Cocktail San Pellegrino','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(103,'Red Bull','',3,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,'The Estathe Limone','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(105,'The Estate Pesca','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(106,'Crodino','',2,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,'Crodino Twist','',2,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,'Spritz','',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,'Corona','',3,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,'Tennens','',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,'Guinnes','',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(112,'Ichnusa','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,'Amari','',3,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,'Whisky','',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,'Vodka','',4,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,'Rum','',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,'Tequila','',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,'Absenta','',3.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,'Analcolico','',4,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,'Cocktail','',5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,'Shottini','',2.5,0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(500) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notes_orders1_idx` (`order_id`),
  CONSTRAINT `fk_notes_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'dfgh',1,'2017-06-26 20:45:11','2017-06-26 20:45:11');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(255) NOT NULL,
  `message` varchar(500) NOT NULL,
  `state` varchar(45) NOT NULL DEFAULT 'new | update | delete | change',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notes_orders1_idx` (`order_id`),
  CONSTRAINT `fk_notes_orders10` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Tavolo 1, numero di coperti 2','Ordinazione: stato modificato','change',0,1,'2017-06-26 20:45:11','2017-06-26 20:45:57'),(2,'Tavolo 2, numero di coperti 2','Ordinazione: stato piatto cambiato','change',1,2,'2017-06-26 20:56:23','2017-06-26 20:56:36');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `client` varchar(200) NOT NULL,
  `covered` int(11) NOT NULL DEFAULT '0',
  `totalorder` double NOT NULL,
  `totalservice` double NOT NULL,
  `state_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_state1_idx` (`state_id`),
  CONSTRAINT `fk_orders_state1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017-06-26 22:52:00','Tavolo 1, numero di coperti 2',0,65.5,6.55,1,'2017-06-26 20:45:11','2017-06-26 20:52:54'),(2,'2017-06-26 22:06:00','Tavolo 2, numero di coperti 2',2,35,3.5,1,'2017-06-26 20:56:23','2017-06-26 20:56:23');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `special` varchar(45) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state_id` int(11) NOT NULL,
  `statename` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_specials_orders1_idx` (`order_id`),
  KEY `fk_specials_state1_idx` (`state_id`),
  CONSTRAINT `fk_specials_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_specials_state1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
INSERT INTO `specials` VALUES (1,'dfh',4,'vfnh',1,'2017-06-26 20:45:11','2017-06-26 20:45:11',1,'pending');
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'pending','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'completed','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'admin',
  `api_token` varchar(60) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_token_UNIQUE` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','admin','admin','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxf',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'manager@easycomande.it','$2y$10$cJ9T9QZaf9qmX3ktGiVyT./xL1XiGQruNUcIPE/3el21MzXnaiZ/y','manager','manager','Pwbo7CmLtqAP5TvIHYFZPqkmetJFTi9UZIfxE1GLeBFFJgzZ8DvhdTEiGFxg',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-26 23:28:04
