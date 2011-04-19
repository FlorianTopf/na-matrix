-- MySQL dump 10.13  Distrib 5.1.49, for portbld-freebsd7.2 (amd64)
--
-- Host: localhost    Database: europlanet_na1
-- ------------------------------------------------------
-- Server version	5.1.47

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
-- Table structure for table `additional_information`
--

DROP TABLE IF EXISTS `additional_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_information` (
  `id` int(10) unsigned NOT NULL,
  `further_contacts` text,
  `instrument_comments` text,
  `additional_instruments` text,
  `array_description` text,
  `backend_description` text,
  `research_comments` text,
  `general_comments` text,
  KEY `observatory_id_4` (`id`),
  CONSTRAINT `observatory_id_4` FOREIGN KEY (`id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_information`
--

LOCK TABLES `additional_information` WRITE;
/*!40000 ALTER TABLE `additional_information` DISABLE KEYS */;
INSERT INTO `additional_information` VALUES (1,'','','','','','',''),(2,'','','','','Tektronix CCD Camera 2048x2048 7.5x7.5 ;\r\nOptic CCD 2048x4096 r 9.3x9.3fov ;\r\nUH8k Wide Field Imager Camera 8192x8192 r 33x33 fov ;\r\nULBCAM Infrared Camera 2048 x 2048 r 17x17 fov ;\r\nWide Field Grism Spectrograph 380-970 nm 11x11 ;\r\nSNIFS Spectrograph 6x6 fov','','Schedule: http://www.ifa.haAugust-Januarywaii.edu/88inch/schedule/current.pdf\r\nForm: http://www.ifa.hawaii.edu/88inch/forms/uhform.pdf 1st October for Feb-Jul, 1st April for Aug-Jan'),(3,'','','','','BVR Custom Scientific Photometric filters and SBIG CFW9 Filter Wheel.','',''),(4,'','Inst #1: Historic 10\" equatorial refractor built by Grubb brothers (Dublin) in 1885. Used mostly for visual and video work.\r\nInst#2: Planewave CDK 17\" Corrected Hall- Dirkham Astrograph w XSVR-H36 Starlight Xpress CCD camera. To be commisioned 2011','Meteor camera cluster: 3xWatec 902DM2S video cams +2x3.8mm + 1x6mm lenses, 45% sky coverage. Commisioned 2005. Polar Bear pole-staring camera cluster: 3xStarlight Express H16 CCD+3x Nikor 85mm lenses, covers ~10 deg around NCP. Commisioned 2008.','','','',''),(5,'','3 astro-camera\'s','','','','',''),(6,'','','','','','',''),(7,'','','','','','',''),(8,'','','','','','',''),(9,'','','','','','',''),(10,'','','','','','',''),(11,'','','','','','',''),(12,'','','','','','',''),(13,'','','','','','',''),(14,'','','','','','',''),(15,'','','','','','',''),(16,'','','','','','',''),(17,'','','','','','',''),(18,'','','','','','',''),(19,'','','','','','',''),(20,'HARUTYUNIAN Haik A., Dr.\r\n(Director) hhayk@bao.sci.am','','SCORPIO Focal Reducer\r\nVAGR Integral Field Spectrograph','','','Undertook research on:\r\nDetection of extragalactic objects with UV continuum  \r\nSearch for flare stars',''),(21,'Mary McCready (Project Leader)\r\nmccready@sri.com','Capable of measuring range-resolved ionospheric \r\nand atmospheric parameters simultaneously from\r\nground to outer reaches of atmosphere','Gravimeter\r\nPhotometer\r\nGPS','','','',''),(22,'','','Double astrograph 40cm opening\r\nSolar telescope 15cm aperture\r\nGPS\r\nSpectrometers','Very Long Base Interferometry (VLBI)','','',''),(23,'','','','','','Part of antenna array in Canberra and California','Alternative website:\r\nhttp://deepspace.jpl.nasa.gov/dsn/'),(24,'','','','','','','4th most ancient observatory still functioning'),(25,'','','','','','',''),(26,'','','','','','',''),(27,'','','Bombonera\r\nSuper Polaris\r\nComet-Catcher with stellar CCD','','','3SSS UNICORN-Project',''),(28,'','','Spectrometer\r\nPhotometer','','','Property of various universities/institutes\r\nwww.iac.es/adjuntos/cci/ottable.pdf\r\n(Go to link for further details)',''),(29,'Charles Wrench\r\ncharles.wrench@stfc.ac.uk','','3GHz Doppler-polarisation radar\r\nCloud radar systems\r\nMeteorological sensors\r\nHigh power UV lidar','','','',''),(30,'','','Meade telescopes\r\nTransit telescope\r\n408 MHz pulsar telescope\r\nCelestrons','','','',''),(31,'Dr Peter Thomas (observatory manager)\r\npkt@ulo.ucl.ac.uk','','Meade reflector telescopes\r\nPortable Meade ETX\r\nExplorer Scientific 80mm APO refractor\r\nSolar View 50mm\r\nJoynson 6-inch refractor','','','New Metre-Class Telescope Project currently underway to acquire large modern telescope with remote and robotic observing capabilities\r\n(aperture 1m)',''),(32,'','','Meade cadiotropic 10 inch (0.25m)\r\nDavies reftractor 8 inch (0.2m)\r\nMalta binoculars 6 inch (0.15m)\r\nWatson refractor 4.2 inch (0.11m)\r\nCoronado solar telescope 1.5 inch (0.04m)','','','','Science Outreach: Open sessions for public (Tuesdays and Saturdays)'),(33,'','','ICOM R-7000 radio receiver','','','Part of Genesis Project','Observatory used and run by members of Norwich Astronomical Society'),(34,'','Includes Astronomical Telescope (CCD)\r\nand Satellite Laser Ranging (SLR)','','','','Involved in GOCE Mission (ESA) and GNSS (GPS research)',''),(35,'Pascal LOVIS\r\npascal.lovis@jura-observatory.ch','','Coronograph 160mm\r\nOptec Temperature Compensated Focuser\r\nMCMT II Stepper motor-not','','','Discovered Comet P/2008 Q2 or Comet Ory',''),(36,'','','APO Binoculars apochromatic 100mm\r\nPentax 75mm refractor','','','',''),(37,'','','','','','Involved with the processing of data provided by the satellite INTEGRAL of the ESA.',''),(38,'','','Automated Meade 200mm Telescope (equipped with binoculars, controlled by a microcomputer)\r\nLumicon H-alpha filter','','','',''),(39,'','','','','','',''),(40,'','','Dobsonian Telescope (Old Newton-Cassegrain)\r\nGalileo Telescopes \r\nBinoculars 20x1000 Miyauchi Fluorite Apo\r\nH-alpha filter ASP-60\r\nWAM-850 tracking device','','','',''),(41,'','','Solar Laboratory','','','',''),(42,'','','','','','',''),(43,'','','Guide Telescope 0.07m\r\nH-alpha filter','','','',''),(44,'','','Two Telescopes 15cm aperture for Solar Observation\r\nH-Alpha, Ca II K, CN Filters','','','Project to acquire 3.6m Devasthal Optical Telescope and 1.3m Devasthal Fast Optical Telescopes is currently underway',''),(45,'','','','','','Running a Comet and Asteroid Search Program (PIKA) and discovered several comets, NEOs, variable stars and supernovae',''),(46,'','','5 Meade Telescopes (0.35-0.4m)\r\n0.4m spectroscopic telescope\r\n0.3m Brinton Newtonian reflector\r\nObjective Prism Telescope\r\nH-alpha filter\r\nCeolostat','','','',''),(47,'Wang, Yi\r\n(Secretary of Chief Scientist)\r\nyw@bao.ac.cn','','Solar Nine-Channel Telescope	600mm	6000mm\r\nSolar Magnetic Field Telescope	350mm	2800mm\r\nFull-disc & Local H-Alpha Telescope	14cm	\r\nFull-disc H-Alpha Telescope	200mm	1800mm\r\nFull-disc Vector Magnetograph	100mm	770.86mm\r\nFull-disc Calcium Monochromator	8cm	','','','Involved in various research projects eg. Space Solar Telescope (SST), Balloon-Borne Telescope (BBT), and other solar activity research',''),(48,'','','Photoheliograph\r\nTwin Spectroheliographs 6cm\r\nK-filtergrams','','','Its director, Evershed, discovered radial motion in sunspots (named the Evershed effect)',''),(49,'','','Wind vane and Anemometer','','','','Minor Planet Centre of the International Astronomical Union'),(50,'','','Photoelectric Photometers','','','Research projects include HERCULES (Large Echelle Spectograph) and MOA (Microlensing Observations)',''),(51,'','','','Australian Long Baseline Array VLBI network','','',''),(52,'','','0.5m Automatic Patrol Telescope\r\n0.6m Uppsala Schmidt Telescope','','','',''),(53,'','','Photometers','','','',''),(54,'','','','','','',''),(55,'','','','','','',''),(56,'','','','','','',''),(57,'','','','','','',''),(58,'','','','','','','Currently being upgraded. Expected to be operational again in 2012.'),(59,'','','','','','',''),(60,'cgoudis@astro.noa.gr','','','','','',''),(61,'','','','','','',''),(62,'','','','','','Involved in the SETI program',''),(63,'','','','','','',''),(64,'','','','','','',''),(65,'','','','','','',''),(66,'','More details concerning the additional instruments can be found here: http://www.ct.astro.it/sln/strumenti.html','','','','',''),(67,'','Morais (43cm telescope) previously used for observing comets\r\nand is the largest telescope of its kind in Italy (2011)\r\n','','','','',''),(68,'','','','','','At present it is the largest Russian astronomical centre for ground-based observations of objects in the Universe (25/05/2010)\r\n',''),(69,'','','','','','','');
/*!40000 ALTER TABLE `additional_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `web_address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'NASA','National Aeronautics and Space Administration','http://www.nasa.gov/'),(2,'ESA','European Space Agency','http://www.esa.int/'),(3,'UKSA','UK Space Agency','http://www.ukspaceagency.bis.gov.uk/'),(4,'CNES','Centre National d\'Études Spatiale','http://www.cnes.fr/'),(5,'CNSA','China National Space Administration','http://www.cnsa.gov.cn/'),(6,'JAXA','Japan Aerospace Exploration Agency','http://www.jaxa.jp'),(7,'SSAU','State Space Agency of Ukraine','http://www.nkau.gov.ua/'),(8,'AEB','Brazilian Space Agency','http://www.aeb.gov.br/'),(9,'DLR','Deutsches Zentrum für Luft- und Raumfahrt','http://www.dlr.de/'),(10,'ASI','Agenzia Spaziale Italiana','http://www.asi.it/'),(11,'ISRO','Indian Space Research Organisation','http://www.isro.org/'),(12,'ROSCOSMOS','Russian Federal Space Agency','http://www.roscosmos.ru/');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera_properties`
--

DROP TABLE IF EXISTS `camera_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `camera_properties` (
  `id` int(10) unsigned NOT NULL,
  `camera_type` text,
  `max_frames_per_sec` float DEFAULT NULL,
  `frame_size` text,
  `max_exposure_time` float DEFAULT NULL,
  `min_exposure_time` float DEFAULT NULL,
  `color_bw_chip` tinyint(1) DEFAULT NULL,
  `ccd_chip_type` text,
  KEY `observatory_id_6` (`id`),
  CONSTRAINT `observatory_id_6` FOREIGN KEY (`id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera_properties`
--

LOCK TABLES `camera_properties` WRITE;
/*!40000 ALTER TABLE `camera_properties` DISABLE KEYS */;
INSERT INTO `camera_properties` VALUES (1,'',0,'',0,0,0,''),(2,'',0,'',0,0,0,''),(3,'SBIG / ST-7XME',4,'765 x 510',3600,0.12,1,'KAF-0402ME'),(4,'',0,'',0,0,0,''),(5,'Artemis',0,'2000 x 2000',0,0.0001,1,''),(6,'',0,'',0,0,0,''),(7,'',0,'',0,0,0,''),(8,'',0,'',0,0,0,''),(9,'',0,'',0,0,0,''),(10,'',0,'',0,0,0,''),(11,'',0,'',0,0,0,''),(12,'',0,'',0,0,0,''),(13,'',0,'',0,0,0,''),(14,'',0,'',0,0,0,''),(15,'',0,'',0,0,0,''),(16,'',0,'',0,0,0,''),(17,'',0,'',0,0,0,''),(18,'',0,'',0,0,0,''),(19,'',0,'',0,0,0,''),(20,'',0,'',0,0,0,''),(21,'',0,'',0,0,0,''),(22,'CCD',0,'',0,0,0,''),(23,'',0,'',0,0,0,''),(24,'',0,'',0,0,0,''),(25,'ST-7 CCD',0,'',0,0,0,''),(26,'SBIG ST7 CCD camera',0,'',0,0,0,''),(27,'Schmidt Camera 40cm, CCD',0,'',0,0,0,''),(28,'',0,'',0,0,0,''),(29,'',0,'',0,0,0,''),(30,'',0,'',0,0,0,''),(31,'CCD',0,'',0,0,0,''),(32,'',0,'',0,0,0,''),(33,'',0,'',0,0,0,''),(34,'',0,'',0,0,0,''),(35,'Kodak and Texas CCD Image Sensor',0,'',0,0,0,''),(36,'CCD camera SBIG ST10',0,'',0,0,0,''),(37,'',0,'',0,0,0,''),(38,'CCD Video Camera',0,'',0,0,0,''),(39,'',0,'',0,0,0,''),(40,'',0,'',0,0,0,''),(41,'',0,'',0,0,0,''),(42,'',0,'',0,0,0,''),(43,'CCD camera',0,'',0,0,0,''),(44,'CCD',0,'',0,0,0,''),(45,'All-Sky and CCD',0,'',0,0,0,''),(46,'CCD',0,'',0,0,0,''),(47,'CCD',0,'',0,0,0,''),(48,'CCD',0,'',0,0,0,''),(49,'CCD (SBIG ST9 cooled camera)',0,'',0,0,0,''),(50,'CCD',0,'',0,0,0,''),(51,'',0,'',0,0,0,''),(52,'',0,'',0,0,0,''),(53,'CCD',0,'',0,0,0,''),(54,'',0,'',0,0,0,''),(55,'',0,'',0,0,0,''),(56,'',0,'',0,0,0,''),(57,'',0,'',0,0,0,''),(58,'',0,'',0,0,0,''),(59,'',0,'',0,0,0,''),(60,'1k*1k LN/CCD Camera, 4k*4k Vernikou-Eugenides CCD Camera, ULTRACAM - Ultra-Fast Triple-Beam CCD Camera ',0,'',0,0,0,''),(61,'Photometrics AT200 CCD camera, Princeton Instruments CCD camera, Andor iXon+888 EMCCD camera',0,'',0,0,0,''),(62,'',0,'',0,0,0,''),(63,'',0,'',0,0,0,''),(64,'',0,'',0,0,0,''),(65,'A FLI camera Pro series with Kodak 1001E 1024x1024 pixel sensor,  A HI-SIS 39 camera with Kodak 1001E 1024x1024 pixel sensor,  Two HI-SIS 33 cameras with Thompson 512x512 pixel sensors  Two HI-SIS 23 cameras with Kodak 401E sensors,  A SBIG STV camera for tracking ',0,'',0,0,0,''),(66,'CCD camera ',0,'',0,0,0,''),(67,'CCD camera (ASTROMED-UK, 1152 x 1296 pixel format, scale 0.467 \"/ pixel liquid nitrogen cooled) ',0,'',0,0,0,''),(68,'',0,'',0,0,0,''),(69,'',0,'',0,0,0,'');
/*!40000 ALTER TABLE `camera_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clearnights_ranges`
--

DROP TABLE IF EXISTS `clearnights_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clearnights_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `range` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clearnights_ranges`
--

LOCK TABLES `clearnights_ranges` WRITE;
/*!40000 ALTER TABLE `clearnights_ranges` DISABLE KEYS */;
INSERT INTO `clearnights_ranges` VALUES (1,'<50'),(2,'51-100'),(3,'101-150'),(4,'151-200'),(5,'251-300'),(6,'>300');
/*!40000 ALTER TABLE `clearnights_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(5) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AL','Albania'),(3,'DZ','Algeria'),(4,'AS','American Samoa'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antarctica'),(9,'AG','Antigua And Barbuda'),(10,'AR','Argentina'),(11,'AM','Armenia'),(12,'AW','Aruba'),(13,'AU','Australia'),(14,'AT','Austria'),(15,'AZ','Azerbaijan'),(16,'BS','Bahamas'),(17,'BH','Bahrain'),(18,'BD','Bangladesh'),(19,'BB','Barbados'),(20,'BY','Belarus'),(21,'BE','Belgium'),(22,'BZ','Belize'),(23,'BJ','Benin'),(24,'BM','Bermuda'),(25,'BT','Bhutan'),(26,'BO','Bolivia'),(27,'BA','Bosnia & Herzegovina'),(28,'BW','Botswana'),(29,'BV','Bouvet Island'),(30,'BR','Brazil'),(31,'IO','British Indian Ocean Territory'),(32,'BN','Brunei'),(33,'BG','Bulgaria'),(34,'BF','Burkina Faso'),(35,'BI','Burundi'),(36,'KH','Cambodia'),(37,'CM','Cameroon'),(38,'CA','Canada'),(39,'CV','Cape Verde'),(40,'KY','Cayman Islands'),(41,'CF','Central African Republic'),(42,'TD','Chad'),(43,'CL','Chile'),(44,'CN','China'),(45,'CX','Christmas Island'),(46,'CC','Cocos (Keeling) Islands'),(47,'CO','Colombia'),(48,'KM','Comoros'),(49,'CG','Congo'),(50,'ZR','Congo (The Democratic Republic Of The)'),(51,'CK','Cook Islands'),(52,'CR','Costa Rica'),(53,'CI','Cote D\'Ivoire'),(54,'HR','Croatia'),(55,'CY','Cyprus'),(56,'CZ','Czech Republic'),(57,'DK','Denmark'),(58,'DJ','Djibouti'),(59,'DM','Dominica'),(60,'DO','Dominican Republic'),(61,'TP','East Timor'),(62,'EC','Ecuador'),(63,'EG','Egypt'),(64,'SV','El Salvador'),(65,'GQ','Equatorial Guinea'),(66,'ER','Eritrea'),(67,'EE','Estonia'),(68,'ET','Ethiopia'),(69,'FK','Falkland Islands'),(70,'FO','Faroe Islands'),(71,'FJ','Fiji'),(72,'FI','Finland'),(73,'FR','France'),(74,'FX','France Metropolitan'),(75,'GF','French Guiana'),(76,'PF','French Polynesia'),(77,'TF','French Southern Territories'),(78,'GA','Gabon'),(79,'GM','Gambia'),(80,'GE','Georgia'),(81,'DE','Germany'),(82,'GH','Ghana'),(83,'GI','Gibraltar'),(84,'GR','Greece'),(85,'GL','Greenland'),(86,'GD','Grenada'),(87,'GP','Guadeloupe'),(88,'GU','Guam'),(89,'GT','Guatemala'),(90,'GN','Guinea'),(91,'GW','Guinea-Bissau'),(92,'GY','Guyana'),(93,'HT','Haiti'),(94,'HM','Heard And Mc Donald Islands'),(95,'HN','Honduras'),(96,'HK','Hong Kong'),(97,'HU','Hungary'),(98,'IS','Iceland'),(99,'IN','India'),(100,'ID','Indonesia'),(101,'IE','Ireland'),(102,'IL','Israel'),(103,'IT','Italy'),(104,'JM','Jamaica'),(105,'JP','Japan'),(106,'JO','Jordan'),(107,'KZ','Kazakhstan'),(108,'KE','Kenya'),(109,'KI','Kiribati'),(110,'KW','Kuwait'),(111,'KG','Kyrgyzstan'),(112,'LA','Laos'),(113,'LV','Latvia'),(114,'LB','Lebanon'),(115,'LS','Lesotho'),(116,'LR','Liberia'),(117,'LI','Liechtenstein'),(118,'LT','Lithuania'),(119,'LU','Luxembourg'),(120,'MO','Macau'),(121,'MK','Macedonia (The F.Y.R. Of)'),(122,'MG','Madagascar'),(123,'MW','Malawi'),(124,'MY','Malaysia'),(125,'MV','Maldives'),(126,'ML','Mali'),(127,'MT','Malta'),(128,'MH','Marshall Islands'),(129,'MQ','Martinique'),(130,'MR','Mauritania'),(131,'MU','Mauritius'),(132,'YT','Mayotte'),(133,'MX','Mexico'),(134,'FM','Micronesia'),(135,'MD','Moldova'),(136,'MC','Monaco'),(137,'MN','Mongolia'),(138,'MS','Montserrat'),(139,'MA','Morocco'),(140,'MZ','Mozambique'),(141,'MM','Myanmar'),(142,'NA','Namibia'),(143,'NR','Nauru'),(144,'NP','Nepal'),(145,'NL','Netherlands'),(146,'AN','Netherlands Antilles'),(147,'NC','New Caledonia'),(148,'NZ','New Zealand'),(149,'NI','Nicaragua'),(150,'NE','Niger'),(151,'NG','Nigeria'),(152,'NU','Niue'),(153,'NF','Norfolk Island'),(154,'MP','Northern Mariana Islands'),(155,'NO','Norway'),(156,'OM','Oman'),(157,'PK','Pakistan'),(158,'PW','Palau'),(159,'PA','Panama'),(160,'PG','Papua New Guinea'),(161,'PY','Paraguay'),(162,'PE','Peru'),(163,'PH','Philippines'),(164,'PN','Pitcairn'),(165,'PL','Poland'),(166,'PT','Portugal'),(167,'PR','Puerto Rico'),(168,'QA','Qatar'),(169,'RE','Reunion'),(170,'RO','Romania'),(171,'RU','Russian Federation'),(172,'RW','Rwanda'),(173,'GS','S Georgia & S Sandwich Islands'),(174,'KN','Saint Kitts And Nevis'),(175,'LC','Saint Lucia'),(176,'VC','Saint Vincent & The Grenadines'),(177,'WS','Samoa'),(178,'SM','San Marino'),(179,'ST','Sao Tome And Principe'),(180,'SA','Saudi Arabia'),(181,'SN','Senegal'),(182,'YU','Serbia And Montenegro'),(183,'SC','Seychelles'),(184,'SL','Sierra Leone'),(185,'SG','Singapore'),(186,'SK','Slovakia'),(187,'SI','Slovenia'),(188,'SB','Solomon Islands'),(189,'SO','Somalia'),(190,'ZA','South Africa'),(191,'KR','South Korea'),(192,'ES','Spain'),(193,'LK','Sri Lanka'),(194,'SH','St. Helena'),(195,'PM','St. Pierre And Miquelon'),(196,'SR','Suriname'),(197,'SJ','Svalbard And Jan Mayen Islands'),(198,'SZ','Swaziland'),(199,'SE','Sweden'),(200,'CH','Switzerland'),(201,'TW','Taiwan'),(202,'TJ','Tajikistan'),(203,'TZ','Tanzania'),(204,'TH','Thailand'),(205,'TG','Togo'),(206,'TK','Tokelau'),(207,'TO','Tonga'),(208,'TT','Trinidad And Tobago'),(209,'TN','Tunisia'),(210,'TR','Turkey'),(211,'TM','Turkmenistan'),(212,'TC','Turks And Caicos Islands'),(213,'TV','Tuvalu'),(214,'UG','Uganda'),(215,'UA','Ukraine'),(216,'AE','United Arab Emirates'),(217,'GB','United Kingdom'),(218,'US','United States'),(219,'UM','United States Outlying Islands'),(220,'UY','Uruguay'),(221,'UZ','Uzbekistan'),(222,'VU','Vanuatu'),(223,'VA','Vatican City State'),(224,'VE','Venezuela'),(225,'VN','Vietnam'),(226,'VG','Virgin Islands (British)'),(227,'VI','Virgin Islands (U.S.)'),(228,'WF','Wallis And Futuna Islands'),(229,'EH','Western Sahara'),(230,'YE','Yemen'),(231,'ZM','Zambia'),(232,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hidden_fields`
--

DROP TABLE IF EXISTS `hidden_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hidden_fields` (
  `id` int(10) unsigned NOT NULL,
  `web_address` tinyint(1) NOT NULL DEFAULT '0',
  `address` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` tinyint(1) NOT NULL DEFAULT '0',
  `city` tinyint(1) NOT NULL DEFAULT '0',
  `phone` tinyint(1) NOT NULL DEFAULT '0',
  `email` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` tinyint(1) NOT NULL DEFAULT '0',
  `longitude` tinyint(1) NOT NULL DEFAULT '0',
  `scientific_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `further_contacts` tinyint(1) NOT NULL DEFAULT '0',
  KEY `observatory_id_5` (`id`),
  CONSTRAINT `observatory_id_5` FOREIGN KEY (`id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hidden_fields`
--

LOCK TABLES `hidden_fields` WRITE;
/*!40000 ALTER TABLE `hidden_fields` DISABLE KEYS */;
INSERT INTO `hidden_fields` VALUES (1,0,0,0,0,0,0,0,0,0,0),(2,0,0,0,0,0,0,0,0,0,0),(3,0,0,0,0,1,0,0,0,0,0),(4,0,0,0,0,1,0,0,0,1,0),(5,0,0,0,0,0,0,0,0,0,0),(6,0,0,0,0,0,0,0,0,0,0),(7,0,0,0,0,0,0,0,0,0,0),(8,0,0,0,0,0,0,0,0,0,0),(9,0,0,0,0,0,0,0,0,0,0),(10,0,0,0,0,0,0,0,0,0,0),(11,0,0,0,0,0,0,0,0,0,0),(12,0,0,0,0,0,0,0,0,0,0),(13,0,0,0,0,0,0,0,0,0,0),(14,0,0,0,0,0,0,0,0,0,0),(15,0,0,0,0,0,0,0,0,0,0),(16,0,0,0,0,0,0,0,0,0,0),(17,0,0,0,0,0,0,0,0,0,0),(18,0,0,0,0,0,0,0,0,0,0),(19,0,0,0,0,0,0,0,0,0,0),(20,0,0,0,0,0,0,0,0,0,0),(21,0,0,0,0,0,0,0,0,0,0),(22,0,0,0,0,0,0,0,0,0,0),(23,0,0,0,0,0,0,0,0,0,0),(24,0,0,0,0,0,0,0,0,0,0),(25,0,0,0,0,0,0,0,0,0,0),(26,0,0,0,0,0,0,0,0,0,0),(27,0,0,0,0,0,0,0,0,0,0),(28,0,0,0,0,0,0,0,0,0,0),(29,0,0,0,0,0,0,0,0,0,0),(30,0,0,0,0,0,0,0,0,0,0),(31,0,0,0,0,0,0,0,0,0,0),(32,0,0,0,0,0,0,0,0,0,0),(33,0,0,0,0,0,0,0,0,0,0),(34,0,0,0,0,0,0,0,0,0,0),(35,0,0,0,0,0,0,0,0,0,0),(36,0,0,0,0,0,0,0,0,0,0),(37,0,0,0,0,0,0,0,0,0,0),(38,0,0,0,0,0,0,0,0,0,0),(39,0,0,0,0,0,0,0,0,0,0),(40,0,0,0,0,0,0,0,0,0,0),(41,0,0,0,0,0,0,0,0,0,0),(42,0,0,0,0,0,0,0,0,0,0),(43,0,0,0,0,0,0,0,0,0,0),(44,0,0,0,0,0,0,0,0,0,0),(45,0,0,0,0,0,0,0,0,0,0),(46,0,0,0,0,0,0,0,0,0,0),(47,0,0,0,0,0,0,0,0,0,0),(48,0,0,0,0,0,0,0,0,0,0),(49,0,0,0,0,0,0,0,0,0,0),(50,0,0,0,0,0,0,0,0,0,0),(51,0,0,0,0,0,0,0,0,0,0),(52,0,0,0,0,0,0,0,0,0,0),(53,0,0,0,0,0,0,0,0,0,0),(54,0,0,0,0,0,0,0,0,0,0),(55,0,0,0,0,0,0,0,0,0,0),(56,0,0,0,0,0,0,0,0,0,0),(57,0,0,0,0,0,0,0,0,0,0),(58,0,0,0,0,0,0,0,0,0,0),(59,0,0,0,0,0,0,0,0,0,0),(60,0,0,0,0,0,0,0,0,1,0),(61,0,0,1,0,0,0,0,0,0,1),(62,0,0,1,0,0,0,0,0,0,1),(63,0,0,1,0,0,0,0,0,0,1),(64,0,0,1,0,0,0,0,0,0,1),(65,0,0,0,0,0,0,0,0,0,0),(66,0,0,1,0,0,0,0,0,1,1),(67,0,0,1,0,0,0,0,0,0,1),(68,0,0,1,1,0,0,0,0,1,1),(69,0,0,1,0,0,1,1,1,1,1);
/*!40000 ALTER TABLE `hidden_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument_types`
--

DROP TABLE IF EXISTS `instrument_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrument_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument_types`
--

LOCK TABLES `instrument_types` WRITE;
/*!40000 ALTER TABLE `instrument_types` DISABLE KEYS */;
INSERT INTO `instrument_types` VALUES (1,'Newton'),(2,'Cassegrain'),(3,'Schmidt-Cassegrain'),(4,'Maksutov'),(5,'Ritchey-Chretien'),(6,'Dobson'),(7,'Refracting Telescope'),(8,'Binocular Telescope'),(9,'Spectrograph'),(10,'Radio Telescope'),(11,'Underground Telescope'),(12,'Interferometer'),(13,'Magnetometer'),(14,'Riometer'),(15,'Other');
/*!40000 ALTER TABLE `instrument_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instrument_type` int(10) unsigned NOT NULL,
  `diameter_m` float DEFAULT NULL,
  `focallength_m` varchar(10) DEFAULT NULL,
  `wavelength` text,
  PRIMARY KEY (`id`),
  KEY `instrument_type_id` (`instrument_type`),
  CONSTRAINT `instrument_type_id` FOREIGN KEY (`instrument_type`) REFERENCES `instrument_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,10,30,'','Radiowaves, LF - Microwaves, EHF'),(2,15,2.2,'22.6 m',''),(3,15,0.6,'',''),(4,3,0,'',''),(5,7,0.25,'',''),(6,15,0.43,'',''),(7,3,0.355,'',''),(8,10,32,'','925.0-931.5 MHz or 1415-1425 MHz'),(9,10,40,'','214.3-234.7 MHz'),(10,10,32,'','921.0-933.5 MHz'),(11,10,42,'','485.0-515.0 MHz'),(12,10,32,'','485.0-515.0 MHz'),(13,10,32,'','929.0-930.5 MHz or 1415-1425 MHz'),(14,3,0,'',''),(15,15,40,'',''),(16,7,20,'',''),(17,3,36,'',''),(18,7,40,'',''),(19,15,70,'',''),(20,5,125,'',''),(21,7,0,'',''),(22,7,0,'',''),(23,7,0,'',''),(24,3,0,'',''),(25,3,0,'',''),(26,3,0,'',''),(27,2,0,'',''),(28,15,0.4,'',''),(29,15,0,'',''),(30,2,0.6,'',''),(31,3,0,'',''),(32,2,0.15,'',''),(33,7,0,'',''),(34,2,2.6,'3.85, 16, ',''),(35,3,1,'2.13',''),(36,10,32,'','L Band'),(37,15,0,'',''),(38,13,0,'',''),(39,12,0,'',''),(40,9,0,'',''),(41,10,40,'',''),(42,10,14,'',''),(43,10,34,'',''),(44,10,26,'',''),(45,10,34,'',''),(46,10,70,'',''),(47,3,0,'',''),(48,15,0.36,'3.9','Celestron'),(49,3,0.28,'0.04',''),(50,7,0.07,'0.007',''),(51,1,0.212,'0.045',''),(52,3,0.4,'4',''),(53,9,0,'',''),(54,15,1.2,'','Robotic'),(55,12,0,'',''),(56,15,1.55,'','Infrared'),(57,15,1.5,'','Solar'),(58,15,0.4,'','Optical'),(59,10,25,'',''),(60,15,0.5,'','Grubb Parsons'),(61,10,3,'','HI'),(62,7,0.45,'7','Radcliffe'),(63,7,0.2,'3.2','Fry'),(64,15,0.36,'3.91','Celestron Reflector'),(65,15,0.6,'7','Allen Reflector'),(66,7,0.6,'','Radcliffe'),(67,15,0.6,'','Thornton Reflector'),(68,15,0.4,'','Hindle Reflector'),(69,7,0.31,'','Grubb'),(70,2,0.02,'',''),(71,3,0.036,'',''),(72,15,1,'','Laser & Astrometric'),(73,2,0.61,'0.003',''),(74,15,0.31,'1.31','Altair'),(75,3,0.305,'3.05',''),(76,3,0.4,'4',''),(77,4,0.09,'',''),(78,15,0.5,'','Meade LX200'),(79,15,1.2,'',''),(80,15,1,'',''),(81,1,0.2,'',''),(82,2,0.4,'2',''),(83,7,0.08,'','Achromatic'),(84,15,0.402,'','Friedrich-Meier'),(85,7,0.203,'',''),(86,7,0.15,'1.2',''),(87,15,0.3,'3.57','Reflector'),(88,7,0.15,'1.5',''),(89,2,0.3,'7',''),(90,4,0.3,'4.8',''),(91,15,0.127,'1.9','Meade ETX-125'),(92,15,0.356,'3.556','Meade LX200'),(93,15,0.406,'4.064','Kreiken'),(94,7,0.15,'2.25','Coude'),(95,15,0.3,'1.5','Astrograph'),(96,7,0.12,'2.32','Chromosphere'),(97,7,0.13,'2','Photosphere'),(98,7,0.25,'',''),(99,2,0.38,'',''),(100,2,0.52,'',''),(101,2,0.56,'',''),(102,7,1.04,'',''),(103,3,0.19,'',''),(104,15,0.6,'','Sky Survey'),(105,3,0.36,'',''),(106,2,0.5,'',''),(107,10,4.5,'',''),(108,7,0.15,'',''),(109,15,0.6,'6','Solar Multi Channel Telescope'),(110,15,0.6,'','Grubb Parson Coleostat'),(111,9,0.2,'18',''),(112,15,0.3,'','Meade LX200'),(113,15,1,'','McLellan'),(114,9,0,'',''),(115,15,1.8,'','MOA'),(116,15,0.61,'','Boller&Chivens'),(117,15,0.6,'','Optical'),(118,10,26,'',''),(119,10,14,'',''),(120,15,2.3,'','Advanced Technology'),(121,15,1,'','Boller&Chivens'),(122,3,1.24,'',''),(123,15,2,'','Faulkes'),(124,15,3.9,'','Anglo-Australian'),(125,15,1.5,'','Nasmyth'),(126,9,0,'',''),(127,15,0.9,'','Nasmyth'),(128,15,10.4,'','Submillimeter'),(129,2,3.6,'','Optical and infrared'),(130,2,8.1,'','Optical and infrared'),(131,2,8.1,'','Optical and infrared'),(132,10,37,'','Radio '),(133,2,15,'','Submillimeter'),(134,5,2.3,'2',''),(135,2,1.2,'',''),(136,5,1,'1.35',''),(137,2,0.5,'0.74',''),(138,2,0.4,'0.24',''),(139,2,0.9,'1.8',''),(140,10,32,'',''),(141,10,0,'',''),(142,2,0.6,'1.2',''),(143,5,1.52,'1.2',''),(144,7,0.4,'6',''),(145,15,0.6,'2.4',''),(146,15,0.33,'3.43',''),(147,3,0.98,'2.4',''),(148,15,1.8,'',''),(149,2,0.81,'',''),(150,2,0.25,'',''),(151,15,0.8,'1.6',''),(152,2,0.91,'4.143',''),(153,2,0.61,'1.21',''),(154,2,1.05,'0.994',''),(155,8,0.43,'7',''),(156,15,0.8,'',''),(157,15,0.2,'1.14',''),(158,15,6,'24',''),(159,10,600,'',''),(160,15,1,'',''),(161,2,0.6,'',''),(162,10,0,'','3.3-30m'),(163,10,0,'','1.2-2.7m'),(164,9,18000,'GNIRS','1-5.4 microns'),(165,9,0,'','');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_of_instruments`
--

DROP TABLE IF EXISTS `number_of_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_of_instruments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instruments_number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_of_instruments`
--

LOCK TABLES `number_of_instruments` WRITE;
/*!40000 ALTER TABLE `number_of_instruments` DISABLE KEYS */;
INSERT INTO `number_of_instruments` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'>3'),(5,'Array');
/*!40000 ALTER TABLE `number_of_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatories`
--

DROP TABLE IF EXISTS `observatories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `founded` int(11) DEFAULT NULL,
  `institution` text,
  `web_address` text,
  `address` text,
  `zip_code` varchar(10) DEFAULT NULL,
  `city` text,
  `country_id` int(10) unsigned NOT NULL,
  `phone` varchar(22) DEFAULT NULL,
  `email` text NOT NULL,
  `latitude` double(10,6) DEFAULT NULL,
  `longitude` double(10,6) DEFAULT NULL,
  `approx_position` text,
  `sealevel_m` int(11) DEFAULT NULL,
  `precipitation` int(10) unsigned DEFAULT NULL,
  `clear_nights` int(10) unsigned DEFAULT NULL,
  `timezone` int(10) unsigned DEFAULT NULL,
  `instruments_number` int(10) unsigned DEFAULT NULL,
  `partner_observatories` text,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `precipitation_id` (`precipitation`),
  KEY `clear_nights_id` (`clear_nights`),
  KEY `timezone_id` (`timezone`),
  KEY `instruments_number_id` (`instruments_number`),
  CONSTRAINT `clear_nights_id` FOREIGN KEY (`clear_nights`) REFERENCES `clearnights_ranges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `instruments_number_id` FOREIGN KEY (`instruments_number`) REFERENCES `number_of_instruments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `precipitation_id` FOREIGN KEY (`precipitation`) REFERENCES `precipitation_ranges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `timezone_id` FOREIGN KEY (`timezone`) REFERENCES `timezones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatories`
--

LOCK TABLES `observatories` WRITE;
/*!40000 ALTER TABLE `observatories` DISABLE KEYS */;
INSERT INTO `observatories` VALUES (1,'30-meter telescope',1984,'IRAM (Institut de Radioastronomie Millimétrique)','http://www.iram-institute.org','Avenida Divina Pastora 7, Local 20','','',192,'0034-95880-5454','info@iram.fr',37.068414,-3.398753,'Pico Veleta, Sierra Nevada Andalusia',2850,1,1,2,1,'Plateau de Bure Interferometer (also operated by IRAM)','2011-02-25 14:10:58',NULL),(2,'88 Telescope (Mauna Kea)',1970,'University of Hawaii','http://www.ifa.hawaii.edu/88inch/','96720-2700,Hawaii','','',218,'+1 808 932-2300','feedback2@ifa.hawaii.edu',19.822972,-155.469433,'',4214,1,1,23,2,'','2011-02-25 14:50:57',NULL),(3,'A81 Balzaretto Observatory',2005,'Private persons','http://digilander.libero.it/A81_Observatory/','Via Giuseppe Balzaretto 184','','Rome',103,'39 06 66411076','lor_franco@libero.it',41.870000,12.403306,'',70,6,1,2,1,'','2011-02-25 15:10:01',NULL),(4,'Armagh Observatory',1790,'Armagh Observatory','http://www.arm.ac.uk','College Hill','','',217,'44-2837-522928','info@arm.ac.uk',54.353056,-6.649722,'',60,6,2,1,2,'','2011-02-25 15:19:53',NULL),(5,'Abre Los Ojos',2008,'private owned','http://www.AbreLosOjos.be','','','',21,'','info@AbreLosOjos.be',0.000000,0.000000,'',50,1,1,2,1,'','2011-02-25 15:29:48',NULL),(6,'European Incoherent Scatter Facility (EISCAT), Tromso',0,'EISCAT','http://www.eiscat.se/','','','Tromso',199,'','',69.583331,19.233331,'',86,1,1,1,1,'EISCAT Kiruna, EISCAT Sodankylä, EISCAT Longyearbyen','2011-02-26 15:47:58','2011-02-26 16:01:08'),(7,'European Incoherent Scatter Facility (EISCAT), Kiruna',0,'EISCAT','http://www.eiscat.se/','','','Kiruna',199,'','',67.866667,20.433333,'',418,1,1,1,1,'EISCAT Tromso, EISCAT Sodankylä, EISCAT Longyearbyen','2011-02-26 15:57:57',NULL),(8,'European Incoherent Scatter Facility (EISCAT), Longyearbyen',0,'EISCAT','http://www.eiscat.se/','','','Longyearbyen',199,'','',78.150000,16.016667,'',445,1,1,1,1,'EISCAT Kiruna, EISCAT Sodankylä, EISCAT Tromso','2011-02-26 16:05:34',NULL),(9,'European Incoherent Scatter Facility (EISCAT), Sodankylä',0,'EISCAT','http://www.eiscat.se/','','','Sodankylä',199,'','',67.366667,26.633333,'',197,1,1,1,1,'EISCAT Kiruna, EISCAT Tromso, EISCAT Longyearbyen','2011-02-26 16:09:52',NULL),(10,'Brorfelde',0,'','','','','',57,'','',0.000000,0.000000,'',0,1,1,1,1,'','2011-02-26 17:16:33','2011-02-26 17:25:07'),(11,'Abastumani',0,'','','','','',80,'','',0.000000,0.000000,'',0,1,1,1,4,'','2011-02-26 17:24:19',NULL),(12,'Observatorium Kanzelh?he',0,'','','','','',14,'','',0.000000,0.000000,'',0,1,1,1,2,'','2011-02-26 17:28:50',NULL),(13,'Andjelko Glivar',0,'','','','','',54,'','',0.000000,0.000000,'',0,1,1,1,2,'','2011-02-26 17:33:48',NULL),(14,'Nyrola',0,'','http://www.ursa.fi/sirius/nytt/nytt@info.html','','','',72,'','',0.000000,0.000000,'',0,1,1,1,1,'','2011-02-26 17:38:47',NULL),(15,'Pises observatory',0,'','http://pisesobservatoire.free.fr/','','','',73,'','',0.000000,0.000000,'',0,1,1,1,4,'','2011-02-26 17:49:39',NULL),(16,'Hamberg-Bergedorf',0,'','http://www.hs.uni-hamburg.de/','Hamburg Observatory, Gojenbergsweg 112, 21029 Hamburg ','','',81,'','',0.000000,0.000000,'',0,1,1,1,4,'','2011-02-26 17:57:32',NULL),(17,'Beersel Hills Observatory',0,'','http://users.skynet.be/bho/index.htm','','','',21,'','',0.000000,0.000000,'',0,1,1,1,1,'','2011-02-28 17:21:02','2011-02-28 17:24:09'),(18,'Belogradchik',0,'','http://www.astro.bas.bg/~aobel','','','',33,'','',0.000000,0.000000,'',0,1,1,1,3,'','2011-02-28 17:33:33',NULL),(19,'Turku-Kevola Observatory',0,'','','','','',72,'','',0.000000,0.000000,'',0,1,1,1,1,'','2011-02-28 17:35:34',NULL),(20,'Byurakan Astrophysical Observatory',1946,'','http://www.bao.am/','Byurakan Astrophysical Observatory, Byurakan 378433, Aragatzotn province Armenia','378433','Byurakan',11,'','director@bao.sci.am',40.350833,44.241667,'',1709,1,1,5,4,'','2011-02-28 21:47:22',NULL),(21,'Sondrestrom Research Facility',1983,'SRI International; National Science Foundation; Denmark Meteorological Institute','http://isr.sri.com/','Greenland','','',85,'650-859-5343','sandie.avlakeotes@sri.com',67.000000,309.000000,'',74,1,1,16,4,'SVALBARD, EISCAT, Arecibo, Millstone Hill','2011-02-28 21:58:27',NULL),(22,'Yebes Astronomical Centre (Centro Astronomico de Yebes)',0,'National Astronomical Observatory, Spanish Grand Scientific Facility','http://www.fomento.es/','Guadalajara','','Yebes',192,'','',40.516667,-3.083333,'',980,1,1,2,5,'','2011-02-28 22:07:40',NULL),(23,'Madrid Deep Space Communications Complex',0,'NASA Deep Space Network, Instituto Nacional de Tecnica Aerospacial','http://insa.org/node/112','Robledo de Chavela','','Madrid',192,'0034 91 867 7000','',40.000000,4.000000,'',0,1,1,2,4,'Canberra DSCC, Goldstone DSCC','2011-02-28 22:32:05',NULL),(24,'Observatori Fabra',1904,'Reial Academia de Ciencies I Arts de Barcelona','http://www.fabra.cat','','','Barcelona',192,'','',41.700000,2.200000,'',415,1,1,2,1,'','2011-02-28 22:38:06',NULL),(25,'Observatorio Monte Deva',0,'','http://www.observatoriomontedeva.com/','Monte Deva, Gijon','','',192,'985 096 630','',43.483331,-5.599994,'',423,1,1,2,1,'','2011-02-28 22:47:38','2011-02-28 23:48:27'),(26,'E Pozuelo Observatory',0,'','http://www.nto.org/observatorio.html','Pozuelo','','Madrid',192,'','',40.433333,0.000000,'',730,1,1,2,4,'','2011-02-28 22:53:49',NULL),(27,'Piera Observatory',0,'','http://www.astrogea.org/jguarro/index.html','Piera, Anoia','','',192,'','',0.000000,0.000000,'',0,1,1,2,1,'','2011-02-28 22:59:33',NULL),(28,'Observatorio del Teide',0,'Instituto de Astrofisica de Canarias','http://www.iac.es/eno.php?op1=3&lang=en','Observatoria del Teide (Tenerife), Instituto de Astrofisica de Canarias C/ Via Lactea, s / n 38200 - La Laguna (Tenerife), Espana','38200','Tenerife',192,'34/922 329 110','teide@iac.es',28.300000,-16.500000,'',2,1,1,2,4,'Various (Europe)','2011-02-28 23:09:42','2011-02-28 23:47:51'),(29,'Chilbolton Observatory',1967,'Chilbolton Group of RAL Space, STFC Rutherford Appleton Laboratory','http://www.chilbolton.rl.ac.uk/facilities.htm','Chilbolton Observatory Drove Road, Chilbolton, Nr Stockbridge, Hants SO20 6BJ','SO20 6BJ','',217,'(01264) 860391','',51.133333,-1.433333,'',82,1,1,1,4,'','2011-02-28 23:16:48',NULL),(30,'Glasgow University Observatory',0,'University of Glasgow','http://www.astro.gla.ac.uk/observatory/observ.shtml','Acre Road (main observatory) / Cochno (outstation); Glasgow, Edinburgh','','Glasgow',217,'(0141) 581 4322/3','',55.899997,-4.299997,'',50,1,1,1,4,'','2011-02-28 23:25:01','2011-02-28 23:47:21'),(31,'University of London Observatory (ULO)',1929,'University College London','http://www.ulo.ucl.ac.uk/','553 Watford Way, Mill Hill London NW7 2QS','NW7 2QS','London',217,'0044 (0)203 108 1613','kathryn.goldsmith@ucl.ac.uk',51.600000,-0.233331,'',78,1,1,1,4,'','2011-02-28 23:33:06','2011-02-28 23:49:19'),(32,'Keele Observatory',1962,'Keele University','http://www.astro.keele.ac.uk/~obs/','Keele University, Newcastle-under-Lyme','','',217,'','obsvisits@phys.keele.ac.uk',53.000000,-2.266667,'',202,1,1,1,4,'','2011-02-28 23:41:54','2011-02-28 23:46:26'),(33,'Seething Observatory',0,'Norwich Astronomical Society','http://www.norwich.astronomicalsociety.org.uk/','Toad Lane, Thwaite St Mary, NR35 2EQ Norfolk','','',217,'01953 602624','drbalcombe@tiscali.co.uk',52.500000,1.416667,'',0,1,1,1,2,'','2011-02-28 23:53:39',NULL),(34,'Zimmerwald Observatory',1956,'Universitat Bern','http://www.aiub.unibe.ch/content/zimmerwald/index_eng.html','Waldhof, Zimmerwald (Bern)','','',200,'031 6318594','',46.866667,7.450000,'',897,1,1,2,1,'','2011-03-01 00:13:57',NULL),(35,'Observatoire Astronomique Jurassien-Vicques (Jura Observatory)',0,'Jura Astronomical Society','http://www.jura-observatory.ch/','Béridier 30, 2800 Delémont CH-Switzerland','','',200,'0041 (0) 32 423 32 86','info@jura-observatory.ch',47.350000,7.416667,'',505,1,1,2,3,'','2011-03-01 00:19:55',NULL),(36,'Observatoire d',1991,'Astronomical Society of Valais (SAVAR)','http://obs-arbaz.com','Anzere','','',200,'(079) 770 03 54','borgillioz@bluewin.ch',46.283331,7.366667,'',1440,1,1,2,4,'','2011-03-01 00:26:09','2011-03-01 00:50:07'),(37,'Observatory of Geneva',0,'Universite De Geneve; Laboratoire d\'Astrophysique de l\'EPFL','http://www.unige.ch/sciences/astro/an/','Sauverny, Versoix, Geneva','','Geneva',200,'','',46.316667,6.133333,'',455,1,1,2,2,'El Roque de los Muchachos Observatory (Spain)','2011-03-01 00:30:25',NULL),(38,'Observatoire de Verossaz',1995,'','http://www.verobservatoire.ch/','','','Verossaz',200,'079 206 31 57','info@verobservatoire.ch',46.216667,7.000000,'',730,1,1,2,4,'','2011-03-01 00:35:28',NULL),(39,'Sternwarte Eschenberg',1979,'Astronomischen Gessellschaft Winterthur','http://eschenberg.ch/','','','',200,'','',47.466667,8.750000,'',542,1,1,2,2,'','2011-03-01 00:37:50',NULL),(40,'Sternwarte Rotgrueb',1996,'Swiss Astronomical Society','http://ruemlang.astronomie.ch/','Rumlang region','','',200,'044 817 28 13','',47.433333,31.466667,'',495,1,1,2,4,'','2011-03-01 00:41:21',NULL),(41,'Sternwarte Uitikon-Waldegg',0,'','http://www.andreasfaisst.ch/STU/stu.php?view=home','Uitikon/Waldegg','','',200,'','',47.366667,8.450000,'',600,1,1,2,3,'','2011-03-01 00:44:19',NULL),(42,'Ankara University Observatory',1963,'Ankara University','http://rasathane.ankara.edu.tr/en/index.php','Ahlatl&#305;bel, ANKARA','','',210,'(312) 490 79 19','rasathane@ankara.edu.tr',39.850000,2.183333,'',1260,1,1,3,4,'','2011-03-01 00:49:39',NULL),(43,'Istanbul University Observatory',1936,'Istanbul University','http://www.istanbul.edu.tr/fen/en/gozlemevi.php','','','',210,'0212 440 00 00/10294 (','',41.016667,28.966667,'',65,1,1,3,4,'','2011-03-01 00:55:25',NULL),(44,'Aryabhatta Research Institute of Observational Sciences',1954,'Department of Science and Technology, Government of India','http://www.aries.res.in/','Manora Peak, Nainital-263 129, Uttarakhand (India)','','',99,'0091-5942-233734','',29.366667,79.466667,'',1925,1,4,6,4,'','2011-03-01 01:01:22',NULL),(45,'Crni Vrh Observatory',1975,'University of Ljublana','http://www.observatorij.org','Predgrize 29a, 5274 Crni Vrh nad Idrijo SLOVENIA','','',187,'00386 5 3777380','',45.950000,14.066667,'',726,1,1,2,3,'','2011-03-01 01:06:43','2011-03-01 01:29:50'),(46,'Bayfordbury Observatory',0,'University of Hertfordshire','http://www.herts.ac.uk/courses/schools-of-study/physics-astronomy-and-mathematics/observatory.cfm','Hatfield Campus','','',217,'0044 (0)1707 284426 (H','bayfordbury@herts.ac.uk',51.783333,-0.100000,'',57,1,1,1,4,'','2011-03-01 01:11:28',NULL),(47,'Huairou Solar Observing Station',0,'','http://sun.bao.ac.cn/','Located on a small island near the north bank of Huairou Reservoir','','',96,'10-64855805/64888716 (','',40.000000,117.000000,'',62,5,5,9,4,'','2011-03-01 01:18:35',NULL),(48,'Kodaikanal Observatory',1899,'Indian Institute of Astrophysics','http://www.iiap.res.in/centers/kodai','Located in the Palani hill range, southern India','624 103','Kodaikanal',99,'91 (4542) 240218','sundar@iiap.res.in',10.216667,77.466667,'',2343,1,1,6,4,'','2011-03-01 01:23:22',NULL),(49,'La Canada Observatory',2002,'','http://www.lacanada.es/','La Canada, Avila, Spain','','',192,'','',40.600000,-4.500000,'',1400,1,1,2,1,'','2011-03-01 01:27:44',NULL),(50,'Mt John University Observatory',0,'University of Canterbury','http://www.phys.canterbury.ac.nz/research/mt_john/index.shtml','P O Box 56, Lake Tekapo 7945','','',148,'0064 (3) 680 6000','',-43.983333,170.466667,'',1029,1,1,13,4,'','2011-03-01 01:36:01',NULL),(51,'Mt Pleasant Observatory',0,'University of Tasmania','http://www-ra.phys.utas.edu.au/physics_mt_pleasant.html','Located 20km east of Hobart, Tasmania','','',13,'0061 (0)3 6226 2447 (P','',-42.800000,147.433333,'',43,1,1,11,5,'','2011-03-01 01:39:42',NULL),(52,'Siding Spring Observatory',0,'Research School of Astronomy and Astrophysics (RSAA)','http://www.mso.anu.edu.au/info/sso/','Located 20 minutes from Coonabarabran National Park Road, New South Wales','','',13,'02 68426211','ssovc@mso.anu.edu.au',-31.250000,149.066667,'',1130,1,1,11,4,'','2011-03-01 01:44:52',NULL),(53,'Sierra Nevada Observatory (OSN)',1976,'Instituto de Astrofisica de Andalucia','http://www.osn.iaa.es/osn_eng.html','Instituto de Astrofisica de Andalucia (CSIC) c/ Camino Bajo de Huetor, 50 PO Box 3004, 18080 Granada','','',192,'0034 958 121311','',37.066667,-3.383333,'',2896,1,1,2,2,'','2011-03-01 01:48:02',NULL),(54,'Caltech Submillimeter Observatory (CSO)',1988,'Caltech','http://www.submm.caltech.edu/cso/','Caltech Submillimeter Observatory Office, 111 Nowelo St., Hilo, Hawaii','96720','Hilo',218,'(808) 935-1909','webmaster@www.submm.caltech.edu',0.000000,0.000000,'',0,1,1,1,1,'','2011-03-01 15:11:52',NULL),(55,'Canada-France-Hawaii Telescope',1979,'National Research Council of Canada, Centre National de la Recherche Scientifique of France, University of Hawaii','http://www.cfht.hawaii.edu/','CFHT Corporation 65-1238 Mamalahoa Hwy Kamuela, Hawaii','96743','',218,'(808) 885-7944','info@cfht.hawaii.edu',0.000000,0.000000,'',4200,1,1,23,1,'James Clerk Maxwell Telescope','2011-03-01 15:34:15','2011-03-01 16:50:36'),(56,'Gemini Observatory (South)',2000,'The United States Gemini Office, The United Kingdom Gemini Office, The Canadian Gemini Office, The Australian Gemini Office, The Argentinian Gemini Office, The Brazilian Gemini Office, The Chilean Gemini Office, University of Hawaii Gemini Office','http://www.gemini.edu/','Gemini Observatory Southern Operations Center c/o AURA, Casilla 603 La Serena','','',43,'56-51-205-600','iks@astro.ox.ac.uk',-30.260000,-70.739331,'Summit of Cerro Pachon',2750,1,1,17,1,'Gemini Observatory (North)','2011-03-01 15:58:17','2011-03-01 16:12:03'),(57,'Gemini Observatory (North)',2000,'The United States Gemini Office, The United Kingdom Gemini Office, The Canadian Gemini Office, The Australian Gemini Office, The Argentinian Gemini Office, The Brazilian Gemini Office, The Chilean Gemini Office, University of Hawaii Gemini Office','http://www.gemini.edu/','Gemini Observatory Northern Operations Center 670 N. A','96720','Hilo',218,'(808) 974-2500','iks@astro.ox.ac.uk',19.843092,-155.470592,'',4213,1,1,1,1,'Gemini Observatory (South)','2011-03-01 16:06:02','2011-03-04 11:31:42'),(58,'MIT Haystack Observatory',1964,'MIT','http://www.haystack.mit.edu/','MIT Haystack Observatory Off Route 40 Westford, MA','01886-1299','Westford',218,'(781) 981-5400','info@haystack.mit.edu',0.000000,0.000000,'',0,1,1,1,1,'','2011-03-01 16:37:37',NULL),(59,'James Clerk Maxwell Telescope',1987,'Science and Technology Facilities Council, the National Research Council Canada, and the Netherlands Organisation for Scientific Research','http://www.jach.hawaii.edu/JCMT/','Summit of Mauna Kea','','',218,'','',0.000000,0.000000,'',4092,1,1,23,1,'Canada-France-Hawaii Telescope','2011-03-01 16:50:08','2011-03-01 16:55:38'),(60,'national observatory of athens',1842,'The Institute of Astronomy and Astrophysics (IAA) ','http://www.noa.gr/indexen.html','P.O. BOX 20048 - THISSIO - 11810 - ATHENS - GREECE ','','Athens',84,'+30 2103490101, +30 21','',37.983333,22.200000,'',2340,1,3,3,2,'Chelmos observatory, Aristarchos','2011-03-03 18:37:31',NULL),(61,'Konkoly Observatory',0,'Hungarian Academy of Sciences','http://www.konkoly.hu/',' H-1121 Budapest, Konkoly Thege Miklós út 15-17. ','','Budapest',97,'+36 1 3919360 ','abraham@konkoly.hu',47.500000,18.966667,'',935,1,1,2,4,'Heliophysical Observatory','2011-03-03 18:54:34',NULL),(62,'Medicina Radiotelescopes',1963,'National Institute for Astrophysics ','http://www.med.ira.inaf.it/index_EN.htm','Via Fiorentina n. 3508/B - 40059 Fiorentina di Medicina (Bologna) ','','Bologna',103,'+39 (0)51.6965811 ','s.mariotti@ira.inaf.it',44.520556,11.652497,'44° 31',28,1,1,2,2,'SKA, EVN','2011-03-03 19:03:50','2011-03-03 19:05:41'),(63,'Astronomical Observatory of Bologna',1986,'National Institute for Astrophysics (INAF)','http://translate.google.com/translate?hl=en&sl=it&u=http://www.bo.astro.it/&ei=Pa5dTe-rL8aq8AOlqKSrCw&sa=X&oi=translate&ct=result&resnum=1&ved=0CCEQ7gEwAA&prev=/search%3Fq%3DAstronomical%2BObservatory%2Bof%2BBOLOGNA%26hl%3Den%26prmd%3Divnsm','Osservatorio Astronomico di Bologna  Via Ranzani 1 Via Ranzani 1  40127 Bologna  Italy','','Bologna',103,'+39 0512095701','flavio.fusipecci@oabo.inaf.it',44.500000,11.349997,'',0,1,1,2,2,'Loiano Observatory','2011-03-03 19:17:15','2011-03-03 19:31:31'),(64,'Vatican Observatory',1891,'Vatican Observatory Group','http://vaticanobservatory.org/','Vatican Observatory 00040 Caster Gandolfo Rome','','Vatican City',223,'(+39)-06-698-85266 ','',41.900000,12.483333,'',430,1,1,2,4,'Mount Graham International Observatory ','2011-03-03 19:30:20',NULL),(65,'astronomical observatory of the autonomous valley aosta valley',2003,'','http://www.oavda.it/english/index.htm','Saint-Barthélemy · Loc. Lignan, 39 11020 Nus (AO)','','Aosta Valley',103,'+39 0165 77 00 50','info@oavda.it',45.750000,7.466667,'',1600,1,1,1,1,'','2011-03-03 19:52:17',NULL),(66,'Catania Astrophysical Observatory',0,'National Institute for Astrophysics, INAF ','http://translate.google.co.uk/translate?hl=en&sl=it&u=http://www.ct.astro.it/&ei=6OFdTZHkKNSZhQeAhpWDDg&sa=X&oi=translate&ct=result&resnum=1&ved=0CCoQ7gEwAA&prev=/search%3Fq%3DCatania%2BAstrophysical%2BObservatory%26hl%3Den%26safe%3Doff%26client%3Dfirefox-a%26hs%3DFUH%26rls%3Dorg.mozilla:en-GB:official%26prmd%3Divns','78, 95123 Catania ITALY ','','Catania',103,'(+39) 0957332111 ','protocollo_oact@pec.it',37.516667,25.066667,'',3340,1,1,2,3,'','2011-03-03 20:19:52',NULL),(67,'Osservatorio Astronomico di Torino',1759,'Observatory of Torino ','http://www.to.astro.it/index.html','Via Osservatorio, 20 10025 Pino Torinese (TO) - Italy ','','Torino',103,'+39 0118101900 ','antonucci@oato.inaf.it',45.033333,7.766667,'',622,1,1,2,4,'European Southern Observatory,  National Optical Astronomy Observatories,  Steward Observatory ','2011-03-03 20:34:42',NULL),(68,'Special Astrophysical Observatory (SAO)',1966,'','http://www.sao.ru/Doc-en/index.html','Special Astrophysical Observatory,  Nizhnij Arkhyz,  Zelenchukskiy region,  Karachai-Cherkessian Republic,  Russia 369167 ','','',171,'+7(87878) 46436 ','admsao@sao.ru',57.250000,53.016667,'',2070,1,1,4,4,'European Southern Observatory,  National Optical Astronomy Observatories,  Steward Observatory','2011-03-03 20:56:32',NULL),(69,'LOFAR',0,'Netherlands Institute for Radio Astronomy','http://www.lofar.org/about-lofar/system/introduction','Oude Hoogeveensedijk, 4 7991 PD Dwingeloo, The Netherlands','','Dwingeloo',145,'(+31) (0)521 595 100 ','',0.000000,0.000000,'Spread Across Europe',0,1,1,1,5,'','2011-03-03 21:08:10',NULL);
/*!40000 ALTER TABLE `observatories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatory_to_instruments`
--

DROP TABLE IF EXISTS `observatory_to_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatory_to_instruments` (
  `observatory_id` int(10) unsigned NOT NULL,
  `instrument_id` int(10) unsigned NOT NULL,
  KEY `observatory_id_2` (`observatory_id`),
  KEY `instrument_id` (`instrument_id`),
  CONSTRAINT `instrument_id` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `observatory_id_2` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatory_to_instruments`
--

LOCK TABLES `observatory_to_instruments` WRITE;
/*!40000 ALTER TABLE `observatory_to_instruments` DISABLE KEYS */;
INSERT INTO `observatory_to_instruments` VALUES (1,1),(2,2),(2,3),(3,4),(4,5),(4,6),(5,7),(7,8),(6,9),(6,10),(8,11),(8,12),(9,13),(11,15),(11,16),(11,17),(11,18),(11,19),(11,20),(10,14),(12,21),(12,22),(13,23),(13,24),(15,25),(15,26),(15,27),(17,28),(17,29),(18,30),(18,31),(18,32),(19,33),(20,34),(20,35),(21,36),(21,37),(21,38),(21,39),(21,40),(22,41),(22,42),(23,43),(23,44),(23,45),(23,46),(26,49),(26,50),(26,51),(27,52),(27,53),(29,59),(32,67),(32,68),(32,69),(30,60),(30,61),(28,54),(28,55),(28,56),(28,57),(28,58),(25,47),(25,48),(31,62),(31,63),(31,64),(31,65),(31,66),(33,70),(33,71),(34,72),(35,73),(35,74),(35,75),(37,79),(37,80),(38,81),(38,82),(38,83),(39,84),(39,85),(40,86),(40,87),(41,88),(41,89),(42,90),(42,91),(42,92),(42,93),(42,94),(36,76),(36,77),(36,78),(43,95),(43,96),(43,97),(44,98),(44,99),(44,100),(44,101),(44,102),(46,106),(46,107),(46,108),(47,109),(48,110),(48,111),(49,112),(45,103),(45,104),(45,105),(50,113),(50,114),(50,115),(50,116),(50,117),(51,118),(51,119),(52,120),(52,121),(52,122),(52,123),(52,124),(53,125),(53,126),(53,127),(54,128),(56,130),(58,132),(55,129),(59,133),(60,134),(60,135),(61,136),(61,137),(61,138),(61,139),(62,140),(62,141),(64,144),(64,145),(64,146),(64,147),(64,148),(63,142),(63,143),(65,149),(65,150),(66,151),(66,152),(66,153),(67,154),(67,155),(67,156),(67,157),(68,158),(68,159),(68,160),(68,161),(69,162),(69,163),(57,131),(57,164),(57,165);
/*!40000 ALTER TABLE `observatory_to_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatory_to_research_areas`
--

DROP TABLE IF EXISTS `observatory_to_research_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatory_to_research_areas` (
  `observatory_id` int(10) unsigned NOT NULL,
  `research_area_id` int(10) unsigned NOT NULL,
  KEY `observatory_id_3` (`observatory_id`),
  KEY `research_area_id_1` (`research_area_id`),
  CONSTRAINT `observatory_id_3` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `research_area_id_1` FOREIGN KEY (`research_area_id`) REFERENCES `research_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatory_to_research_areas`
--

LOCK TABLES `observatory_to_research_areas` WRITE;
/*!40000 ALTER TABLE `observatory_to_research_areas` DISABLE KEYS */;
INSERT INTO `observatory_to_research_areas` VALUES (1,6),(1,7),(1,13),(1,15),(1,17),(1,19),(2,2),(3,2),(3,5),(3,24),(4,2),(4,3),(4,9),(4,11),(4,14),(4,15),(4,21),(4,25),(5,1),(5,3),(5,6),(7,23),(6,23),(8,23),(9,23),(11,2),(11,11),(10,1),(15,1),(15,6),(15,11),(15,13),(16,4),(16,6),(16,13),(17,2),(18,3),(19,2),(20,6),(20,13),(20,26),(21,1),(21,4),(22,1),(22,27),(23,1),(23,27),(24,1),(24,2),(26,2),(26,28),(27,2),(27,24),(29,1),(29,4),(29,27),(29,29),(32,15),(32,28),(30,2),(30,28),(28,2),(28,11),(28,22),(25,2),(25,28),(31,5),(31,6),(31,8),(31,28),(33,28),(34,1),(34,2),(34,3),(34,4),(35,2),(35,5),(35,14),(37,28),(38,11),(38,28),(39,28),(40,28),(41,11),(41,28),(42,15),(42,28),(36,28),(43,11),(43,29),(44,1),(44,2),(44,4),(44,5),(44,6),(44,9),(44,11),(46,1),(46,2),(46,11),(46,27),(47,11),(48,14),(48,28),(49,3),(49,29),(49,30),(45,1),(45,2),(45,4),(45,5),(45,6),(45,9),(45,11),(45,30),(50,6),(50,19),(50,20),(51,27),(52,31),(52,32),(53,28),(54,6),(54,10),(54,33),(56,31),(56,32),(58,27),(55,31),(55,32),(59,6),(59,7),(59,34),(60,6),(60,11),(60,13),(60,22),(60,49),(61,7),(61,9),(61,13),(61,20),(61,24),(61,31),(61,40),(61,54),(61,56),(62,7),(62,13),(62,20),(62,27),(62,30),(62,55),(62,56),(64,10),(64,13),(64,15),(64,24),(64,31),(64,42),(64,46),(64,52),(64,66),(63,6),(63,54),(65,31),(66,9),(66,11),(66,13),(67,6),(67,13),(67,34),(67,67),(68,5),(68,7),(68,9),(68,11),(68,13),(68,19),(68,20),(68,31),(68,33),(68,45),(68,47),(68,64),(68,67),(69,67),(57,9);
/*!40000 ALTER TABLE `observatory_to_research_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatory_to_scientific_contacts`
--

DROP TABLE IF EXISTS `observatory_to_scientific_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatory_to_scientific_contacts` (
  `observatory_id` int(10) unsigned NOT NULL,
  `scientific_contact_id` int(10) unsigned NOT NULL,
  KEY `observatory_id_1` (`observatory_id`),
  KEY `scientific_contact_id_1` (`scientific_contact_id`),
  CONSTRAINT `observatory_id_1` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scientific_contact_id_1` FOREIGN KEY (`scientific_contact_id`) REFERENCES `scientific_contacts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatory_to_scientific_contacts`
--

LOCK TABLES `observatory_to_scientific_contacts` WRITE;
/*!40000 ALTER TABLE `observatory_to_scientific_contacts` DISABLE KEYS */;
INSERT INTO `observatory_to_scientific_contacts` VALUES (1,1),(3,2),(4,3),(4,4),(5,5),(20,10),(21,11),(27,12),(29,13),(30,14),(31,15),(33,16),(34,17),(35,18),(38,20),(40,21),(42,22),(36,19),(43,23),(44,24),(46,26),(47,27),(49,28),(45,25),(50,29),(51,30),(52,31),(53,32),(61,62),(62,63),(64,65),(63,64),(67,66);
/*!40000 ALTER TABLE `observatory_to_scientific_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observatory_to_targets`
--

DROP TABLE IF EXISTS `observatory_to_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observatory_to_targets` (
  `observatory_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  KEY `observatory_id_7` (`observatory_id`),
  KEY `target_id_1` (`target_id`),
  CONSTRAINT `observatory_id_7` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `target_id_1` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observatory_to_targets`
--

LOCK TABLES `observatory_to_targets` WRITE;
/*!40000 ALTER TABLE `observatory_to_targets` DISABLE KEYS */;
INSERT INTO `observatory_to_targets` VALUES (11,45),(23,50),(24,31),(24,33),(24,34),(24,51),(27,33),(31,47),(34,48),(35,31),(35,33),(38,50),(41,45),(48,31),(49,31),(45,31),(45,33),(60,45),(60,47),(61,13),(61,14),(61,15),(61,16),(61,17),(61,18),(61,19),(61,20),(61,21),(61,22),(61,23),(61,24),(61,25),(61,26),(61,27),(61,28),(61,29),(61,30),(61,31),(61,32),(61,33),(61,34),(61,35),(61,36),(61,37),(61,38),(61,39),(61,40),(61,41),(61,42),(61,43),(61,44),(61,47),(61,48),(61,49),(61,51),(61,52),(61,53),(62,47),(62,48),(63,45),(66,45),(67,8),(67,30),(67,45),(68,45);
/*!40000 ALTER TABLE `observatory_to_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_list`
--

DROP TABLE IF EXISTS `pages_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  CONSTRAINT `pages_list_ibfk_1` FOREIGN KEY (`level`) REFERENCES `users_levels` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_list`
--

LOCK TABLES `pages_list` WRITE;
/*!40000 ALTER TABLE `pages_list` DISABLE KEYS */;
INSERT INTO `pages_list` VALUES (1,'add.php','add new catalogue entries',21),(2,'browse.php','browse catalogue',0),(3,'edit.php','edit catalogue entries',21),(4,'home.php',NULL,0),(5,'login.php',NULL,0),(6,'logout.php',NULL,0),(7,'account.php','change account details',11),(8,'reset.php','resets a user password',0),(9,'registration.php','register a new user',31);
/*!40000 ALTER TABLE `pages_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precipitation_ranges`
--

DROP TABLE IF EXISTS `precipitation_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precipitation_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `range` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precipitation_ranges`
--

LOCK TABLES `precipitation_ranges` WRITE;
/*!40000 ALTER TABLE `precipitation_ranges` DISABLE KEYS */;
INSERT INTO `precipitation_ranges` VALUES (1,'<10'),(2,'11-50'),(3,'51-100'),(4,'101-200'),(5,'201-500'),(6,'>500');
/*!40000 ALTER TABLE `precipitation_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_areas`
--

DROP TABLE IF EXISTS `research_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `research_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_areas`
--

LOCK TABLES `research_areas` WRITE;
/*!40000 ALTER TABLE `research_areas` DISABLE KEYS */;
INSERT INTO `research_areas` VALUES (1,'Key Area 1 (Planetary aurorae, planetary radio emissions, planetary space weather)'),(2,'Key Area 2 (Small solar system objects: Astrometry, spectroscopy, stellar occultations, meteoroid impact effects)'),(3,'Key Area 3 (Airless bodies in the solar system: Moon, Mercury, Galilean satellites)'),(4,'Atmospheric Physics'),(5,'Supernovae / Novae'),(6,'Galaxies'),(7,'Interstellar Medium'),(8,'Exoplanets'),(9,'Stellar Physics'),(10,'Large Scale Structures'),(11,'Solar Physics'),(12,'Geodesy'),(13,'Cosmology'),(14,'Stellar Occultations'),(15,'Public Outreach / Education etc.'),(16,'Particle Physics'),(17,'Black Holes'),(18,'Astrobiology'),(19,'Astrochemistry'),(20,'Neutron Stars / Pulsars etc.'),(21,'Orbital Mechanics'),(22,'Interplanetary Medium'),(23,'Magnetospheric Physics'),(24,'Variable Stars'),(25,'Climate Studies'),(26,'Instability phenomena in the universe'),(27,'Radio Astronomy'),(28,'Sky Observation'),(29,'Meteorology'),(30,'NEOs'),(31,'Optical Astronomy'),(32,'Infrared Astronomy'),(33,'Cosmic Microwave Background'),(34,'Solar System'),(35,'Space Plasma Physics'),(36,'Sun-Earth Interaction'),(37,'Space Weather'),(38,'Solar Wind Interaction'),(39,'Earth\'s Magnetic Environment'),(40,'Gamma-ray emission'),(41,'Energetic Radiation'),(42,'Iron Quasar'),(43,'Determination of Hubble Constant'),(44,'Sunyaev-Zel\'dovich effect'),(45,'Big Bang'),(46,'Expansion of Universe'),(47,'Beginning of Universe'),(48,'Exotic Matter'),(49,'X-rays'),(50,'Observations of GRB'),(51,'Hubble Deep Fields'),(52,'Quasars'),(53,'Gamma-ray bursts'),(54,'Creation of Stars'),(55,'Comets'),(56,'Planets'),(57,'Satellites'),(58,'Creation of Chemical Elements'),(59,'X-ray emitting temperatures'),(60,'Composition of Satellites'),(61,'Electromagnetic Radiation'),(62,'Lunar Geology'),(63,'Geochemistry'),(64,'Investigation of magnetic activity of the Sun - including its generation, energy transfer and release of the magnetic energy.'),(65,'Stellar Interiors'),(66,'Dark Matter'),(67,'Instrument Design'),(68,'Atmospheric Observations'),(69,'Radar Imaging'),(70,'Military Defence');
/*!40000 ALTER TABLE `research_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `science_goals`
--

DROP TABLE IF EXISTS `science_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `science_goals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(5) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `science_goals`
--

LOCK TABLES `science_goals` WRITE;
/*!40000 ALTER TABLE `science_goals` DISABLE KEYS */;
INSERT INTO `science_goals` VALUES (1,'MA','Magnetospheres'),(2,'SA','Satellites'),(3,'AT','Atmospheres'),(4,'AU','Aurorae'),(5,'UNK','unknown'),(6,'PC','Polar Cusps'),(7,'SW','Solar Winds'),(8,'S-E I','Sun-Earth Interaction'),(9,'SPP','Space Plasma Physics'),(10,'N','Nucleosynthesis'),(11,'RPA','Relativistic-particle accelerators'),(12,'SFS','Strong-field signatures in compact stars'),(13,'OE','Optical Emission from prime targets of Integral Instruments'),(14,'XG','Observations in optical band with those at X-rays and gamma-rays'),(15,'NP','Nature and Physics of sources over wavelength range'),(16,'EON','Energetic Objects in Universe'),(17,'GRS','Gamma-ray sources'),(18,'PDS','Proton-detection system'),(19,'GRE','Gamma-Ray Emission'),(20,'BOU','Beginning of Universe'),(21,'EU','How the Universe evolved to the state we observe today'),(22,'UEF','How the Universe will continue to evolve in the future'),(23,'UBB','Measuring remnants of the radiation that filled the Universe immediately after the Big Bang'),(24,'CMB','Cosmic Microwave Background'),(25,'HC','Determining the Hubble Constant value'),(26,'XBH','X-rays from accretion onto black holes'),(27,'PES','Properties of exploding stars'),(28,'NEM','Nature of exotic matter'),(29,'OOG','Observations of GRB'),(30,'WRE','Highest Possible effective area over a wide range of energies'),(31,'SRHE','To provide sufficient reflectivity at high energies'),(32,'XBH','X-rays from accretion onto black holes'),(33,'PES','Properties of exploding stars'),(34,'NEM','Nature of exotic matter'),(35,'OOG','Observations of GRB'),(36,'LU','Life of Universe'),(37,'BS','Birth of Stars'),(38,'G','Galaxies'),(39,'SS','Solar Systems'),(40,'IG','Interstellar gas'),(41,'FGSP','Formation of galaxies, stars & planetary systems'),(42,'HDF','The Hubble Deep Fields'),(43,'PQG','Proof that Quasars reside in galaxies'),(44,'SCO','Measure the angular diameter of stars and other celestial objects'),(45,'AMS','Refine the positions and absolute magnitude scale for stars'),(46,'DSU','Determine the true distance scale for the Universe'),(47,'EUM','Expansion of the Universe measured'),(48,'GRB','Proof that gamma-ray burst are found in galaxies'),(49,'USE','Study the formation of Galaxies in the early universe and their subsequent evolution'),(50,'IIM','Investigate the creation of stars and their interaction with the interstellar medium'),(51,'CCA','Observe the Chemical Composition of the Atmospheres and Surfaces of Comets, Planets & Satellites'),(52,'MCU','Examine the molecular chemistry of the universe'),(53,'GDU','Detection and Investigation of galaxies in the distant Universe.'),(54,'IMG','Study of star formation and the interstellar medium in our own and nearby galaxies.'),(55,'XGR','Detecting Signals ranging from soft X-rays up to Gamma-rays'),(56,'BHS','Investigating high energy astronomical phenomena, such as Black holes and Supernovae'),(57,'XGR','Detecting Signals ranging from soft X-rays up to Gamma-rays.'),(58,'BHS','Investigating high energy astronomical phenomena, such as Black holes and Supernovae.'),(59,'LSD','To analyse geological, mineralogical and topographical aspects of the lunar surface in unprecedented detail.'),(60,'DCM','Study the vertical distribution of crustal material.'),(61,'MBM','Investigate the processes that led to the formation of craters, maria and basins on the Moon.'),(62,'CRM','Explore space weathering processes, that result from the interaction of the solar wind and cosmic rays with the Moon\'s surface.'),(63,'ALS','Analyse the magnetic anomalies on the lunar surface.'),(64,'SIP','Search for ices at the poles.'),(65,'HSR','Produce 3D maps of regions of particular scientific interest at high spatial resolution.'),(66,'PTI','Drop an impact probe on the lunar surface to test near-surface properties and test impact technology.'),(67,'SCM','Learn more about lunar history and formation from the composition of different surface features and the changes in the continuum slope over the Moon.'),(68,'PSA','Search for the presence of water in the form of hydrated minerals or ices at the lunar poles in the permanently shaded areas.'),(69,'HEM','Extend the scientific knowledge about resources for a later human exploration of the Moon.'),(70,'IFM','Map lunar surface composition by infrared fingerprints of minerals.'),(71,'MSL','To understand the processes of magnetic field generation and transport including the magnetic modulation of the Sun\'s luminosity.'),(72,'SCC','To investigate the processes responsible for energy transfer from the photosphere to the corona and that are responsible for the heating and structuring of the chromosphere and the corona.'),(73,'SES','To determine the mechanisms responsible for eruptive phenomena, such as flares and coronal mass ejections, and understand these phenomena in the context of the space weather of the Sun-Earth System.'),(74,'SMF','To observe the dissipation of the life-cycle story of Solar magnetic fields'),(75,'CTE','To observe the energy buildup, storage and release process in the corona for any transient event'),(76,'SSI','To study stellar interiors.'),(77,'SFE','To study for exoplanets.'),(78,'ELP','Searching for rocky planets outside our Solar System, and to find habitable, Earth-like planets around other stars.'),(79,'LPS','To study the acoustical waves across surfaces of stars, and hence penetrate into the \'invisible\' stellar interiors and learn about the physics of stars.'),(80,'IF','Ion Flux'),(81,'67P','Observations of the comet 67P\'s nucleus and coma'),(82,'N/A','Study Mars\' Atmosphere and Surface'),(83,'EOS','Earth Observing Systems'),(84,'HRTI','High Resolution Terrain Information'),(85,'SAR','High resolution reconnaissance imaging'),(86,'WLE','Worlds like Earth'),(87,'67P','unlock the secrets of how our solar system looked before planets formed.     * Characterisation of the nucleus     * Determination of the chemical compounds present, including enantiomers     * Study of comet activities and developments over time.'),(88,'67P ','search for the abundance of noble gas in the comet core');
/*!40000 ALTER TABLE `science_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scientific_contacts`
--

DROP TABLE IF EXISTS `scientific_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `institution` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scientific_contacts`
--

LOCK TABLES `scientific_contacts` WRITE;
/*!40000 ALTER TABLE `scientific_contacts` DISABLE KEYS */;
INSERT INTO `scientific_contacts` VALUES (1,'Carsten Kramer','kramer@iram.es','IRAM'),(2,'Lorenzo Franco','lor_franco@libero.it',''),(3,'Dr Apostolos Christou','aac@arm.ac.uk',''),(4,'Prof Mark Bailey','meb@arm.ac.uk',''),(5,'A. van Zegveld','andre@AbreLosOjos.be',''),(6,'Dr. Edward Stone','ecr@srl.caltech.edu',''),(7,'Gerhard Schwehm','',' ESOC, Darmstadt, Germany'),(8,'Rudolf Schmidt ','','ESOC, Darmstadt, Germany'),(9,'Elsa Montagnon','','(ESOC) Darmstadt, Germany. '),(10,'NIKOGOSSIAN Elena H., Dr','elena@bao.sci.am',''),(11,'Dr. Anja Stromme','anja.stromme@sri.com',''),(12,'Joan Guarro','jguarro@astrogea.org',''),(13,'Darcy Ladd','darcy.ladd@stfc.ac.uk',''),(14,'Graham Woan (Director)','graham@astro.gla.ac.uk','University of Glasgow'),(15,'Prof Ian Howarth (Director)','idh@star.ucl.ac.uk','University College London'),(16,'Mark Thompson (Chairman)','thompsonmarkp@btopenworld.com','FRAS'),(17,'Prof. Dr Schildknecht Thomas (Director)','',''),(18,'Michel ORY (Astrophysicist and educator)','michel.ory@jura-observatory.ch',''),(19,'Alain Kohler (President)','alain.kohler@tvs2net.ch',''),(20,'Biollay Sebastian','024/485 18 76',''),(21,'Walter Bersinger (President)','',''),(22,'Assoc. Prof. Birol Gurol (Director)','birol@astro1.science.ankara.edu.tr','Ankara University'),(23,'Prof. Dr. M. Turker Ozkan (Head of Department)','ozkant@istanbul.edu.tr','Istanbul University'),(24,'Prof. Ram Sagar (Director)','0091-05942--233734 ext 201',''),(25,'Stanislav Maticic (In charge of Hardware and Technology)','stanislav.maticic@guest.arnes.si',''),(26,'Professor Hugh Jones','',''),(27,'Professor Zhang, Hongqi','hzhang@bao.ac.cn',''),(28,'Juan Lacruz','',''),(29,'Dr Karen Pollard (Director)','karen.pollard@canterbury.ac.nz',''),(30,'Prof J.M. Dickey','John.Dickey@utas.edu.au','University of Tasmania'),(31,'Geoffrey White (Senior Technical Officer)','gwhite@mso.anu.edu.au',''),(32,'Julio F. Rodriguez Gomez (Vice Director of Technology)','julio@iaa.es',''),(33,'Marshall Space Flight Center','','NASA'),(34,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(35,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(36,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(37,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(38,'Joern Wilms ','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(39,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(40,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(41,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(42,'Charles F. Bolden, Jr','www.nasa.gov','NASA'),(43,'Charles F. Bolden, Jr','www.nasa.gov','NASA'),(44,'Charles F. Bolden, Jr','www.nasa.gov','NASA'),(45,'Charles F. Bolden, Jr','www.nasa.gov','NASA'),(46,'Charles F. Bolden, Jr','www.nasa.gov','NASA'),(47,'Charles F. Bolden, Jr','www.nasa.gov','NASA'),(48,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(49,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(50,'Joern Wilms','joern.wilms@sternwarte.uni-erlangen.de','ESA'),(51,'http://www.jaxa.jp/pr/inquiries/index_e.html','','JAXA'),(52,'http://www.jaxa.jp/pr/inquiries/index_e.html','','JAXA'),(53,'http://www.jaxa.jp/pr/inquiries/index_e.html','','JAXA'),(54,'Antariksh Bhavan','satish@isro.gov.in','ISRO'),(55,'Antariksh Bhavan','satish@isro.gov.in','ISRO'),(56,'Antariksh Bhavan','satish@isro.gov.in','ISRO'),(57,'http://www.jaxa.jp/pr/mail/index_e.html','','JAXA'),(58,'http://www.jaxa.jp/pr/mail/index_e.html','','JAXA'),(59,'http://www.jaxa.jp/pr/mail/index_e.html','','JAXA'),(60,'CNES','enquiries@cne-siar.gov.uk','CNES'),(61,'CNES','enquiries@cne-siar.gov.uk','CNES'),(62,'Ábrahám, Péter','abraham@konkoly.hu',''),(63,'Sergio Mariotti','s.mariotti@ira.inaf.it','National Institute for Astrophysics '),(64,'Prof. Flavio Fusi Pecci , director ','flavio.fusipecci@oabo.inaf.it',''),(65,'Jose Funes, S.J.','',''),(66,'Ester Antonucci ','antonucci@oato.inaf.it','INAF'),(67,'Oliver Montenbruck','oliver.montenbruck@dlr.de','German Aerospace Center (DLR), Wessling, Germany'),(68,'Eberhard Gill','e.k.a.gill@tudelft.nl','German Aerospace Center (DLR), Wessling, Germany'),(69,'Simone D’Amico','simone.damico@dlr.de','German Aerospace Center (DLR), Wessling, Germany'),(70,'Thomas Rupp','thomas.rupp@dlr.de','German Aerospace Center (DLR), Wessling, Germany'),(71,'Murakami, H','',''),(72,'Murakami, H','',''),(73,'ANDERSON, Caprece','cap@srl.caltech.edu','SRL'),(74,'Len Fisk','lafisk@umich.edu','SHRG'),(75,'Eberhard Moebius','','UNH'),(76,'Dr. Robert Gold','Robert.Gold@jhuapl.edu','JHU Applied Physics Laboratory'),(77,'CALDERON, Minerva','mc@srl.caltech.edu','SRL'),(78,'Thomas Zurbuchen','Thomasz@umich.edu','SHRG'),(79,'E. C. Stone','','Caltech '),(80,'D.J. McComas','','Space and Atmospheric Sciences Group'),(81,'Charles W. Smith','Charles W. Smith','UNH'),(82,'Richard Mewaldt','rmewaldt@srl.caltech.edu. ','SWPC'),(83,'Andrea Accomazzo','',''),(84,'Kevin Brown','',''),(85,'Don McCoy','','ESCO, Darmstadt, Germany'),(86,'Graeme Stephens','','NASA'),(87,'Steve Benner','','NASA'),(88,'David Bogart ','','Goddard Space Flight Center'),(89,'Borucki, W','',''),(90,'Laurie Kleppin','','POES ');
/*!40000 ALTER TABLE `scientific_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_to_science_goals`
--

DROP TABLE IF EXISTS `sensor_to_science_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_to_science_goals` (
  `sensor_id` int(10) unsigned NOT NULL,
  `science_goal_id` int(10) unsigned NOT NULL,
  KEY `sensor_id_3` (`sensor_id`),
  KEY `science_goal_id` (`science_goal_id`),
  CONSTRAINT `sensor_id_3` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `science_goal_id` FOREIGN KEY (`science_goal_id`) REFERENCES `science_goals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_to_science_goals`
--

LOCK TABLES `sensor_to_science_goals` WRITE;
/*!40000 ALTER TABLE `sensor_to_science_goals` DISABLE KEYS */;
INSERT INTO `sensor_to_science_goals` VALUES (5,5),(6,5),(7,5),(8,5),(10,5),(11,5),(12,5),(13,5),(24,1),(24,4),(24,6),(24,7),(24,8),(24,9),(31,30),(31,31),(31,32),(31,33),(31,34),(31,35),(35,42),(35,43),(35,44),(35,45),(35,46),(35,47),(35,48),(41,53),(41,54),(43,55),(43,56),(44,57),(44,58),(47,2),(47,59),(47,60),(47,61),(47,62),(47,63),(47,64),(47,65),(47,66),(48,2),(48,67),(48,68),(48,69),(48,70),(49,2),(50,10),(50,11),(50,12),(51,13),(51,14),(51,15),(51,16),(52,17),(52,18),(53,19),(54,71),(54,72),(54,73),(60,1),(61,1),(62,1),(63,15),(64,15),(100,7),(100,8),(100,24),(100,40),(100,76),(101,7),(101,40),(102,7),(102,8),(102,24),(103,80),(104,7),(105,7),(105,40),(106,7),(106,40),(106,76),(106,80),(107,7),(108,1),(109,3),(109,7),(109,8),(111,82),(112,1),(112,3),(113,3),(122,3),(123,3),(124,1),(126,84),(127,83),(128,3),(129,3),(131,3),(133,3),(133,83),(134,3),(135,3),(136,3),(136,83),(137,3),(137,8),(138,3),(139,77),(139,86),(140,3),(140,83),(141,3),(144,3),(145,3),(146,87),(146,88),(147,81),(148,81),(149,81),(151,81),(152,81),(154,81),(156,2),(157,85),(158,5),(159,5);
/*!40000 ALTER TABLE `sensor_to_science_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_to_scientific_contacts`
--

DROP TABLE IF EXISTS `sensor_to_scientific_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_to_scientific_contacts` (
  `sensor_id` int(10) unsigned NOT NULL,
  `scientific_contact_id` int(10) unsigned NOT NULL,
  KEY `sensor_id_2` (`sensor_id`),
  KEY `scientific_contact_id_2` (`scientific_contact_id`),
  CONSTRAINT `sensor_id_2` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `scientific_contact_id_2` FOREIGN KEY (`scientific_contact_id`) REFERENCES `scientific_contacts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_to_scientific_contacts`
--

LOCK TABLES `sensor_to_scientific_contacts` WRITE;
/*!40000 ALTER TABLE `sensor_to_scientific_contacts` DISABLE KEYS */;
INSERT INTO `sensor_to_scientific_contacts` VALUES (6,6),(24,33),(29,38),(30,39),(31,40),(32,41),(34,42),(35,43),(36,44),(37,45),(38,46),(39,47),(40,48),(41,49),(42,50),(44,51),(45,52),(46,53),(47,54),(48,55),(49,56),(50,34),(51,35),(52,36),(53,37),(54,57),(55,58),(56,59),(57,60),(58,61),(60,67),(60,68),(60,69),(60,70),(63,71),(64,72),(100,73),(101,74),(102,75),(103,76),(104,77),(105,78),(106,79),(107,80),(108,81),(109,82),(111,8),(112,9),(115,84),(125,85),(133,86),(134,87),(135,88),(139,89),(145,90),(146,7),(146,83);
/*!40000 ALTER TABLE `sensor_to_scientific_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sensor_name` text NOT NULL,
  `sensor_type` text NOT NULL,
  `underlying` text,
  `range_begin` float DEFAULT NULL,
  `range_end` float DEFAULT NULL,
  `units` text,
  `measured` text,
  `resolution` text,
  `field_of_view` text,
  `web_address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensors`
--

LOCK TABLES `sensors` WRITE;
/*!40000 ALTER TABLE `sensors` DISABLE KEYS */;
INSERT INTO `sensors` VALUES (5,'ULEIS','Ultra Low Energy Isotope Spectrometer','',2,28,'Z','M, E','','24',''),(6,'SIS','Solar Isotope Spectrometer','Stack Detector',2,30,'Z','Z, M, E','','104 Conical',''),(7,'SEPICA','Solar Energetic Particle Isotope Charge Analyzerr','',2,28,'Z','Z, Q, E','','61.5',''),(8,'EPAM','Electron, Proton & Alpha Monitor','',0,0,'H, He','Z, M, E','60 Conical','',''),(9,'MAG','Magnetometer','Triaxial Fluxgate',0,0,'','','0.17','',''),(10,'SWICS','Solar Wind Ion Composition Spectrometer','',2,30,'Z','Z, E','82 x 1','',''),(11,'SWIMS','Solar Wind Ion Mass Spectrometer','',2,30,'Z','M,E/Q','62 x 6','',''),(12,'SWEPAM','Solar Wind Electron Proton & Alpha Monitor','',0,0,'H, He','E/Q','80 x 1','',''),(13,'CRIS','Cosmic Ray Isotope Spectrometer','Silicon Detectors',2,30,'Z','Z, M, E','','120',''),(24,'Cluster II','','',0,0,'','Interaction between the Solar Wind and Magnetosphere','','Solar Wind Particles, Particles entering Polar Cusps, Magnetotail',''),(29,'Ariane 5 ECA','Expendable Launch System','',350,10000,'µm','Amplitude of Structures in Cosmic Microwave Background Radiation, Hubble Constant, Sunyaev-Zel\'dovich Effect','Good Angular Resolution and Sensitivity','Cosmic Microwave Background Anisotropies, Inflationary Models of early Universe',''),(30,'European Photon Imaging Cameras (EPIC)','Cameras','',0.15,15,'keV','Extemely sensitive imaging observations over the telescope\'s field of view.','Angular resolution of PSF, 6 arcsec FWHM','Field of view of 30 arcmin',''),(31,'X-ray telescopes','X-ray telescopes','',6,7,'keV','highest possible effective area over a wide range of energies - provides sufficient reflectivity at high energies','Mirror system uses a shallow grazing angle of 30\' to provide sufficient reflectivity at high energies.','The telescopes focal length is 7.5 meters and the diameter of the largest mirrors is 70cm, to be compatible with the shroud of the launcher.',''),(32,'Two reflection grating spectrometeres','Spectrometers','',0.33,2.5,'keV','Diffracts the X-rays to an array of dedicated charge coupled devices (CCD) detectors.','6 arcsec (FWHM)','30 arcmin',''),(34,'NICMOS','Infrared Camera/Spectrometer','Objects in deepest space',0,77,'Kelvin','Electromagnetic Spectrum, Birth of stars, galaxies, solar systems, Interstellar gas, Life of Universe, and formation of galaxies, stars & planetary systems','near infra-red wavelengths','',''),(35,'FGS','Fine guidance sensors','',0,0,'','Star positions','0.007 arcsec','',''),(36,'WFC3','Wide field optical camera','',0,0,'','Near infrared light, visible light, and near-Ultraviolet radiation','','',''),(37,'COS','Ultraviolet spectrograph','',0,0,'','Observing points of light, like stars and quasars, whilst looking at large areas - galaxies','','',''),(38,'STIS','Optical Spectrometer/Camera','',0,0,'','To hunt for black holes, measure an object\'s temperature, density, chemical composition and motion.','','',''),(39,'ACS','Optical Survey Camera','',0,0,'','Studying earliest activity of the Universe, how the Universe evolved, and the nature and distribution of galaxies.','Enhanced sensitivity/resolution','Sees wavelengths from far ultraviolet to visible light.',''),(40,'HIFI','Heterodyne Instrument for the Far Infrared','',480,1250,'GHz','','','',''),(41,'PACS','Photodetector Array Camera and Spectrometer','',57,210,'µm','Operates either as an imaging photometer or an integral field spectrometer over the spectral band.','','',''),(42,'SPIRE','Spectral and Photometric Imaging Reciever','3.5 meter diameter telescope.',60,700,'µm','','','',''),(43,'XRT','X-ray telescope','Consist of nested conical thin-foil mirrors which share similar design concepts with ASCA XRT.',5,8,'keV','','High Spectroscopic Resolution','',''),(44,'XRS','X-ray spectrometer','',0.2,700,'keV','','High Spectroscopic Resolution','',''),(45,'XIS','X-ray Imaging Spectrometer','X-ray telescope and X-ray sensitive charged coupled device (CCD)',0.2,700,'keV','location and energy of incident X-ray photons.','High Spectroscopic Resolution','',''),(46,'HXD','Hard X-ray Detector','High sensitivity',10,700,'keV','Detects transient high energy phenomena such as the gamma-ray bursts.','High Spectroscopic Resolution','',''),(47,'C1XS','Chandrayaan-1 X-ray Spectrometer','Will carry out high-quality, low energy X-ray spectroscopic mapping of the moon',1,10,'keV','Measure the elemental abundance, and map the distribution of the three main rock forming elements: Mg, Al, and Si.','High Spectroscopic Resolution','Determine the abundance of minor elements such as Ca, Ti and Fe on the surface of the Moon.',''),(48,'SARA','Sub-keV Atom Reflecting Analyser','Studies of plasma-surface interactions in space.',0.01,2,'keV','Detect atoms with sufficient angular and mass resolution to address the scientific objectives.','','',''),(49,'SIR-2','The near infrared spectrometer','Study the chemical composition of the Moon\'s crust and mantle.',0.9,2.4,'micrometer','','6 nanometres','',''),(50,'SPI','Spectrometer','Astrophysical lines',0.02,10,'MeV','','Fine enough to resolve astrophysical lines and allow spectroscopy in region of gamma-rays','Nucleosynthesis, relativistic particle accelerators, and strong-field signatures in compact stars',''),(51,'OMC','Optical Monitor','',500,600,'nm','X-rays, Gamma-rays','','',''),(52,'JEM-X','X-ray monitor','',3,35,'keV','Images of the sky.','Arcminute angular resolution','',''),(53,'IBIS','Imager','',0.015,10,'MeV','','High Angular Resolution','',''),(54,'SOT','Solar Optical Telescope','50cm aperture.',388,668,'nm','Measurement of the vector magnetic field in the photosphere and dynamics of both the photosphere and chromosphere associated with the magnetic fields.','','',''),(55,'EIS','Extreme-ultraviolet Imaging Spectrometer','',0,0,'','','','',''),(56,'XRT','X-ray Telescope','',0,0,'','Observes the generation, transport, and emergence of solar magnetic fields, and ultimate dissipation of magnetic energy in a form such as flares, and pico-flares, coronal heating, coronal mass ejection.','High Resolution','',''),(57,'Afocal Telescope','27cm-diameter afocal telescope','',370,950,'nm','Blocks sunlight reflected by the Earth.','','2.7-3.05 degrees',''),(58,'CCD','4-CCD wide-field camera','CCD camera built around the PROTEUS spacecraft bus, and operates in a low-Earth orbit.',850,900,'km','','','',''),(60,'High-grade single-frequency Phoenix GPS sensor','GPS','',0,0,'','','','',''),(61,'Formation Flying Radio-Frequency Sensor','','',0,0,'','','','',''),(62,'Vision-Based Sensor ','','',0,0,'','','','',''),(63,'Far-Infrared Surveyor','Infrared','',45,180,'micro m','','26.79arcsec, 44.20arcsec','',''),(64,'InfraRed Camera','Infrared','',1.7,5.5,'micron','','','9.5x10.0	9.1x10.0	10.3x10.2',''),(100,'The Cosmic Ray Isotope Spectrometer','Spectrometer','',250,250,'cm²-sr','','mass resolution, 0.25 amu ','',''),(101,'Solar Wind Ion Composition Spectrometer (SWICS)','Spectrometer','',0,100,'keV/e','','','',''),(102,'SEPICA','Ionic state','',0.2,100,'MeV/Nuc','','','',''),(103,'ULEIS ','Ion Flux','',20000,10000,'MeV/nucleon','','','',''),(104,'The Solar Isotope Spectrometer','Spectrometer','',10,100,'MeV/nucleon','','mass resolution, 0.25 amu','',''),(105,'Solar Wind Ions Mass Spectrometer (SWIMS)','Spectrometer','',0,10,'keV/e','','','',''),(106,'EPAM','Spectrometer','',0,50,'keV','','','',''),(107,'Solar Wind Electron, Proton, and Alpha Monitor (SWEPAM)','Monitor','',0.26,36,'Kev','','','',''),(108,'Magnetometer Instrument','Twin, triaxial fluxgate magnetometers (boom mounted)','',4,65,'nT','','','',''),(109,'Real-Time Solar Wind Data (RTSW)','Geometric storm warning','',0,0,'','','','',''),(111,'HRSC','High Resolution Stereo Camera ','',0,0,'','','2 m ','',''),(112,'MERMAG','Mercury Magnetometer','',0,0,'','','','',''),(113,'CALIOP','the Cloud-Aerosol Lidar with Orthogonal Polarization ','',0,0,'','','','',''),(114,'WFC','the Wide Field Camera ','',0,0,'','','','',''),(115,'IIR','the Imaging Infrared Radiometer ','',0,0,'','','','',''),(122,'ASPERA-4','Analyzer of Space Plasmas and Energetic Atoms','',0,0,'','','','',''),(123,'Spectrometer','Planetary Fourier Spectrometer and Spectroscopy for Investigation of Characteristics of the Atmosphere of Venus, also Visible and Infrared Thermal Imaging Spectrometer','',0.9,45,'µm','','','',''),(124,'MAG','magnetometer','measure the strength of Venus\'s magnetic field and the direction of it as affected by the solar wind and Venus itself.',0,0,'','map the magnetosheath, magnetotail, ionosphere, and magnetic barrier in high resolution in three-dimensions','','',''),(125,'VMC','Venus Monitoring Camera (a wide-angle, multi-channel CCD)','',0,0,'','','','',''),(126,'SAR','Synthetic Aperture Radar','Generation of a consistent global Digital Elevation Model (DEM)',0,0,'','','','',''),(127,'ASTER',' Advanced Spaceborne Thermal Emission and Reflection Radiometer','',0,0,'','','','',''),(128,'MOPITT','Measurements of Pollution in the Troposphere','',0,0,'','','','',''),(129,'MISR','Multi-angle Imaging Spectroradiometer ','',0,0,'','','','',''),(130,'MODIS','Moderate-resolution Imaging Spectroradiometer ','',0,0,'','','','',''),(131,'CERES','Clouds and Earth','',0,0,'','','','',''),(133,'The Cloud Profiling Radar (CPR)','Radar','',-30,70,'dBZ','','','',''),(134,'GOES-O Solar X-Ray Imager','Soft X-Ray','',6,60,'A (Angstroms)','','','',''),(135,'GOES-P Solar X-Ray Imager','','',6,60,'A (Angstroms)','','','',''),(136,'GOES-P Space Environment Monitor','3 in 1, EPS, Magnometer, XRS','',0.05,0.3,'nm','','','',''),(137,'GOES-P Sounder','Filter Radiometer','',0,15,'microns','','','',''),(138,'GOES-P Imager','Imaging','',0,0,'','','','',''),(139,'Kepler photometer','Photometer','',400,850,'nm','','2200x1024 pixels','105deg2 (about 12 degree diameter)',''),(140,'Advanced Microwave Sounding Unit (AMSU-A and MHS)','Microwave','',50.3,89,'GHz oxygen band','','','',''),(141,'Advanced Data Collection System (A-DCS)','Environmental Monitoring System','',0,0,'','','','',''),(142,'Space Environment Monitor (SEM)','Charged Particle Spectrometer','',20,50,'eV','','','',''),(143,'Solar Backscatter Ultraviolet Spectral Radiometer (SBUV/2)','Radiometer','',0,0,'','','','',''),(144,'High Resolution Infrared Radiation Sounder (HIRS/4)','Infrared','',0,0,'','','','',''),(145,'Advanced Very High Resolution Radiometer (AVHRR/3)','Infra red','',0,0,'','','','',''),(146,'ALICE ','(an ultraviolet imaging spectrograph)','',0,0,'','','','',''),(147,'OSIRIS','(Optical, Spectroscopic, and Infrared Remote Imaging System)','The camera system has a narrow angle lens (700  mm) and a wide angle lens (140  mm), with a 2048x2048 pixel CCD chip. ',0,0,'','','','',''),(148,'VIRTIS ','(Visible and Infrared Thermal Imaging Spectrometer)','make pictures of the core in the IR and also search for IR spectra of molecules in the coma. ',0,0,'','','','',''),(149,'MIRO','(Microwave Instrument for the Rosetta Orbiter)','The abundance and temperature of volatile substances like water, ammonia and carbon dioxide can be detected',0,0,'','','','',''),(150,'CONSERT ','(Comet Nucleus Sounding Experiment by Radiowave Transmission)','determine the comet\'s internal structure and deduce information on its composition',0,0,'','','','',''),(151,'ROSINA',' (Rosetta Orbiter Spectrometer for Ion and Neutral Analysis)','',0,0,'','','up to 300 amu','',''),(152,'MIDAS ','(Micro-Imaging Dust Analysis System)','investigate the dust particles which are deposited on a silicone plate',0,0,'','','','',''),(153,'COSIMA ','(Cometary Secondary Ion Mass Analyser)','analyses the composition of dust particles by secondary ion mass spectrometry, after the surface is cleaned by indium ions',0,0,'','','analyse ions up to a mass of 4000 amu','',''),(154,'GIADA (Grain Impact Analyser and Dust Accumulator) and RPC (Rosetta Plasma Consortium)','Solarwind interaction','',0,0,'','','','',''),(156,'Radar Altmeter','','',0,0,'','','','',''),(157,'Synthetic Aperture Radar','X-band','',0,0,'','','50 cm','',''),(158,'X-ray Detector','','',15,40,'keV','','','',''),(159,'Gamma Radiation Detector','','',30,50,'GeV','','','','');
/*!40000 ALTER TABLE `sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_mission_to_research_areas`
--

DROP TABLE IF EXISTS `space_mission_to_research_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_mission_to_research_areas` (
  `space_mission_id` int(10) unsigned NOT NULL,
  `research_area_id` int(10) unsigned NOT NULL,
  KEY `space_mission_id_3` (`space_mission_id`),
  KEY `research_area_id_2` (`research_area_id`),
  CONSTRAINT `research_area_id_2` FOREIGN KEY (`research_area_id`) REFERENCES `research_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `space_mission_id_3` FOREIGN KEY (`space_mission_id`) REFERENCES `space_missions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_mission_to_research_areas`
--

LOCK TABLES `space_mission_to_research_areas` WRITE;
/*!40000 ALTER TABLE `space_mission_to_research_areas` DISABLE KEYS */;
INSERT INTO `space_mission_to_research_areas` VALUES (2,7),(2,11),(2,16),(7,4),(7,23),(7,35),(7,36),(7,37),(7,38),(7,39),(9,6),(9,9),(9,10),(9,13),(9,17),(9,20),(9,33),(9,43),(9,44),(9,45),(9,46),(9,47),(10,9),(10,13),(10,14),(10,17),(10,48),(10,49),(10,50),(11,6),(11,9),(11,10),(11,40),(11,46),(11,51),(11,52),(11,53),(12,3),(12,4),(12,6),(12,7),(12,9),(12,13),(12,46),(12,47),(12,54),(12,55),(12,56),(12,57),(13,5),(13,6),(13,17),(13,20),(13,58),(13,59),(14,3),(14,60),(14,61),(14,62),(14,63),(8,13),(8,17),(8,40),(8,41),(8,42),(15,9),(15,11),(15,13),(15,64),(16,8),(16,9),(16,13),(16,65),(17,12),(18,28),(19,4),(19,7),(19,11),(19,13),(19,16),(19,22),(19,36),(19,38),(4,3),(4,25),(6,3),(6,12),(6,23),(6,25),(20,4),(20,25),(21,55),(23,15),(24,68),(25,69),(22,25),(26,70),(28,4),(29,4),(29,25),(30,4),(30,25),(31,4),(31,25),(32,13),(32,56),(33,4),(33,25),(3,55),(5,3),(27,70),(1,16);
/*!40000 ALTER TABLE `space_mission_to_research_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_mission_to_sensors`
--

DROP TABLE IF EXISTS `space_mission_to_sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_mission_to_sensors` (
  `space_mission_id` int(10) unsigned NOT NULL,
  `sensor_id` int(10) unsigned NOT NULL,
  KEY `space_mission_id_1` (`space_mission_id`),
  KEY `sensor_id_1` (`sensor_id`),
  CONSTRAINT `sensor_id_1` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `space_mission_id_1` FOREIGN KEY (`space_mission_id`) REFERENCES `space_missions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_mission_to_sensors`
--

LOCK TABLES `space_mission_to_sensors` WRITE;
/*!40000 ALTER TABLE `space_mission_to_sensors` DISABLE KEYS */;
INSERT INTO `space_mission_to_sensors` VALUES (2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(7,24),(9,29),(10,30),(10,31),(10,32),(11,34),(11,35),(11,36),(11,37),(11,38),(11,39),(12,40),(12,41),(12,42),(13,43),(13,44),(13,45),(13,46),(14,47),(14,48),(14,49),(8,50),(8,51),(8,52),(8,53),(15,54),(15,55),(15,56),(16,57),(16,58),(17,60),(17,61),(17,62),(18,63),(18,64),(19,100),(19,101),(19,102),(19,103),(19,104),(19,105),(19,106),(19,107),(19,108),(19,109),(4,111),(6,112),(20,113),(20,114),(20,115),(24,122),(24,123),(24,124),(24,125),(25,126),(22,127),(22,128),(22,129),(22,130),(22,131),(28,133),(30,134),(31,135),(31,136),(31,137),(31,138),(32,139),(33,140),(33,141),(33,142),(33,143),(33,144),(33,145),(3,146),(3,147),(3,148),(3,149),(3,150),(3,151),(3,152),(3,153),(3,154),(5,156),(27,157),(1,158),(1,159);
/*!40000 ALTER TABLE `space_mission_to_sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_mission_to_targets`
--

DROP TABLE IF EXISTS `space_mission_to_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_mission_to_targets` (
  `space_mission_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  KEY `space_mission_id_2` (`space_mission_id`),
  KEY `target_id_2` (`target_id`),
  CONSTRAINT `space_mission_id_2` FOREIGN KEY (`space_mission_id`) REFERENCES `space_missions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `target_id_2` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_mission_to_targets`
--

LOCK TABLES `space_mission_to_targets` WRITE;
/*!40000 ALTER TABLE `space_mission_to_targets` DISABLE KEYS */;
INSERT INTO `space_mission_to_targets` VALUES (2,45),(7,2),(7,45),(9,2),(9,45),(10,2),(11,2),(12,2),(12,45),(13,2),(13,50),(14,2),(14,9),(8,2),(15,2),(15,45),(16,2),(16,47),(17,2),(18,2),(19,45),(19,46),(4,3),(6,53),(20,2),(21,31),(23,2),(24,1),(25,2),(22,2),(26,2),(28,2),(29,2),(30,2),(31,2),(32,50),(33,2),(3,31),(5,5),(5,38),(5,39),(5,48),(5,52),(27,2),(1,2);
/*!40000 ALTER TABLE `space_mission_to_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_missions`
--

DROP TABLE IF EXISTS `space_missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `space_missions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mission_name` text NOT NULL,
  `mission_agency` int(10) unsigned NOT NULL,
  `launch_date` date NOT NULL,
  `death_date` date DEFAULT NULL,
  `web_address` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mission_agency_id` (`mission_agency`),
  CONSTRAINT `mission_agency_id` FOREIGN KEY (`mission_agency`) REFERENCES `agencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_missions`
--

LOCK TABLES `space_missions` WRITE;
/*!40000 ALTER TABLE `space_missions` DISABLE KEYS */;
INSERT INTO `space_missions` VALUES (1,'AGILE',2,'2007-04-23','0000-00-00','http://agile.rm.iasf.cnr.it/','2011-02-25 15:44:15','2011-03-04 12:49:14'),(2,'Advanced Composition Explorer (ACE)',1,'1997-08-25','2024-01-01','http://www.srl.caltech.edu/ACE/ASC/orbit.html','2011-02-25 16:06:28',NULL),(3,'Rosetta',2,'2004-03-02','2015-12-01','http://www.esa.int/esaMI/Rosetta/SEMYMF374OD_0.html','2011-02-28 12:56:32','2011-03-04 12:44:50'),(4,'Mars Express',2,'2003-06-02','2012-12-31','http://www.esa.int/SPECIALS/Mars_Express/SEMFU55V9ED_0.html','2011-02-28 13:14:52','2011-03-04 00:05:17'),(5,'Cassini-Huygens',2,'1997-10-15','2017-00-00','http://sci.esa.int/science-e/www/area/index.cfm?fareaid=12','2011-02-28 13:23:36','2011-03-04 12:47:25'),(6,'Bepicolumbo',2,'2014-00-00','2021-00-00','http://sci.esa.int/science-e/www/area/index.cfm?fareaid=30','2011-02-28 13:25:47','2011-03-04 00:07:27'),(7,'Cluster',1,'2000-08-09','2014-12-31','http://sci.esa.int/science-e/www/area/index.cfm?fareaid=8','2011-03-02 16:03:09',NULL),(8,'International Gamma-Ray Astrophysics Laboratory (INTEGRAL)',2,'2002-10-17','2014-12-31','http://sci.esa.int/science-e/www/area/index.cfm?fareaid=21','2011-03-02 16:59:18','2011-03-03 03:42:23'),(9,'Planck',2,'2009-05-14','2012-01-01','http://sci.esa.int/science-e/www/area/index.cfm?fareaid=17','2011-03-02 23:31:21',NULL),(10,'XMM-Newton',2,'1999-12-10','2014-12-31','http://sci.esa.int/science-e/www/area/index.cfm?fareaid=23','2011-03-03 00:02:24',NULL),(11,'The Hubble Space Telescope',1,'1990-04-24','2014-12-31','http://hubble.nasa.gov/','2011-03-03 00:27:48','2011-03-03 00:44:36'),(12,'HERSCHEL',2,'2009-05-14','2012-01-01','http://sci.esa.int/science-e/www/area/index.cfm?fareaid=16','2011-03-03 01:49:26',NULL),(13,'Suzaku',6,'2005-07-10','0000-00-00','http://www.nasa.gov/mission_pages/astro-e2/main/index.html','2011-03-03 02:43:26',NULL),(14,'Chandrayaan-1',11,'2008-10-22','0000-00-00','http://www.isro.gov.in/Chandrayaan/htmls/home.htm','2011-03-03 03:32:02',NULL),(15,'Hinode',6,'2006-09-22','0000-00-00','http://www.isas.jaxa.jp/e/enterp/missions/hinode/','2011-03-03 04:16:56',NULL),(16,'COROT',4,'2006-12-27','2013-03-31','http://smsc.cnes.fr/COROT/','2011-03-03 04:37:08',NULL),(17,'Prisma',9,'2010-06-15','2012-01-01','http://www.dlr.de/rb/en/desktopdefault.aspx/tabid-6813/11187_read-25543/','2011-03-03 21:37:23',NULL),(18,'Akari',6,'2006-02-21','0000-00-00','http://www.ir.isas.jaxa.jp/ASTRO-F/Outreach/index_e.html','2011-03-03 22:01:34',NULL),(19,'The Advanced Composition Explorer (ACE)',1,'1997-08-25','2024-01-01','http://www.srl.caltech.edu/ACE/','2011-03-03 22:43:50','2011-03-03 23:09:09'),(20,'Calipso',1,'2006-04-28','0000-00-00','http://www.nasa.gov/mission_pages/calipso/spacecraft/index.html','2011-03-04 00:25:26',NULL),(21,'EPOXI',1,'2005-01-12','0000-00-00','http://www.nasa.gov/mission_pages/epoxi/index.html','2011-03-04 00:40:10',NULL),(22,'Terra',1,'1999-08-12','0000-00-00','http://www.nasa.gov/mission_pages/terra/index.html','2011-03-04 00:48:52','2011-03-04 10:36:26'),(23,'International Space Station',1,'1998-00-00','2015-00-00','http://www.nasa.gov/mission_pages/station/main/index.html','2011-03-04 01:01:20',NULL),(24,'Venus Express',2,'2005-11-09','2012-12-00','http://www.esa.int/SPECIALS/Venus_Express/','2011-03-04 10:25:27',NULL),(25,'TanDEM-X',9,'2010-06-21','0000-00-00','http://www.dlr.de/eo/en/desktopdefault.aspx/tabid-5727/10086_read-21046/','2011-03-04 10:31:57',NULL),(26,'SATCOMBw',9,'2009-01-10','2024-00-00','http://www.dlr.de/rb/en/desktopdefault.aspx/tabid-6813/11187_read-25574/','2011-03-04 10:51:58',NULL),(27,'SAR-Lupe',9,'2006-12-19','0000-00-00','http://www.dlr.de/en/desktopdefault.aspx/tabid-1/86_read-13077/','2011-03-04 11:01:03','2011-03-04 12:48:19'),(28,'CloudSat',1,'2006-04-28','0000-00-00','http://www.nasa.gov/mission_pages/cloudsat/main/index.html','2011-03-04 11:21:00',NULL),(29,'ARCTAS NASA',1,'2008-07-01','0000-00-00','http://www.nasa.gov/mission_pages/arctas/','2011-03-04 11:30:55',NULL),(30,'GOES-O',1,'2009-06-26','0000-00-00','http://www.nasa.gov/mission_pages/GOES-O/main/index.html','2011-03-04 11:39:34',NULL),(31,'GOES-P',1,'2010-03-04','0000-00-00','http://www.nasa.gov/mission_pages/GOES-P/main/index.html','2011-03-04 11:50:00',NULL),(32,'Kepler',1,'2009-03-07','2012-12-30','http://kepler.nasa.gov/','2011-03-04 12:02:04',NULL),(33,'NOAA-N Prime',1,'2009-02-06','0000-00-00','http://www.nasa.gov/mission_pages/NOAA-N-Prime/main/index.html','2011-03-04 12:12:57',NULL);
/*!40000 ALTER TABLE `space_missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_family` varchar(45) NOT NULL,
  `target_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targets`
--

LOCK TABLES `targets` WRITE;
/*!40000 ALTER TABLE `targets` DISABLE KEYS */;
INSERT INTO `targets` VALUES (1,'PLANETS','Venus'),(2,'PLANETS','Earth'),(3,'PLANETS','Mars'),(4,'PLANETS','Jupiter'),(5,'PLANETS','Saturn'),(6,'PLANETS','Uranus'),(7,'PLANETS','Neptune'),(8,'PLANETS','Pluto'),(9,'PLANETS/Earth','Moon'),(10,'PLANETS/Mars','Phobos'),(11,'PLANETS/Mars','Deimos'),(12,'PLANETS/Jupiter','Jupiter Satellites'),(13,'PLANETS/Jupiter','Io'),(14,'PLANETS/Jupiter','Ganymede'),(15,'PLANETS/Jupiter','Callisto'),(16,'PLANETS/Saturn','Janus'),(17,'PLANETS/Saturn','Mimas'),(18,'PLANETS/Saturn','Enceladus'),(19,'PLANETS/Saturn','Tethys'),(20,'PLANETS/Saturn','Dione'),(21,'PLANETS/Saturn','Rhea'),(22,'PLANETS/Saturn','Titan'),(23,'PLANETS/Saturn','Hyperion'),(24,'PLANETS/Saturn','Iapetus'),(25,'PLANETS/Saturn','Phoebe'),(26,'PLANETS/Uranus','Uranus Satellites'),(27,'PLANETS/Neptune','Neptune Satellites'),(28,'PLANETS/Neptune','Nereid'),(29,'PLANETS/Pluto','Pluto Satellites'),(30,'PLANETS/Pluto','Charon'),(31,'SMALL BODIES','Comets'),(32,'SMALL BODIES','Kuiper Belt and Oort Cloud'),(33,'SMALL BODIES','Asteroids'),(34,'SMALL BODIES','Meteors'),(35,'PLANETS/Mars','Mars Satellites'),(36,'SMALL BODIES','TNO (Trans-Neptunian Objects)'),(37,'SMALL BODIES','SMALL BODIES'),(38,'PLANETS','RINGS'),(39,'PLANETS/Saturn','Saturn Rings'),(40,'PLANETS/Jupiter','Jupiter Rings'),(41,'PLANETS/Uranus','Uranus Rings'),(42,'PLANETS/Neptune','Neptune Rings'),(43,'SMALL BODIES/Asteroids','Vesta'),(44,'SMALL BODIES/Asteroids','Ceres'),(45,'SUN','SUN'),(46,'DUST','DUST'),(47,'EXOPLANETS','EXOPLANETS'),(48,'PLANETS','SATELLITES'),(49,'PLANETS/Jupiter','Europa'),(50,'PLANETS','PLANETS'),(51,'SMALL BODIES','Meteorites'),(52,'PLANETS/Saturn','Saturn Satellites'),(53,'PLANETS','Mercury');
/*!40000 ALTER TABLE `targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;
INSERT INTO `timezones` VALUES (1,'+00'),(2,'+01'),(3,'+02'),(4,'+03'),(5,'+04'),(6,'+05'),(7,'+06'),(8,'+07'),(9,'+08'),(10,'+09'),(11,'+10'),(12,'+11'),(13,'+12'),(14,'-01'),(15,'-02'),(16,'-03'),(17,'-04'),(18,'-05'),(19,'-06'),(20,'-07'),(21,'-08'),(22,'-09'),(23,'-10'),(24,'-11'),(25,'-12');
/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_levels`
--

DROP TABLE IF EXISTS `users_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_levels` (
  `level` int(10) unsigned NOT NULL,
  `category` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_levels`
--

LOCK TABLES `users_levels` WRITE;
/*!40000 ALTER TABLE `users_levels` DISABLE KEYS */;
INSERT INTO `users_levels` VALUES (0,'anonymous','access without login'),(11,'browsing','read-only access for registered users'),(21,'processing','data processing for selected users'),(31,'super user','full access');
/*!40000 ALTER TABLE `users_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_list`
--

DROP TABLE IF EXISTS `users_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `passwd` text,
  `title` text,
  `fname` text,
  `lname` text,
  `email` text,
  `affiliation` text,
  `category` text NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  CONSTRAINT `users_list_ibfk_1` FOREIGN KEY (`level`) REFERENCES `users_levels` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_list`
--

LOCK TABLES `users_list` WRITE;
/*!40000 ALTER TABLE `users_list` DISABLE KEYS */;
INSERT INTO `users_list` VALUES (1,'anonymous',NULL,NULL,NULL,NULL,NULL,NULL,'other',0),(2,'stoeckler','530e90856e3fa433e5ad31f3359ea47e','Mr.','Robert','Stöckler','robert.stoeckler@oeaw.ac.at','Institut für Weltraumforschung','commercial',31),(3,'ftopf','5e12806b179c04620320b332f205a80c','Mr.','Florian','Topf','florian.topf@oeaw.ac.at','Institut für Weltraumforschung','commercial',31),(43,'nagpal','28e29334745b11450410d66f147239d7','Mr.','Parinesh','Nagpal','p.nagpal@ucl.ac.uk','UCL','scientific',11),(44,'smiller','28e29334745b11450410d66f147239d7','Prof.','Steve','Miller','s.miller@ucl.ac.uk','UCL','scientific',11),(45,'mscherf','9996535e07258a7bbfd8b132435c5962','Mr.','Manuel','Scherf','manuel.scherf@oeaw.ac.at','IWF-OeAW','scientific',11);
/*!40000 ALTER TABLE `users_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_statistics`
--

DROP TABLE IF EXISTS `users_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `page` int(10) unsigned NOT NULL,
  `epoch` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `page` (`page`),
  CONSTRAINT `users_statistics_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_statistics_ibfk_2` FOREIGN KEY (`page`) REFERENCES `pages_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3364 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_statistics`
--

LOCK TABLES `users_statistics` WRITE;
/*!40000 ALTER TABLE `users_statistics` DISABLE KEYS */;
INSERT INTO `users_statistics` VALUES (1921,1,4,'2011-02-25 13:33:20'),(1922,1,5,'2011-02-25 13:33:39'),(1923,2,5,'2011-02-25 13:33:39'),(1924,2,2,'2011-02-25 13:33:44'),(1925,2,2,'2011-02-25 13:34:03'),(1926,2,2,'2011-02-25 13:34:06'),(1927,2,2,'2011-02-25 13:34:09'),(1928,2,2,'2011-02-25 13:34:11'),(1929,2,2,'2011-02-25 13:34:12'),(1930,2,2,'2011-02-25 13:34:13'),(1931,2,2,'2011-02-25 13:34:17'),(1932,2,2,'2011-02-25 13:34:28'),(1933,2,2,'2011-02-25 13:34:30'),(1934,2,2,'2011-02-25 13:34:32'),(1935,2,3,'2011-02-25 13:34:39'),(1936,2,1,'2011-02-25 13:35:04'),(1937,2,2,'2011-02-25 13:35:06'),(1938,2,1,'2011-02-25 13:35:07'),(1939,2,2,'2011-02-25 13:35:09'),(1940,2,1,'2011-02-25 13:35:17'),(1941,2,2,'2011-02-25 13:35:19'),(1942,2,1,'2011-02-25 13:35:22'),(1943,2,2,'2011-02-25 13:35:24'),(1944,2,2,'2011-02-25 13:40:30'),(1945,2,2,'2011-02-25 13:40:32'),(1946,2,2,'2011-02-25 13:40:34'),(1947,2,2,'2011-02-25 13:40:35'),(1948,2,2,'2011-02-25 13:40:36'),(1949,2,2,'2011-02-25 13:40:38'),(1950,2,2,'2011-02-25 13:40:39'),(1951,2,2,'2011-02-25 13:40:40'),(1952,2,2,'2011-02-25 13:40:41'),(1953,2,2,'2011-02-25 13:40:43'),(1954,2,3,'2011-02-25 13:40:44'),(1955,2,1,'2011-02-25 13:40:45'),(1956,2,3,'2011-02-25 13:40:46'),(1957,2,3,'2011-02-25 13:40:49'),(1958,2,2,'2011-02-25 13:40:51'),(1959,2,2,'2011-02-25 13:40:52'),(1960,2,2,'2011-02-25 13:40:53'),(1961,2,3,'2011-02-25 13:40:54'),(1962,2,2,'2011-02-25 13:43:13'),(1963,2,2,'2011-02-25 13:43:15'),(1964,2,2,'2011-02-25 13:43:17'),(1965,2,2,'2011-02-25 13:43:17'),(1966,2,2,'2011-02-25 13:43:18'),(1967,2,2,'2011-02-25 13:43:18'),(1968,2,3,'2011-02-25 13:43:21'),(1969,2,1,'2011-02-25 13:43:29'),(1970,2,1,'2011-02-25 13:43:31'),(1971,1,4,'2011-02-25 13:44:11'),(1972,2,1,'2011-02-25 14:10:58'),(1973,2,2,'2011-02-25 14:12:06'),(1974,2,2,'2011-02-25 14:12:07'),(1975,2,2,'2011-02-25 14:12:08'),(1976,2,2,'2011-02-25 14:12:09'),(1977,2,2,'2011-02-25 14:12:10'),(1978,2,2,'2011-02-25 14:13:06'),(1979,2,2,'2011-02-25 14:13:23'),(1980,2,2,'2011-02-25 14:13:24'),(1981,2,2,'2011-02-25 14:13:27'),(1982,2,2,'2011-02-25 14:13:30'),(1983,2,1,'2011-02-25 14:15:15'),(1984,2,1,'2011-02-25 14:15:17'),(1985,2,1,'2011-02-25 14:50:57'),(1986,2,2,'2011-02-25 14:51:04'),(1987,2,2,'2011-02-25 14:51:06'),(1988,2,1,'2011-02-25 15:02:39'),(1989,2,1,'2011-02-25 15:02:41'),(1990,2,1,'2011-02-25 15:10:01'),(1991,2,2,'2011-02-25 15:10:05'),(1992,2,2,'2011-02-25 15:10:07'),(1993,2,1,'2011-02-25 15:11:12'),(1994,2,1,'2011-02-25 15:11:13'),(1995,2,1,'2011-02-25 15:19:53'),(1996,2,2,'2011-02-25 15:19:56'),(1997,2,2,'2011-02-25 15:19:58'),(1998,2,2,'2011-02-25 15:20:10'),(1999,2,2,'2011-02-25 15:20:13'),(2000,2,1,'2011-02-25 15:20:45'),(2001,2,1,'2011-02-25 15:20:47'),(2002,2,1,'2011-02-25 15:29:48'),(2003,2,3,'2011-02-25 15:29:51'),(2004,2,1,'2011-02-25 15:29:58'),(2005,2,3,'2011-02-25 15:29:59'),(2006,2,1,'2011-02-25 15:30:00'),(2007,2,1,'2011-02-25 15:30:31'),(2008,2,1,'2011-02-25 15:44:15'),(2009,2,3,'2011-02-25 15:44:18'),(2010,2,1,'2011-02-25 15:44:20'),(2011,2,1,'2011-02-25 15:44:32'),(2012,2,3,'2011-02-25 15:44:35'),(2013,2,2,'2011-02-25 15:44:46'),(2014,2,2,'2011-02-25 15:44:47'),(2015,2,2,'2011-02-25 15:44:58'),(2016,2,1,'2011-02-25 15:45:09'),(2017,2,1,'2011-02-25 15:45:11'),(2018,2,1,'2011-02-25 16:06:28'),(2019,2,2,'2011-02-25 16:06:37'),(2020,2,2,'2011-02-25 16:06:39'),(2021,2,2,'2011-02-25 16:06:43'),(2022,2,2,'2011-02-25 16:06:46'),(2023,2,2,'2011-02-25 16:07:12'),(2024,2,2,'2011-02-25 16:07:14'),(2025,2,2,'2011-02-25 16:07:18'),(2026,2,4,'2011-02-25 16:31:22'),(2027,2,2,'2011-02-25 16:49:06'),(2028,2,3,'2011-02-25 17:06:12'),(2029,2,1,'2011-02-25 17:06:14'),(2030,2,1,'2011-02-25 17:41:29'),(2031,2,1,'2011-02-25 18:24:54'),(2032,1,4,'2011-02-25 18:40:13'),(2033,1,2,'2011-02-25 18:40:16'),(2034,1,2,'2011-02-25 18:40:53'),(2035,1,2,'2011-02-25 18:40:55'),(2036,1,2,'2011-02-25 18:47:02'),(2037,1,2,'2011-02-25 18:47:06'),(2038,1,2,'2011-02-25 18:47:07'),(2039,1,2,'2011-02-25 18:47:12'),(2040,1,2,'2011-02-25 18:47:14'),(2041,2,2,'2011-02-25 18:50:33'),(2042,2,2,'2011-02-25 18:50:35'),(2043,2,2,'2011-02-25 18:50:36'),(2044,2,2,'2011-02-25 18:50:37'),(2045,2,2,'2011-02-25 18:50:43'),(2046,2,2,'2011-02-25 18:50:46'),(2047,2,2,'2011-02-25 18:50:52'),(2048,2,9,'2011-02-25 18:51:02'),(2049,1,2,'2011-02-25 18:51:38'),(2050,2,9,'2011-02-25 18:52:30'),(2051,2,2,'2011-02-25 18:52:49'),(2052,2,2,'2011-02-25 18:56:41'),(2053,2,2,'2011-02-25 18:56:42'),(2054,2,2,'2011-02-25 18:56:44'),(2055,2,2,'2011-02-25 18:56:46'),(2056,2,3,'2011-02-25 18:56:51'),(2057,2,1,'2011-02-25 18:56:53'),(2058,2,3,'2011-02-25 18:56:56'),(2059,2,1,'2011-02-25 18:56:58'),(2060,2,3,'2011-02-25 18:57:08'),(2061,2,2,'2011-02-25 18:57:10'),(2062,2,4,'2011-02-25 18:57:11'),(2063,2,6,'2011-02-25 18:57:46'),(2064,1,4,'2011-02-25 18:57:46'),(2065,1,8,'2011-02-25 18:57:51'),(2066,1,4,'2011-02-25 18:57:58'),(2067,1,4,'2011-02-25 19:03:12'),(2068,1,4,'2011-02-25 19:03:39'),(2069,1,2,'2011-02-25 19:10:01'),(2070,1,2,'2011-02-25 19:10:04'),(2071,1,2,'2011-02-25 19:10:26'),(2072,1,4,'2011-02-25 19:10:33'),(2073,1,4,'2011-02-25 19:19:16'),(2074,1,4,'2011-02-25 21:17:26'),(2075,1,5,'2011-02-25 21:17:40'),(2076,1,5,'2011-02-25 21:18:01'),(2077,43,5,'2011-02-25 21:18:01'),(2078,43,2,'2011-02-25 21:18:06'),(2079,43,2,'2011-02-25 21:18:08'),(2080,43,1,'2011-02-25 21:18:29'),(2081,43,1,'2011-02-25 21:18:31'),(2082,43,6,'2011-02-25 21:23:45'),(2083,1,4,'2011-02-25 21:23:45'),(2084,1,4,'2011-02-26 15:34:54'),(2085,1,5,'2011-02-26 15:35:27'),(2086,43,5,'2011-02-26 15:35:27'),(2087,43,1,'2011-02-26 15:35:30'),(2088,43,1,'2011-02-26 15:35:33'),(2089,43,1,'2011-02-26 15:47:58'),(2090,43,2,'2011-02-26 15:48:02'),(2091,43,2,'2011-02-26 15:48:05'),(2092,43,3,'2011-02-26 15:48:14'),(2093,43,1,'2011-02-26 15:48:24'),(2094,43,1,'2011-02-26 15:48:42'),(2095,43,1,'2011-02-26 15:48:46'),(2096,43,1,'2011-02-26 15:48:49'),(2097,43,1,'2011-02-26 15:57:57'),(2098,43,3,'2011-02-26 15:58:00'),(2099,43,1,'2011-02-26 15:58:05'),(2100,43,1,'2011-02-26 16:01:08'),(2101,43,1,'2011-02-26 16:01:10'),(2102,43,1,'2011-02-26 16:01:13'),(2103,43,1,'2011-02-26 16:05:34'),(2104,43,1,'2011-02-26 16:05:36'),(2105,43,1,'2011-02-26 16:05:41'),(2106,43,1,'2011-02-26 16:09:52'),(2107,43,1,'2011-02-26 16:09:56'),(2108,43,1,'2011-02-26 16:09:58'),(2109,43,3,'2011-02-26 16:19:04'),(2110,43,2,'2011-02-26 16:19:20'),(2111,43,2,'2011-02-26 16:19:22'),(2112,43,6,'2011-02-26 16:19:32'),(2113,1,4,'2011-02-26 16:19:33'),(2114,1,4,'2011-02-26 16:42:45'),(2115,1,4,'2011-02-26 16:43:30'),(2116,1,5,'2011-02-26 16:43:50'),(2117,43,5,'2011-02-26 16:43:50'),(2118,43,2,'2011-02-26 16:43:55'),(2119,43,6,'2011-02-26 16:44:04'),(2120,1,4,'2011-02-26 16:44:04'),(2121,1,5,'2011-02-26 16:44:19'),(2122,43,5,'2011-02-26 16:44:19'),(2123,43,4,'2011-02-26 16:44:25'),(2124,43,2,'2011-02-26 16:44:29'),(2125,43,2,'2011-02-26 16:44:38'),(2126,43,2,'2011-02-26 16:44:56'),(2127,43,1,'2011-02-26 16:45:41'),(2128,43,1,'2011-02-26 16:45:44'),(2129,43,1,'2011-02-26 16:46:12'),(2130,43,4,'2011-02-26 16:46:21'),(2131,1,4,'2011-02-26 17:11:37'),(2132,1,5,'2011-02-26 17:11:51'),(2133,43,5,'2011-02-26 17:11:51'),(2134,43,1,'2011-02-26 17:11:54'),(2135,43,1,'2011-02-26 17:11:56'),(2136,43,1,'2011-02-26 17:16:32'),(2137,43,2,'2011-02-26 17:16:41'),(2138,43,2,'2011-02-26 17:16:43'),(2139,43,3,'2011-02-26 17:19:34'),(2140,43,1,'2011-02-26 17:19:48'),(2141,43,1,'2011-02-26 17:19:52'),(2142,43,1,'2011-02-26 17:24:19'),(2143,43,2,'2011-02-26 17:24:22'),(2144,43,2,'2011-02-26 17:24:24'),(2145,43,3,'2011-02-26 17:24:42'),(2146,43,1,'2011-02-26 17:24:47'),(2147,43,1,'2011-02-26 17:25:07'),(2148,43,1,'2011-02-26 17:25:44'),(2149,43,1,'2011-02-26 17:25:47'),(2150,43,1,'2011-02-26 17:28:50'),(2151,43,2,'2011-02-26 17:28:54'),(2152,43,2,'2011-02-26 17:28:55'),(2153,43,1,'2011-02-26 17:32:31'),(2154,43,1,'2011-02-26 17:32:33'),(2155,43,1,'2011-02-26 17:33:48'),(2156,43,1,'2011-02-26 17:35:14'),(2157,43,1,'2011-02-26 17:35:43'),(2158,43,1,'2011-02-26 17:38:47'),(2159,43,2,'2011-02-26 17:38:50'),(2160,43,2,'2011-02-26 17:38:52'),(2161,43,1,'2011-02-26 17:44:59'),(2162,43,1,'2011-02-26 17:45:01'),(2163,43,1,'2011-02-26 17:49:39'),(2164,43,2,'2011-02-26 17:49:49'),(2165,43,2,'2011-02-26 17:49:52'),(2166,43,1,'2011-02-26 17:53:58'),(2167,43,1,'2011-02-26 17:54:03'),(2168,43,1,'2011-02-26 17:57:32'),(2169,43,2,'2011-02-26 17:57:34'),(2170,43,2,'2011-02-26 17:57:36'),(2171,43,4,'2011-02-26 17:58:41'),(2172,1,4,'2011-02-26 17:59:08'),(2173,43,2,'2011-02-26 18:21:30'),(2174,43,2,'2011-02-26 18:21:32'),(2175,43,4,'2011-02-26 18:21:36'),(2176,1,4,'2011-02-26 20:22:41'),(2177,1,5,'2011-02-26 20:23:05'),(2178,43,5,'2011-02-26 20:23:06'),(2179,43,3,'2011-02-26 20:23:13'),(2180,43,2,'2011-02-26 20:23:37'),(2181,43,2,'2011-02-26 20:23:40'),(2182,43,2,'2011-02-26 20:23:51'),(2183,43,1,'2011-02-26 22:26:02'),(2184,43,1,'2011-02-26 22:26:05'),(2185,1,4,'2011-02-28 11:04:19'),(2186,1,4,'2011-02-28 12:40:36'),(2187,1,4,'2011-02-28 12:41:02'),(2188,1,5,'2011-02-28 12:41:37'),(2189,43,5,'2011-02-28 12:41:37'),(2190,43,2,'2011-02-28 12:41:41'),(2191,1,5,'2011-02-28 12:41:42'),(2192,43,2,'2011-02-28 12:41:53'),(2193,1,5,'2011-02-28 12:41:54'),(2194,1,5,'2011-02-28 12:42:11'),(2195,1,5,'2011-02-28 12:42:22'),(2196,43,5,'2011-02-28 12:42:22'),(2197,43,2,'2011-02-28 12:42:39'),(2198,43,2,'2011-02-28 12:42:49'),(2199,43,1,'2011-02-28 12:42:49'),(2200,43,2,'2011-02-28 12:42:49'),(2201,43,1,'2011-02-28 12:42:52'),(2202,43,3,'2011-02-28 12:43:00'),(2203,43,1,'2011-02-28 12:43:27'),(2204,43,2,'2011-02-28 12:53:36'),(2205,43,2,'2011-02-28 12:54:22'),(2206,43,3,'2011-02-28 12:55:22'),(2207,43,1,'2011-02-28 12:55:35'),(2208,43,1,'2011-02-28 12:55:43'),(2209,43,1,'2011-02-28 12:56:32'),(2210,43,2,'2011-02-28 12:56:36'),(2211,43,2,'2011-02-28 12:56:39'),(2212,43,3,'2011-02-28 12:57:01'),(2213,43,1,'2011-02-28 12:57:10'),(2214,43,1,'2011-02-28 12:58:30'),(2215,43,2,'2011-02-28 12:58:36'),(2216,43,2,'2011-02-28 12:58:38'),(2217,43,3,'2011-02-28 12:58:50'),(2218,43,1,'2011-02-28 12:58:54'),(2219,43,1,'2011-02-28 13:00:16'),(2220,43,2,'2011-02-28 13:00:29'),(2221,43,2,'2011-02-28 13:00:30'),(2222,43,3,'2011-02-28 13:01:23'),(2223,43,1,'2011-02-28 13:01:26'),(2224,43,6,'2011-02-28 13:03:31'),(2225,1,4,'2011-02-28 13:03:31'),(2226,1,5,'2011-02-28 13:04:01'),(2227,43,5,'2011-02-28 13:04:01'),(2228,43,1,'2011-02-28 13:04:03'),(2229,43,1,'2011-02-28 13:04:06'),(2230,43,1,'2011-02-28 13:04:50'),(2231,43,1,'2011-02-28 13:04:52'),(2232,43,1,'2011-02-28 13:05:46'),(2233,43,1,'2011-02-28 13:14:52'),(2234,43,2,'2011-02-28 13:15:10'),(2235,43,2,'2011-02-28 13:15:12'),(2236,43,1,'2011-02-28 13:15:23'),(2237,43,1,'2011-02-28 13:15:25'),(2238,43,1,'2011-02-28 13:23:36'),(2239,43,3,'2011-02-28 13:23:40'),(2240,43,1,'2011-02-28 13:23:46'),(2241,43,3,'2011-02-28 13:24:08'),(2242,43,1,'2011-02-28 13:25:29'),(2243,43,1,'2011-02-28 13:25:33'),(2244,43,1,'2011-02-28 13:25:47'),(2245,43,3,'2011-02-28 13:25:51'),(2246,43,1,'2011-02-28 13:25:53'),(2247,43,1,'2011-02-28 13:25:58'),(2248,43,2,'2011-02-28 13:26:01'),(2249,43,2,'2011-02-28 13:26:03'),(2250,43,1,'2011-02-28 13:28:10'),(2251,43,1,'2011-02-28 13:28:14'),(2252,1,4,'2011-02-28 13:31:53'),(2253,1,2,'2011-02-28 13:32:01'),(2254,1,2,'2011-02-28 13:32:06'),(2255,1,4,'2011-02-28 13:39:18'),(2256,1,5,'2011-02-28 13:39:38'),(2257,2,5,'2011-02-28 13:39:38'),(2258,2,1,'2011-02-28 13:39:48'),(2259,2,1,'2011-02-28 13:39:50'),(2260,2,1,'2011-02-28 13:40:22'),(2261,2,2,'2011-02-28 13:41:43'),(2262,2,2,'2011-02-28 13:41:45'),(2263,2,1,'2011-02-28 13:42:13'),(2264,2,3,'2011-02-28 13:42:15'),(2265,2,1,'2011-02-28 13:42:20'),(2266,1,4,'2011-02-28 13:43:09'),(2267,1,5,'2011-02-28 13:43:17'),(2268,2,5,'2011-02-28 13:43:17'),(2269,2,3,'2011-02-28 13:43:19'),(2270,2,1,'2011-02-28 13:43:22'),(2271,2,3,'2011-02-28 13:43:47'),(2272,2,1,'2011-02-28 13:43:53'),(2273,2,1,'2011-02-28 13:44:20'),(2274,2,3,'2011-02-28 13:44:24'),(2275,43,4,'2011-02-28 13:51:56'),(2276,43,1,'2011-02-28 13:52:49'),(2277,2,2,'2011-02-28 14:10:44'),(2278,2,2,'2011-02-28 14:10:48'),(2279,2,2,'2011-02-28 14:10:52'),(2280,2,2,'2011-02-28 14:34:08'),(2281,2,3,'2011-02-28 14:34:17'),(2282,2,1,'2011-02-28 14:34:22'),(2283,2,2,'2011-02-28 14:43:27'),(2284,2,9,'2011-02-28 14:53:08'),(2285,2,9,'2011-02-28 14:55:23'),(2286,2,4,'2011-02-28 14:56:38'),(2287,2,2,'2011-02-28 14:56:39'),(2288,2,2,'2011-02-28 14:56:42'),(2289,2,2,'2011-02-28 14:56:49'),(2290,2,2,'2011-02-28 14:59:00'),(2291,2,2,'2011-02-28 14:59:05'),(2292,2,3,'2011-02-28 14:59:16'),(2293,2,2,'2011-02-28 14:59:57'),(2294,2,2,'2011-02-28 14:59:59'),(2295,2,3,'2011-02-28 15:00:07'),(2296,1,4,'2011-02-28 15:00:29'),(2297,1,5,'2011-02-28 15:00:34'),(2298,3,5,'2011-02-28 15:00:34'),(2299,3,1,'2011-02-28 15:00:35'),(2300,3,3,'2011-02-28 15:00:38'),(2301,3,1,'2011-02-28 15:00:46'),(2302,3,3,'2011-02-28 15:00:49'),(2303,3,1,'2011-02-28 15:00:57'),(2304,3,3,'2011-02-28 15:01:00'),(2305,3,1,'2011-02-28 15:01:02'),(2306,3,3,'2011-02-28 15:01:05'),(2307,2,1,'2011-02-28 15:02:13'),(2308,2,1,'2011-02-28 15:02:15'),(2309,3,1,'2011-02-28 15:09:51'),(2310,3,3,'2011-02-28 15:09:59'),(2311,3,1,'2011-02-28 15:10:01'),(2312,3,3,'2011-02-28 15:10:17'),(2313,3,1,'2011-02-28 15:10:18'),(2314,3,3,'2011-02-28 15:10:25'),(2315,2,2,'2011-02-28 15:10:28'),(2316,2,2,'2011-02-28 15:10:31'),(2317,3,1,'2011-02-28 15:10:32'),(2318,3,3,'2011-02-28 15:10:34'),(2319,3,1,'2011-02-28 15:10:38'),(2320,1,4,'2011-02-28 15:10:59'),(2321,3,3,'2011-02-28 15:11:41'),(2322,3,1,'2011-02-28 15:11:42'),(2323,2,2,'2011-02-28 15:19:15'),(2324,2,2,'2011-02-28 15:19:17'),(2325,3,4,'2011-02-28 15:19:19'),(2326,3,3,'2011-02-28 15:19:21'),(2327,2,3,'2011-02-28 15:19:22'),(2328,3,1,'2011-02-28 15:19:28'),(2329,3,3,'2011-02-28 15:19:30'),(2330,3,1,'2011-02-28 15:19:31'),(2331,2,2,'2011-02-28 15:19:39'),(2332,2,2,'2011-02-28 15:19:41'),(2333,2,3,'2011-02-28 15:21:25'),(2334,2,2,'2011-02-28 15:22:20'),(2335,3,1,'2011-02-28 15:33:32'),(2336,3,4,'2011-02-28 15:33:37'),(2337,3,1,'2011-02-28 15:33:38'),(2338,3,1,'2011-02-28 15:36:36'),(2339,3,2,'2011-02-28 15:36:44'),(2340,3,2,'2011-02-28 15:36:46'),(2341,2,2,'2011-02-28 15:37:14'),(2342,2,2,'2011-02-28 15:37:17'),(2343,2,2,'2011-02-28 15:37:22'),(2344,3,2,'2011-02-28 15:37:48'),(2345,3,1,'2011-02-28 15:38:23'),(2346,3,2,'2011-02-28 15:38:24'),(2347,3,2,'2011-02-28 15:38:25'),(2348,2,2,'2011-02-28 15:54:42'),(2349,2,2,'2011-02-28 15:54:44'),(2350,2,3,'2011-02-28 15:54:55'),(2351,2,4,'2011-02-28 16:13:23'),(2352,2,3,'2011-02-28 16:13:28'),(2353,2,1,'2011-02-28 16:13:35'),(2354,2,1,'2011-02-28 16:13:54'),(2355,2,3,'2011-02-28 16:14:09'),(2356,2,1,'2011-02-28 16:14:13'),(2357,2,1,'2011-02-28 16:14:25'),(2358,2,3,'2011-02-28 16:14:29'),(2359,2,1,'2011-02-28 16:14:32'),(2360,1,4,'2011-02-28 17:14:20'),(2361,1,5,'2011-02-28 17:14:36'),(2362,43,5,'2011-02-28 17:14:36'),(2363,43,1,'2011-02-28 17:16:56'),(2364,43,1,'2011-02-28 17:16:58'),(2365,43,1,'2011-02-28 17:21:02'),(2366,43,2,'2011-02-28 17:21:15'),(2367,43,2,'2011-02-28 17:21:17'),(2368,43,3,'2011-02-28 17:21:38'),(2369,43,1,'2011-02-28 17:21:47'),(2370,43,1,'2011-02-28 17:22:41'),(2371,43,2,'2011-02-28 17:22:43'),(2372,43,2,'2011-02-28 17:22:45'),(2373,43,3,'2011-02-28 17:23:05'),(2374,43,1,'2011-02-28 17:23:12'),(2375,43,1,'2011-02-28 17:24:09'),(2376,43,2,'2011-02-28 17:24:11'),(2377,43,2,'2011-02-28 17:24:13'),(2378,43,1,'2011-02-28 17:24:40'),(2379,43,1,'2011-02-28 17:24:42'),(2380,43,1,'2011-02-28 17:27:50'),(2381,43,1,'2011-02-28 17:29:20'),(2382,43,4,'2011-02-28 17:30:36'),(2383,43,1,'2011-02-28 17:30:46'),(2384,43,1,'2011-02-28 17:30:48'),(2385,43,1,'2011-02-28 17:33:33'),(2386,43,1,'2011-02-28 17:34:46'),(2387,43,1,'2011-02-28 17:34:48'),(2388,43,1,'2011-02-28 17:35:34'),(2389,43,3,'2011-02-28 17:37:29'),(2390,43,1,'2011-02-28 17:37:37'),(2391,43,3,'2011-02-28 17:37:43'),(2392,43,1,'2011-02-28 17:38:11'),(2393,43,3,'2011-02-28 17:39:35'),(2394,43,1,'2011-02-28 17:39:51'),(2395,43,3,'2011-02-28 17:40:03'),(2396,43,4,'2011-02-28 17:43:53'),(2397,1,4,'2011-02-28 21:22:56'),(2398,1,5,'2011-02-28 21:23:14'),(2399,43,5,'2011-02-28 21:23:14'),(2400,43,2,'2011-02-28 21:23:25'),(2401,43,2,'2011-02-28 21:23:32'),(2402,43,3,'2011-02-28 21:24:42'),(2403,43,2,'2011-02-28 21:25:07'),(2404,43,2,'2011-02-28 21:25:09'),(2405,43,2,'2011-02-28 21:25:15'),(2406,43,1,'2011-02-28 21:25:23'),(2407,43,1,'2011-02-28 21:25:26'),(2408,43,6,'2011-02-28 21:34:38'),(2409,1,4,'2011-02-28 21:34:39'),(2410,1,5,'2011-02-28 21:34:52'),(2411,43,5,'2011-02-28 21:34:53'),(2412,43,1,'2011-02-28 21:34:55'),(2413,43,1,'2011-02-28 21:34:58'),(2414,43,3,'2011-02-28 21:35:00'),(2415,43,2,'2011-02-28 21:35:29'),(2416,43,2,'2011-02-28 21:35:31'),(2417,43,1,'2011-02-28 21:35:43'),(2418,43,1,'2011-02-28 21:35:46'),(2419,43,6,'2011-02-28 21:36:04'),(2420,1,4,'2011-02-28 21:36:04'),(2421,1,5,'2011-02-28 21:36:07'),(2422,43,5,'2011-02-28 21:36:08'),(2423,43,1,'2011-02-28 21:36:10'),(2424,43,1,'2011-02-28 21:36:22'),(2425,43,1,'2011-02-28 21:47:22'),(2426,43,2,'2011-02-28 21:47:26'),(2427,43,2,'2011-02-28 21:47:28'),(2428,43,1,'2011-02-28 21:48:13'),(2429,43,1,'2011-02-28 21:48:16'),(2430,43,1,'2011-02-28 21:58:27'),(2431,43,1,'2011-02-28 22:00:22'),(2432,43,1,'2011-02-28 22:00:32'),(2433,1,2,'2011-02-28 22:06:19'),(2434,1,2,'2011-02-28 22:06:22'),(2435,1,2,'2011-02-28 22:07:03'),(2436,1,8,'2011-02-28 22:07:14'),(2437,1,2,'2011-02-28 22:07:32'),(2438,1,4,'2011-02-28 22:07:34'),(2439,43,1,'2011-02-28 22:07:40'),(2440,43,2,'2011-02-28 22:07:43'),(2441,43,2,'2011-02-28 22:07:45'),(2442,1,5,'2011-02-28 22:07:58'),(2443,2,5,'2011-02-28 22:07:58'),(2444,2,1,'2011-02-28 22:08:03'),(2445,2,3,'2011-02-28 22:08:05'),(2446,43,1,'2011-02-28 22:08:06'),(2447,43,1,'2011-02-28 22:08:08'),(2448,2,4,'2011-02-28 22:08:46'),(2449,2,3,'2011-02-28 22:08:52'),(2450,2,1,'2011-02-28 22:08:55'),(2451,2,4,'2011-02-28 22:09:20'),(2452,2,6,'2011-02-28 22:09:28'),(2453,1,4,'2011-02-28 22:09:28'),(2454,1,4,'2011-02-28 22:15:37'),(2455,1,2,'2011-02-28 22:16:31'),(2456,1,2,'2011-02-28 22:16:36'),(2457,1,2,'2011-02-28 22:16:45'),(2458,43,1,'2011-02-28 22:32:05'),(2459,43,1,'2011-02-28 22:32:59'),(2460,43,1,'2011-02-28 22:33:00'),(2461,43,6,'2011-02-28 22:34:00'),(2462,1,4,'2011-02-28 22:34:01'),(2463,1,5,'2011-02-28 22:34:04'),(2464,43,5,'2011-02-28 22:34:05'),(2465,43,1,'2011-02-28 22:34:07'),(2466,43,2,'2011-02-28 22:34:10'),(2467,43,2,'2011-02-28 22:34:17'),(2468,43,1,'2011-02-28 22:34:22'),(2469,43,1,'2011-02-28 22:34:25'),(2470,43,1,'2011-02-28 22:38:06'),(2471,43,1,'2011-02-28 22:39:07'),(2472,43,1,'2011-02-28 22:39:09'),(2473,43,1,'2011-02-28 22:47:38'),(2474,43,1,'2011-02-28 22:47:48'),(2475,43,1,'2011-02-28 22:47:50'),(2476,43,1,'2011-02-28 22:53:49'),(2477,43,1,'2011-02-28 22:53:51'),(2478,43,1,'2011-02-28 22:54:02'),(2479,43,1,'2011-02-28 22:59:33'),(2480,43,1,'2011-02-28 22:59:36'),(2481,43,1,'2011-02-28 22:59:38'),(2482,43,1,'2011-02-28 23:09:42'),(2483,43,3,'2011-02-28 23:09:49'),(2484,43,1,'2011-02-28 23:10:20'),(2485,43,1,'2011-02-28 23:10:43'),(2486,43,1,'2011-02-28 23:10:48'),(2487,43,1,'2011-02-28 23:10:56'),(2488,43,1,'2011-02-28 23:16:48'),(2489,43,1,'2011-02-28 23:16:53'),(2490,43,1,'2011-02-28 23:16:56'),(2491,1,4,'2011-02-28 23:25:00'),(2492,43,1,'2011-02-28 23:25:01'),(2493,1,4,'2011-02-28 23:25:11'),(2494,43,1,'2011-02-28 23:25:13'),(2495,43,1,'2011-02-28 23:25:16'),(2496,1,4,'2011-02-28 23:25:18'),(2497,1,4,'2011-02-28 23:26:49'),(2498,1,5,'2011-02-28 23:27:04'),(2499,43,5,'2011-02-28 23:27:04'),(2500,43,2,'2011-02-28 23:27:07'),(2501,43,2,'2011-02-28 23:27:10'),(2502,43,2,'2011-02-28 23:27:31'),(2503,43,1,'2011-02-28 23:33:06'),(2504,43,1,'2011-02-28 23:33:10'),(2505,43,1,'2011-02-28 23:36:46'),(2506,43,1,'2011-02-28 23:41:54'),(2507,43,1,'2011-02-28 23:41:58'),(2508,43,1,'2011-02-28 23:42:00'),(2509,1,4,'2011-02-28 23:43:17'),(2510,1,5,'2011-02-28 23:43:32'),(2511,43,5,'2011-02-28 23:43:33'),(2512,43,2,'2011-02-28 23:43:38'),(2513,1,4,'2011-02-28 23:43:38'),(2514,43,2,'2011-02-28 23:43:40'),(2515,43,3,'2011-02-28 23:45:57'),(2516,43,1,'2011-02-28 23:46:04'),(2517,43,1,'2011-02-28 23:46:26'),(2518,43,2,'2011-02-28 23:46:33'),(2519,43,3,'2011-02-28 23:46:42'),(2520,43,1,'2011-02-28 23:46:53'),(2521,43,1,'2011-02-28 23:47:21'),(2522,43,3,'2011-02-28 23:47:24'),(2523,43,1,'2011-02-28 23:47:36'),(2524,43,1,'2011-02-28 23:47:36'),(2525,43,1,'2011-02-28 23:47:51'),(2526,43,3,'2011-02-28 23:48:07'),(2527,43,1,'2011-02-28 23:48:14'),(2528,43,1,'2011-02-28 23:48:27'),(2529,43,3,'2011-02-28 23:48:31'),(2530,43,1,'2011-02-28 23:48:48'),(2531,43,1,'2011-02-28 23:49:19'),(2532,43,2,'2011-02-28 23:49:28'),(2533,43,1,'2011-02-28 23:49:48'),(2534,43,1,'2011-02-28 23:49:50'),(2535,43,1,'2011-02-28 23:53:38'),(2536,43,1,'2011-02-28 23:53:46'),(2537,43,1,'2011-02-28 23:53:50'),(2538,43,1,'2011-03-01 00:13:56'),(2539,43,1,'2011-03-01 00:14:05'),(2540,43,1,'2011-03-01 00:14:08'),(2541,43,1,'2011-03-01 00:19:55'),(2542,43,1,'2011-03-01 00:20:00'),(2543,43,1,'2011-03-01 00:20:01'),(2544,43,1,'2011-03-01 00:26:09'),(2545,43,3,'2011-03-01 00:26:12'),(2546,43,1,'2011-03-01 00:26:40'),(2547,43,1,'2011-03-01 00:26:44'),(2548,43,1,'2011-03-01 00:30:25'),(2549,43,1,'2011-03-01 00:30:28'),(2550,43,1,'2011-03-01 00:31:28'),(2551,43,1,'2011-03-01 00:35:28'),(2552,43,1,'2011-03-01 00:35:36'),(2553,43,1,'2011-03-01 00:35:38'),(2554,43,1,'2011-03-01 00:37:50'),(2555,43,1,'2011-03-01 00:38:00'),(2556,43,1,'2011-03-01 00:38:01'),(2557,43,1,'2011-03-01 00:41:21'),(2558,43,1,'2011-03-01 00:41:24'),(2559,43,1,'2011-03-01 00:41:26'),(2560,43,1,'2011-03-01 00:44:19'),(2561,43,1,'2011-03-01 00:44:23'),(2562,43,1,'2011-03-01 00:44:26'),(2563,43,2,'2011-03-01 00:47:07'),(2564,43,1,'2011-03-01 00:49:39'),(2565,43,3,'2011-03-01 00:49:42'),(2566,43,1,'2011-03-01 00:49:52'),(2567,43,1,'2011-03-01 00:50:07'),(2568,43,1,'2011-03-01 00:50:14'),(2569,43,1,'2011-03-01 00:50:16'),(2570,43,1,'2011-03-01 00:55:25'),(2571,43,1,'2011-03-01 00:55:28'),(2572,43,1,'2011-03-01 00:55:36'),(2573,43,1,'2011-03-01 01:01:22'),(2574,43,1,'2011-03-01 01:01:25'),(2575,43,1,'2011-03-01 01:01:30'),(2576,43,1,'2011-03-01 01:06:43'),(2577,43,1,'2011-03-01 01:06:50'),(2578,43,1,'2011-03-01 01:06:53'),(2579,43,1,'2011-03-01 01:11:28'),(2580,43,1,'2011-03-01 01:13:56'),(2581,43,1,'2011-03-01 01:14:07'),(2582,43,1,'2011-03-01 01:18:35'),(2583,43,1,'2011-03-01 01:18:37'),(2584,43,1,'2011-03-01 01:18:40'),(2585,43,1,'2011-03-01 01:23:22'),(2586,43,1,'2011-03-01 01:23:29'),(2587,43,1,'2011-03-01 01:23:33'),(2588,43,1,'2011-03-01 01:27:44'),(2589,43,3,'2011-03-01 01:28:37'),(2590,43,1,'2011-03-01 01:28:42'),(2591,43,1,'2011-03-01 01:29:50'),(2592,43,1,'2011-03-01 01:29:54'),(2593,43,1,'2011-03-01 01:29:55'),(2594,43,2,'2011-03-01 01:30:11'),(2595,43,1,'2011-03-01 01:36:01'),(2596,43,1,'2011-03-01 01:36:08'),(2597,43,1,'2011-03-01 01:36:10'),(2598,1,4,'2011-03-01 01:38:04'),(2599,43,1,'2011-03-01 01:39:42'),(2600,43,1,'2011-03-01 01:39:51'),(2601,43,1,'2011-03-01 01:39:52'),(2602,43,1,'2011-03-01 01:44:52'),(2603,43,1,'2011-03-01 01:44:57'),(2604,43,1,'2011-03-01 01:44:58'),(2605,43,1,'2011-03-01 01:48:02'),(2606,43,2,'2011-03-01 01:48:05'),(2607,43,2,'2011-03-01 01:48:07'),(2608,1,4,'2011-03-01 02:27:09'),(2609,1,5,'2011-03-01 02:27:18'),(2610,43,5,'2011-03-01 02:27:19'),(2611,43,3,'2011-03-01 02:27:23'),(2612,43,1,'2011-03-01 02:27:28'),(2613,43,2,'2011-03-01 02:28:28'),(2614,43,2,'2011-03-01 02:28:32'),(2615,43,3,'2011-03-01 02:28:35'),(2616,43,1,'2011-03-01 02:28:40'),(2617,43,6,'2011-03-01 02:28:56'),(2618,1,4,'2011-03-01 02:28:56'),(2619,43,2,'2011-03-01 03:21:58'),(2620,43,2,'2011-03-01 03:22:05'),(2621,1,4,'2011-03-01 12:45:47'),(2622,1,4,'2011-03-01 12:46:25'),(2623,1,4,'2011-03-01 12:46:44'),(2624,1,5,'2011-03-01 12:46:47'),(2625,2,5,'2011-03-01 12:46:47'),(2626,2,2,'2011-03-01 12:47:02'),(2627,2,2,'2011-03-01 12:47:04'),(2628,2,1,'2011-03-01 12:47:33'),(2629,2,1,'2011-03-01 12:47:35'),(2630,2,2,'2011-03-01 12:47:49'),(2631,2,2,'2011-03-01 12:47:51'),(2632,2,4,'2011-03-01 12:47:55'),(2633,2,2,'2011-03-01 12:47:58'),(2634,2,6,'2011-03-01 12:48:05'),(2635,1,4,'2011-03-01 12:48:05'),(2636,1,4,'2011-03-01 12:50:44'),(2637,1,4,'2011-03-01 12:52:48'),(2638,1,5,'2011-03-01 12:52:56'),(2639,1,5,'2011-03-01 12:53:41'),(2640,1,5,'2011-03-01 12:53:54'),(2641,1,5,'2011-03-01 12:54:01'),(2642,1,5,'2011-03-01 12:54:07'),(2643,1,8,'2011-03-01 12:54:19'),(2644,1,8,'2011-03-01 12:54:24'),(2645,1,8,'2011-03-01 12:54:25'),(2646,1,4,'2011-03-01 12:55:06'),(2647,1,5,'2011-03-01 12:55:08'),(2648,2,5,'2011-03-01 12:55:08'),(2649,2,9,'2011-03-01 12:55:09'),(2650,2,9,'2011-03-01 12:55:51'),(2651,2,2,'2011-03-01 12:56:01'),(2652,2,2,'2011-03-01 12:56:02'),(2653,2,2,'2011-03-01 12:56:04'),(2654,1,4,'2011-03-01 13:05:09'),(2655,1,5,'2011-03-01 13:05:23'),(2656,45,5,'2011-03-01 13:05:23'),(2657,45,1,'2011-03-01 13:06:01'),(2658,45,1,'2011-03-01 13:06:03'),(2659,45,2,'2011-03-01 13:14:45'),(2660,45,2,'2011-03-01 13:14:47'),(2661,45,3,'2011-03-01 13:16:30'),(2662,45,1,'2011-03-01 13:16:33'),(2663,45,6,'2011-03-01 13:17:01'),(2664,1,4,'2011-03-01 13:17:01'),(2665,1,4,'2011-03-01 14:16:52'),(2666,1,4,'2011-03-01 14:23:55'),(2667,1,2,'2011-03-01 14:24:54'),(2668,1,8,'2011-03-01 14:33:09'),(2669,1,4,'2011-03-01 14:38:52'),(2670,1,5,'2011-03-01 14:39:04'),(2671,43,5,'2011-03-01 14:39:04'),(2672,43,3,'2011-03-01 14:39:07'),(2673,43,1,'2011-03-01 14:39:17'),(2674,43,3,'2011-03-01 14:39:33'),(2675,43,1,'2011-03-01 14:49:46'),(2676,43,1,'2011-03-01 14:49:50'),(2677,43,6,'2011-03-01 15:08:38'),(2678,1,4,'2011-03-01 15:08:38'),(2679,1,2,'2011-03-01 15:08:44'),(2680,1,2,'2011-03-01 15:08:46'),(2681,1,2,'2011-03-01 15:08:52'),(2682,1,5,'2011-03-01 15:09:02'),(2683,43,5,'2011-03-01 15:09:02'),(2684,43,3,'2011-03-01 15:09:05'),(2685,43,1,'2011-03-01 15:09:24'),(2686,43,1,'2011-03-01 15:09:25'),(2687,43,1,'2011-03-01 15:11:52'),(2688,43,3,'2011-03-01 15:11:57'),(2689,43,1,'2011-03-01 15:12:17'),(2690,43,1,'2011-03-01 15:13:57'),(2691,1,4,'2011-03-01 15:21:56'),(2692,1,5,'2011-03-01 15:22:29'),(2693,1,8,'2011-03-01 15:22:56'),(2694,1,5,'2011-03-01 15:23:16'),(2695,1,4,'2011-03-01 15:27:49'),(2696,1,2,'2011-03-01 15:27:54'),(2697,1,2,'2011-03-01 15:28:00'),(2698,1,2,'2011-03-01 15:28:37'),(2699,1,2,'2011-03-01 15:28:53'),(2700,1,2,'2011-03-01 15:28:57'),(2701,1,4,'2011-03-01 15:31:00'),(2702,1,4,'2011-03-01 15:31:36'),(2703,1,2,'2011-03-01 15:32:08'),(2704,1,2,'2011-03-01 15:32:11'),(2705,43,1,'2011-03-01 15:34:14'),(2706,43,1,'2011-03-01 15:34:18'),(2707,43,1,'2011-03-01 15:34:20'),(2708,1,2,'2011-03-01 15:36:08'),(2709,43,1,'2011-03-01 15:58:17'),(2710,43,1,'2011-03-01 15:58:20'),(2711,43,1,'2011-03-01 15:58:22'),(2712,43,1,'2011-03-01 16:06:02'),(2713,43,3,'2011-03-01 16:06:05'),(2714,43,1,'2011-03-01 16:06:12'),(2715,43,1,'2011-03-01 16:10:36'),(2716,43,3,'2011-03-01 16:10:39'),(2717,43,1,'2011-03-01 16:11:00'),(2718,43,1,'2011-03-01 16:11:29'),(2719,43,3,'2011-03-01 16:11:32'),(2720,43,1,'2011-03-01 16:11:48'),(2721,43,1,'2011-03-01 16:12:03'),(2722,43,3,'2011-03-01 16:12:05'),(2723,43,1,'2011-03-01 16:12:10'),(2724,43,1,'2011-03-01 16:12:21'),(2725,43,3,'2011-03-01 16:13:22'),(2726,43,1,'2011-03-01 16:13:24'),(2727,43,1,'2011-03-01 16:13:33'),(2728,43,1,'2011-03-01 16:14:29'),(2729,43,1,'2011-03-01 16:14:31'),(2730,43,1,'2011-03-01 16:37:37'),(2731,43,1,'2011-03-01 16:39:29'),(2732,43,1,'2011-03-01 16:39:31'),(2733,43,1,'2011-03-01 16:50:08'),(2734,43,3,'2011-03-01 16:50:11'),(2735,43,1,'2011-03-01 16:50:13'),(2736,43,1,'2011-03-01 16:50:36'),(2737,43,3,'2011-03-01 16:50:39'),(2738,43,1,'2011-03-01 16:50:43'),(2739,43,1,'2011-03-01 16:51:46'),(2740,43,3,'2011-03-01 16:51:49'),(2741,43,1,'2011-03-01 16:51:56'),(2742,43,1,'2011-03-01 16:55:38'),(2743,43,6,'2011-03-01 16:55:41'),(2744,1,4,'2011-03-01 16:55:41'),(2745,1,4,'2011-03-01 17:59:51'),(2746,1,4,'2011-03-01 21:29:56'),(2747,1,4,'2011-03-01 21:30:16'),(2748,1,2,'2011-03-01 21:30:19'),(2749,1,2,'2011-03-01 21:30:30'),(2750,1,4,'2011-03-02 12:18:10'),(2751,1,4,'2011-03-02 13:37:21'),(2752,1,4,'2011-03-02 15:18:12'),(2753,1,5,'2011-03-02 15:18:26'),(2754,43,5,'2011-03-02 15:18:26'),(2755,43,3,'2011-03-02 15:20:54'),(2756,43,1,'2011-03-02 15:21:45'),(2757,43,3,'2011-03-02 15:21:49'),(2758,1,4,'2011-03-02 15:27:51'),(2759,1,5,'2011-03-02 15:27:58'),(2760,43,5,'2011-03-02 15:27:58'),(2761,43,1,'2011-03-02 15:28:03'),(2762,43,1,'2011-03-02 15:28:07'),(2763,43,1,'2011-03-02 16:03:09'),(2764,43,3,'2011-03-02 16:03:14'),(2765,43,1,'2011-03-02 16:14:59'),(2766,43,1,'2011-03-02 16:15:23'),(2767,43,1,'2011-03-02 16:16:39'),(2768,43,4,'2011-03-02 16:26:53'),(2769,1,4,'2011-03-02 16:39:31'),(2770,43,1,'2011-03-02 16:59:18'),(2771,43,1,'2011-03-02 16:59:23'),(2772,43,3,'2011-03-02 16:59:26'),(2773,1,2,'2011-03-02 18:04:53'),(2774,1,4,'2011-03-02 18:26:27'),(2775,1,8,'2011-03-02 19:27:13'),(2776,43,3,'2011-03-02 22:57:58'),(2777,43,2,'2011-03-02 22:58:07'),(2778,43,3,'2011-03-02 22:58:12'),(2779,43,2,'2011-03-02 22:58:29'),(2780,43,2,'2011-03-02 22:58:31'),(2781,43,4,'2011-03-02 22:58:47'),(2782,43,1,'2011-03-02 23:14:05'),(2783,43,1,'2011-03-02 23:14:07'),(2784,43,3,'2011-03-02 23:14:12'),(2785,43,1,'2011-03-02 23:14:21'),(2786,43,1,'2011-03-02 23:14:23'),(2787,43,6,'2011-03-02 23:14:28'),(2788,1,4,'2011-03-02 23:14:28'),(2789,1,5,'2011-03-02 23:14:35'),(2790,43,5,'2011-03-02 23:14:35'),(2791,43,1,'2011-03-02 23:14:38'),(2792,43,1,'2011-03-02 23:14:39'),(2793,43,3,'2011-03-02 23:14:43'),(2794,43,1,'2011-03-02 23:14:55'),(2795,43,1,'2011-03-02 23:14:57'),(2796,43,1,'2011-03-02 23:31:21'),(2797,43,3,'2011-03-02 23:31:32'),(2798,43,1,'2011-03-02 23:32:50'),(2799,43,1,'2011-03-02 23:32:52'),(2800,43,1,'2011-03-03 00:02:24'),(2801,43,3,'2011-03-03 00:02:33'),(2802,43,1,'2011-03-03 00:03:12'),(2803,43,3,'2011-03-03 00:03:16'),(2804,43,1,'2011-03-03 00:03:21'),(2805,43,3,'2011-03-03 00:03:25'),(2806,43,1,'2011-03-03 00:03:30'),(2807,43,3,'2011-03-03 00:03:33'),(2808,43,1,'2011-03-03 00:09:31'),(2809,43,1,'2011-03-03 00:09:33'),(2810,43,1,'2011-03-03 00:27:48'),(2811,43,3,'2011-03-03 00:27:52'),(2812,43,1,'2011-03-03 00:27:55'),(2813,43,1,'2011-03-03 00:44:36'),(2814,43,3,'2011-03-03 00:44:40'),(2815,43,1,'2011-03-03 00:44:58'),(2816,43,1,'2011-03-03 00:45:01'),(2817,43,3,'2011-03-03 00:45:45'),(2818,1,4,'2011-03-03 01:25:10'),(2819,43,3,'2011-03-03 01:30:02'),(2820,43,1,'2011-03-03 01:30:12'),(2821,43,1,'2011-03-03 01:30:14'),(2822,43,1,'2011-03-03 01:49:26'),(2823,43,3,'2011-03-03 01:49:30'),(2824,43,1,'2011-03-03 02:14:33'),(2825,43,1,'2011-03-03 02:14:35'),(2826,43,1,'2011-03-03 02:43:26'),(2827,43,3,'2011-03-03 02:43:29'),(2828,43,1,'2011-03-03 02:45:48'),(2829,43,2,'2011-03-03 02:45:55'),(2830,43,2,'2011-03-03 02:45:58'),(2831,43,3,'2011-03-03 02:46:02'),(2832,43,1,'2011-03-03 02:51:21'),(2833,43,1,'2011-03-03 02:51:22'),(2834,43,1,'2011-03-03 03:32:02'),(2835,43,1,'2011-03-03 03:32:06'),(2836,43,1,'2011-03-03 03:32:08'),(2837,43,3,'2011-03-03 03:41:20'),(2838,43,1,'2011-03-03 03:41:30'),(2839,43,1,'2011-03-03 03:42:23'),(2840,43,3,'2011-03-03 03:42:29'),(2841,43,1,'2011-03-03 03:42:35'),(2842,43,1,'2011-03-03 03:57:48'),(2843,43,1,'2011-03-03 04:16:56'),(2844,43,3,'2011-03-03 04:17:02'),(2845,43,1,'2011-03-03 04:17:34'),(2846,43,1,'2011-03-03 04:18:52'),(2847,43,1,'2011-03-03 04:37:08'),(2848,43,1,'2011-03-03 04:37:11'),(2849,43,3,'2011-03-03 04:37:13'),(2850,1,4,'2011-03-03 10:30:07'),(2851,1,4,'2011-03-03 10:30:09'),(2852,1,2,'2011-03-03 10:30:09'),(2853,1,8,'2011-03-03 10:30:09'),(2854,1,4,'2011-03-03 12:29:24'),(2855,1,4,'2011-03-03 12:32:03'),(2856,1,5,'2011-03-03 12:32:07'),(2857,2,5,'2011-03-03 12:32:07'),(2858,2,2,'2011-03-03 12:32:08'),(2859,2,2,'2011-03-03 12:32:10'),(2860,2,2,'2011-03-03 12:32:36'),(2861,2,2,'2011-03-03 12:32:38'),(2862,2,2,'2011-03-03 12:32:49'),(2863,2,3,'2011-03-03 12:33:58'),(2864,2,1,'2011-03-03 12:34:04'),(2865,2,1,'2011-03-03 12:34:16'),(2866,2,2,'2011-03-03 12:34:26'),(2867,2,2,'2011-03-03 12:34:27'),(2868,43,3,'2011-03-03 13:13:42'),(2869,43,6,'2011-03-03 13:13:51'),(2870,1,4,'2011-03-03 13:13:51'),(2871,1,4,'2011-03-03 15:49:19'),(2872,1,4,'2011-03-03 15:58:37'),(2873,2,2,'2011-03-03 16:14:51'),(2874,2,2,'2011-03-03 16:15:02'),(2875,1,4,'2011-03-03 18:23:52'),(2876,1,5,'2011-03-03 18:24:10'),(2877,43,5,'2011-03-03 18:24:39'),(2878,43,5,'2011-03-03 18:24:39'),(2879,43,1,'2011-03-03 18:24:43'),(2880,43,1,'2011-03-03 18:24:45'),(2881,43,2,'2011-03-03 18:28:04'),(2882,43,2,'2011-03-03 18:28:06'),(2883,43,2,'2011-03-03 18:28:32'),(2884,43,1,'2011-03-03 18:28:35'),(2885,43,1,'2011-03-03 18:37:31'),(2886,43,1,'2011-03-03 18:37:34'),(2887,43,1,'2011-03-03 18:37:36'),(2888,43,1,'2011-03-03 18:54:34'),(2889,43,1,'2011-03-03 18:54:58'),(2890,43,1,'2011-03-03 18:54:59'),(2891,43,1,'2011-03-03 18:55:01'),(2892,43,1,'2011-03-03 18:55:02'),(2893,43,1,'2011-03-03 19:03:50'),(2894,43,1,'2011-03-03 19:04:28'),(2895,43,1,'2011-03-03 19:04:30'),(2896,43,3,'2011-03-03 19:04:55'),(2897,43,1,'2011-03-03 19:05:25'),(2898,43,1,'2011-03-03 19:05:41'),(2899,43,1,'2011-03-03 19:05:45'),(2900,43,1,'2011-03-03 19:05:55'),(2901,43,6,'2011-03-03 19:08:21'),(2902,1,4,'2011-03-03 19:08:21'),(2903,1,5,'2011-03-03 19:08:30'),(2904,43,5,'2011-03-03 19:08:31'),(2905,43,1,'2011-03-03 19:08:36'),(2906,43,1,'2011-03-03 19:08:39'),(2907,43,1,'2011-03-03 19:17:15'),(2908,43,1,'2011-03-03 19:17:17'),(2909,43,1,'2011-03-03 19:17:30'),(2910,43,1,'2011-03-03 19:30:20'),(2911,43,1,'2011-03-03 19:30:30'),(2912,43,1,'2011-03-03 19:30:31'),(2913,43,1,'2011-03-03 19:30:58'),(2914,43,3,'2011-03-03 19:30:58'),(2915,43,1,'2011-03-03 19:31:03'),(2916,43,1,'2011-03-03 19:31:31'),(2917,43,1,'2011-03-03 19:31:33'),(2918,1,4,'2011-03-03 19:31:38'),(2919,43,1,'2011-03-03 19:31:43'),(2920,1,5,'2011-03-03 19:31:46'),(2921,43,5,'2011-03-03 19:31:46'),(2922,43,1,'2011-03-03 19:31:50'),(2923,43,1,'2011-03-03 19:31:52'),(2924,43,2,'2011-03-03 19:32:00'),(2925,43,2,'2011-03-03 19:32:02'),(2926,43,6,'2011-03-03 19:34:02'),(2927,1,4,'2011-03-03 19:34:03'),(2928,1,5,'2011-03-03 19:34:10'),(2929,43,5,'2011-03-03 19:34:11'),(2930,43,1,'2011-03-03 19:34:15'),(2931,43,3,'2011-03-03 19:34:46'),(2932,43,1,'2011-03-03 19:35:02'),(2933,43,3,'2011-03-03 19:35:26'),(2934,43,1,'2011-03-03 19:35:48'),(2935,43,3,'2011-03-03 19:36:20'),(2936,43,1,'2011-03-03 19:36:22'),(2937,43,3,'2011-03-03 19:36:28'),(2938,43,1,'2011-03-03 19:36:29'),(2939,43,3,'2011-03-03 19:36:46'),(2940,43,1,'2011-03-03 19:36:48'),(2941,43,3,'2011-03-03 19:36:59'),(2942,43,1,'2011-03-03 19:44:00'),(2943,43,1,'2011-03-03 19:44:03'),(2944,43,1,'2011-03-03 19:52:17'),(2945,43,1,'2011-03-03 19:55:23'),(2946,43,1,'2011-03-03 19:55:25'),(2947,43,1,'2011-03-03 20:19:52'),(2948,43,1,'2011-03-03 20:19:55'),(2949,43,1,'2011-03-03 20:19:56'),(2950,43,1,'2011-03-03 20:34:42'),(2951,43,1,'2011-03-03 20:35:02'),(2952,43,1,'2011-03-03 20:35:04'),(2953,1,2,'2011-03-03 20:35:43'),(2954,1,2,'2011-03-03 20:35:45'),(2955,1,2,'2011-03-03 20:36:09'),(2956,1,2,'2011-03-03 20:36:11'),(2957,1,4,'2011-03-03 20:51:04'),(2958,1,2,'2011-03-03 20:51:05'),(2959,1,5,'2011-03-03 20:51:16'),(2960,43,5,'2011-03-03 20:51:16'),(2961,43,1,'2011-03-03 20:51:19'),(2962,43,1,'2011-03-03 20:51:21'),(2963,43,6,'2011-03-03 20:53:21'),(2964,1,4,'2011-03-03 20:53:21'),(2965,1,5,'2011-03-03 20:53:36'),(2966,43,5,'2011-03-03 20:53:37'),(2967,43,3,'2011-03-03 20:53:39'),(2968,43,1,'2011-03-03 20:54:01'),(2969,43,1,'2011-03-03 20:54:04'),(2970,43,1,'2011-03-03 20:56:32'),(2971,43,1,'2011-03-03 20:56:36'),(2972,43,1,'2011-03-03 20:56:39'),(2973,43,6,'2011-03-03 20:59:31'),(2974,1,4,'2011-03-03 20:59:31'),(2975,1,5,'2011-03-03 20:59:36'),(2976,43,5,'2011-03-03 20:59:36'),(2977,43,1,'2011-03-03 20:59:37'),(2978,43,1,'2011-03-03 20:59:39'),(2979,2,4,'2011-03-03 21:03:50'),(2980,43,1,'2011-03-03 21:08:10'),(2981,1,4,'2011-03-03 21:26:21'),(2982,1,5,'2011-03-03 21:33:37'),(2983,43,5,'2011-03-03 21:33:38'),(2984,43,2,'2011-03-03 21:33:40'),(2985,43,2,'2011-03-03 21:33:42'),(2986,43,1,'2011-03-03 21:37:22'),(2987,43,1,'2011-03-03 21:37:26'),(2988,43,1,'2011-03-03 21:37:42'),(2989,43,1,'2011-03-03 22:01:34'),(2990,43,1,'2011-03-03 22:01:37'),(2991,43,1,'2011-03-03 22:01:41'),(2992,43,1,'2011-03-03 22:43:50'),(2993,43,3,'2011-03-03 22:43:55'),(2994,43,1,'2011-03-03 22:44:09'),(2995,43,6,'2011-03-03 22:49:49'),(2996,1,4,'2011-03-03 22:49:49'),(2997,1,5,'2011-03-03 22:50:12'),(2998,43,5,'2011-03-03 22:50:13'),(2999,43,3,'2011-03-03 22:50:16'),(3000,43,1,'2011-03-03 22:50:19'),(3001,43,1,'2011-03-03 22:52:33'),(3002,43,3,'2011-03-03 22:52:38'),(3003,43,1,'2011-03-03 22:52:46'),(3004,43,1,'2011-03-03 22:56:52'),(3005,43,3,'2011-03-03 22:57:31'),(3006,43,1,'2011-03-03 22:57:34'),(3007,43,1,'2011-03-03 23:00:17'),(3008,43,3,'2011-03-03 23:00:21'),(3009,43,1,'2011-03-03 23:00:28'),(3010,43,3,'2011-03-03 23:00:41'),(3011,43,1,'2011-03-03 23:00:59'),(3012,43,3,'2011-03-03 23:03:51'),(3013,43,1,'2011-03-03 23:04:20'),(3014,43,1,'2011-03-03 23:04:51'),(3015,43,3,'2011-03-03 23:04:57'),(3016,43,1,'2011-03-03 23:05:05'),(3017,43,1,'2011-03-03 23:09:09'),(3018,43,1,'2011-03-03 23:09:57'),(3019,43,1,'2011-03-03 23:09:59'),(3020,1,4,'2011-03-03 23:22:00'),(3021,1,5,'2011-03-03 23:22:08'),(3022,43,5,'2011-03-03 23:22:08'),(3023,43,2,'2011-03-03 23:22:09'),(3024,43,2,'2011-03-03 23:22:11'),(3025,43,3,'2011-03-03 23:22:58'),(3026,43,1,'2011-03-03 23:30:18'),(3027,43,2,'2011-03-03 23:31:48'),(3028,43,2,'2011-03-03 23:31:52'),(3029,43,3,'2011-03-03 23:32:49'),(3030,43,1,'2011-03-03 23:34:51'),(3031,43,4,'2011-03-03 23:39:17'),(3032,43,1,'2011-03-03 23:39:28'),(3033,43,1,'2011-03-03 23:39:30'),(3034,1,4,'2011-03-03 23:50:39'),(3035,43,3,'2011-03-03 23:51:34'),(3036,43,1,'2011-03-03 23:51:50'),(3037,43,3,'2011-03-03 23:53:20'),(3038,43,1,'2011-03-03 23:53:27'),(3039,43,3,'2011-03-03 23:53:50'),(3040,43,1,'2011-03-03 23:53:58'),(3041,43,3,'2011-03-03 23:55:12'),(3042,43,1,'2011-03-03 23:55:28'),(3043,43,3,'2011-03-04 00:00:33'),(3044,43,1,'2011-03-04 00:00:44'),(3045,43,1,'2011-03-04 00:01:30'),(3046,43,2,'2011-03-04 00:01:33'),(3047,43,2,'2011-03-04 00:01:36'),(3048,43,3,'2011-03-04 00:02:04'),(3049,43,1,'2011-03-04 00:02:09'),(3050,43,1,'2011-03-04 00:05:16'),(3051,43,3,'2011-03-04 00:05:21'),(3052,43,1,'2011-03-04 00:05:46'),(3053,43,1,'2011-03-04 00:07:26'),(3054,43,3,'2011-03-04 00:08:42'),(3055,43,1,'2011-03-04 00:08:51'),(3056,43,2,'2011-03-04 00:11:02'),(3057,43,2,'2011-03-04 00:11:05'),(3058,43,3,'2011-03-04 00:11:21'),(3059,43,1,'2011-03-04 00:11:37'),(3060,43,3,'2011-03-04 00:13:34'),(3061,43,1,'2011-03-04 00:13:45'),(3062,43,1,'2011-03-04 00:14:22'),(3063,43,1,'2011-03-04 00:14:24'),(3064,43,3,'2011-03-04 00:16:11'),(3065,43,1,'2011-03-04 00:16:21'),(3066,43,1,'2011-03-04 00:25:26'),(3067,43,1,'2011-03-04 00:27:46'),(3068,43,1,'2011-03-04 00:27:48'),(3069,43,1,'2011-03-04 00:40:10'),(3070,43,2,'2011-03-04 00:40:13'),(3071,43,2,'2011-03-04 00:40:15'),(3072,43,1,'2011-03-04 00:43:07'),(3073,43,1,'2011-03-04 00:43:09'),(3074,43,3,'2011-03-04 00:44:01'),(3075,43,1,'2011-03-04 00:44:07'),(3076,43,3,'2011-03-04 00:44:13'),(3077,43,1,'2011-03-04 00:48:52'),(3078,43,2,'2011-03-04 00:49:52'),(3079,43,2,'2011-03-04 00:49:54'),(3080,43,1,'2011-03-04 00:51:36'),(3081,43,1,'2011-03-04 00:51:38'),(3082,43,1,'2011-03-04 01:01:20'),(3083,43,2,'2011-03-04 01:02:13'),(3084,43,2,'2011-03-04 01:02:16'),(3085,1,2,'2011-03-04 05:59:45'),(3086,1,8,'2011-03-04 06:39:35'),(3087,43,2,'2011-03-04 09:15:12'),(3088,43,2,'2011-03-04 09:15:36'),(3089,43,2,'2011-03-04 09:16:14'),(3090,43,2,'2011-03-04 09:16:58'),(3091,43,1,'2011-03-04 09:18:21'),(3092,43,1,'2011-03-04 09:18:36'),(3093,1,4,'2011-03-04 09:47:03'),(3094,1,5,'2011-03-04 09:47:38'),(3095,44,5,'2011-03-04 09:47:38'),(3096,44,1,'2011-03-04 09:47:51'),(3097,44,1,'2011-03-04 09:47:54'),(3098,44,1,'2011-03-04 09:49:34'),(3099,44,3,'2011-03-04 09:49:38'),(3100,44,1,'2011-03-04 09:49:48'),(3101,44,1,'2011-03-04 09:49:50'),(3102,44,1,'2011-03-04 09:49:58'),(3103,44,3,'2011-03-04 09:50:09'),(3104,44,1,'2011-03-04 09:50:59'),(3105,44,1,'2011-03-04 09:56:17'),(3106,44,3,'2011-03-04 09:56:24'),(3107,44,1,'2011-03-04 09:56:26'),(3108,44,3,'2011-03-04 09:58:23'),(3109,44,1,'2011-03-04 09:58:37'),(3110,44,1,'2011-03-04 10:01:12'),(3111,44,3,'2011-03-04 10:01:17'),(3112,44,1,'2011-03-04 10:01:23'),(3113,1,4,'2011-03-04 10:14:43'),(3114,1,5,'2011-03-04 10:15:01'),(3115,43,5,'2011-03-04 10:15:02'),(3116,43,2,'2011-03-04 10:15:09'),(3117,43,2,'2011-03-04 10:15:12'),(3118,43,1,'2011-03-04 10:25:27'),(3119,43,1,'2011-03-04 10:26:06'),(3120,43,1,'2011-03-04 10:26:06'),(3121,43,1,'2011-03-04 10:26:10'),(3122,43,1,'2011-03-04 10:31:57'),(3123,43,2,'2011-03-04 10:32:21'),(3124,43,2,'2011-03-04 10:32:24'),(3125,43,3,'2011-03-04 10:32:47'),(3126,43,1,'2011-03-04 10:32:57'),(3127,43,1,'2011-03-04 10:36:26'),(3128,43,2,'2011-03-04 10:36:31'),(3129,43,2,'2011-03-04 10:36:34'),(3130,43,2,'2011-03-04 10:36:43'),(3131,43,3,'2011-03-04 10:36:45'),(3132,43,1,'2011-03-04 10:36:48'),(3133,43,1,'2011-03-04 10:43:18'),(3134,43,1,'2011-03-04 10:44:18'),(3135,43,1,'2011-03-04 10:44:24'),(3136,1,4,'2011-03-04 10:50:43'),(3137,1,5,'2011-03-04 10:50:48'),(3138,3,5,'2011-03-04 10:50:48'),(3139,3,2,'2011-03-04 10:50:51'),(3140,3,2,'2011-03-04 10:50:52'),(3141,3,2,'2011-03-04 10:51:03'),(3142,43,1,'2011-03-04 10:51:58'),(3143,43,1,'2011-03-04 10:52:02'),(3144,3,3,'2011-03-04 10:53:00'),(3145,3,2,'2011-03-04 10:53:42'),(3146,3,2,'2011-03-04 10:53:43'),(3147,3,2,'2011-03-04 10:53:51'),(3148,3,2,'2011-03-04 10:53:54'),(3149,43,1,'2011-03-04 10:54:26'),(3150,3,3,'2011-03-04 10:55:33'),(3151,1,4,'2011-03-04 11:01:02'),(3152,43,1,'2011-03-04 11:01:03'),(3153,43,2,'2011-03-04 11:01:06'),(3154,1,5,'2011-03-04 11:01:14'),(3155,44,5,'2011-03-04 11:01:14'),(3156,3,1,'2011-03-04 11:01:16'),(3157,3,1,'2011-03-04 11:01:18'),(3158,44,3,'2011-03-04 11:01:19'),(3159,44,1,'2011-03-04 11:01:24'),(3160,43,3,'2011-03-04 11:01:46'),(3161,43,1,'2011-03-04 11:01:52'),(3162,1,4,'2011-03-04 11:02:05'),(3163,3,3,'2011-03-04 11:02:11'),(3164,3,1,'2011-03-04 11:02:14'),(3165,1,5,'2011-03-04 11:02:33'),(3166,1,5,'2011-03-04 11:03:02'),(3167,43,5,'2011-03-04 11:03:02'),(3168,43,3,'2011-03-04 11:03:08'),(3169,3,3,'2011-03-04 11:03:10'),(3170,43,1,'2011-03-04 11:03:13'),(3171,3,1,'2011-03-04 11:03:23'),(3172,1,4,'2011-03-04 11:05:46'),(3173,1,5,'2011-03-04 11:06:03'),(3174,43,5,'2011-03-04 11:06:04'),(3175,43,2,'2011-03-04 11:06:09'),(3176,43,2,'2011-03-04 11:06:11'),(3177,43,3,'2011-03-04 11:06:50'),(3178,43,1,'2011-03-04 11:07:04'),(3179,43,3,'2011-03-04 11:07:35'),(3180,43,1,'2011-03-04 11:07:37'),(3181,43,3,'2011-03-04 11:07:49'),(3182,43,1,'2011-03-04 11:09:13'),(3183,43,1,'2011-03-04 11:09:15'),(3184,43,1,'2011-03-04 11:09:23'),(3185,43,1,'2011-03-04 11:09:25'),(3186,43,2,'2011-03-04 11:09:29'),(3187,43,2,'2011-03-04 11:09:31'),(3188,43,3,'2011-03-04 11:09:40'),(3189,43,1,'2011-03-04 11:10:14'),(3190,43,1,'2011-03-04 11:10:17'),(3191,43,1,'2011-03-04 11:21:00'),(3192,43,1,'2011-03-04 11:21:04'),(3193,43,3,'2011-03-04 11:22:07'),(3194,43,1,'2011-03-04 11:23:34'),(3195,43,1,'2011-03-04 11:23:36'),(3196,3,3,'2011-03-04 11:26:09'),(3197,3,2,'2011-03-04 11:26:11'),(3198,3,2,'2011-03-04 11:26:13'),(3199,3,3,'2011-03-04 11:26:34'),(3200,3,1,'2011-03-04 11:26:57'),(3201,43,1,'2011-03-04 11:30:55'),(3202,43,1,'2011-03-04 11:30:59'),(3203,43,1,'2011-03-04 11:31:02'),(3204,44,1,'2011-03-04 11:31:37'),(3205,44,3,'2011-03-04 11:31:40'),(3206,43,1,'2011-03-04 11:31:42'),(3207,44,1,'2011-03-04 11:31:42'),(3208,43,3,'2011-03-04 11:31:46'),(3209,43,1,'2011-03-04 11:31:49'),(3210,43,2,'2011-03-04 11:32:04'),(3211,43,2,'2011-03-04 11:32:07'),(3212,43,3,'2011-03-04 11:32:25'),(3213,43,1,'2011-03-04 11:32:28'),(3214,43,1,'2011-03-04 11:39:34'),(3215,43,1,'2011-03-04 11:39:37'),(3216,43,1,'2011-03-04 11:40:02'),(3217,3,2,'2011-03-04 11:43:07'),(3218,43,3,'2011-03-04 11:43:08'),(3219,44,1,'2011-03-04 11:43:09'),(3220,3,3,'2011-03-04 11:43:09'),(3221,3,1,'2011-03-04 11:43:14'),(3222,43,2,'2011-03-04 11:43:17'),(3223,43,2,'2011-03-04 11:43:21'),(3224,43,3,'2011-03-04 11:44:04'),(3225,43,1,'2011-03-04 11:44:19'),(3226,43,1,'2011-03-04 11:50:00'),(3227,43,1,'2011-03-04 11:50:03'),(3228,43,1,'2011-03-04 11:50:05'),(3229,3,1,'2011-03-04 12:00:51'),(3230,3,1,'2011-03-04 12:00:53'),(3231,43,1,'2011-03-04 12:02:04'),(3232,43,1,'2011-03-04 12:02:07'),(3233,43,1,'2011-03-04 12:02:54'),(3234,3,1,'2011-03-04 12:03:48'),(3235,3,1,'2011-03-04 12:03:57'),(3236,3,1,'2011-03-04 12:03:58'),(3237,44,1,'2011-03-04 12:06:10'),(3238,43,3,'2011-03-04 12:06:18'),(3239,43,1,'2011-03-04 12:06:22'),(3240,43,1,'2011-03-04 12:12:57'),(3241,43,6,'2011-03-04 12:13:01'),(3242,1,4,'2011-03-04 12:13:01'),(3243,43,2,'2011-03-04 12:17:57'),(3244,43,3,'2011-03-04 12:29:02'),(3245,43,1,'2011-03-04 12:29:11'),(3246,3,2,'2011-03-04 12:30:45'),(3247,3,2,'2011-03-04 12:30:47'),(3248,3,2,'2011-03-04 12:32:02'),(3249,3,1,'2011-03-04 12:32:05'),(3250,3,1,'2011-03-04 12:32:07'),(3251,3,1,'2011-03-04 12:32:38'),(3252,3,1,'2011-03-04 12:32:39'),(3253,43,1,'2011-03-04 12:44:50'),(3254,43,2,'2011-03-04 12:44:54'),(3255,43,2,'2011-03-04 12:44:59'),(3256,43,3,'2011-03-04 12:45:20'),(3257,43,1,'2011-03-04 12:45:27'),(3258,43,1,'2011-03-04 12:45:56'),(3259,43,3,'2011-03-04 12:46:05'),(3260,43,1,'2011-03-04 12:46:08'),(3261,43,1,'2011-03-04 12:47:25'),(3262,43,2,'2011-03-04 12:47:28'),(3263,43,2,'2011-03-04 12:47:30'),(3264,43,3,'2011-03-04 12:47:42'),(3265,43,1,'2011-03-04 12:47:47'),(3266,43,1,'2011-03-04 12:48:19'),(3267,43,2,'2011-03-04 12:48:23'),(3268,43,2,'2011-03-04 12:48:26'),(3269,43,3,'2011-03-04 12:48:35'),(3270,43,1,'2011-03-04 12:48:40'),(3271,43,1,'2011-03-04 12:49:14'),(3272,43,2,'2011-03-04 12:49:19'),(3273,43,2,'2011-03-04 12:49:21'),(3274,43,4,'2011-03-04 12:50:22'),(3275,43,1,'2011-03-04 13:02:03'),(3276,1,4,'2011-03-04 14:01:19'),(3277,1,5,'2011-03-04 14:01:29'),(3278,44,5,'2011-03-04 14:01:29'),(3279,44,1,'2011-03-04 14:04:21'),(3280,44,3,'2011-03-04 14:04:25'),(3281,44,1,'2011-03-04 14:05:54'),(3282,1,4,'2011-03-04 14:54:35'),(3283,1,5,'2011-03-04 14:54:42'),(3284,43,5,'2011-03-04 14:54:42'),(3285,43,2,'2011-03-04 14:54:45'),(3286,43,2,'2011-03-04 14:55:07'),(3287,43,2,'2011-03-04 14:55:30'),(3288,43,1,'2011-03-04 14:55:55'),(3289,43,1,'2011-03-04 14:55:59'),(3290,43,1,'2011-03-04 14:56:40'),(3291,43,2,'2011-03-04 14:57:26'),(3292,43,2,'2011-03-04 14:57:33'),(3293,43,3,'2011-03-04 14:57:33'),(3294,43,2,'2011-03-04 14:57:42'),(3295,43,2,'2011-03-04 14:57:46'),(3296,43,2,'2011-03-04 14:59:26'),(3297,43,4,'2011-03-04 14:59:28'),(3298,43,6,'2011-03-04 14:59:37'),(3299,1,4,'2011-03-04 14:59:37'),(3300,43,4,'2011-03-04 16:19:53'),(3301,1,4,'2011-03-04 22:07:45'),(3302,1,4,'2011-03-05 02:24:03'),(3303,1,8,'2011-03-05 05:44:13'),(3304,1,4,'2011-03-05 08:38:28'),(3305,1,2,'2011-03-05 11:31:38'),(3306,1,4,'2011-03-05 13:06:30'),(3307,1,4,'2011-03-05 14:35:52'),(3308,43,4,'2011-03-06 19:58:25'),(3309,1,4,'2011-03-07 01:56:33'),(3310,1,4,'2011-03-07 09:49:39'),(3311,1,4,'2011-03-07 13:47:46'),(3312,1,4,'2011-03-07 15:04:29'),(3313,1,4,'2011-03-07 15:08:53'),(3314,1,5,'2011-03-07 15:09:11'),(3315,45,5,'2011-03-07 15:09:11'),(3316,45,6,'2011-03-07 15:09:25'),(3317,1,4,'2011-03-07 15:09:26'),(3318,1,4,'2011-03-07 16:03:07'),(3319,1,5,'2011-03-07 16:03:17'),(3320,1,5,'2011-03-07 16:03:23'),(3321,3,5,'2011-03-07 16:03:23'),(3322,3,1,'2011-03-07 16:03:25'),(3323,3,1,'2011-03-07 16:03:26'),(3324,3,1,'2011-03-07 16:20:28'),(3325,3,1,'2011-03-07 16:20:30'),(3326,3,2,'2011-03-07 16:20:31'),(3327,3,2,'2011-03-07 16:20:32'),(3328,3,2,'2011-03-07 16:20:50'),(3329,3,3,'2011-03-07 16:20:53'),(3330,3,1,'2011-03-07 16:20:54'),(3331,3,1,'2011-03-07 17:09:27'),(3332,3,1,'2011-03-07 17:09:29'),(3333,3,1,'2011-03-07 17:17:56'),(3334,3,1,'2011-03-07 17:19:48'),(3335,3,1,'2011-03-07 17:20:10'),(3336,43,4,'2011-03-07 19:17:48'),(3337,1,4,'2011-03-07 22:40:39'),(3338,1,4,'2011-03-08 00:55:11'),(3339,1,8,'2011-03-08 01:09:02'),(3340,1,4,'2011-03-08 01:22:25'),(3341,1,2,'2011-03-08 01:28:37'),(3342,1,5,'2011-03-08 02:10:26'),(3343,43,5,'2011-03-08 02:10:26'),(3344,43,4,'2011-03-08 02:11:22'),(3345,43,4,'2011-03-08 02:14:00'),(3346,43,2,'2011-03-08 02:14:04'),(3347,43,2,'2011-03-08 02:14:07'),(3348,43,6,'2011-03-08 02:14:59'),(3349,1,4,'2011-03-08 02:14:59'),(3350,1,2,'2011-03-08 02:15:02'),(3351,1,2,'2011-03-08 02:15:04'),(3352,1,2,'2011-03-08 02:38:55'),(3353,1,4,'2011-03-08 02:44:58'),(3354,1,5,'2011-03-08 02:45:01'),(3355,43,5,'2011-03-08 02:45:01'),(3356,1,8,'2011-03-08 03:19:09'),(3357,43,4,'2011-03-08 03:19:48'),(3358,43,6,'2011-03-08 03:19:54'),(3359,1,4,'2011-03-08 03:19:55'),(3360,1,5,'2011-03-08 03:19:56'),(3361,43,5,'2011-03-08 03:19:56'),(3362,3,2,'2011-03-08 17:46:14'),(3363,3,2,'2011-03-08 17:46:17');
/*!40000 ALTER TABLE `users_statistics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-03-08 17:58:44
