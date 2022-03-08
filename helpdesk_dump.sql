-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: helpdesk
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `baza`
--

DROP TABLE IF EXISTS `baza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `naziv` (`naziv`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baza`
--

LOCK TABLES `baza` WRITE;
/*!40000 ALTER TABLE `baza` DISABLE KEYS */;
INSERT INTO `baza` VALUES (1,'SVE',1),(2,'HRVATSKA',1),(3,'SRBIJA',1);
/*!40000 ALTER TABLE `baza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_uploads`
--

DROP TABLE IF EXISTS `data_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_uploads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `komentar_id` int DEFAULT NULL,
  `naziv` varchar(64) NOT NULL,
  `original_naziv` varchar(64) DEFAULT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `komentar_id` (`komentar_id`),
  CONSTRAINT `data_uploads_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `data_uploads_ibfk_2` FOREIGN KEY (`komentar_id`) REFERENCES `komentar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_uploads`
--

LOCK TABLES `data_uploads` WRITE;
/*!40000 ALTER TABLE `data_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djelatnik`
--

DROP TABLE IF EXISTS `djelatnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `djelatnik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `zahtjev_id` int NOT NULL,
  `baza_id` int NOT NULL,
  `tvrtka_id` int NOT NULL,
  `ime` varchar(40) NOT NULL,
  `prezime` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_grupa` varchar(100) DEFAULT NULL,
  `radno_mjesto` varchar(100) DEFAULT NULL,
  `lokacija` varchar(200) NOT NULL,
  `diglas` varchar(100) DEFAULT NULL,
  `server` varchar(100) DEFAULT NULL,
  `sophos` varchar(100) DEFAULT NULL,
  `web_shop` varchar(100) DEFAULT NULL,
  `web_maticna` varchar(200) DEFAULT NULL,
  `pocetak_rada` datetime DEFAULT NULL,
  `kreiran` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zahtjev_id` (`zahtjev_id`),
  KEY `baza_id` (`baza_id`),
  KEY `tvrtka_id` (`tvrtka_id`),
  CONSTRAINT `djelatnik_ibfk_1` FOREIGN KEY (`zahtjev_id`) REFERENCES `zahtjev_djelatnik` (`id`),
  CONSTRAINT `djelatnik_ibfk_2` FOREIGN KEY (`baza_id`) REFERENCES `baza` (`id`),
  CONSTRAINT `djelatnik_ibfk_3` FOREIGN KEY (`tvrtka_id`) REFERENCES `tvrtka` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djelatnik`
--

LOCK TABLES `djelatnik` WRITE;
/*!40000 ALTER TABLE `djelatnik` DISABLE KEYS */;
/*!40000 ALTER TABLE `djelatnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupa_korisnika`
--

DROP TABLE IF EXISTS `grupa_korisnika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupa_korisnika` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `podrska` tinyint(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `slika` varchar(20) DEFAULT NULL,
  `aktivan` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa_korisnika`
--

LOCK TABLES `grupa_korisnika` WRITE;
/*!40000 ALTER TABLE `grupa_korisnika` DISABLE KEYS */;
INSERT INTO `grupa_korisnika` VALUES (1,'Korisnik',0,NULL,'default.png',1),(2,'Administrator',1,NULL,'default.png',1),(3,'Programska podrška',1,'programska.podrska@ciak.hr','default.png',1),(4,'Sistemska podrška',1,'sistemska.podrska@ciak.hr','default.png',1),(5,'Web podrška',1,'webshop@ciak.hr','default.png',1);
/*!40000 ALTER TABLE `grupa_korisnika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komentar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sadrzaj` text NOT NULL,
  `kreirao_id` int NOT NULL,
  `ticket_id` int DEFAULT NULL,
  `zahtjev_id` int DEFAULT NULL,
  `datum_kreirao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kreirao_id` (`kreirao_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `zahtjev_id` (`zahtjev_id`),
  CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`kreirao_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `komentar_ibfk_3` FOREIGN KEY (`zahtjev_id`) REFERENCES `zahtjev_djelatnik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(40) NOT NULL,
  `prezime` varchar(40) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `korisnicko_ime` varchar(40) NOT NULL,
  `lozinka` varchar(200) NOT NULL,
  `grupa_id` int NOT NULL,
  `datum_kreirao` datetime NOT NULL,
  `mobitel` varchar(20) DEFAULT NULL,
  `vpn` varchar(10) DEFAULT NULL,
  `nadredeni` tinyint(1) NOT NULL,
  `odobravatelj` tinyint(1) NOT NULL,
  `dashboard` tinyint(1) DEFAULT NULL,
  `aktivan` tinyint(1) NOT NULL,
  `zadnja_prijava` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`),
  KEY `grupa_id` (`grupa_id`),
  CONSTRAINT `korisnik_ibfk_1` FOREIGN KEY (`grupa_id`) REFERENCES `grupa_korisnika` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'Antonio','Kulić','antonio.kulic@ciak.hr','akulic','gAAAAABhub-f5bamw2gpC5hNzr0vUF6d7MrfmqjqpuRicPqKu8jo7AiAHxGEDR6QTYeqyW3X2H5POa1KTQFi4S8fTOAt7LQ2vA==',2,'2022-03-07 11:54:07',NULL,NULL,0,0,NULL,1,NULL);
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obavijest`
--

DROP TABLE IF EXISTS `obavijest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obavijest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tekst` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obavijest`
--

LOCK TABLES `obavijest` WRITE;
/*!40000 ALTER TABLE `obavijest` DISABLE KEYS */;
INSERT INTO `obavijest` VALUES (1,'kreira novi ticket','/helpdesk/tiket/'),(2,'odgovara na ticket','/helpdesk/tiket/'),(3,'zatvara ticket','/helpdesk/tiket/'),(4,'kreira zahtjev za otvaranje novog djelatnika','/helpdesk/zahtjev_djelatnik/'),(5,'zatvara zahtjev za otvaranje novog djelatnika','/helpdesk/zahtjev_djelatnik/'),(6,'reaktivira zatvoreni ticket','/helpdesk/tiket/'),(7,'odobrava ticket','/helpdesk/tiket/'),(8,'poništava ticket','/helpdesk/tiket/');
/*!40000 ALTER TABLE `obavijest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obavijest_korisnik`
--

DROP TABLE IF EXISTS `obavijest_korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obavijest_korisnik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `obavijest_id` int NOT NULL,
  `kreirao_id` int NOT NULL,
  `zaduzen_id` int NOT NULL,
  `ticket_id` int DEFAULT NULL,
  `zahtjev_id` int DEFAULT NULL,
  `pregledan` tinyint(1) NOT NULL,
  `otvoren` tinyint(1) NOT NULL,
  `kreiran` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `obavijest_id` (`obavijest_id`),
  KEY `kreirao_id` (`kreirao_id`),
  KEY `zaduzen_id` (`zaduzen_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `zahtjev_id` (`zahtjev_id`),
  CONSTRAINT `obavijest_korisnik_ibfk_1` FOREIGN KEY (`obavijest_id`) REFERENCES `obavijest` (`id`),
  CONSTRAINT `obavijest_korisnik_ibfk_2` FOREIGN KEY (`kreirao_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `obavijest_korisnik_ibfk_3` FOREIGN KEY (`zaduzen_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `obavijest_korisnik_ibfk_4` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `obavijest_korisnik_ibfk_5` FOREIGN KEY (`zahtjev_id`) REFERENCES `zahtjev_djelatnik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obavijest_korisnik`
--

LOCK TABLES `obavijest_korisnik` WRITE;
/*!40000 ALTER TABLE `obavijest_korisnik` DISABLE KEYS */;
/*!40000 ALTER TABLE `obavijest_korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oprema`
--

DROP TABLE IF EXISTS `oprema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oprema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vrsta_opreme_id` int DEFAULT NULL,
  `proizvodac` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `serijski_br` varchar(100) DEFAULT NULL,
  `inventarni_br` varchar(100) DEFAULT NULL,
  `dobavljac` varchar(100) DEFAULT NULL,
  `br_racuna` varchar(100) DEFAULT NULL,
  `br_leasing` varchar(100) DEFAULT NULL,
  `datum_kupnje` datetime DEFAULT NULL,
  `datum_neaktivno` datetime DEFAULT NULL,
  `opis` text,
  `dostupno` tinyint(1) NOT NULL,
  `otpisano` tinyint(1) NOT NULL,
  `leasing` tinyint(1) NOT NULL,
  `korisnik_unosa` int DEFAULT NULL,
  `datum_unosa` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serijski_br` (`serijski_br`),
  UNIQUE KEY `inventarni_br` (`inventarni_br`),
  KEY `vrsta_opreme_id` (`vrsta_opreme_id`),
  KEY `korisnik_unosa` (`korisnik_unosa`),
  CONSTRAINT `oprema_ibfk_1` FOREIGN KEY (`vrsta_opreme_id`) REFERENCES `vrsta_opreme` (`id`),
  CONSTRAINT `oprema_ibfk_2` FOREIGN KEY (`korisnik_unosa`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema`
--

LOCK TABLES `oprema` WRITE;
/*!40000 ALTER TABLE `oprema` DISABLE KEYS */;
/*!40000 ALTER TABLE `oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oprema_servis`
--

DROP TABLE IF EXISTS `oprema_servis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oprema_servis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oprema_id` int DEFAULT NULL,
  `radni_nalog` varchar(100) DEFAULT NULL,
  `naziv_firme` varchar(100) DEFAULT NULL,
  `vanjska_firma` tinyint(1) NOT NULL,
  `trosak` float DEFAULT NULL,
  `datum_pocetak` datetime DEFAULT NULL,
  `datum_zavrsetak` datetime DEFAULT NULL,
  `naslov` varchar(100) DEFAULT NULL,
  `opis` text NOT NULL,
  `korisnik_unosa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oprema_id` (`oprema_id`),
  KEY `korisnik_unosa` (`korisnik_unosa`),
  CONSTRAINT `oprema_servis_ibfk_1` FOREIGN KEY (`oprema_id`) REFERENCES `oprema` (`id`),
  CONSTRAINT `oprema_servis_ibfk_2` FOREIGN KEY (`korisnik_unosa`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oprema_servis`
--

LOCK TABLES `oprema_servis` WRITE;
/*!40000 ALTER TABLE `oprema_servis` DISABLE KEYS */;
/*!40000 ALTER TABLE `oprema_servis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `podvrsta_zadatka`
--

DROP TABLE IF EXISTS `podvrsta_zadatka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `podvrsta_zadatka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vrsta_zadatka_id` int NOT NULL,
  `naziv` varchar(150) NOT NULL,
  `opis` varchar(300) DEFAULT NULL,
  `aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `naziv` (`naziv`),
  KEY `vrsta_zadatka_id` (`vrsta_zadatka_id`),
  CONSTRAINT `podvrsta_zadatka_ibfk_1` FOREIGN KEY (`vrsta_zadatka_id`) REFERENCES `vrsta_zadatka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `podvrsta_zadatka`
--

LOCK TABLES `podvrsta_zadatka` WRITE;
/*!40000 ALTER TABLE `podvrsta_zadatka` DISABLE KEYS */;
INSERT INTO `podvrsta_zadatka` VALUES (1,35,'WINDOWS','WMS aplikacija',1),(2,35,'ANDROID','WMS aplikacija',1),(3,36,'TERMINAL','WMS uređaj',1),(4,36,'PUNJAČ BATERIJA','WMS uređaj',1),(5,36,'PUNJAČ TERMINALA','WMS uređaj',1),(6,36,'PRINTER','WMS uređaj',1),(7,36,'ACCESS POINT','WMS uređaj',1),(8,36,'WIFI','WMS uređaj',1),(9,43,'POS','SP Greska Print',1),(10,43,'A4','SP Greska Print',1),(11,45,'PROBLEM SA SLANJEM','SP Greska Mail',1),(12,45,'PROBLEM SA PRIMANJEM','SP Greska Mail',1),(13,45,'ZABORAVLJENA LOZINKA','SP Greska Mail',1),(14,45,'PROBLEM SA APLIKACIJOM','SP Greska Mail',1),(15,45,'NIŠTA NE RADI','SP Greska Mail',1);
/*!40000 ALTER TABLE `podvrsta_zadatka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poslovna_jedinica`
--

DROP TABLE IF EXISTS `poslovna_jedinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poslovna_jedinica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sifra` varchar(10) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `tvrtka_id` int NOT NULL,
  `aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tvrtka_id` (`tvrtka_id`),
  CONSTRAINT `poslovna_jedinica_ibfk_1` FOREIGN KEY (`tvrtka_id`) REFERENCES `tvrtka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poslovna_jedinica`
--

LOCK TABLES `poslovna_jedinica` WRITE;
/*!40000 ALTER TABLE `poslovna_jedinica` DISABLE KEYS */;
INSERT INTO `poslovna_jedinica` VALUES (1,'000','SVE POSLOVNICE',7,1),(2,'901','UPRAVA I ZAJEDNIČKI TROŠKOVI ',7,1),(3,'902','ODELJENJE IT-A',7,1),(4,'903','ODELJENJE LOGISTIKA',7,1),(5,'930','ODELJENJE RAČUNOVODSTVA',7,1),(6,'931','ODELJENJE NABAVE',7,1),(7,'9311','TROŠKOVI NABAVE',7,1),(8,'932','CENTRI MALOPRODAJE I SERVISA',7,1),(9,'93202','P02 APATIN MALOPRODAJA',7,1),(10,'93203','P03 SOMBOR MALOPRODAJA',7,1),(11,'93204','P04 ODŽACI MALOPRODAJA',7,1),(12,'93205','P05 VETERNIK MALOPRODAJA',7,1),(13,'93206','P06 NIŠ MALOPRODAJA',7,1),(14,'93207','P07 JAGODINA MALOPRODAJA',7,1),(15,'93208','P08 ČUKARICA MALOPRODAJA',7,1),(16,'93209','P09 VALJEVO MALOPRODAJA',7,1),(17,'93210','P10 LESKOVAC MALOPRODAJA',7,1),(18,'93211','P11 ZEMUN MALOPRODAJA',7,1),(19,'93212','P12 ČUKARICA HUB',7,1),(20,'93213','P13 KRAGUJEVAC MALOPRODAJA',7,1),(21,'933','VELEPRODAJA I KOMERCIJALA ',7,1),(22,'9330','KOMERCIJALA I KOM. PODRŠKA',7,1),(23,'9331','P01 VELEPRODAJA STARA PAZOVA',7,1),(24,'000','SVE POSLOVNICE',3,1),(25,'930','OPĆI I ADMINISTRATIVNI POSLOVI ',3,1),(26,'000','SVE POSLOVNICE',4,1),(27,'400','UPRAVA I ZAJEDNIČKI TROŠKOVI',4,1),(28,'421','PROIZVODNJA TEKUĆINA ZA STAKLA',4,1),(29,'432','TRGOVINA-ULJA',4,1),(30,'000','SVE POSLOVNICE',5,1),(31,'93','TRGOVINA',5,1),(32,'930','OPĆI I ADMINISTRATIVNI TROŠKOVI',5,1),(33,'9321','P01 SUSTJEPAN MALOPRODAJA',5,1),(34,'9322','P02 GRUŽ MALOPRODAJA',5,1),(35,'9323','P03 GRUDA MALOPRODAJA',5,1),(36,'9324','P04 ŽUPA MALOPRODAJA',5,1),(37,'9325','P05 KORČULA MALOPRODAJA',5,1),(38,'000','SVE POSLOVNICE',6,1),(39,'1000','PROMOTEHNA',6,1),(40,'1001','AUTO SHOP',6,1),(41,'1002','GAS',6,1),(42,'90','UPRAVA I IT',6,1),(43,'901','UPRAVA I ZAJEDNIČKI TROŠKOVI',6,1),(44,'902','IT',6,1),(45,'903','OSIJEK-J.J. STROSSMAYERA 74 S-B',6,1),(46,'93','TRGOVINA',6,1),(47,'930','OPĆI I ADMINISTRATIVNI TROŠKOVI',6,1),(48,'931','ODJEL NABAVE',6,1),(49,'9311','TROŠKOVI NABAVE',6,1),(50,'932','CENTRI MALOPRODAJE I SERVISA',6,1),(51,'93202','P02 DARUVAR MALOPRODAJA',6,1),(52,'93203','P03 OSIJEK MALOPRODAJA I SERVIS',6,1),(53,'93204','P04 SLAVONSKI BROD MALOPRODAJA',6,1),(54,'93205','P05 RIJEKA MALOPRODAJA I SERVIS',6,1),(55,'93206','P06 VELIKA GORICA MALOPRODAJA',6,1),(56,'93207','P07 ŽUPANJA MALOPRODAJA',6,1),(57,'93208','P08 ZAGREB BAŠTIJANOVA MP',6,1),(58,'93209','P09 SPLIT MALOPRODAJA',6,1),(59,'93210','P10 SISAK MALOPRODAJA',6,1),(60,'93211','P11 PODSTRANA  MALOPRODAJA',6,1),(61,'93212','P12 DUGO SELO MALOPRODAJA',6,1),(62,'93213','P13 ZABOK MALOPRODAJA',6,1),(63,'93214','P14 POŽEGA MALOPRODAJA',6,1),(64,'93215','P15 SLAVONSKI BROD2  MALOPRODAJA',6,1),(65,'93216','P16 OSIJEK MALOPRODAJA',6,1),(66,'93217','P17 GRUDA MALOPRODAJA',6,1),(67,'93218','P18 SAMOBOR 2 MALOPRODAJA',6,1),(68,'93219','P19 VRBOVEC MALOPRODAJA',6,1),(69,'93220','P20 BJELOVAR MALOPRODAJA',6,1),(70,'93221','P21AUTO SPAS BJELOVAR 2 MP',6,1),(71,'93222','P22 ČAZMA MP',6,1),(72,'93223','P23  GAREŠNICA MP',6,1),(73,'93224','P24 GRUBIŠNO POLJE MP.SERVIS',6,1),(74,'93225','P25 ZAGREB-ISTOK MALOPRODAJA',6,1),(75,'93226','P26 RIJEKA 2 MALOPRODAJA',6,1),(76,'93227','P27 KARLOVAC MALOPRODAJA',6,1),(77,'93228','P28 METKOVIĆ MALOPRODAJA',6,1),(78,'93229','P29 VARAŽDIN MALOPRODAJA',6,1),(79,'93230','P30 GOSPIĆ MALOPRODAJA',6,1),(80,'93231','P31 SPLIT MALOPRODAJA',6,1),(81,'93232','P32 ZADAR MALOPRODAJA',6,1),(82,'93233','P33 SAMOBOR MALOPRODAJA',6,1),(83,'93234','P34 ČAKOVEC MALOPRODAJA',6,1),(84,'93235','P35 DUBROVNIK MALOPRODAJA',6,1),(85,'93236','P36 PULA MALOPRODAJA',6,1),(86,'93237','P37 JASTREBARSKO MALOPRODAJA',6,1),(87,'93238','P38 SLAVONSKI BROD 3 MALOPRODAJA',6,1),(88,'93241','P41 MAKARSKA MALOPRODAJA',6,1),(89,'93243','P43 ŽUPANJA2 MALOPRODAJA',6,1),(90,'93244','P44 VUKOVAR MALOPRODAJA',6,1),(91,'93246','P46 ZAPREŠIĆ MALOPRODAJA',6,1),(92,'93247','P47 KNIN MALOPRODAJA',6,1),(93,'93248','P48 OTOČAC MALOPRODAJA',6,1),(94,'93249','P49 ŠIBENIK MALOPRODAJA',6,1),(95,'93250','P50 TROGIR MALOPRODAJA',6,1),(96,'93251','P51 NOVI ZAGREB MALOPRODAJA',6,1),(97,'93252','P52 SLATINA MALOPRODAJA',6,1),(98,'93253','P53 VIROVITICA MALOPRODAJA',6,1),(99,'93254','P54 NAŠICE MALOPRODAJA',6,1),(100,'93255','P55 DONJI MIHOLJAC MALOPRODAJA',6,1),(101,'93256','P56 VINKOVCI MALOPRODAJA',6,1),(102,'93257','P57 VUKOVAR 2  MALOPRODAJA',6,1),(103,'93258','P58 ĐAKOVO MALOPRODAJA',6,1),(104,'93259','P59 VALPOVO MALOPRODAJA',6,1),(105,'93260','P60 OSIJEK DRINSKA MALOPRODAJA',6,1),(106,'93261','P61 KAŠTEL STARI MALOPRODAJA',6,1),(107,'93262','P62 OSIJEK JABLANOVA MALOPRODAJA',6,1),(108,'93263','P63 ZAGREB-NOVI ZAGREB',6,1),(109,'93264','P64 KOPRIVNICA',6,1),(110,'93265','P65 RIJEKA - ČAVLE',6,1),(111,'93266','P66 BIOGRAD NA MORU',6,1),(112,'93267','P67 KORČULA-BLATO',6,1),(113,'93268','P68 OGULIN',6,1),(114,'93269','P69 ALATI I OPREMA STAHLGRUBER',6,1),(115,'93290','P90 SAJAM',6,1),(116,'93291','P91 LOGISTIČKI CENTAR VRBOVEC',6,1),(117,'933','VELEPRODAJA I KOMERCIJALA',6,1),(118,'9330','KOMERCIJALA I KOM.PODRŠKA',6,1),(119,'9331','P01 VELEPRODAJA STUPNIK',6,1),(120,'93320','P01 STUPNIK SERVIS',6,1),(121,'93321','P01 ALATI I SERVISNA OPREMA',6,1),(122,'9339','KOMISIONA PRODAJA DANA',6,1),(123,'981','WEB SHOP CIAK',6,1),(124,'982','WEB SHOP B2C',6,1),(125,'000','SVE POSLOVNICE',8,1),(126,'600','UPRAVA OPĆI TROŠKOVI',8,1),(127,'6331','VP SESVETE',8,1),(128,'6332','VP RIJEKA',8,1),(129,'6333','SERVIS SESVETE',8,1),(130,'6339','KOMISIONA PRODAJA DANA',8,1),(131,'000','SVE POSLOVNICE',10,1),(132,'100','UPRAVA I ZAJ.TROŠ.I PRIHODI',10,1),(133,'101','SEKTOR RAČUNOVODSTVA',10,1),(134,'102','SEKTOR RIZNICE',10,1),(135,'103','SEKTOR OBRAČ. PLAĆA-NE KORISTITI',10,1),(136,'104','SEKTOR INFORMATIČKOG SERVISA',10,1),(137,'105','TAJNIŠTVO',10,1),(138,'106','SEKTOR ZAŠT.ZDRAV.I SIG. NA RADU',10,1),(139,'107','KONTROLING',10,1),(140,'108','MARKETING',10,1),(141,'110','P01 VP SAV.OP.-NE KORISTI',10,1),(142,'199','CIAK USLUGE-NE KORISTI',10,1),(143,'000','SVE POSLOVNICE',11,1),(144,'8001','UPRAVA I ZAJEDNIČKI TROŠAK',11,1),(145,'8005','NABAVA',11,1),(146,'8006','OPREMA DANA U NAJAM',11,1),(147,'8102','ŠIBENIK',11,1),(148,'8103','ŠESTINSKI DOL',11,1),(149,'8105','POSLOVNI PROSTOR KOPRIVNICA',11,1),(150,'8106','POSLOVNI PROSTOR SPLIT',11,1),(151,'8107','KOVINSKA - PROMOTEHNA',11,1),(152,'8331','P03 VELEPRODAJA DONJI STUPNIK',11,1),(153,'83310','TRANZIT STUPNIK',11,1),(154,'83313','P13 VELEPRODAJA KARLOVAC',11,1),(155,'83314','P14 VELEPRODAJA KOPRIVNICA',11,1),(156,'8332','P06 VELEPRODAJA SESVETE',11,1),(157,'83320','TRANZIT SESVETE',11,1),(158,'8333','P04 VELEPRODAJA SOLIN',11,1),(159,'8334','P05 VELEPRODAJA VARAŽDIN',11,1),(160,'8335','P07 VELEPRODAJA SLAVONSKI BROD',11,1),(161,'8336','P08 VELEPRODAJA RIJEKA',11,1),(162,'8337','P10 VELEPRODAJA OSIJEK',11,1),(163,'8338','P11 VELEPRODAJA BJELOVAR',11,1),(164,'8339','P12 VELEPRODAJA SISAK',11,1),(165,'881','FEBI BILSTEIN',11,1),(166,'000','SVE POSLOVNICE',9,1),(167,'50','SEGMENT UPRAVA',9,1),(168,'500','OPĆI I ADMINISTRATIVNI TROŠKOVI',9,1),(169,'51','CR SEGMENT RECIKLAŽA',9,1),(170,'510','CR PROIZVODNJA RUJEVAC',9,1),(171,'511','CR PROIZVODNJA VOJNIĆ',9,1),(172,'512','CR PROIZVODNJA ZABOK',9,1),(173,'5120','CR UPRAVA I ADMIN ZABOK',9,1),(174,'5121','CR HIDROSEPARACIJA',9,1),(175,'51211','CR NEUTRALIZACIJA',9,1),(176,'5122','CR TALIONICA',9,1),(177,'5123','CR RAFINACIJA',9,1),(178,'5124','CR PROIZVODNJA ŠLJAKE',9,1),(179,'513','CR MOBILNI MALOOTKUP',9,1),(180,'51301','ZG2317HD TOMISLAV GRGEC',9,1),(181,'51302','ZG1258II BARTOL MARJANOVIĆ',9,1),(182,'51303','ZG2303HD ANTE ČAVIĆ',9,1),(183,'51304','ZG3347HE NIKOLA ŠABALJ',9,1),(184,'51305','ZG9852HU DEJAN ŽEŽELIĆ',9,1),(185,'51306','ZG7390FC IVAN VUKOVIĆ',9,1),(186,'51307','ZG3765HA MARIJO JERKOVIĆ',9,1),(187,'51308','ZG3447GG VEDRAN BRLJAFA',9,1),(188,'51309','ZG3863GG MATEO MARKOVIĆ',9,1),(189,'51310','ZG8961GV ZORAN PIŠKORJANAC ',9,1),(190,'51311','ZG2763IK KARLO STOJAK',9,1),(191,'514','CR OSIJEK SIROVINE',9,1),(192,'515','CR ŠIBENIK SIROVINE',9,1),(193,'52','EKO SEGMENT OTPAD',9,1),(194,'520','EKO RUJEVAC EKOLOGIJA',9,1),(195,'521','EKO VOJNIĆ EKOLOGIJA',9,1),(196,'522','EKO ZABOK EKOLOGIJA',9,1),(197,'5223','EKO CENTAR FREONA',9,1),(198,'523','EKO OSIJEK EKOLOGIJA',9,1),(199,'524','EKO ŠIBENIK EKOLOGIJA',9,1),(200,'525','EKO KOMERCIJALA I KOMER. PODRŠKA',9,1),(201,'526','EKO STRUČNI POSLOVI',9,1),(202,'527','EKO LABORATORIJ ZABOK',9,1),(203,'53','SEGMENT AKUMULATORI I ULJA',9,1),(204,'531','TRGOVINA KRAPINA',9,1),(205,'532','PROIZVODNJA AKUMULATORA KRAPINA',9,1),(206,'533','PROIZVODNJA MAZIVA KRAPINA',9,1),(207,'534','RIJEKA CARINSKO SKLADIŠTE',9,1),(208,'535','ZAGREB TRGOVINA',9,1),(209,'5351','NABAVA',9,1),(210,'5352','KOMERCIJALA I KOMERCIJALNA PODRŠ',9,1),(211,'53531','DANA KOMSIJA INA',9,1),(212,'53532','DANA KOMSIJA PETROL',9,1),(213,'53533','DANA KOMSIJA CRODUX',9,1),(214,'53534','DANA KOMISIJA LUKOIL',9,1),(215,'53535','DANA KOMISIJA TIFON',9,1),(216,'53536','DANA KOMISIJA DIRUS',9,1),(217,'53537','DANA KOMISIJA (MUSTAČ I PSV)',9,1),(218,'536','ZAGREB GUMIPLAST',9,1),(219,'000','SVE POSLOVNICE',12,1),(220,'900','UPRAVA I ZAJEDNIČKI',12,1),(221,'000','SVE POSLOVNICE',13,1),(222,'700','UPRAVA - OPĆI TROŠKOVI',13,1),(223,'731','VELEPRODAJA (KR)',13,1),(224,'732','MALOPRODAJNI CENTRI',13,1),(225,'73201','P01 ZAGREB RIBNJAK',13,1),(226,'73202','P02 DUGO SELO',13,1),(227,'73204','P04 KUTINA',13,1),(228,'73205','P05 ZAPREŠIĆ',13,1),(229,'73206','P06 VARAŽDIN',13,1),(230,'73207','P07 BJELOVAR',13,1),(231,'73208','P08 OSIJEK',13,1),(232,'73212','P12 KORENICA',13,1),(233,'73213','P13 VARAŽDINSKE TOPLICE',13,1),(234,'73214','P14 SAMOBOR',13,1),(235,'73216','P16 ZAGREB SAMOBORSKA',13,1),(236,'73217','P17 DARUVAR',13,1),(237,'73218','P18 VINKOVCI',13,1),(238,'73219','P19 ZLATAR BISTRICA',13,1),(239,'73220','P20 OGULIN',13,1),(240,'73221','P21 KRANJČEVIĆEVA',13,1),(241,'73226','P26 ĐAKOVO',13,1),(242,'73228','P28 NOVSKA',13,1),(243,'73231','P31 BIOGRAD NA MORU',13,1),(244,'73234','P34 ŽUPANJA',13,1),(245,'73235','P35 SPLIT',13,1),(246,'73241','P41 SVETI IVAN ZELINA',13,1),(247,'73242','P42 ZADAR',13,1),(248,'73243','TRGOVAČKA ROBA KRAPINA',13,1),(249,'73244','MALOPRODAJA BR.9-ZAGREB 2',13,1),(250,'73245','MALOPRODAJA BR.23-ZABOK',13,1),(251,'73246','MALOPRODAJA BR.24-KRAPINA',13,1),(252,'73247','MALOPRODAJA BR.25- IVANEC',13,1),(253,'73248','MALOPRODAJA BR.27-DRNIŠ',13,1),(254,'73249','MALOPRODAJA BR.29-OTOČAC',13,1),(255,'73250','MALOPRODAJA BR.32-KNIN',13,1),(256,'73251','MALOPRODAJA BR.33 VELIKA GORICA',13,1),(257,'73252','MALOPRODAJA WEB SHOP',13,1),(258,'73253','MALOPRODAJA BR.37-NOVI VINOD.',13,1),(259,'73254','MALOPRODAJA BR.38-ZADAR',13,1),(260,'73255','MALOPRODAJA BR.39-DONJA STUBICA',13,1),(261,'73256','MALOPRODAJA BR.40-CRIKVENICA',13,1),(262,'73257','P44 ZABOK',13,1),(263,'73258','P45 KAŠTEL STARI',13,1),(264,'73259','P46 NOVI ZAGREB',13,1),(265,'000','SVE POSLOVNICE',14,1),(266,'900','KOVINSKA 4',14,1);
/*!40000 ALTER TABLE `poslovna_jedinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioritet`
--

DROP TABLE IF EXISTS `prioritet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prioritet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) NOT NULL,
  `boja` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioritet`
--

LOCK TABLES `prioritet` WRITE;
/*!40000 ALTER TABLE `prioritet` DISABLE KEYS */;
INSERT INTO `prioritet` VALUES (1,'Niski','#28a745'),(2,'Srednji','#ffc107'),(3,'Visoki','#dc3545');
/*!40000 ALTER TABLE `prioritet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) NOT NULL,
  `boja` varchar(7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Otvoreno','#28a745'),(2,'U obradi','#ffc107'),(3,'Zatvoreno','#dc3545');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naslov` varchar(50) NOT NULL,
  `opis` text NOT NULL,
  `vrsta_id` int NOT NULL,
  `status_id` int NOT NULL,
  `prioritet_id` int NOT NULL,
  `kreirao_id` int NOT NULL,
  `grupa_id` int NOT NULL,
  `baza_id` int NOT NULL,
  `tvrtka_id` int DEFAULT NULL,
  `poslovna_jedinica_id` int DEFAULT NULL,
  `datum_kreirao` datetime NOT NULL,
  `prihvatio_id` int DEFAULT NULL,
  `zatvorio_id` int DEFAULT NULL,
  `datum_zatvoreno` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vrsta_id` (`vrsta_id`),
  KEY `status_id` (`status_id`),
  KEY `prioritet_id` (`prioritet_id`),
  KEY `kreirao_id` (`kreirao_id`),
  KEY `grupa_id` (`grupa_id`),
  KEY `baza_id` (`baza_id`),
  KEY `tvrtka_id` (`tvrtka_id`),
  KEY `poslovna_jedinica_id` (`poslovna_jedinica_id`),
  KEY `prihvatio_id` (`prihvatio_id`),
  KEY `zatvorio_id` (`zatvorio_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`vrsta_id`) REFERENCES `ticket_vrsta` (`id`),
  CONSTRAINT `ticket_ibfk_10` FOREIGN KEY (`zatvorio_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`prioritet_id`) REFERENCES `prioritet` (`id`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`kreirao_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`grupa_id`) REFERENCES `grupa_korisnika` (`id`),
  CONSTRAINT `ticket_ibfk_6` FOREIGN KEY (`baza_id`) REFERENCES `baza` (`id`),
  CONSTRAINT `ticket_ibfk_7` FOREIGN KEY (`tvrtka_id`) REFERENCES `tvrtka` (`id`),
  CONSTRAINT `ticket_ibfk_8` FOREIGN KEY (`poslovna_jedinica_id`) REFERENCES `poslovna_jedinica` (`id`),
  CONSTRAINT `ticket_ibfk_9` FOREIGN KEY (`prihvatio_id`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_ostalo`
--

DROP TABLE IF EXISTS `ticket_ostalo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_ostalo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `microlab_sifra` varchar(50) DEFAULT NULL,
  `razlog` text,
  `nadredeni_id` int DEFAULT NULL,
  `usteda` int DEFAULT NULL,
  `iznos` float DEFAULT NULL,
  `br_ponude` varchar(100) DEFAULT NULL,
  `urudbeni_broj` varchar(100) DEFAULT NULL,
  `korisnik` varchar(100) DEFAULT NULL,
  `radno_mjesto` varchar(100) DEFAULT NULL,
  `lokacija` varchar(100) DEFAULT NULL,
  `sifra_partnera` varchar(10) DEFAULT NULL,
  `maticna_poslovnica` varchar(200) DEFAULT NULL,
  `vrsta_zadatka_id` int DEFAULT NULL,
  `podvrsta_zadatka_id` int DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `provjereno` tinyint(1) DEFAULT NULL,
  `realizacija_dorade` datetime DEFAULT NULL,
  `pregaziti_prava` tinyint(1) DEFAULT NULL,
  `odobrio_nadredeni` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `nadredeni_id` (`nadredeni_id`),
  KEY `vrsta_zadatka_id` (`vrsta_zadatka_id`),
  KEY `podvrsta_zadatka_id` (`podvrsta_zadatka_id`),
  CONSTRAINT `ticket_ostalo_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `ticket_ostalo_ibfk_2` FOREIGN KEY (`nadredeni_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `ticket_ostalo_ibfk_3` FOREIGN KEY (`vrsta_zadatka_id`) REFERENCES `vrsta_zadatka` (`id`),
  CONSTRAINT `ticket_ostalo_ibfk_4` FOREIGN KEY (`podvrsta_zadatka_id`) REFERENCES `podvrsta_zadatka` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_ostalo`
--

LOCK TABLES `ticket_ostalo` WRITE;
/*!40000 ALTER TABLE `ticket_ostalo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_ostalo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_oznaceno`
--

DROP TABLE IF EXISTS `ticket_oznaceno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_oznaceno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `korisnik_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `oznaceno` tinyint(1) DEFAULT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `korisnik_id` (`korisnik_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `ticket_oznaceno_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `ticket_oznaceno_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_oznaceno`
--

LOCK TABLES `ticket_oznaceno` WRITE;
/*!40000 ALTER TABLE `ticket_oznaceno` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_oznaceno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_vrsta`
--

DROP TABLE IF EXISTS `ticket_vrsta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_vrsta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grupa_id` int NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `opis` varchar(200) DEFAULT NULL,
  `aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grupa_id` (`grupa_id`),
  CONSTRAINT `ticket_vrsta_ibfk_1` FOREIGN KEY (`grupa_id`) REFERENCES `grupa_korisnika` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_vrsta`
--

LOCK TABLES `ticket_vrsta` WRITE;
/*!40000 ALTER TABLE `ticket_vrsta` DISABLE KEYS */;
INSERT INTO `ticket_vrsta` VALUES (1,3,'Prijava greške',NULL,1),(2,3,'Dorada Diglas',NULL,1),(3,3,'Dodjela prava',NULL,1),(4,4,'Prijava greške',NULL,1),(5,4,'Nabava opreme',NULL,1),(6,4,'Otvaranje mail / grupe',NULL,1),(7,5,'Web-shop korisnik',NULL,1),(8,5,'WMS',NULL,1),(9,5,'Produkti web',NULL,1);
/*!40000 ALTER TABLE `ticket_vrsta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvrtka`
--

DROP TABLE IF EXISTS `tvrtka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvrtka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `baza_id` int NOT NULL,
  `aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `naziv` (`naziv`),
  KEY `baza_id` (`baza_id`),
  CONSTRAINT `tvrtka_ibfk_1` FOREIGN KEY (`baza_id`) REFERENCES `baza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvrtka`
--

LOCK TABLES `tvrtka` WRITE;
/*!40000 ALTER TABLE `tvrtka` DISABLE KEYS */;
INSERT INTO `tvrtka` VALUES (1,'SVE - HRVATSKA',2,1),(2,'SVE - SRBIJA',3,1),(3,'AD ADRIA D.O.O.',2,1),(4,'ADRIATIK ULJA D.O.O.',2,1),(5,'AUTO DIJELOVI D.O.O.',2,1),(6,'C.I.A.K. AUTO D.O.O.',2,1),(7,'C.I.A.K. AUTO D.O.O. NOVI SAD',3,1),(8,'C.I.A.K. TRADE D.O.O.',2,1),(9,'C.I.A.K. D.O.O.',2,1),(10,'CIAK GRUPA D.D.',2,1),(11,'CIAK TRUCK D.O.O.',2,1),(12,'TM-AUTO D.O.O.',2,1),(13,'TOP START D.O.O.',2,1),(14,'TRGOMETAL D.O.O.',2,1);
/*!40000 ALTER TABLE `tvrtka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrsta_opreme`
--

DROP TABLE IF EXISTS `vrsta_opreme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vrsta_opreme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `opis` text,
  `unique_oprema` tinyint(1) DEFAULT NULL,
  `aktivan` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `naziv` (`naziv`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrsta_opreme`
--

LOCK TABLES `vrsta_opreme` WRITE;
/*!40000 ALTER TABLE `vrsta_opreme` DISABLE KEYS */;
INSERT INTO `vrsta_opreme` VALUES (1,'Računalo',NULL,1,1),(2,'Prijenosno računalo',NULL,1,1),(3,'Monitor',NULL,1,1),(4,'Printer/skener',NULL,1,1),(5,'Samo printer',NULL,1,1),(6,'POS printer',NULL,1,1),(7,'Barkod čitač',NULL,1,1),(8,'Miš',NULL,0,1),(9,'Torba za laptop',NULL,0,1),(10,'Tipkovnica',NULL,0,1);
/*!40000 ALTER TABLE `vrsta_opreme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrsta_zadatka`
--

DROP TABLE IF EXISTS `vrsta_zadatka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vrsta_zadatka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_vrsta_id` int NOT NULL,
  `naziv` varchar(150) NOT NULL,
  `opis` varchar(300) DEFAULT NULL,
  `aktivan` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `_unq_vrsta_id_naziv` (`ticket_vrsta_id`,`naziv`),
  CONSTRAINT `vrsta_zadatka_ibfk_1` FOREIGN KEY (`ticket_vrsta_id`) REFERENCES `ticket_vrsta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrsta_zadatka`
--

LOCK TABLES `vrsta_zadatka` WRITE;
/*!40000 ALTER TABLE `vrsta_zadatka` DISABLE KEYS */;
INSERT INTO `vrsta_zadatka` VALUES (1,1,'BI',NULL,1),(2,1,'CRM',NULL,1),(3,1,'EKOLOGIJA',NULL,1),(4,1,'FINANCIJE/RAČUNOVODSTVO',NULL,1),(5,1,'KONTROLING',NULL,1),(6,1,'MALOPRODAJA',NULL,1),(7,1,'NABAVA',NULL,1),(8,1,'OSNOVNA SREDSTVA',NULL,1),(9,1,'PLAĆE',NULL,1),(10,1,'PRODAJA',NULL,1),(11,1,'PROIZVODNJA',NULL,1),(12,1,'SERVIS',NULL,1),(13,1,'SKLADIŠTE',NULL,1),(14,1,'URUDŽBENI',NULL,1),(15,1,'VOZNI PARK',NULL,1),(16,1,'WMS',NULL,1),(17,1,'ZAJEDNIČKI PODACI',NULL,1),(18,2,'BI',NULL,1),(19,2,'CRM',NULL,1),(20,2,'EKOLOGIJA',NULL,1),(21,2,'FINANCIJE/RAČUNOVODSTVO',NULL,1),(22,2,'KONTROLING',NULL,1),(23,2,'MALOPRODAJA',NULL,1),(24,2,'NABAVA',NULL,1),(25,2,'OSNOVNA SREDSTVA',NULL,1),(26,2,'PLAĆE',NULL,1),(27,2,'PRODAJA',NULL,1),(28,2,'PROIZVODNJA',NULL,1),(29,2,'SERVIS',NULL,1),(30,2,'SKLADIŠTE',NULL,1),(31,2,'URUDŽBENI',NULL,1),(32,2,'VOZNI PARK',NULL,1),(33,2,'WMS',NULL,1),(34,2,'ZAJEDNIČKI PODACI',NULL,1),(35,8,'APLIKACIJA',NULL,1),(36,8,'UREĐAJ',NULL,1),(37,7,'NOVI KORISNIK',NULL,1),(38,7,'PROMJENA MATIČNE',NULL,1),(39,7,'PROMJENA LOZINKE',NULL,1),(40,7,'DEAKTIVACIJA',NULL,1),(41,7,'PROMJENA PARTNERA',NULL,1),(42,7,'DODATNE MOGUĆNOSTI',NULL,1),(43,4,'PRINTANJE / SKRENIRANJE',NULL,1),(44,4,'RAČUNALO/LAPTOP/MONITOR',NULL,1),(45,4,'MAIL',NULL,1),(46,4,'PROBLEM SA SERVEROM,INTERNETOM,TELEFONOM',NULL,1),(47,4,'OSTALO',NULL,1),(48,6,'EMAIL',NULL,1),(49,6,'EMAIL GRUPA',NULL,1);
/*!40000 ALTER TABLE `vrsta_zadatka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaduzena_oprema`
--

DROP TABLE IF EXISTS `zaduzena_oprema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaduzena_oprema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `djelatnik_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `vrsta_opreme_id` int NOT NULL,
  `oprema_id` int DEFAULT NULL,
  `kolicina` int DEFAULT NULL,
  `isporuceno` tinyint(1) DEFAULT NULL,
  `datum_zaduzi` datetime NOT NULL,
  `datum_razduzi` datetime DEFAULT NULL,
  `korisnik_izmjene` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `djelatnik_id` (`djelatnik_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `vrsta_opreme_id` (`vrsta_opreme_id`),
  KEY `oprema_id` (`oprema_id`),
  CONSTRAINT `zaduzena_oprema_ibfk_1` FOREIGN KEY (`djelatnik_id`) REFERENCES `djelatnik` (`id`),
  CONSTRAINT `zaduzena_oprema_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `zaduzena_oprema_ibfk_3` FOREIGN KEY (`vrsta_opreme_id`) REFERENCES `vrsta_opreme` (`id`),
  CONSTRAINT `zaduzena_oprema_ibfk_4` FOREIGN KEY (`oprema_id`) REFERENCES `oprema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaduzena_oprema`
--

LOCK TABLES `zaduzena_oprema` WRITE;
/*!40000 ALTER TABLE `zaduzena_oprema` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaduzena_oprema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaduzena_oprema_arh`
--

DROP TABLE IF EXISTS `zaduzena_oprema_arh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaduzena_oprema_arh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `djelatnik_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `oprema_id` int DEFAULT NULL,
  `korisnik` varchar(100) DEFAULT NULL,
  `kolicina` int DEFAULT NULL,
  `isporuceno` tinyint(1) DEFAULT NULL,
  `datum_zaduzi` datetime NOT NULL,
  `datum_razduzi` datetime DEFAULT NULL,
  `korisnik_unosa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `djelatnik_id` (`djelatnik_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `oprema_id` (`oprema_id`),
  CONSTRAINT `zaduzena_oprema_arh_ibfk_1` FOREIGN KEY (`djelatnik_id`) REFERENCES `djelatnik` (`id`),
  CONSTRAINT `zaduzena_oprema_arh_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `zaduzena_oprema_arh_ibfk_3` FOREIGN KEY (`oprema_id`) REFERENCES `oprema` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaduzena_oprema_arh`
--

LOCK TABLES `zaduzena_oprema_arh` WRITE;
/*!40000 ALTER TABLE `zaduzena_oprema_arh` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaduzena_oprema_arh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtjev_djelatnik`
--

DROP TABLE IF EXISTS `zahtjev_djelatnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtjev_djelatnik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_id` int NOT NULL,
  `prioritet_id` int NOT NULL,
  `kreirao_id` int NOT NULL,
  `email` tinyint(1) NOT NULL,
  `diglas` tinyint(1) NOT NULL,
  `server` tinyint(1) NOT NULL,
  `sophos` tinyint(1) NOT NULL,
  `web_shop` tinyint(1) NOT NULL,
  `nadredeni_id` int NOT NULL,
  `odobrio_nadredeni` tinyint(1) DEFAULT NULL,
  `odobravatelj_id` int DEFAULT NULL,
  `odobren` tinyint(1) DEFAULT NULL,
  `opis` text,
  `datum_kreirao` datetime NOT NULL,
  `datum_zatvorio` datetime DEFAULT NULL,
  `ponisten` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `prioritet_id` (`prioritet_id`),
  KEY `kreirao_id` (`kreirao_id`),
  KEY `nadredeni_id` (`nadredeni_id`),
  KEY `odobravatelj_id` (`odobravatelj_id`),
  CONSTRAINT `zahtjev_djelatnik_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `zahtjev_djelatnik_ibfk_2` FOREIGN KEY (`prioritet_id`) REFERENCES `prioritet` (`id`),
  CONSTRAINT `zahtjev_djelatnik_ibfk_3` FOREIGN KEY (`kreirao_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `zahtjev_djelatnik_ibfk_4` FOREIGN KEY (`nadredeni_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `zahtjev_djelatnik_ibfk_5` FOREIGN KEY (`odobravatelj_id`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtjev_djelatnik`
--

LOCK TABLES `zahtjev_djelatnik` WRITE;
/*!40000 ALTER TABLE `zahtjev_djelatnik` DISABLE KEYS */;
/*!40000 ALTER TABLE `zahtjev_djelatnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtjev_zaduzen`
--

DROP TABLE IF EXISTS `zahtjev_zaduzen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtjev_zaduzen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `podrska_id` int NOT NULL,
  `zahtjev_id` int NOT NULL,
  `datum_kreirao` datetime NOT NULL,
  `prihvatio_id` int DEFAULT NULL,
  `datum_prihvatio` datetime DEFAULT NULL,
  `zatvorio_id` int DEFAULT NULL,
  `datum_zatvorio` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `podrska_id` (`podrska_id`),
  KEY `zahtjev_id` (`zahtjev_id`),
  KEY `prihvatio_id` (`prihvatio_id`),
  KEY `zatvorio_id` (`zatvorio_id`),
  CONSTRAINT `zahtjev_zaduzen_ibfk_1` FOREIGN KEY (`podrska_id`) REFERENCES `grupa_korisnika` (`id`),
  CONSTRAINT `zahtjev_zaduzen_ibfk_2` FOREIGN KEY (`zahtjev_id`) REFERENCES `zahtjev_djelatnik` (`id`),
  CONSTRAINT `zahtjev_zaduzen_ibfk_3` FOREIGN KEY (`prihvatio_id`) REFERENCES `korisnik` (`id`),
  CONSTRAINT `zahtjev_zaduzen_ibfk_4` FOREIGN KEY (`zatvorio_id`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtjev_zaduzen`
--

LOCK TABLES `zahtjev_zaduzen` WRITE;
/*!40000 ALTER TABLE `zahtjev_zaduzen` DISABLE KEYS */;
/*!40000 ALTER TABLE `zahtjev_zaduzen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-07 11:56:10
