-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 04, 2011 at 09:52 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `europlanet_na1`
--

DROP SCHEMA IF EXISTS `europlanet_na1` ;
CREATE SCHEMA IF NOT EXISTS `europlanet_na1` DEFAULT CHARACTER SET latin1 ;
USE `europlanet_na1` ;

-- --------------------------------------------------------

--
-- Table structure for table `additional_information`
--

DROP TABLE IF EXISTS `additional_information`;
CREATE TABLE IF NOT EXISTS `additional_information` (
  `id` int(10) unsigned NOT NULL,
  `further_contacts` text,
  `instrument_comments` text,
  `additional_instruments` text,
  `array_description` text,
  `backend_description` text,
  `research_comments` text,
  `general_comments` text,
  PRIMARY KEY (`id`),
  KEY `observatory_id_4` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `additional_information`
--

INSERT INTO `additional_information` (`id`, `further_contacts`, `instrument_comments`, `additional_instruments`, `array_description`, `backend_description`, `research_comments`, `general_comments`) VALUES
(1, '', '', '', '', '', '', ''),
(2, '', '', '', '', 'Tektronix CCD Camera 2048x2048 7.5x7.5 ;\r\nOptic CCD 2048x4096 r 9.3x9.3fov ;\r\nUH8k Wide Field Imager Camera 8192x8192 r 33x33 fov ;\r\nULBCAM Infrared Camera 2048 x 2048 r 17x17 fov ;\r\nWide Field Grism Spectrograph 380-970 nm 11x11 ;\r\nSNIFS Spectrograph 6x6 fov', '', 'Schedule: http://www.ifa.haAugust-Januarywaii.edu/88inch/schedule/current.pdf\r\nForm: http://www.ifa.hawaii.edu/88inch/forms/uhform.pdf 1st October for Feb-Jul, 1st April for Aug-Jan'),
(3, '', '', '', '', 'BVR Custom Scientific Photometric filters and SBIG CFW9 Filter Wheel.', '', ''),
(4, '', 'Inst #1: Historic 10" equatorial refractor built by Grubb brothers (Dublin) in 1885. Used mostly for visual and video work.\r\nInst#2: Planewave CDK 17" Corrected Hall- Dirkham Astrograph w XSVR-H36 Starlight Xpress CCD camera. To be commisioned 2011', 'Meteor camera cluster: 3xWatec 902DM2S video cams +2x3.8mm + 1x6mm lenses, 45% sky coverage. Commisioned 2005. Polar Bear pole-staring camera cluster: 3xStarlight Express H16 CCD+3x Nikor 85mm lenses, covers ~10 deg around NCP. Commisioned 2008.', '', '', '', ''),
(5, '', '3 astro-camera''s', '', '', '', '', ''),
(6, '', '', '', '', '', '', ''),
(7, '', '', '', '', '', '', ''),
(8, '', '', '', '', '', '', ''),
(9, '', '', '', '', '', '', ''),
(10, '', '', '', '', '', '', ''),
(11, '', '', '', '', '', '', ''),
(12, '', '', '', '', '', '', ''),
(13, '', '', '', '', '', '', ''),
(14, '', '', '', '', '', '', ''),
(15, '', '', '', '', '', '', ''),
(16, '', '', '', '', '', '', ''),
(17, '', '', '', '', '', '', ''),
(18, '', '', '', '', '', '', ''),
(19, '', '', '', '', '', '', ''),
(20, 'HARUTYUNIAN Haik A., Dr.\r\n(Director) hhayk@bao.sci.am', '', 'SCORPIO Focal Reducer\r\nVAGR Integral Field Spectrograph', '', '', 'Undertook research on:\r\nDetection of extragalactic objects with UV continuum  \r\nSearch for flare stars', ''),
(21, 'Mary McCready (Project Leader)\r\nmccready@sri.com', 'Capable of measuring range-resolved ionospheric \r\nand atmospheric parameters simultaneously from\r\nground to outer reaches of atmosphere', 'Gravimeter\r\nPhotometer\r\nGPS', '', '', '', ''),
(22, '', '', 'Double astrograph 40cm opening\r\nSolar telescope 15cm aperture\r\nGPS\r\nSpectrometers', 'Very Long Base Interferometry (VLBI)', '', '', ''),
(23, '', '', '', '', '', 'Part of antenna array in Canberra and California', 'Alternative website:\r\nhttp://deepspace.jpl.nasa.gov/dsn/'),
(24, '', '', '', '', '', '', '4th most ancient observatory still functioning'),
(25, '', '', '', '', '', '', ''),
(26, '', '', '', '', '', '', ''),
(27, '', '', 'Bombonera\r\nSuper Polaris\r\nComet-Catcher with stellar CCD', '', '', '3SSS UNICORN-Project', ''),
(28, '', '', 'Spectrometer\r\nPhotometer', '', '', 'Property of various universities/institutes\r\nwww.iac.es/adjuntos/cci/ottable.pdf\r\n(Go to link for further details)', ''),
(29, 'Charles Wrench\r\ncharles.wrench@stfc.ac.uk', '', '3GHz Doppler-polarisation radar\r\nCloud radar systems\r\nMeteorological sensors\r\nHigh power UV lidar', '', '', '', ''),
(30, '', '', 'Meade telescopes\r\nTransit telescope\r\n408 MHz pulsar telescope\r\nCelestrons', '', '', '', ''),
(31, 'Dr Peter Thomas (observatory manager)\r\npkt@ulo.ucl.ac.uk', '', 'Meade reflector telescopes\r\nPortable Meade ETX\r\nExplorer Scientific 80mm APO refractor\r\nSolar View 50mm\r\nJoynson 6-inch refractor', '', '', 'New Metre-Class Telescope Project currently underway to acquire large modern telescope with remote and robotic observing capabilities\r\n(aperture 1m)', ''),
(32, '', '', 'Meade cadiotropic 10 inch (0.25m)\r\nDavies reftractor 8 inch (0.2m)\r\nMalta binoculars 6 inch (0.15m)\r\nWatson refractor 4.2 inch (0.11m)\r\nCoronado solar telescope 1.5 inch (0.04m)', '', '', '', 'Science Outreach: Open sessions for public (Tuesdays and Saturdays)'),
(33, '', '', 'ICOM R-7000 radio receiver', '', '', 'Part of Genesis Project', 'Observatory used and run by members of Norwich Astronomical Society'),
(34, '', 'Includes Astronomical Telescope (CCD)\r\nand Satellite Laser Ranging (SLR)', '', '', '', 'Involved in GOCE Mission (ESA) and GNSS (GPS research)', ''),
(35, 'Pascal LOVIS\r\npascal.lovis@jura-observatory.ch', '', 'Coronograph 160mm\r\nOptec Temperature Compensated Focuser\r\nMCMT II Stepper motor-not', '', '', 'Discovered Comet P/2008 Q2 or Comet Ory', ''),
(36, '', '', 'APO Binoculars apochromatic 100mm\r\nPentax 75mm refractor', '', '', '', ''),
(37, '', '', '', '', '', 'Involved with the processing of data provided by the satellite INTEGRAL of the ESA.', ''),
(38, '', '', 'Automated Meade 200mm Telescope (equipped with binoculars, controlled by a microcomputer)\r\nLumicon H-alpha filter', '', '', '', ''),
(39, '', '', '', '', '', '', ''),
(40, '', '', 'Dobsonian Telescope (Old Newton-Cassegrain)\r\nGalileo Telescopes \r\nBinoculars 20x1000 Miyauchi Fluorite Apo\r\nH-alpha filter ASP-60\r\nWAM-850 tracking device', '', '', '', ''),
(41, '', '', 'Solar Laboratory', '', '', '', ''),
(42, '', '', '', '', '', '', ''),
(43, '', '', 'Guide Telescope 0.07m\r\nH-alpha filter', '', '', '', ''),
(44, '', '', 'Two Telescopes 15cm aperture for Solar Observation\r\nH-Alpha, Ca II K, CN Filters', '', '', 'Project to acquire 3.6m Devasthal Optical Telescope and 1.3m Devasthal Fast Optical Telescopes is currently underway', ''),
(45, '', '', '', '', '', 'Running a Comet and Asteroid Search Program (PIKA) and discovered several comets, NEOs, variable stars and supernovae', ''),
(46, '', '', '5 Meade Telescopes (0.35-0.4m)\r\n0.4m spectroscopic telescope\r\n0.3m Brinton Newtonian reflector\r\nObjective Prism Telescope\r\nH-alpha filter\r\nCeolostat', '', '', '', ''),
(47, 'Wang, Yi\r\n(Secretary of Chief Scientist)\r\nyw@bao.ac.cn', '', 'Solar Nine-Channel Telescope	600mm	6000mm\r\nSolar Magnetic Field Telescope	350mm	2800mm\r\nFull-disc & Local H-Alpha Telescope	14cm	\r\nFull-disc H-Alpha Telescope	200mm	1800mm\r\nFull-disc Vector Magnetograph	100mm	770.86mm\r\nFull-disc Calcium Monochromator	8cm	', '', '', 'Involved in various research projects eg. Space Solar Telescope (SST), Balloon-Borne Telescope (BBT), and other solar activity research', ''),
(48, '', '', 'Photoheliograph\r\nTwin Spectroheliographs 6cm\r\nK-filtergrams', '', '', 'Its director, Evershed, discovered radial motion in sunspots (named the Evershed effect)', ''),
(49, '', '', 'Wind vane and Anemometer', '', '', '', 'Minor Planet Centre of the International Astronomical Union'),
(50, '', '', 'Photoelectric Photometers', '', '', 'Research projects include HERCULES (Large Echelle Spectograph) and MOA (Microlensing Observations)', ''),
(51, '', '', '', 'Australian Long Baseline Array VLBI network', '', '', ''),
(52, '', '', '0.5m Automatic Patrol Telescope\r\n0.6m Uppsala Schmidt Telescope', '', '', '', ''),
(53, '', '', 'Photometers', '', '', '', ''),
(54, '', '', '', '', '', '', ''),
(55, '', '', '', '', '', '', ''),
(56, '', '', '', '', '', '', ''),
(57, '', '', '', '', '', '', ''),
(58, '', '', '', '', '', '', 'Currently being upgraded. Expected to be operational again in 2012.'),
(59, '', '', '', '', '', '', ''),
(60, 'cgoudis@astro.noa.gr', '', '', '', '', '', ''),
(61, '', '', '', '', '', '', ''),
(62, '', '', '', '', '', 'Involved in the SETI program', ''),
(63, '', '', '', '', '', '', ''),
(64, '', '', '', '', '', '', ''),
(65, '', '', '', '', '', '', ''),
(66, '', 'More details concerning the additional instruments can be found here: http://www.ct.astro.it/sln/strumenti.html', '', '', '', '', ''),
(67, '', 'Morais (43cm telescope) previously used for observing comets\r\nand is the largest telescope of its kind in Italy (2011)\r\n', '', '', '', '', ''),
(68, '', '', '', '', '', 'At present it is the largest Russian astronomical centre for ground-based observations of objects in the Universe (25/05/2010)\r\n', ''),
(69, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
CREATE TABLE IF NOT EXISTS `agencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `web_address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`id`, `acronym`, `name`, `web_address`) VALUES
(1, 'NASA', 'National Aeronautics and Space Administration', 'http://www.nasa.gov/'),
(2, 'ESA', 'European Space Agency', 'http://www.esa.int/'),
(3, 'UKSA', 'UK Space Agency', 'http://www.ukspaceagency.bis.gov.uk/'),
(4, 'CNES', 'Centre National d''Études Spatiale', 'http://www.cnes.fr/'),
(5, 'CNSA', 'China National Space Administration', 'http://www.cnsa.gov.cn/'),
(6, 'JAXA', 'Japan Aerospace Exploration Agency', 'http://www.jaxa.jp'),
(7, 'SSAU', 'State Space Agency of Ukraine', 'http://www.nkau.gov.ua/'),
(8, 'AEB', 'Brazilian Space Agency', 'http://www.aeb.gov.br/'),
(9, 'DLR', 'Deutsches Zentrum für Luft- und Raumfahrt', 'http://www.dlr.de/'),
(10, 'ASI', 'Agenzia Spaziale Italiana', 'http://www.asi.it/'),
(11, 'ISRO', 'Indian Space Research Organisation', 'http://www.isro.org/'),
(12, 'ROSCOSMOS', 'Russian Federal Space Agency', 'http://www.roscosmos.ru/');

-- --------------------------------------------------------

--
-- Table structure for table `antenna_types`
--

DROP TABLE IF EXISTS `antenna_types`;
CREATE TABLE IF NOT EXISTS `antenna_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `antenna_type` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `antenna_types`
--

INSERT INTO `antenna_types` (`id`, `antenna_type`) VALUES
(1, '---'),
(2, 'Dipole'),
(3, 'Whip'),
(4, 'Loop'),
(5, 'Helical'),
(6, 'Yagi'),
(7, 'Log Periodic'),
(8, 'Conical'),
(9, 'Cylindrical'),
(10, 'Horn'),
(11, 'Parabolic'),
(12, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `camera_properties`
--

DROP TABLE IF EXISTS `camera_properties`;
CREATE TABLE IF NOT EXISTS `camera_properties` (
  `id` int(10) unsigned NOT NULL,
  `camera_type` text,
  `max_frames_per_sec` float DEFAULT NULL,
  `frame_size` text,
  `max_exposure_time` float DEFAULT NULL,
  `min_exposure_time` float DEFAULT NULL,
  `color_bw_chip` tinyint(1) DEFAULT NULL,
  `ccd_chip_type` text,
  PRIMARY KEY (`id`),
  KEY `observatory_id_6` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camera_properties`
--

INSERT INTO `camera_properties` (`id`, `camera_type`, `max_frames_per_sec`, `frame_size`, `max_exposure_time`, `min_exposure_time`, `color_bw_chip`, `ccd_chip_type`) VALUES
(1, '', 0, '', 0, 0, 0, ''),
(2, '', 0, '', 0, 0, 0, ''),
(3, 'SBIG / ST-7XME', 4, '765 x 510', 3600, 0.12, 1, 'KAF-0402ME'),
(4, '', 0, '', 0, 0, 0, ''),
(5, 'Artemis', 0, '2000 x 2000', 0, 0.0001, 1, ''),
(6, '', 0, '', 0, 0, 0, ''),
(7, '', 0, '', 0, 0, 0, ''),
(8, '', 0, '', 0, 0, 0, ''),
(9, '', 0, '', 0, 0, 0, ''),
(10, '', 0, '', 0, 0, 0, ''),
(11, '', 0, '', 0, 0, 0, ''),
(12, '', 0, '', 0, 0, 0, ''),
(13, '', 0, '', 0, 0, 0, ''),
(14, '', 0, '', 0, 0, 0, ''),
(15, '', 0, '', 0, 0, 0, ''),
(16, '', 0, '', 0, 0, 0, ''),
(17, '', 0, '', 0, 0, 0, ''),
(18, '', 0, '', 0, 0, 0, ''),
(19, '', 0, '', 0, 0, 0, ''),
(20, '', 0, '', 0, 0, 0, ''),
(21, '', 0, '', 0, 0, 0, ''),
(22, 'CCD', 0, '', 0, 0, 0, ''),
(23, '', 0, '', 0, 0, 0, ''),
(24, '', 0, '', 0, 0, 0, ''),
(25, 'ST-7 CCD', 0, '', 0, 0, 0, ''),
(26, 'SBIG ST7 CCD camera', 0, '', 0, 0, 0, ''),
(27, 'Schmidt Camera 40cm, CCD', 0, '', 0, 0, 0, ''),
(28, '', 0, '', 0, 0, 0, ''),
(29, '', 0, '', 0, 0, 0, ''),
(30, '', 0, '', 0, 0, 0, ''),
(31, 'CCD', 0, '', 0, 0, 0, ''),
(32, '', 0, '', 0, 0, 0, ''),
(33, '', 0, '', 0, 0, 0, ''),
(34, '', 0, '', 0, 0, 0, ''),
(35, 'Kodak and Texas CCD Image Sensor', 0, '', 0, 0, 0, ''),
(36, 'CCD camera SBIG ST10', 0, '', 0, 0, 0, ''),
(37, '', 0, '', 0, 0, 0, ''),
(38, 'CCD Video Camera', 0, '', 0, 0, 0, ''),
(39, '', 0, '', 0, 0, 0, ''),
(40, '', 0, '', 0, 0, 0, ''),
(41, '', 0, '', 0, 0, 0, ''),
(42, '', 0, '', 0, 0, 0, ''),
(43, 'CCD camera', 0, '', 0, 0, 0, ''),
(44, 'CCD', 0, '', 0, 0, 0, ''),
(45, 'All-Sky and CCD', 0, '', 0, 0, 0, ''),
(46, 'CCD', 0, '', 0, 0, 0, ''),
(47, 'CCD', 0, '', 0, 0, 0, ''),
(48, 'CCD', 0, '', 0, 0, 0, ''),
(49, 'CCD (SBIG ST9 cooled camera)', 0, '', 0, 0, 0, ''),
(50, 'CCD', 0, '', 0, 0, 0, ''),
(51, '', 0, '', 0, 0, 0, ''),
(52, '', 0, '', 0, 0, 0, ''),
(53, 'CCD', 0, '', 0, 0, 0, ''),
(54, '', 0, '', 0, 0, 0, ''),
(55, '', 0, '', 0, 0, 0, ''),
(56, '', 0, '', 0, 0, 0, ''),
(57, '', 0, '', 0, 0, 0, ''),
(58, '', 0, '', 0, 0, 0, ''),
(59, '', 0, '', 0, 0, 0, ''),
(60, '1k*1k LN/CCD Camera, 4k*4k Vernikou-Eugenides CCD Camera, ULTRACAM - Ultra-Fast Triple-Beam CCD Camera ', 0, '', 0, 0, 0, ''),
(61, 'Photometrics AT200 CCD camera, Princeton Instruments CCD camera, Andor iXon+888 EMCCD camera', 0, '', 0, 0, 0, ''),
(62, '', 0, '', 0, 0, 0, ''),
(63, '', 0, '', 0, 0, 0, ''),
(64, '', 0, '', 0, 0, 0, ''),
(65, 'A FLI camera Pro series with Kodak 1001E 1024x1024 pixel sensor,  A HI-SIS 39 camera with Kodak 1001E 1024x1024 pixel sensor,  Two HI-SIS 33 cameras with Thompson 512x512 pixel sensors  Two HI-SIS 23 cameras with Kodak 401E sensors,  A SBIG STV camera for tracking ', 0, '', 0, 0, 0, ''),
(66, 'CCD camera ', 0, '', 0, 0, 0, ''),
(67, 'CCD camera (ASTROMED-UK, 1152 x 1296 pixel format, scale 0.467 "/ pixel liquid nitrogen cooled) ', 0, '', 0, 0, 0, ''),
(68, '', 0, '', 0, 0, 0, ''),
(69, '', 0, '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `clearnights_ranges`
--

DROP TABLE IF EXISTS `clearnights_ranges`;
CREATE TABLE IF NOT EXISTS `clearnights_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `range` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `clearnights_ranges`
--

INSERT INTO `clearnights_ranges` (`id`, `range`) VALUES
(1, '<50'),
(2, '51-100'),
(3, '101-150'),
(4, '151-200'),
(5, '251-300'),
(6, '>300'),
(7, '---');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(5) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=233 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `acronym`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'AS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua And Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia & Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'ZR', 'Congo (The Democratic Republic Of The)'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'CI', 'Cote D''Ivoire'),
(54, 'HR', 'Croatia'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard And Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IE', 'Ireland'),
(102, 'IL', 'Israel'),
(103, 'IT', 'Italy'),
(104, 'JM', 'Jamaica'),
(105, 'JP', 'Japan'),
(106, 'JO', 'Jordan'),
(107, 'KZ', 'Kazakhstan'),
(108, 'KE', 'Kenya'),
(109, 'KI', 'Kiribati'),
(110, 'KW', 'Kuwait'),
(111, 'KG', 'Kyrgyzstan'),
(112, 'LA', 'Laos'),
(113, 'LV', 'Latvia'),
(114, 'LB', 'Lebanon'),
(115, 'LS', 'Lesotho'),
(116, 'LR', 'Liberia'),
(117, 'LI', 'Liechtenstein'),
(118, 'LT', 'Lithuania'),
(119, 'LU', 'Luxembourg'),
(120, 'MO', 'Macau'),
(121, 'MK', 'Macedonia (The F.Y.R. Of)'),
(122, 'MG', 'Madagascar'),
(123, 'MW', 'Malawi'),
(124, 'MY', 'Malaysia'),
(125, 'MV', 'Maldives'),
(126, 'ML', 'Mali'),
(127, 'MT', 'Malta'),
(128, 'MH', 'Marshall Islands'),
(129, 'MQ', 'Martinique'),
(130, 'MR', 'Mauritania'),
(131, 'MU', 'Mauritius'),
(132, 'YT', 'Mayotte'),
(133, 'MX', 'Mexico'),
(134, 'FM', 'Micronesia'),
(135, 'MD', 'Moldova'),
(136, 'MC', 'Monaco'),
(137, 'MN', 'Mongolia'),
(138, 'MS', 'Montserrat'),
(139, 'MA', 'Morocco'),
(140, 'MZ', 'Mozambique'),
(141, 'MM', 'Myanmar'),
(142, 'NA', 'Namibia'),
(143, 'NR', 'Nauru'),
(144, 'NP', 'Nepal'),
(145, 'NL', 'Netherlands'),
(146, 'AN', 'Netherlands Antilles'),
(147, 'NC', 'New Caledonia'),
(148, 'NZ', 'New Zealand'),
(149, 'NI', 'Nicaragua'),
(150, 'NE', 'Niger'),
(151, 'NG', 'Nigeria'),
(152, 'NU', 'Niue'),
(153, 'NF', 'Norfolk Island'),
(154, 'MP', 'Northern Mariana Islands'),
(155, 'NO', 'Norway'),
(156, 'OM', 'Oman'),
(157, 'PK', 'Pakistan'),
(158, 'PW', 'Palau'),
(159, 'PA', 'Panama'),
(160, 'PG', 'Papua New Guinea'),
(161, 'PY', 'Paraguay'),
(162, 'PE', 'Peru'),
(163, 'PH', 'Philippines'),
(164, 'PN', 'Pitcairn'),
(165, 'PL', 'Poland'),
(166, 'PT', 'Portugal'),
(167, 'PR', 'Puerto Rico'),
(168, 'QA', 'Qatar'),
(169, 'RE', 'Reunion'),
(170, 'RO', 'Romania'),
(171, 'RU', 'Russian Federation'),
(172, 'RW', 'Rwanda'),
(173, 'GS', 'S Georgia & S Sandwich Islands'),
(174, 'KN', 'Saint Kitts And Nevis'),
(175, 'LC', 'Saint Lucia'),
(176, 'VC', 'Saint Vincent & The Grenadines'),
(177, 'WS', 'Samoa'),
(178, 'SM', 'San Marino'),
(179, 'ST', 'Sao Tome And Principe'),
(180, 'SA', 'Saudi Arabia'),
(181, 'SN', 'Senegal'),
(182, 'YU', 'Serbia And Montenegro'),
(183, 'SC', 'Seychelles'),
(184, 'SL', 'Sierra Leone'),
(185, 'SG', 'Singapore'),
(186, 'SK', 'Slovakia'),
(187, 'SI', 'Slovenia'),
(188, 'SB', 'Solomon Islands'),
(189, 'SO', 'Somalia'),
(190, 'ZA', 'South Africa'),
(191, 'KR', 'South Korea'),
(192, 'ES', 'Spain'),
(193, 'LK', 'Sri Lanka'),
(194, 'SH', 'St. Helena'),
(195, 'PM', 'St. Pierre And Miquelon'),
(196, 'SR', 'Suriname'),
(197, 'SJ', 'Svalbard And Jan Mayen Islands'),
(198, 'SZ', 'Swaziland'),
(199, 'SE', 'Sweden'),
(200, 'CH', 'Switzerland'),
(201, 'TW', 'Taiwan'),
(202, 'TJ', 'Tajikistan'),
(203, 'TZ', 'Tanzania'),
(204, 'TH', 'Thailand'),
(205, 'TG', 'Togo'),
(206, 'TK', 'Tokelau'),
(207, 'TO', 'Tonga'),
(208, 'TT', 'Trinidad And Tobago'),
(209, 'TN', 'Tunisia'),
(210, 'TR', 'Turkey'),
(211, 'TM', 'Turkmenistan'),
(212, 'TC', 'Turks And Caicos Islands'),
(213, 'TV', 'Tuvalu'),
(214, 'UG', 'Uganda'),
(215, 'UA', 'Ukraine'),
(216, 'AE', 'United Arab Emirates'),
(217, 'GB', 'United Kingdom'),
(218, 'US', 'United States'),
(219, 'UM', 'United States Outlying Islands'),
(220, 'UY', 'Uruguay'),
(221, 'UZ', 'Uzbekistan'),
(222, 'VU', 'Vanuatu'),
(223, 'VA', 'Vatican City State'),
(224, 'VE', 'Venezuela'),
(225, 'VN', 'Vietnam'),
(226, 'VG', 'Virgin Islands (British)'),
(227, 'VI', 'Virgin Islands (U.S.)'),
(228, 'WF', 'Wallis And Futuna Islands'),
(229, 'EH', 'Western Sahara'),
(230, 'YE', 'Yemen'),
(231, 'ZM', 'Zambia'),
(232, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `hidden_fields`
--

DROP TABLE IF EXISTS `hidden_fields`;
CREATE TABLE IF NOT EXISTS `hidden_fields` (
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
  PRIMARY KEY (`id`),
  KEY `observatory_id_5` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hidden_fields`
--

INSERT INTO `hidden_fields` (`id`, `web_address`, `address`, `zip_code`, `city`, `phone`, `email`, `latitude`, `longitude`, `scientific_contacts`, `further_contacts`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0),
(5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(61, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(62, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(63, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(64, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1),
(67, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(68, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1),
(69, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
CREATE TABLE IF NOT EXISTS `instruments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instrument_name` text,
  `instrument_type` int(10) unsigned NOT NULL,
  `focal_position` text,
  `wavelength` text,
  `wavelength_begin` float(10,6) DEFAULT NULL,
  `wavelength_b_unit` int(10) unsigned NOT NULL,
  `wavelength_end` float(10,6) DEFAULT NULL,
  `wavelength_e_unit` int(10) unsigned NOT NULL,
  `spatial_resolution` text,
  `spectral_resolution` text,
  `polarisation` text,
  `field_of_view` text,
  `max_frames_per_sec` float DEFAULT NULL,
  `frame_size` text,
  `min_exposure_time` float DEFAULT NULL,
  `max_exposure_time` float DEFAULT NULL,
  `color_bw_chip` tinyint(1) DEFAULT NULL,
  `ccd_chip_type` text,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `instrument_type_id` (`instrument_type`),
  KEY `wavelength_unit_id_3` (`wavelength_b_unit`),
  KEY `wavelength_unit_id_4` (`wavelength_e_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `instruments`
--


-- --------------------------------------------------------

--
-- Table structure for table `instrument_types`
--

DROP TABLE IF EXISTS `instrument_types`;
CREATE TABLE IF NOT EXISTS `instrument_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `instrument_types`
--

INSERT INTO `instrument_types` (`id`, `name`) VALUES
(1, 'Spectrometer'),
(2, 'Interferometer'),
(3, 'Polarimeter'),
(4, 'Riometer'),
(5, 'Camera'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `observatories`
--

DROP TABLE IF EXISTS `observatories`;
CREATE TABLE IF NOT EXISTS `observatories` (
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
  `observatory_status` text,
  `partner_observatories` text,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `precipitation_id` (`precipitation`),
  KEY `clear_nights_id` (`clear_nights`),
  KEY `timezone_id` (`timezone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `observatories`
--

INSERT INTO `observatories` (`id`, `name`, `founded`, `institution`, `web_address`, `address`, `zip_code`, `city`, `country_id`, `phone`, `email`, `latitude`, `longitude`, `approx_position`, `sealevel_m`, `precipitation`, `clear_nights`, `timezone`, `observatory_status`, `partner_observatories`, `creation_date`, `modification_date`) VALUES
(1, '30-meter telescope', 1984, 'IRAM (Institut de Radioastronomie Millimétrique)', 'http://www.iram-institute.org', 'Avenida Divina Pastora 7, Local 20', '', '', 192, '0034-95880-5454', 'info@iram.fr', 37.068414, -3.398753, 'Pico Veleta, Sierra Nevada Andalusia', 2850, 1, 1, 2, NULL, 'Plateau de Bure Interferometer (also operated by IRAM)', '2011-02-25 14:10:58', NULL),
(2, '88 Telescope (Mauna Kea)', 1970, 'University of Hawaii', 'http://www.ifa.hawaii.edu/88inch/', '96720-2700,Hawaii', '', '', 218, '+1 808 932-2300', 'feedback2@ifa.hawaii.edu', 19.822972, -155.469433, '', 4214, 1, 1, 23, NULL, '', '2011-02-25 14:50:57', NULL),
(3, 'A81 Balzaretto Observatory', 2005, 'Private persons', 'http://digilander.libero.it/A81_Observatory/', 'Via Giuseppe Balzaretto 184', '', 'Rome', 103, '39 06 66411076', 'lor_franco@libero.it', 41.870000, 12.403306, '', 70, 6, 1, 2, NULL, '', '2011-02-25 15:10:01', NULL),
(4, 'Armagh Observatory', 1790, 'Armagh Observatory', 'http://www.arm.ac.uk', 'College Hill', '', '', 217, '44-2837-522928', 'info@arm.ac.uk', 54.353056, -6.649722, '', 60, 6, 2, 1, NULL, '', '2011-02-25 15:19:53', NULL),
(5, 'Abre Los Ojos', 2008, 'private owned', 'http://www.AbreLosOjos.be', '', '', '', 21, '', 'info@AbreLosOjos.be', 0.000000, 0.000000, '', 50, 1, 1, 2, NULL, '', '2011-02-25 15:29:48', NULL),
(6, 'European Incoherent Scatter Facility (EISCAT), Tromso', 0, 'EISCAT', 'http://www.eiscat.se/', '', '', 'Tromso', 199, '', '', 69.583331, 19.233331, '', 86, 1, 1, 1, NULL, 'EISCAT Kiruna, EISCAT Sodankylä, EISCAT Longyearbyen', '2011-02-26 15:47:58', '2011-02-26 16:01:08'),
(7, 'European Incoherent Scatter Facility (EISCAT), Kiruna', 0, 'EISCAT', 'http://www.eiscat.se/', '', '', 'Kiruna', 199, '', '', 67.866667, 20.433333, '', 418, 1, 1, 1, NULL, 'EISCAT Tromso, EISCAT Sodankylä, EISCAT Longyearbyen', '2011-02-26 15:57:57', NULL),
(8, 'European Incoherent Scatter Facility (EISCAT), Longyearbyen', 0, 'EISCAT', 'http://www.eiscat.se/', '', '', 'Longyearbyen', 199, '', '', 78.150000, 16.016667, '', 445, 1, 1, 1, NULL, 'EISCAT Kiruna, EISCAT Sodankylä, EISCAT Tromso', '2011-02-26 16:05:34', NULL),
(9, 'European Incoherent Scatter Facility (EISCAT), Sodankylä', 0, 'EISCAT', 'http://www.eiscat.se/', '', '', 'Sodankylä', 199, '', '', 67.366667, 26.633333, '', 197, 1, 1, 1, NULL, 'EISCAT Kiruna, EISCAT Tromso, EISCAT Longyearbyen', '2011-02-26 16:09:52', NULL),
(10, 'Brorfelde', 0, '', '', '', '', '', 57, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-26 17:16:33', '2011-02-26 17:25:07'),
(11, 'Abastumani', 0, '', '', '', '', '', 80, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-26 17:24:19', NULL),
(12, 'Observatorium Kanzelh?he', 0, '', '', '', '', '', 14, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-26 17:28:50', NULL),
(13, 'Andjelko Glivar', 0, '', '', '', '', '', 54, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-26 17:33:48', NULL),
(14, 'Nyrola', 0, '', 'http://www.ursa.fi/sirius/nytt/nytt@info.html', '', '', '', 72, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-26 17:38:47', NULL),
(15, 'Pises observatory', 0, '', 'http://pisesobservatoire.free.fr/', '', '', '', 73, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-26 17:49:39', NULL),
(16, 'Hamberg-Bergedorf', 0, '', 'http://www.hs.uni-hamburg.de/', 'Hamburg Observatory, Gojenbergsweg 112, 21029 Hamburg ', '', '', 81, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-26 17:57:32', NULL),
(17, 'Beersel Hills Observatory', 0, '', 'http://users.skynet.be/bho/index.htm', '', '', '', 21, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-28 17:21:02', '2011-02-28 17:24:09'),
(18, 'Belogradchik', 0, '', 'http://www.astro.bas.bg/~aobel', '', '', '', 33, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-28 17:33:33', NULL),
(19, 'Turku-Kevola Observatory', 0, '', '', '', '', '', 72, '', '', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-02-28 17:35:34', NULL),
(20, 'Byurakan Astrophysical Observatory', 1946, '', 'http://www.bao.am/', 'Byurakan Astrophysical Observatory, Byurakan 378433, Aragatzotn province Armenia', '378433', 'Byurakan', 11, '', 'director@bao.sci.am', 40.350833, 44.241667, '', 1709, 1, 1, 5, NULL, '', '2011-02-28 21:47:22', NULL),
(21, 'Sondrestrom Research Facility', 1983, 'SRI International; National Science Foundation; Denmark Meteorological Institute', 'http://isr.sri.com/', 'Greenland', '', '', 85, '650-859-5343', 'sandie.avlakeotes@sri.com', 67.000000, 309.000000, '', 74, 1, 1, 16, NULL, 'SVALBARD, EISCAT, Arecibo, Millstone Hill', '2011-02-28 21:58:27', NULL),
(22, 'Yebes Astronomical Centre (Centro Astronomico de Yebes)', 0, 'National Astronomical Observatory, Spanish Grand Scientific Facility', 'http://www.fomento.es/', 'Guadalajara', '', 'Yebes', 192, '', '', 40.516667, -3.083333, '', 980, 1, 1, 2, NULL, '', '2011-02-28 22:07:40', NULL),
(23, 'Madrid Deep Space Communications Complex', 0, 'NASA Deep Space Network, Instituto Nacional de Tecnica Aerospacial', 'http://insa.org/node/112', 'Robledo de Chavela', '', 'Madrid', 192, '0034 91 867 7000', '', 40.000000, 4.000000, '', 0, 1, 1, 2, NULL, 'Canberra DSCC, Goldstone DSCC', '2011-02-28 22:32:05', NULL),
(24, 'Observatori Fabra', 1904, 'Reial Academia de Ciencies I Arts de Barcelona', 'http://www.fabra.cat', '', '', 'Barcelona', 192, '', '', 41.700000, 2.200000, '', 415, 1, 1, 2, NULL, '', '2011-02-28 22:38:06', NULL),
(25, 'Observatorio Monte Deva', 0, '', 'http://www.observatoriomontedeva.com/', 'Monte Deva, Gijon', '', '', 192, '985 096 630', '', 43.483331, -5.599994, '', 423, 1, 1, 2, NULL, '', '2011-02-28 22:47:38', '2011-02-28 23:48:27'),
(26, 'E Pozuelo Observatory', 0, '', 'http://www.nto.org/observatorio.html', 'Pozuelo', '', 'Madrid', 192, '', '', 40.433333, 0.000000, '', 730, 1, 1, 2, NULL, '', '2011-02-28 22:53:49', NULL),
(27, 'Piera Observatory', 0, '', 'http://www.astrogea.org/jguarro/index.html', 'Piera, Anoia', '', '', 192, '', '', 0.000000, 0.000000, '', 0, 1, 1, 2, NULL, '', '2011-02-28 22:59:33', NULL),
(28, 'Observatorio del Teide', 0, 'Instituto de Astrofisica de Canarias', 'http://www.iac.es/eno.php?op1=3&lang=en', 'Observatoria del Teide (Tenerife), Instituto de Astrofisica de Canarias C/ Via Lactea, s / n 38200 - La Laguna (Tenerife), Espana', '38200', 'Tenerife', 192, '34/922 329 110', 'teide@iac.es', 28.300000, -16.500000, '', 2, 1, 1, 2, NULL, 'Various (Europe)', '2011-02-28 23:09:42', '2011-02-28 23:47:51'),
(29, 'Chilbolton Observatory', 1967, 'Chilbolton Group of RAL Space, STFC Rutherford Appleton Laboratory', 'http://www.chilbolton.rl.ac.uk/facilities.htm', 'Chilbolton Observatory Drove Road, Chilbolton, Nr Stockbridge, Hants SO20 6BJ', 'SO20 6BJ', '', 217, '(01264) 860391', '', 51.133333, -1.433333, '', 82, 1, 1, 1, NULL, '', '2011-02-28 23:16:48', NULL),
(30, 'Glasgow University Observatory', 0, 'University of Glasgow', 'http://www.astro.gla.ac.uk/observatory/observ.shtml', 'Acre Road (main observatory) / Cochno (outstation); Glasgow, Edinburgh', '', 'Glasgow', 217, '(0141) 581 4322/3', '', 55.899997, -4.299997, '', 50, 1, 1, 1, NULL, '', '2011-02-28 23:25:01', '2011-02-28 23:47:21'),
(31, 'University of London Observatory (ULO)', 1929, 'University College London', 'http://www.ulo.ucl.ac.uk/', '553 Watford Way, Mill Hill London NW7 2QS', 'NW7 2QS', 'London', 217, '0044 (0)203 108 1613', 'kathryn.goldsmith@ucl.ac.uk', 51.600000, -0.233331, '', 78, 1, 1, 1, NULL, '', '2011-02-28 23:33:06', '2011-02-28 23:49:19'),
(32, 'Keele Observatory', 1962, 'Keele University', 'http://www.astro.keele.ac.uk/~obs/', 'Keele University, Newcastle-under-Lyme', '', '', 217, '', 'obsvisits@phys.keele.ac.uk', 53.000000, -2.266667, '', 202, 1, 1, 1, NULL, '', '2011-02-28 23:41:54', '2011-02-28 23:46:26'),
(33, 'Seething Observatory', 0, 'Norwich Astronomical Society', 'http://www.norwich.astronomicalsociety.org.uk/', 'Toad Lane, Thwaite St Mary, NR35 2EQ Norfolk', '', '', 217, '01953 602624', 'drbalcombe@tiscali.co.uk', 52.500000, 1.416667, '', 0, 1, 1, 1, NULL, '', '2011-02-28 23:53:39', NULL),
(34, 'Zimmerwald Observatory', 1956, 'Universitat Bern', 'http://www.aiub.unibe.ch/content/zimmerwald/index_eng.html', 'Waldhof, Zimmerwald (Bern)', '', '', 200, '031 6318594', '', 46.866667, 7.450000, '', 897, 1, 1, 2, NULL, '', '2011-03-01 00:13:57', NULL),
(35, 'Observatoire Astronomique Jurassien-Vicques (Jura Observatory)', 0, 'Jura Astronomical Society', 'http://www.jura-observatory.ch/', 'Béridier 30, 2800 Delémont CH-Switzerland', '', '', 200, '0041 (0) 32 423 32 86', 'info@jura-observatory.ch', 47.350000, 7.416667, '', 505, 1, 1, 2, NULL, '', '2011-03-01 00:19:55', NULL),
(36, 'Observatoire d', 1991, 'Astronomical Society of Valais (SAVAR)', 'http://obs-arbaz.com', 'Anzere', '', '', 200, '(079) 770 03 54', 'borgillioz@bluewin.ch', 46.283331, 7.366667, '', 1440, 1, 1, 2, NULL, '', '2011-03-01 00:26:09', '2011-03-01 00:50:07'),
(37, 'Observatory of Geneva', 0, 'Universite De Geneve; Laboratoire d''Astrophysique de l''EPFL', 'http://www.unige.ch/sciences/astro/an/', 'Sauverny, Versoix, Geneva', '', 'Geneva', 200, '', '', 46.316667, 6.133333, '', 455, 1, 1, 2, NULL, 'El Roque de los Muchachos Observatory (Spain)', '2011-03-01 00:30:25', NULL),
(38, 'Observatoire de Verossaz', 1995, '', 'http://www.verobservatoire.ch/', '', '', 'Verossaz', 200, '079 206 31 57', 'info@verobservatoire.ch', 46.216667, 7.000000, '', 730, 1, 1, 2, NULL, '', '2011-03-01 00:35:28', NULL),
(39, 'Sternwarte Eschenberg', 1979, 'Astronomischen Gessellschaft Winterthur', 'http://eschenberg.ch/', '', '', '', 200, '', '', 47.466667, 8.750000, '', 542, 1, 1, 2, NULL, '', '2011-03-01 00:37:50', NULL),
(40, 'Sternwarte Rotgrueb', 1996, 'Swiss Astronomical Society', 'http://ruemlang.astronomie.ch/', 'Rumlang region', '', '', 200, '044 817 28 13', '', 47.433333, 31.466667, '', 495, 1, 1, 2, NULL, '', '2011-03-01 00:41:21', NULL),
(41, 'Sternwarte Uitikon-Waldegg', 0, '', 'http://www.andreasfaisst.ch/STU/stu.php?view=home', 'Uitikon/Waldegg', '', '', 200, '', '', 47.366667, 8.450000, '', 600, 1, 1, 2, NULL, '', '2011-03-01 00:44:19', NULL),
(42, 'Ankara University Observatory', 1963, 'Ankara University', 'http://rasathane.ankara.edu.tr/en/index.php', 'Ahlatl&#305;bel, ANKARA', '', '', 210, '(312) 490 79 19', 'rasathane@ankara.edu.tr', 39.850000, 2.183333, '', 1260, 1, 1, 3, NULL, '', '2011-03-01 00:49:39', NULL),
(43, 'Istanbul University Observatory', 1936, 'Istanbul University', 'http://www.istanbul.edu.tr/fen/en/gozlemevi.php', '', '', '', 210, '0212 440 00 00/10294 (', '', 41.016667, 28.966667, '', 65, 1, 1, 3, NULL, '', '2011-03-01 00:55:25', NULL),
(44, 'Aryabhatta Research Institute of Observational Sciences', 1954, 'Department of Science and Technology, Government of India', 'http://www.aries.res.in/', 'Manora Peak, Nainital-263 129, Uttarakhand (India)', '', '', 99, '0091-5942-233734', '', 29.366667, 79.466667, '', 1925, 1, 4, 6, NULL, '', '2011-03-01 01:01:22', NULL),
(45, 'Crni Vrh Observatory', 1975, 'University of Ljublana', 'http://www.observatorij.org', 'Predgrize 29a, 5274 Crni Vrh nad Idrijo SLOVENIA', '', '', 187, '00386 5 3777380', '', 45.950000, 14.066667, '', 726, 1, 1, 2, NULL, '', '2011-03-01 01:06:43', '2011-03-01 01:29:50'),
(46, 'Bayfordbury Observatory', 0, 'University of Hertfordshire', 'http://www.herts.ac.uk/courses/schools-of-study/physics-astronomy-and-mathematics/observatory.cfm', 'Hatfield Campus', '', '', 217, '0044 (0)1707 284426 (H', 'bayfordbury@herts.ac.uk', 51.783333, -0.100000, '', 57, 1, 1, 1, NULL, '', '2011-03-01 01:11:28', NULL),
(47, 'Huairou Solar Observing Station', 0, '', 'http://sun.bao.ac.cn/', 'Located on a small island near the north bank of Huairou Reservoir', '', '', 96, '10-64855805/64888716 (', '', 40.000000, 117.000000, '', 62, 5, 5, 9, NULL, '', '2011-03-01 01:18:35', NULL),
(48, 'Kodaikanal Observatory', 1899, 'Indian Institute of Astrophysics', 'http://www.iiap.res.in/centers/kodai', 'Located in the Palani hill range, southern India', '624 103', 'Kodaikanal', 99, '91 (4542) 240218', 'sundar@iiap.res.in', 10.216667, 77.466667, '', 2343, 1, 1, 6, NULL, '', '2011-03-01 01:23:22', NULL),
(49, 'La Canada Observatory', 2002, '', 'http://www.lacanada.es/', 'La Canada, Avila, Spain', '', '', 192, '', '', 40.600000, -4.500000, '', 1400, 1, 1, 2, NULL, '', '2011-03-01 01:27:44', NULL),
(50, 'Mt John University Observatory', 0, 'University of Canterbury', 'http://www.phys.canterbury.ac.nz/research/mt_john/index.shtml', 'P O Box 56, Lake Tekapo 7945', '', '', 148, '0064 (3) 680 6000', '', -43.983333, 170.466667, '', 1029, 1, 1, 13, NULL, '', '2011-03-01 01:36:01', NULL),
(51, 'Mt Pleasant Observatory', 0, 'University of Tasmania', 'http://www-ra.phys.utas.edu.au/physics_mt_pleasant.html', 'Located 20km east of Hobart, Tasmania', '', '', 13, '0061 (0)3 6226 2447 (P', '', -42.800000, 147.433333, '', 43, 1, 1, 11, NULL, '', '2011-03-01 01:39:42', NULL),
(52, 'Siding Spring Observatory', 0, 'Research School of Astronomy and Astrophysics (RSAA)', 'http://www.mso.anu.edu.au/info/sso/', 'Located 20 minutes from Coonabarabran National Park Road, New South Wales', '', '', 13, '02 68426211', 'ssovc@mso.anu.edu.au', -31.250000, 149.066667, '', 1130, 1, 1, 11, NULL, '', '2011-03-01 01:44:52', NULL),
(53, 'Sierra Nevada Observatory (OSN)', 1976, 'Instituto de Astrofisica de Andalucia', 'http://www.osn.iaa.es/osn_eng.html', 'Instituto de Astrofisica de Andalucia (CSIC) c/ Camino Bajo de Huetor, 50 PO Box 3004, 18080 Granada', '', '', 192, '0034 958 121311', '', 37.066667, -3.383333, '', 2896, 1, 1, 2, NULL, '', '2011-03-01 01:48:02', NULL),
(54, 'Caltech Submillimeter Observatory (CSO)', 1988, 'Caltech', 'http://www.submm.caltech.edu/cso/', 'Caltech Submillimeter Observatory Office, 111 Nowelo St., Hilo, Hawaii', '96720', 'Hilo', 218, '(808) 935-1909', 'webmaster@www.submm.caltech.edu', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-03-01 15:11:52', NULL),
(55, 'Canada-France-Hawaii Telescope', 1979, 'National Research Council of Canada, Centre National de la Recherche Scientifique of France, University of Hawaii', 'http://www.cfht.hawaii.edu/', 'CFHT Corporation 65-1238 Mamalahoa Hwy Kamuela, Hawaii', '96743', '', 218, '(808) 885-7944', 'info@cfht.hawaii.edu', 0.000000, 0.000000, '', 4200, 1, 1, 23, NULL, 'James Clerk Maxwell Telescope', '2011-03-01 15:34:15', '2011-03-01 16:50:36'),
(56, 'Gemini Observatory (South)', 2000, 'The United States Gemini Office, The United Kingdom Gemini Office, The Canadian Gemini Office, The Australian Gemini Office, The Argentinian Gemini Office, The Brazilian Gemini Office, The Chilean Gemini Office, University of Hawaii Gemini Office', 'http://www.gemini.edu/', 'Gemini Observatory Southern Operations Center c/o AURA, Casilla 603 La Serena', '', '', 43, '56-51-205-600', 'iks@astro.ox.ac.uk', -30.260000, -70.739331, 'Summit of Cerro Pachon', 2750, 1, 1, 17, NULL, 'Gemini Observatory (North)', '2011-03-01 15:58:17', '2011-03-01 16:12:03'),
(57, 'Gemini Observatory (North)', 2000, 'The United States Gemini Office, The United Kingdom Gemini Office, The Canadian Gemini Office, The Australian Gemini Office, The Argentinian Gemini Office, The Brazilian Gemini Office, The Chilean Gemini Office, University of Hawaii Gemini Office', 'http://www.gemini.edu/', 'Gemini Observatory Northern Operations Center 670 N. A', '96720', 'Hilo', 218, '(808) 974-2500', 'iks@astro.ox.ac.uk', 19.843092, -155.470592, '', 4213, 1, 1, 1, NULL, 'Gemini Observatory (South)', '2011-03-01 16:06:02', '2011-03-04 11:31:42'),
(58, 'MIT Haystack Observatory', 1964, 'MIT', 'http://www.haystack.mit.edu/', 'MIT Haystack Observatory Off Route 40 Westford, MA', '01886-1299', 'Westford', 218, '(781) 981-5400', 'info@haystack.mit.edu', 0.000000, 0.000000, '', 0, 1, 1, 1, NULL, '', '2011-03-01 16:37:37', NULL),
(59, 'James Clerk Maxwell Telescope', 1987, 'Science and Technology Facilities Council, the National Research Council Canada, and the Netherlands Organisation for Scientific Research', 'http://www.jach.hawaii.edu/JCMT/', 'Summit of Mauna Kea', '', '', 218, '', '', 0.000000, 0.000000, '', 4092, 1, 1, 23, NULL, 'Canada-France-Hawaii Telescope', '2011-03-01 16:50:08', '2011-03-01 16:55:38'),
(60, 'national observatory of athens', 1842, 'The Institute of Astronomy and Astrophysics (IAA) ', 'http://www.noa.gr/indexen.html', 'P.O. BOX 20048 - THISSIO - 11810 - ATHENS - GREECE ', '', 'Athens', 84, '+30 2103490101, +30 21', '', 37.983333, 22.200000, '', 2340, 1, 3, 3, NULL, 'Chelmos observatory, Aristarchos', '2011-03-03 18:37:31', NULL),
(61, 'Konkoly Observatory', 0, 'Hungarian Academy of Sciences', 'http://www.konkoly.hu/', ' H-1121 Budapest, Konkoly Thege Miklós út 15-17. ', '', 'Budapest', 97, '+36 1 3919360 ', 'abraham@konkoly.hu', 47.500000, 18.966667, '', 935, 1, 1, 2, NULL, 'Heliophysical Observatory', '2011-03-03 18:54:34', NULL),
(62, 'Medicina Radiotelescopes', 1963, 'National Institute for Astrophysics ', 'http://www.med.ira.inaf.it/index_EN.htm', 'Via Fiorentina n. 3508/B - 40059 Fiorentina di Medicina (Bologna) ', '', 'Bologna', 103, '+39 (0)51.6965811 ', 's.mariotti@ira.inaf.it', 44.520556, 11.652497, '44° 31', 28, 1, 1, 2, NULL, 'SKA, EVN', '2011-03-03 19:03:50', '2011-03-03 19:05:41'),
(63, 'Astronomical Observatory of Bologna', 1986, 'National Institute for Astrophysics (INAF)', 'http://translate.google.com/translate?hl=en&sl=it&u=http://www.bo.astro.it/&ei=Pa5dTe-rL8aq8AOlqKSrCw&sa=X&oi=translate&ct=result&resnum=1&ved=0CCEQ7gEwAA&prev=/search%3Fq%3DAstronomical%2BObservatory%2Bof%2BBOLOGNA%26hl%3Den%26prmd%3Divnsm', 'Osservatorio Astronomico di Bologna  Via Ranzani 1 Via Ranzani 1  40127 Bologna  Italy', '', 'Bologna', 103, '+39 0512095701', 'flavio.fusipecci@oabo.inaf.it', 44.500000, 11.349997, '', 0, 1, 1, 2, NULL, 'Loiano Observatory', '2011-03-03 19:17:15', '2011-03-03 19:31:31'),
(64, 'Vatican Observatory', 1891, 'Vatican Observatory Group', 'http://vaticanobservatory.org/', 'Vatican Observatory 00040 Caster Gandolfo Rome', '', 'Vatican City', 223, '(+39)-06-698-85266 ', '', 41.900000, 12.483333, '', 430, 1, 1, 2, NULL, 'Mount Graham International Observatory ', '2011-03-03 19:30:20', NULL),
(65, 'astronomical observatory of the autonomous valley aosta valley', 2003, '', 'http://www.oavda.it/english/index.htm', 'Saint-Barthélemy · Loc. Lignan, 39 11020 Nus (AO)', '', 'Aosta Valley', 103, '+39 0165 77 00 50', 'info@oavda.it', 45.750000, 7.466667, '', 1600, 1, 1, 1, NULL, '', '2011-03-03 19:52:17', NULL),
(66, 'Catania Astrophysical Observatory', 0, 'National Institute for Astrophysics, INAF ', 'http://translate.google.co.uk/translate?hl=en&sl=it&u=http://www.ct.astro.it/&ei=6OFdTZHkKNSZhQeAhpWDDg&sa=X&oi=translate&ct=result&resnum=1&ved=0CCoQ7gEwAA&prev=/search%3Fq%3DCatania%2BAstrophysical%2BObservatory%26hl%3Den%26safe%3Doff%26client%3Dfirefox-a%26hs%3DFUH%26rls%3Dorg.mozilla:en-GB:official%26prmd%3Divns', '78, 95123 Catania ITALY ', '', 'Catania', 103, '(+39) 0957332111 ', 'protocollo_oact@pec.it', 37.516667, 25.066667, '', 3340, 1, 1, 2, NULL, '', '2011-03-03 20:19:52', NULL),
(67, 'Osservatorio Astronomico di Torino', 1759, 'Observatory of Torino ', 'http://www.to.astro.it/index.html', 'Via Osservatorio, 20 10025 Pino Torinese (TO) - Italy ', '', 'Torino', 103, '+39 0118101900 ', 'antonucci@oato.inaf.it', 45.033333, 7.766667, '', 622, 1, 1, 2, NULL, 'European Southern Observatory,  National Optical Astronomy Observatories,  Steward Observatory ', '2011-03-03 20:34:42', NULL),
(68, 'Special Astrophysical Observatory (SAO)', 1966, '', 'http://www.sao.ru/Doc-en/index.html', 'Special Astrophysical Observatory,  Nizhnij Arkhyz,  Zelenchukskiy region,  Karachai-Cherkessian Republic,  Russia 369167 ', '', '', 171, '+7(87878) 46436 ', 'admsao@sao.ru', 57.250000, 53.016667, '', 2070, 1, 1, 4, NULL, 'European Southern Observatory,  National Optical Astronomy Observatories,  Steward Observatory', '2011-03-03 20:56:32', NULL),
(69, 'LOFAR', 0, 'Netherlands Institute for Radio Astronomy', 'http://www.lofar.org/about-lofar/system/introduction', 'Oude Hoogeveensedijk, 4 7991 PD Dwingeloo, The Netherlands', '', 'Dwingeloo', 145, '(+31) (0)521 595 100 ', '', 0.000000, 0.000000, 'Spread Across Europe', 0, 1, 1, 1, NULL, '', '2011-03-03 21:08:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `observatory_to_research_areas`
--

DROP TABLE IF EXISTS `observatory_to_research_areas`;
CREATE TABLE IF NOT EXISTS `observatory_to_research_areas` (
  `observatory_id` int(10) unsigned NOT NULL,
  `research_area_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`observatory_id`,`research_area_id`),
  KEY `observatory_id_3` (`observatory_id`),
  KEY `research_area_id_1` (`research_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observatory_to_research_areas`
--

INSERT INTO `observatory_to_research_areas` (`observatory_id`, `research_area_id`) VALUES
(1, 6),
(1, 7),
(1, 13),
(1, 15),
(1, 17),
(1, 19),
(2, 2),
(3, 2),
(3, 5),
(3, 24),
(4, 2),
(4, 3),
(4, 9),
(4, 11),
(4, 14),
(4, 15),
(4, 21),
(4, 25),
(5, 1),
(5, 3),
(5, 6),
(6, 23),
(7, 23),
(8, 23),
(9, 23),
(10, 1),
(11, 2),
(11, 11),
(15, 1),
(15, 6),
(15, 11),
(15, 13),
(16, 4),
(16, 6),
(16, 13),
(17, 2),
(18, 3),
(19, 2),
(20, 6),
(20, 13),
(20, 26),
(21, 1),
(21, 4),
(22, 1),
(22, 27),
(23, 1),
(23, 27),
(24, 1),
(24, 2),
(25, 2),
(25, 28),
(26, 2),
(26, 28),
(27, 2),
(27, 24),
(28, 2),
(28, 11),
(28, 22),
(29, 1),
(29, 4),
(29, 27),
(29, 29),
(30, 2),
(30, 28),
(31, 5),
(31, 6),
(31, 8),
(31, 28),
(32, 15),
(32, 28),
(33, 28),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(35, 2),
(35, 5),
(35, 14),
(36, 28),
(37, 28),
(38, 11),
(38, 28),
(39, 28),
(40, 28),
(41, 11),
(41, 28),
(42, 15),
(42, 28),
(43, 11),
(43, 29),
(44, 1),
(44, 2),
(44, 4),
(44, 5),
(44, 6),
(44, 9),
(44, 11),
(45, 1),
(45, 2),
(45, 4),
(45, 5),
(45, 6),
(45, 9),
(45, 11),
(45, 30),
(46, 1),
(46, 2),
(46, 11),
(46, 27),
(47, 11),
(48, 14),
(48, 28),
(49, 3),
(49, 29),
(49, 30),
(50, 6),
(50, 19),
(50, 20),
(51, 27),
(52, 31),
(52, 32),
(53, 28),
(54, 6),
(54, 10),
(54, 33),
(55, 31),
(55, 32),
(56, 31),
(56, 32),
(57, 9),
(58, 27),
(59, 6),
(59, 7),
(59, 34),
(60, 6),
(60, 11),
(60, 13),
(60, 22),
(60, 49),
(61, 7),
(61, 9),
(61, 13),
(61, 20),
(61, 24),
(61, 31),
(61, 40),
(61, 54),
(61, 56),
(62, 7),
(62, 13),
(62, 20),
(62, 27),
(62, 30),
(62, 55),
(62, 56),
(63, 6),
(63, 54),
(64, 10),
(64, 13),
(64, 15),
(64, 24),
(64, 31),
(64, 42),
(64, 46),
(64, 52),
(64, 66),
(65, 31),
(66, 9),
(66, 11),
(66, 13),
(67, 6),
(67, 13),
(67, 34),
(67, 67),
(68, 5),
(68, 7),
(68, 9),
(68, 11),
(68, 13),
(68, 19),
(68, 20),
(68, 31),
(68, 33),
(68, 45),
(68, 47),
(68, 64),
(68, 67),
(69, 67);

-- --------------------------------------------------------

--
-- Table structure for table `observatory_to_scientific_contacts`
--

DROP TABLE IF EXISTS `observatory_to_scientific_contacts`;
CREATE TABLE IF NOT EXISTS `observatory_to_scientific_contacts` (
  `observatory_id` int(10) unsigned NOT NULL,
  `scientific_contact_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`observatory_id`,`scientific_contact_id`),
  KEY `observatory_id_1` (`observatory_id`),
  KEY `scientific_contact_id_1` (`scientific_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observatory_to_scientific_contacts`
--

INSERT INTO `observatory_to_scientific_contacts` (`observatory_id`, `scientific_contact_id`) VALUES
(1, 1),
(3, 2),
(4, 3),
(4, 4),
(5, 5),
(20, 10),
(21, 11),
(27, 12),
(29, 13),
(30, 14),
(31, 15),
(33, 16),
(34, 17),
(35, 18),
(36, 19),
(38, 20),
(40, 21),
(42, 22),
(43, 23),
(44, 24),
(45, 25),
(46, 26),
(47, 27),
(49, 28),
(50, 29),
(51, 30),
(52, 31),
(53, 32),
(61, 62),
(62, 63),
(63, 64),
(64, 65),
(67, 66);

-- --------------------------------------------------------

--
-- Table structure for table `observatory_to_targets`
--

DROP TABLE IF EXISTS `observatory_to_targets`;
CREATE TABLE IF NOT EXISTS `observatory_to_targets` (
  `observatory_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`observatory_id`,`target_id`),
  KEY `observatory_id_7` (`observatory_id`),
  KEY `target_id_1` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observatory_to_targets`
--

INSERT INTO `observatory_to_targets` (`observatory_id`, `target_id`) VALUES
(11, 45),
(23, 50),
(24, 31),
(24, 33),
(24, 34),
(24, 51),
(27, 33),
(31, 47),
(34, 48),
(35, 31),
(35, 33),
(38, 50),
(41, 45),
(45, 31),
(45, 33),
(48, 31),
(49, 31),
(60, 45),
(60, 47),
(61, 13),
(61, 14),
(61, 15),
(61, 16),
(61, 17),
(61, 18),
(61, 19),
(61, 20),
(61, 21),
(61, 22),
(61, 23),
(61, 24),
(61, 25),
(61, 26),
(61, 27),
(61, 28),
(61, 29),
(61, 30),
(61, 31),
(61, 32),
(61, 33),
(61, 34),
(61, 35),
(61, 36),
(61, 37),
(61, 38),
(61, 39),
(61, 40),
(61, 41),
(61, 42),
(61, 43),
(61, 44),
(61, 47),
(61, 48),
(61, 49),
(61, 51),
(61, 52),
(61, 53),
(62, 47),
(62, 48),
(63, 45),
(66, 45),
(67, 8),
(67, 30),
(67, 45),
(68, 45);

-- --------------------------------------------------------

--
-- Table structure for table `observatory_to_telescopes`
--

DROP TABLE IF EXISTS `observatory_to_telescopes`;
CREATE TABLE IF NOT EXISTS `observatory_to_telescopes` (
  `observatory_id` int(10) unsigned NOT NULL,
  `telescope_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`observatory_id`,`telescope_id`),
  KEY `observatory_id_2` (`observatory_id`),
  KEY `telescope_id_1` (`telescope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `observatory_to_telescopes`
--

INSERT INTO `observatory_to_telescopes` (`observatory_id`, `telescope_id`) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 9),
(6, 10),
(7, 8),
(8, 11),
(8, 12),
(9, 13),
(10, 14),
(11, 15),
(11, 16),
(11, 17),
(11, 18),
(11, 19),
(11, 20),
(12, 21),
(12, 22),
(13, 23),
(13, 24),
(15, 25),
(15, 26),
(15, 27),
(17, 28),
(17, 29),
(18, 30),
(18, 31),
(18, 32),
(19, 33),
(20, 34),
(20, 35),
(21, 36),
(21, 37),
(21, 38),
(21, 39),
(21, 40),
(22, 41),
(22, 42),
(23, 43),
(23, 44),
(23, 45),
(23, 46),
(25, 47),
(25, 48),
(26, 49),
(26, 50),
(26, 51),
(27, 52),
(27, 53),
(28, 54),
(28, 55),
(28, 56),
(28, 57),
(28, 58),
(29, 59),
(30, 60),
(30, 61),
(31, 62),
(31, 63),
(31, 64),
(31, 65),
(31, 66),
(32, 67),
(32, 68),
(32, 69),
(33, 70),
(33, 71),
(34, 72),
(35, 73),
(35, 74),
(35, 75),
(36, 76),
(36, 77),
(36, 78),
(37, 79),
(37, 80),
(38, 81),
(38, 82),
(38, 83),
(39, 84),
(39, 85),
(40, 86),
(40, 87),
(41, 88),
(41, 89),
(42, 90),
(42, 91),
(42, 92),
(42, 93),
(42, 94),
(43, 95),
(43, 96),
(43, 97),
(44, 98),
(44, 99),
(44, 100),
(44, 101),
(44, 102),
(45, 103),
(45, 104),
(45, 105),
(46, 106),
(46, 107),
(46, 108),
(47, 109),
(48, 110),
(48, 111),
(49, 112),
(50, 113),
(50, 114),
(50, 115),
(50, 116),
(50, 117),
(51, 118),
(51, 119),
(52, 120),
(52, 121),
(52, 122),
(52, 123),
(52, 124),
(53, 125),
(53, 126),
(53, 127),
(54, 128),
(55, 129),
(56, 130),
(57, 131),
(57, 164),
(57, 165),
(58, 132),
(59, 133),
(60, 134),
(60, 135),
(61, 136),
(61, 137),
(61, 138),
(61, 139),
(62, 140),
(62, 141),
(63, 142),
(63, 143),
(64, 144),
(64, 145),
(64, 146),
(64, 147),
(64, 148),
(65, 149),
(65, 150),
(66, 151),
(66, 152),
(66, 153),
(67, 154),
(67, 155),
(67, 156),
(67, 157),
(68, 158),
(68, 159),
(68, 160),
(68, 161),
(69, 162),
(69, 163);

-- --------------------------------------------------------

--
-- Table structure for table `pages_list`
--

DROP TABLE IF EXISTS `pages_list`;
CREATE TABLE IF NOT EXISTS `pages_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `pages_list`
--

INSERT INTO `pages_list` (`id`, `name`, `description`, `level`) VALUES
(1, 'add.php', 'add new catalogue entries', 21),
(2, 'browse.php', 'browse catalogue', 0),
(3, 'edit.php', 'edit catalogue entries', 21),
(4, 'home.php', NULL, 0),
(5, 'login.php', NULL, 0),
(6, 'logout.php', NULL, 0),
(7, 'account.php', 'change account details', 11),
(8, 'reset.php', 'resets a user password', 0),
(9, 'registration.php', 'registers a new user', 31);

-- --------------------------------------------------------

--
-- Table structure for table `precipitation_ranges`
--

DROP TABLE IF EXISTS `precipitation_ranges`;
CREATE TABLE IF NOT EXISTS `precipitation_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `range` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `precipitation_ranges`
--

INSERT INTO `precipitation_ranges` (`id`, `range`) VALUES
(1, '<10'),
(2, '11-50'),
(3, '51-100'),
(4, '101-200'),
(5, '201-500'),
(6, '>500'),
(7, '---');

-- --------------------------------------------------------

--
-- Table structure for table `research_areas`
--

DROP TABLE IF EXISTS `research_areas`;
CREATE TABLE IF NOT EXISTS `research_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `research_areas`
--

INSERT INTO `research_areas` (`id`, `name`) VALUES
(1, 'Key Area 1 (Planetary aurorae, planetary radio emissions, planetary space weather)'),
(2, 'Key Area 2 (Small solar system objects: Astrometry, spectroscopy, stellar occultations, meteoroid impact effects)'),
(3, 'Key Area 3 (Airless bodies in the solar system: Moon, Mercury, Galilean satellites)'),
(4, 'Atmospheric Physics'),
(5, 'Supernovae / Novae'),
(6, 'Galaxies'),
(7, 'Interstellar Medium'),
(8, 'Exoplanets'),
(9, 'Stellar Physics'),
(10, 'Large Scale Structures'),
(11, 'Solar Physics'),
(12, 'Geodesy'),
(13, 'Cosmology'),
(14, 'Stellar Occultations'),
(15, 'Public Outreach / Education etc.'),
(16, 'Particle Physics'),
(17, 'Black Holes'),
(18, 'Astrobiology'),
(19, 'Astrochemistry'),
(20, 'Neutron Stars / Pulsars etc.'),
(21, 'Orbital Mechanics'),
(22, 'Interplanetary Medium'),
(23, 'Magnetospheric Physics'),
(24, 'Variable Stars'),
(25, 'Climate Studies'),
(26, 'Instability phenomena in the universe'),
(27, 'Radio Astronomy'),
(28, 'Sky Observation'),
(29, 'Meteorology'),
(30, 'NEOs'),
(31, 'Optical Astronomy'),
(32, 'Infrared Astronomy'),
(33, 'Cosmic Microwave Background'),
(34, 'Solar System'),
(35, 'Space Plasma Physics'),
(36, 'Sun-Earth Interaction'),
(37, 'Space Weather'),
(38, 'Solar Wind Interaction'),
(39, 'Earth''s Magnetic Environment'),
(40, 'Gamma-ray emission'),
(41, 'Energetic Radiation'),
(42, 'Iron Quasar'),
(43, 'Determination of Hubble Constant'),
(44, 'Sunyaev-Zel''dovich effect'),
(45, 'Big Bang'),
(46, 'Expansion of Universe'),
(47, 'Beginning of Universe'),
(48, 'Exotic Matter'),
(49, 'X-rays'),
(50, 'Observations of GRB'),
(51, 'Hubble Deep Fields'),
(52, 'Quasars'),
(53, 'Gamma-ray bursts'),
(54, 'Creation of Stars'),
(55, 'Comets'),
(56, 'Planets'),
(57, 'Satellites'),
(58, 'Creation of Chemical Elements'),
(59, 'X-ray emitting temperatures'),
(60, 'Composition of Satellites'),
(61, 'Electromagnetic Radiation'),
(62, 'Lunar Geology'),
(63, 'Geochemistry'),
(64, 'Investigation of magnetic activity of the Sun - including its generation, energy transfer and release of the magnetic energy.'),
(65, 'Stellar Interiors'),
(66, 'Dark Matter'),
(67, 'Instrument Design'),
(68, 'Atmospheric Observations'),
(69, 'Radar Imaging'),
(70, 'Military Defence');

-- --------------------------------------------------------

--
-- Table structure for table `science_goals`
--

DROP TABLE IF EXISTS `science_goals`;
CREATE TABLE IF NOT EXISTS `science_goals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acronym` varchar(5) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=89 ;

--
-- Dumping data for table `science_goals`
--

INSERT INTO `science_goals` (`id`, `acronym`, `name`) VALUES
(1, 'MA', 'Magnetospheres'),
(2, 'SA', 'Satellites'),
(3, 'AT', 'Atmospheres'),
(4, 'AU', 'Aurorae'),
(5, 'UNK', 'unknown'),
(6, 'PC', 'Polar Cusps'),
(7, 'SW', 'Solar Winds'),
(8, 'S-E I', 'Sun-Earth Interaction'),
(9, 'SPP', 'Space Plasma Physics'),
(10, 'N', 'Nucleosynthesis'),
(11, 'RPA', 'Relativistic-particle accelerators'),
(12, 'SFS', 'Strong-field signatures in compact stars'),
(13, 'OE', 'Optical Emission from prime targets of Integral Instruments'),
(14, 'XG', 'Observations in optical band with those at X-rays and gamma-rays'),
(15, 'NP', 'Nature and Physics of sources over wavelength range'),
(16, 'EON', 'Energetic Objects in Universe'),
(17, 'GRS', 'Gamma-ray sources'),
(18, 'PDS', 'Proton-detection system'),
(19, 'GRE', 'Gamma-Ray Emission'),
(20, 'BOU', 'Beginning of Universe'),
(21, 'EU', 'How the Universe evolved to the state we observe today'),
(22, 'UEF', 'How the Universe will continue to evolve in the future'),
(23, 'UBB', 'Measuring remnants of the radiation that filled the Universe immediately after the Big Bang'),
(24, 'CMB', 'Cosmic Microwave Background'),
(25, 'HC', 'Determining the Hubble Constant value'),
(26, 'XBH', 'X-rays from accretion onto black holes'),
(27, 'PES', 'Properties of exploding stars'),
(28, 'NEM', 'Nature of exotic matter'),
(29, 'OOG', 'Observations of GRB'),
(30, 'WRE', 'Highest Possible effective area over a wide range of energies'),
(31, 'SRHE', 'To provide sufficient reflectivity at high energies'),
(32, 'XBH', 'X-rays from accretion onto black holes'),
(33, 'PES', 'Properties of exploding stars'),
(34, 'NEM', 'Nature of exotic matter'),
(35, 'OOG', 'Observations of GRB'),
(36, 'LU', 'Life of Universe'),
(37, 'BS', 'Birth of Stars'),
(38, 'G', 'Galaxies'),
(39, 'SS', 'Solar Systems'),
(40, 'IG', 'Interstellar gas'),
(41, 'FGSP', 'Formation of galaxies, stars & planetary systems'),
(42, 'HDF', 'The Hubble Deep Fields'),
(43, 'PQG', 'Proof that Quasars reside in galaxies'),
(44, 'SCO', 'Measure the angular diameter of stars and other celestial objects'),
(45, 'AMS', 'Refine the positions and absolute magnitude scale for stars'),
(46, 'DSU', 'Determine the true distance scale for the Universe'),
(47, 'EUM', 'Expansion of the Universe measured'),
(48, 'GRB', 'Proof that gamma-ray burst are found in galaxies'),
(49, 'USE', 'Study the formation of Galaxies in the early universe and their subsequent evolution'),
(50, 'IIM', 'Investigate the creation of stars and their interaction with the interstellar medium'),
(51, 'CCA', 'Observe the Chemical Composition of the Atmospheres and Surfaces of Comets, Planets & Satellites'),
(52, 'MCU', 'Examine the molecular chemistry of the universe'),
(53, 'GDU', 'Detection and Investigation of galaxies in the distant Universe.'),
(54, 'IMG', 'Study of star formation and the interstellar medium in our own and nearby galaxies.'),
(55, 'XGR', 'Detecting Signals ranging from soft X-rays up to Gamma-rays'),
(56, 'BHS', 'Investigating high energy astronomical phenomena, such as Black holes and Supernovae'),
(57, 'XGR', 'Detecting Signals ranging from soft X-rays up to Gamma-rays.'),
(58, 'BHS', 'Investigating high energy astronomical phenomena, such as Black holes and Supernovae.'),
(59, 'LSD', 'To analyse geological, mineralogical and topographical aspects of the lunar surface in unprecedented detail.'),
(60, 'DCM', 'Study the vertical distribution of crustal material.'),
(61, 'MBM', 'Investigate the processes that led to the formation of craters, maria and basins on the Moon.'),
(62, 'CRM', 'Explore space weathering processes, that result from the interaction of the solar wind and cosmic rays with the Moon''s surface.'),
(63, 'ALS', 'Analyse the magnetic anomalies on the lunar surface.'),
(64, 'SIP', 'Search for ices at the poles.'),
(65, 'HSR', 'Produce 3D maps of regions of particular scientific interest at high spatial resolution.'),
(66, 'PTI', 'Drop an impact probe on the lunar surface to test near-surface properties and test impact technology.'),
(67, 'SCM', 'Learn more about lunar history and formation from the composition of different surface features and the changes in the continuum slope over the Moon.'),
(68, 'PSA', 'Search for the presence of water in the form of hydrated minerals or ices at the lunar poles in the permanently shaded areas.'),
(69, 'HEM', 'Extend the scientific knowledge about resources for a later human exploration of the Moon.'),
(70, 'IFM', 'Map lunar surface composition by infrared fingerprints of minerals.'),
(71, 'MSL', 'To understand the processes of magnetic field generation and transport including the magnetic modulation of the Sun''s luminosity.'),
(72, 'SCC', 'To investigate the processes responsible for energy transfer from the photosphere to the corona and that are responsible for the heating and structuring of the chromosphere and the corona.'),
(73, 'SES', 'To determine the mechanisms responsible for eruptive phenomena, such as flares and coronal mass ejections, and understand these phenomena in the context of the space weather of the Sun-Earth System.'),
(74, 'SMF', 'To observe the dissipation of the life-cycle story of Solar magnetic fields'),
(75, 'CTE', 'To observe the energy buildup, storage and release process in the corona for any transient event'),
(76, 'SSI', 'To study stellar interiors.'),
(77, 'SFE', 'To study for exoplanets.'),
(78, 'ELP', 'Searching for rocky planets outside our Solar System, and to find habitable, Earth-like planets around other stars.'),
(79, 'LPS', 'To study the acoustical waves across surfaces of stars, and hence penetrate into the ''invisible'' stellar interiors and learn about the physics of stars.'),
(80, 'IF', 'Ion Flux'),
(81, '67P', 'Observations of the comet 67P''s nucleus and coma'),
(82, 'N/A', 'Study Mars'' Atmosphere and Surface'),
(83, 'EOS', 'Earth Observing Systems'),
(84, 'HRTI', 'High Resolution Terrain Information'),
(85, 'SAR', 'High resolution reconnaissance imaging'),
(86, 'WLE', 'Worlds like Earth'),
(87, '67P', 'unlock the secrets of how our solar system looked before planets formed.     * Characterisation of the nucleus     * Determination of the chemical compounds present, including enantiomers     * Study of comet activities and developments over time.'),
(88, '67P ', 'search for the abundance of noble gas in the comet core');

-- --------------------------------------------------------

--
-- Table structure for table `scientific_contacts`
--

DROP TABLE IF EXISTS `scientific_contacts`;
CREATE TABLE IF NOT EXISTS `scientific_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `institution` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `scientific_contacts`
--

INSERT INTO `scientific_contacts` (`id`, `name`, `email`, `institution`) VALUES
(1, 'Carsten Kramer', 'kramer@iram.es', 'IRAM'),
(2, 'Lorenzo Franco', 'lor_franco@libero.it', ''),
(3, 'Dr Apostolos Christou', 'aac@arm.ac.uk', ''),
(4, 'Prof Mark Bailey', 'meb@arm.ac.uk', ''),
(5, 'A. van Zegveld', 'andre@AbreLosOjos.be', ''),
(6, 'Dr. Edward Stone', 'ecr@srl.caltech.edu', ''),
(7, 'Gerhard Schwehm', '', ' ESOC, Darmstadt, Germany'),
(8, 'Rudolf Schmidt ', '', 'ESOC, Darmstadt, Germany'),
(9, 'Elsa Montagnon', '', '(ESOC) Darmstadt, Germany. '),
(10, 'NIKOGOSSIAN Elena H., Dr', 'elena@bao.sci.am', ''),
(11, 'Dr. Anja Stromme', 'anja.stromme@sri.com', ''),
(12, 'Joan Guarro', 'jguarro@astrogea.org', ''),
(13, 'Darcy Ladd', 'darcy.ladd@stfc.ac.uk', ''),
(14, 'Graham Woan (Director)', 'graham@astro.gla.ac.uk', 'University of Glasgow'),
(15, 'Prof Ian Howarth (Director)', 'idh@star.ucl.ac.uk', 'University College London'),
(16, 'Mark Thompson (Chairman)', 'thompsonmarkp@btopenworld.com', 'FRAS'),
(17, 'Prof. Dr Schildknecht Thomas (Director)', '', ''),
(18, 'Michel ORY (Astrophysicist and educator)', 'michel.ory@jura-observatory.ch', ''),
(19, 'Alain Kohler (President)', 'alain.kohler@tvs2net.ch', ''),
(20, 'Biollay Sebastian', '024/485 18 76', ''),
(21, 'Walter Bersinger (President)', '', ''),
(22, 'Assoc. Prof. Birol Gurol (Director)', 'birol@astro1.science.ankara.edu.tr', 'Ankara University'),
(23, 'Prof. Dr. M. Turker Ozkan (Head of Department)', 'ozkant@istanbul.edu.tr', 'Istanbul University'),
(24, 'Prof. Ram Sagar (Director)', '0091-05942--233734 ext 201', ''),
(25, 'Stanislav Maticic (In charge of Hardware and Technology)', 'stanislav.maticic@guest.arnes.si', ''),
(26, 'Professor Hugh Jones', '', ''),
(27, 'Professor Zhang, Hongqi', 'hzhang@bao.ac.cn', ''),
(28, 'Juan Lacruz', '', ''),
(29, 'Dr Karen Pollard (Director)', 'karen.pollard@canterbury.ac.nz', ''),
(30, 'Prof J.M. Dickey', 'John.Dickey@utas.edu.au', 'University of Tasmania'),
(31, 'Geoffrey White (Senior Technical Officer)', 'gwhite@mso.anu.edu.au', ''),
(32, 'Julio F. Rodriguez Gomez (Vice Director of Technology)', 'julio@iaa.es', ''),
(33, 'Marshall Space Flight Center', '', 'NASA'),
(34, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(35, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(36, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(37, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(38, 'Joern Wilms ', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(39, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(40, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(41, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(42, 'Charles F. Bolden, Jr', 'www.nasa.gov', 'NASA'),
(43, 'Charles F. Bolden, Jr', 'www.nasa.gov', 'NASA'),
(44, 'Charles F. Bolden, Jr', 'www.nasa.gov', 'NASA'),
(45, 'Charles F. Bolden, Jr', 'www.nasa.gov', 'NASA'),
(46, 'Charles F. Bolden, Jr', 'www.nasa.gov', 'NASA'),
(47, 'Charles F. Bolden, Jr', 'www.nasa.gov', 'NASA'),
(48, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(49, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(50, 'Joern Wilms', 'joern.wilms@sternwarte.uni-erlangen.de', 'ESA'),
(51, 'http://www.jaxa.jp/pr/inquiries/index_e.html', '', 'JAXA'),
(52, 'http://www.jaxa.jp/pr/inquiries/index_e.html', '', 'JAXA'),
(53, 'http://www.jaxa.jp/pr/inquiries/index_e.html', '', 'JAXA'),
(54, 'Antariksh Bhavan', 'satish@isro.gov.in', 'ISRO'),
(55, 'Antariksh Bhavan', 'satish@isro.gov.in', 'ISRO'),
(56, 'Antariksh Bhavan', 'satish@isro.gov.in', 'ISRO'),
(57, 'http://www.jaxa.jp/pr/mail/index_e.html', '', 'JAXA'),
(58, 'http://www.jaxa.jp/pr/mail/index_e.html', '', 'JAXA'),
(59, 'http://www.jaxa.jp/pr/mail/index_e.html', '', 'JAXA'),
(60, 'CNES', 'enquiries@cne-siar.gov.uk', 'CNES'),
(61, 'CNES', 'enquiries@cne-siar.gov.uk', 'CNES'),
(62, 'Ábrahám, Péter', 'abraham@konkoly.hu', ''),
(63, 'Sergio Mariotti', 's.mariotti@ira.inaf.it', 'National Institute for Astrophysics '),
(64, 'Prof. Flavio Fusi Pecci , director ', 'flavio.fusipecci@oabo.inaf.it', ''),
(65, 'Jose Funes, S.J.', '', ''),
(66, 'Ester Antonucci ', 'antonucci@oato.inaf.it', 'INAF'),
(67, 'Oliver Montenbruck', 'oliver.montenbruck@dlr.de', 'German Aerospace Center (DLR), Wessling, Germany'),
(68, 'Eberhard Gill', 'e.k.a.gill@tudelft.nl', 'German Aerospace Center (DLR), Wessling, Germany'),
(69, 'Simone D’Amico', 'simone.damico@dlr.de', 'German Aerospace Center (DLR), Wessling, Germany'),
(70, 'Thomas Rupp', 'thomas.rupp@dlr.de', 'German Aerospace Center (DLR), Wessling, Germany'),
(71, 'Murakami, H', '', ''),
(72, 'Murakami, H', '', ''),
(73, 'ANDERSON, Caprece', 'cap@srl.caltech.edu', 'SRL'),
(74, 'Len Fisk', 'lafisk@umich.edu', 'SHRG'),
(75, 'Eberhard Moebius', '', 'UNH'),
(76, 'Dr. Robert Gold', 'Robert.Gold@jhuapl.edu', 'JHU Applied Physics Laboratory'),
(77, 'CALDERON, Minerva', 'mc@srl.caltech.edu', 'SRL'),
(78, 'Thomas Zurbuchen', 'Thomasz@umich.edu', 'SHRG'),
(79, 'E. C. Stone', '', 'Caltech '),
(80, 'D.J. McComas', '', 'Space and Atmospheric Sciences Group'),
(81, 'Charles W. Smith', 'Charles W. Smith', 'UNH'),
(82, 'Richard Mewaldt', 'rmewaldt@srl.caltech.edu. ', 'SWPC'),
(83, 'Andrea Accomazzo', '', ''),
(84, 'Kevin Brown', '', ''),
(85, 'Don McCoy', '', 'ESCO, Darmstadt, Germany'),
(86, 'Graeme Stephens', '', 'NASA'),
(87, 'Steve Benner', '', 'NASA'),
(88, 'David Bogart ', '', 'Goddard Space Flight Center'),
(89, 'Borucki, W', '', ''),
(90, 'Laurie Kleppin', '', 'POES ');

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
CREATE TABLE IF NOT EXISTS `sensors` (
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
  `sensor_comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=160 ;

--
-- Dumping data for table `sensors`
--

INSERT INTO `sensors` (`id`, `sensor_name`, `sensor_type`, `underlying`, `range_begin`, `range_end`, `units`, `measured`, `resolution`, `field_of_view`, `web_address`, `sensor_comments`) VALUES
(5, 'ULEIS', 'Ultra Low Energy Isotope Spectrometer', '', 2, 28, 'Z', 'M, E', '', '24', '', NULL),
(6, 'SIS', 'Solar Isotope Spectrometer', 'Stack Detector', 2, 30, 'Z', 'Z, M, E', '', '104 Conical', '', NULL),
(7, 'SEPICA', 'Solar Energetic Particle Isotope Charge Analyzerr', '', 2, 28, 'Z', 'Z, Q, E', '', '61.5', '', NULL),
(8, 'EPAM', 'Electron, Proton & Alpha Monitor', '', 0, 0, 'H, He', 'Z, M, E', '60 Conical', '', '', NULL),
(9, 'MAG', 'Magnetometer', 'Triaxial Fluxgate', 0, 0, '', '', '0.17', '', '', NULL),
(10, 'SWICS', 'Solar Wind Ion Composition Spectrometer', '', 2, 30, 'Z', 'Z, E', '82 x 1', '', '', NULL),
(11, 'SWIMS', 'Solar Wind Ion Mass Spectrometer', '', 2, 30, 'Z', 'M,E/Q', '62 x 6', '', '', NULL),
(12, 'SWEPAM', 'Solar Wind Electron Proton & Alpha Monitor', '', 0, 0, 'H, He', 'E/Q', '80 x 1', '', '', NULL),
(13, 'CRIS', 'Cosmic Ray Isotope Spectrometer', 'Silicon Detectors', 2, 30, 'Z', 'Z, M, E', '', '120', '', NULL),
(24, 'Cluster II', '', '', 0, 0, '', 'Interaction between the Solar Wind and Magnetosphere', '', 'Solar Wind Particles, Particles entering Polar Cusps, Magnetotail', '', NULL),
(29, 'Ariane 5 ECA', 'Expendable Launch System', '', 350, 10000, 'µm', 'Amplitude of Structures in Cosmic Microwave Background Radiation, Hubble Constant, Sunyaev-Zel''dovich Effect', 'Good Angular Resolution and Sensitivity', 'Cosmic Microwave Background Anisotropies, Inflationary Models of early Universe', '', NULL),
(30, 'European Photon Imaging Cameras (EPIC)', 'Cameras', '', 0.15, 15, 'keV', 'Extemely sensitive imaging observations over the telescope''s field of view.', 'Angular resolution of PSF, 6 arcsec FWHM', 'Field of view of 30 arcmin', '', NULL),
(31, 'X-ray telescopes', 'X-ray telescopes', '', 6, 7, 'keV', 'highest possible effective area over a wide range of energies - provides sufficient reflectivity at high energies', 'Mirror system uses a shallow grazing angle of 30'' to provide sufficient reflectivity at high energies.', 'The telescopes focal length is 7.5 meters and the diameter of the largest mirrors is 70cm, to be compatible with the shroud of the launcher.', '', NULL),
(32, 'Two reflection grating spectrometeres', 'Spectrometers', '', 0.33, 2.5, 'keV', 'Diffracts the X-rays to an array of dedicated charge coupled devices (CCD) detectors.', '6 arcsec (FWHM)', '30 arcmin', '', NULL),
(34, 'NICMOS', 'Infrared Camera/Spectrometer', 'Objects in deepest space', 0, 77, 'Kelvin', 'Electromagnetic Spectrum, Birth of stars, galaxies, solar systems, Interstellar gas, Life of Universe, and formation of galaxies, stars & planetary systems', 'near infra-red wavelengths', '', '', NULL),
(35, 'FGS', 'Fine guidance sensors', '', 0, 0, '', 'Star positions', '0.007 arcsec', '', '', NULL),
(36, 'WFC3', 'Wide field optical camera', '', 0, 0, '', 'Near infrared light, visible light, and near-Ultraviolet radiation', '', '', '', NULL),
(37, 'COS', 'Ultraviolet spectrograph', '', 0, 0, '', 'Observing points of light, like stars and quasars, whilst looking at large areas - galaxies', '', '', '', NULL),
(38, 'STIS', 'Optical Spectrometer/Camera', '', 0, 0, '', 'To hunt for black holes, measure an object''s temperature, density, chemical composition and motion.', '', '', '', NULL),
(39, 'ACS', 'Optical Survey Camera', '', 0, 0, '', 'Studying earliest activity of the Universe, how the Universe evolved, and the nature and distribution of galaxies.', 'Enhanced sensitivity/resolution', 'Sees wavelengths from far ultraviolet to visible light.', '', NULL),
(40, 'HIFI', 'Heterodyne Instrument for the Far Infrared', '', 480, 1250, 'GHz', '', '', '', '', NULL),
(41, 'PACS', 'Photodetector Array Camera and Spectrometer', '', 57, 210, 'µm', 'Operates either as an imaging photometer or an integral field spectrometer over the spectral band.', '', '', '', NULL),
(42, 'SPIRE', 'Spectral and Photometric Imaging Reciever', '3.5 meter diameter telescope.', 60, 700, 'µm', '', '', '', '', NULL),
(43, 'XRT', 'X-ray telescope', 'Consist of nested conical thin-foil mirrors which share similar design concepts with ASCA XRT.', 5, 8, 'keV', '', 'High Spectroscopic Resolution', '', '', NULL),
(44, 'XRS', 'X-ray spectrometer', '', 0.2, 700, 'keV', '', 'High Spectroscopic Resolution', '', '', NULL),
(45, 'XIS', 'X-ray Imaging Spectrometer', 'X-ray telescope and X-ray sensitive charged coupled device (CCD)', 0.2, 700, 'keV', 'location and energy of incident X-ray photons.', 'High Spectroscopic Resolution', '', '', NULL),
(46, 'HXD', 'Hard X-ray Detector', 'High sensitivity', 10, 700, 'keV', 'Detects transient high energy phenomena such as the gamma-ray bursts.', 'High Spectroscopic Resolution', '', '', NULL),
(47, 'C1XS', 'Chandrayaan-1 X-ray Spectrometer', 'Will carry out high-quality, low energy X-ray spectroscopic mapping of the moon', 1, 10, 'keV', 'Measure the elemental abundance, and map the distribution of the three main rock forming elements: Mg, Al, and Si.', 'High Spectroscopic Resolution', 'Determine the abundance of minor elements such as Ca, Ti and Fe on the surface of the Moon.', '', NULL),
(48, 'SARA', 'Sub-keV Atom Reflecting Analyser', 'Studies of plasma-surface interactions in space.', 0.01, 2, 'keV', 'Detect atoms with sufficient angular and mass resolution to address the scientific objectives.', '', '', '', NULL),
(49, 'SIR-2', 'The near infrared spectrometer', 'Study the chemical composition of the Moon''s crust and mantle.', 0.9, 2.4, 'micrometer', '', '6 nanometres', '', '', NULL),
(50, 'SPI', 'Spectrometer', 'Astrophysical lines', 0.02, 10, 'MeV', '', 'Fine enough to resolve astrophysical lines and allow spectroscopy in region of gamma-rays', 'Nucleosynthesis, relativistic particle accelerators, and strong-field signatures in compact stars', '', NULL),
(51, 'OMC', 'Optical Monitor', '', 500, 600, 'nm', 'X-rays, Gamma-rays', '', '', '', NULL),
(52, 'JEM-X', 'X-ray monitor', '', 3, 35, 'keV', 'Images of the sky.', 'Arcminute angular resolution', '', '', NULL),
(53, 'IBIS', 'Imager', '', 0.015, 10, 'MeV', '', 'High Angular Resolution', '', '', NULL),
(54, 'SOT', 'Solar Optical Telescope', '50cm aperture.', 388, 668, 'nm', 'Measurement of the vector magnetic field in the photosphere and dynamics of both the photosphere and chromosphere associated with the magnetic fields.', '', '', '', NULL),
(55, 'EIS', 'Extreme-ultraviolet Imaging Spectrometer', '', 0, 0, '', '', '', '', '', NULL),
(56, 'XRT', 'X-ray Telescope', '', 0, 0, '', 'Observes the generation, transport, and emergence of solar magnetic fields, and ultimate dissipation of magnetic energy in a form such as flares, and pico-flares, coronal heating, coronal mass ejection.', 'High Resolution', '', '', NULL),
(57, 'Afocal Telescope', '27cm-diameter afocal telescope', '', 370, 950, 'nm', 'Blocks sunlight reflected by the Earth.', '', '2.7-3.05 degrees', '', NULL),
(58, 'CCD', '4-CCD wide-field camera', 'CCD camera built around the PROTEUS spacecraft bus, and operates in a low-Earth orbit.', 850, 900, 'km', '', '', '', '', NULL),
(60, 'High-grade single-frequency Phoenix GPS sensor', 'GPS', '', 0, 0, '', '', '', '', '', NULL),
(61, 'Formation Flying Radio-Frequency Sensor', '', '', 0, 0, '', '', '', '', '', NULL),
(62, 'Vision-Based Sensor ', '', '', 0, 0, '', '', '', '', '', NULL),
(63, 'Far-Infrared Surveyor', 'Infrared', '', 45, 180, 'micro m', '', '26.79arcsec, 44.20arcsec', '', '', NULL),
(64, 'InfraRed Camera', 'Infrared', '', 1.7, 5.5, 'micron', '', '', '9.5x10.0	9.1x10.0	10.3x10.2', '', NULL),
(100, 'The Cosmic Ray Isotope Spectrometer', 'Spectrometer', '', 250, 250, 'cm²-sr', '', 'mass resolution, 0.25 amu ', '', '', NULL),
(101, 'Solar Wind Ion Composition Spectrometer (SWICS)', 'Spectrometer', '', 0, 100, 'keV/e', '', '', '', '', NULL),
(102, 'SEPICA', 'Ionic state', '', 0.2, 100, 'MeV/Nuc', '', '', '', '', NULL),
(103, 'ULEIS ', 'Ion Flux', '', 20000, 10000, 'MeV/nucleon', '', '', '', '', NULL),
(104, 'The Solar Isotope Spectrometer', 'Spectrometer', '', 10, 100, 'MeV/nucleon', '', 'mass resolution, 0.25 amu', '', '', NULL),
(105, 'Solar Wind Ions Mass Spectrometer (SWIMS)', 'Spectrometer', '', 0, 10, 'keV/e', '', '', '', '', NULL),
(106, 'EPAM', 'Spectrometer', '', 0, 50, 'keV', '', '', '', '', NULL),
(107, 'Solar Wind Electron, Proton, and Alpha Monitor (SWEPAM)', 'Monitor', '', 0.26, 36, 'Kev', '', '', '', '', NULL),
(108, 'Magnetometer Instrument', 'Twin, triaxial fluxgate magnetometers (boom mounted)', '', 4, 65, 'nT', '', '', '', '', NULL),
(109, 'Real-Time Solar Wind Data (RTSW)', 'Geometric storm warning', '', 0, 0, '', '', '', '', '', NULL),
(111, 'HRSC', 'High Resolution Stereo Camera ', '', 0, 0, '', '', '2 m ', '', '', NULL),
(112, 'MERMAG', 'Mercury Magnetometer', '', 0, 0, '', '', '', '', '', NULL),
(113, 'CALIOP', 'the Cloud-Aerosol Lidar with Orthogonal Polarization ', '', 0, 0, '', '', '', '', '', NULL),
(114, 'WFC', 'the Wide Field Camera ', '', 0, 0, '', '', '', '', '', NULL),
(115, 'IIR', 'the Imaging Infrared Radiometer ', '', 0, 0, '', '', '', '', '', NULL),
(122, 'ASPERA-4', 'Analyzer of Space Plasmas and Energetic Atoms', '', 0, 0, '', '', '', '', '', NULL),
(123, 'Spectrometer', 'Planetary Fourier Spectrometer and Spectroscopy for Investigation of Characteristics of the Atmosphere of Venus, also Visible and Infrared Thermal Imaging Spectrometer', '', 0.9, 45, 'µm', '', '', '', '', NULL),
(124, 'MAG', 'magnetometer', 'measure the strength of Venus''s magnetic field and the direction of it as affected by the solar wind and Venus itself.', 0, 0, '', 'map the magnetosheath, magnetotail, ionosphere, and magnetic barrier in high resolution in three-dimensions', '', '', '', NULL),
(125, 'VMC', 'Venus Monitoring Camera (a wide-angle, multi-channel CCD)', '', 0, 0, '', '', '', '', '', NULL),
(126, 'SAR', 'Synthetic Aperture Radar', 'Generation of a consistent global Digital Elevation Model (DEM)', 0, 0, '', '', '', '', '', NULL),
(127, 'ASTER', ' Advanced Spaceborne Thermal Emission and Reflection Radiometer', '', 0, 0, '', '', '', '', '', NULL),
(128, 'MOPITT', 'Measurements of Pollution in the Troposphere', '', 0, 0, '', '', '', '', '', NULL),
(129, 'MISR', 'Multi-angle Imaging Spectroradiometer ', '', 0, 0, '', '', '', '', '', NULL),
(130, 'MODIS', 'Moderate-resolution Imaging Spectroradiometer ', '', 0, 0, '', '', '', '', '', NULL),
(131, 'CERES', 'Clouds and Earth', '', 0, 0, '', '', '', '', '', NULL),
(133, 'The Cloud Profiling Radar (CPR)', 'Radar', '', -30, 70, 'dBZ', '', '', '', '', NULL),
(134, 'GOES-O Solar X-Ray Imager', 'Soft X-Ray', '', 6, 60, 'A (Angstroms)', '', '', '', '', NULL),
(135, 'GOES-P Solar X-Ray Imager', '', '', 6, 60, 'A (Angstroms)', '', '', '', '', NULL),
(136, 'GOES-P Space Environment Monitor', '3 in 1, EPS, Magnometer, XRS', '', 0.05, 0.3, 'nm', '', '', '', '', NULL),
(137, 'GOES-P Sounder', 'Filter Radiometer', '', 0, 15, 'microns', '', '', '', '', NULL),
(138, 'GOES-P Imager', 'Imaging', '', 0, 0, '', '', '', '', '', NULL),
(139, 'Kepler photometer', 'Photometer', '', 400, 850, 'nm', '', '2200x1024 pixels', '105deg2 (about 12 degree diameter)', '', NULL),
(140, 'Advanced Microwave Sounding Unit (AMSU-A and MHS)', 'Microwave', '', 50.3, 89, 'GHz oxygen band', '', '', '', '', NULL),
(141, 'Advanced Data Collection System (A-DCS)', 'Environmental Monitoring System', '', 0, 0, '', '', '', '', '', NULL),
(142, 'Space Environment Monitor (SEM)', 'Charged Particle Spectrometer', '', 20, 50, 'eV', '', '', '', '', NULL),
(143, 'Solar Backscatter Ultraviolet Spectral Radiometer (SBUV/2)', 'Radiometer', '', 0, 0, '', '', '', '', '', NULL),
(144, 'High Resolution Infrared Radiation Sounder (HIRS/4)', 'Infrared', '', 0, 0, '', '', '', '', '', NULL),
(145, 'Advanced Very High Resolution Radiometer (AVHRR/3)', 'Infra red', '', 0, 0, '', '', '', '', '', NULL),
(146, 'ALICE ', '(an ultraviolet imaging spectrograph)', '', 0, 0, '', '', '', '', '', NULL),
(147, 'OSIRIS', '(Optical, Spectroscopic, and Infrared Remote Imaging System)', 'The camera system has a narrow angle lens (700  mm) and a wide angle lens (140  mm), with a 2048x2048 pixel CCD chip. ', 0, 0, '', '', '', '', '', NULL),
(148, 'VIRTIS ', '(Visible and Infrared Thermal Imaging Spectrometer)', 'make pictures of the core in the IR and also search for IR spectra of molecules in the coma. ', 0, 0, '', '', '', '', '', NULL),
(149, 'MIRO', '(Microwave Instrument for the Rosetta Orbiter)', 'The abundance and temperature of volatile substances like water, ammonia and carbon dioxide can be detected', 0, 0, '', '', '', '', '', NULL),
(150, 'CONSERT ', '(Comet Nucleus Sounding Experiment by Radiowave Transmission)', 'determine the comet''s internal structure and deduce information on its composition', 0, 0, '', '', '', '', '', NULL),
(151, 'ROSINA', ' (Rosetta Orbiter Spectrometer for Ion and Neutral Analysis)', '', 0, 0, '', '', 'up to 300 amu', '', '', NULL),
(152, 'MIDAS ', '(Micro-Imaging Dust Analysis System)', 'investigate the dust particles which are deposited on a silicone plate', 0, 0, '', '', '', '', '', NULL),
(153, 'COSIMA ', '(Cometary Secondary Ion Mass Analyser)', 'analyses the composition of dust particles by secondary ion mass spectrometry, after the surface is cleaned by indium ions', 0, 0, '', '', 'analyse ions up to a mass of 4000 amu', '', '', NULL),
(154, 'GIADA (Grain Impact Analyser and Dust Accumulator) and RPC (Rosetta Plasma Consortium)', 'Solarwind interaction', '', 0, 0, '', '', '', '', '', NULL),
(156, 'Radar Altmeter', '', '', 0, 0, '', '', '', '', '', NULL),
(157, 'Synthetic Aperture Radar', 'X-band', '', 0, 0, '', '', '50 cm', '', '', NULL),
(158, 'X-ray Detector', '', '', 15, 40, 'keV', '', '', '', '', NULL),
(159, 'Gamma Radiation Detector', '', '', 30, 50, 'GeV', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_to_science_goals`
--

DROP TABLE IF EXISTS `sensor_to_science_goals`;
CREATE TABLE IF NOT EXISTS `sensor_to_science_goals` (
  `sensor_id` int(10) unsigned NOT NULL,
  `science_goal_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sensor_id`,`science_goal_id`),
  KEY `sensor_id_3` (`sensor_id`),
  KEY `science_goal_id` (`science_goal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_to_science_goals`
--

INSERT INTO `sensor_to_science_goals` (`sensor_id`, `science_goal_id`) VALUES
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(24, 1),
(24, 4),
(24, 6),
(24, 7),
(24, 8),
(24, 9),
(31, 30),
(31, 31),
(31, 32),
(31, 33),
(31, 34),
(31, 35),
(35, 42),
(35, 43),
(35, 44),
(35, 45),
(35, 46),
(35, 47),
(35, 48),
(41, 53),
(41, 54),
(43, 55),
(43, 56),
(44, 57),
(44, 58),
(47, 2),
(47, 59),
(47, 60),
(47, 61),
(47, 62),
(47, 63),
(47, 64),
(47, 65),
(47, 66),
(48, 2),
(48, 67),
(48, 68),
(48, 69),
(48, 70),
(49, 2),
(50, 10),
(50, 11),
(50, 12),
(51, 13),
(51, 14),
(51, 15),
(51, 16),
(52, 17),
(52, 18),
(53, 19),
(54, 71),
(54, 72),
(54, 73),
(60, 1),
(61, 1),
(62, 1),
(63, 15),
(64, 15),
(100, 7),
(100, 8),
(100, 24),
(100, 40),
(100, 76),
(101, 7),
(101, 40),
(102, 7),
(102, 8),
(102, 24),
(103, 80),
(104, 7),
(105, 7),
(105, 40),
(106, 7),
(106, 40),
(106, 76),
(106, 80),
(107, 7),
(108, 1),
(109, 3),
(109, 7),
(109, 8),
(111, 82),
(112, 1),
(112, 3),
(113, 3),
(122, 3),
(123, 3),
(124, 1),
(126, 84),
(127, 83),
(128, 3),
(129, 3),
(131, 3),
(133, 3),
(133, 83),
(134, 3),
(135, 3),
(136, 3),
(136, 83),
(137, 3),
(137, 8),
(138, 3),
(139, 77),
(139, 86),
(140, 3),
(140, 83),
(141, 3),
(144, 3),
(145, 3),
(146, 87),
(146, 88),
(147, 81),
(148, 81),
(149, 81),
(151, 81),
(152, 81),
(154, 81),
(156, 2),
(157, 85),
(158, 5),
(159, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_to_scientific_contacts`
--

DROP TABLE IF EXISTS `sensor_to_scientific_contacts`;
CREATE TABLE IF NOT EXISTS `sensor_to_scientific_contacts` (
  `sensor_id` int(10) unsigned NOT NULL,
  `scientific_contact_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sensor_id`,`scientific_contact_id`),
  KEY `sensor_id_2` (`sensor_id`),
  KEY `scientific_contact_id_2` (`scientific_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensor_to_scientific_contacts`
--

INSERT INTO `sensor_to_scientific_contacts` (`sensor_id`, `scientific_contact_id`) VALUES
(6, 6),
(24, 33),
(29, 38),
(30, 39),
(31, 40),
(32, 41),
(34, 42),
(35, 43),
(36, 44),
(37, 45),
(38, 46),
(39, 47),
(40, 48),
(41, 49),
(42, 50),
(44, 51),
(45, 52),
(46, 53),
(47, 54),
(48, 55),
(49, 56),
(50, 34),
(51, 35),
(52, 36),
(53, 37),
(54, 57),
(55, 58),
(56, 59),
(57, 60),
(58, 61),
(60, 67),
(60, 68),
(60, 69),
(60, 70),
(63, 71),
(64, 72),
(100, 73),
(101, 74),
(102, 75),
(103, 76),
(104, 77),
(105, 78),
(106, 79),
(107, 80),
(108, 81),
(109, 82),
(111, 8),
(112, 9),
(115, 84),
(125, 85),
(133, 86),
(134, 87),
(135, 88),
(139, 89),
(145, 90),
(146, 7),
(146, 83);

-- --------------------------------------------------------

--
-- Table structure for table `space_missions`
--

DROP TABLE IF EXISTS `space_missions`;
CREATE TABLE IF NOT EXISTS `space_missions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mission_name` text NOT NULL,
  `mission_agency` int(10) unsigned NOT NULL,
  `launch_date` date NOT NULL,
  `death_date` date DEFAULT NULL,
  `web_address` text NOT NULL,
  `brief_description` text,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mission_agency_id` (`mission_agency`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `space_missions`
--

INSERT INTO `space_missions` (`id`, `mission_name`, `mission_agency`, `launch_date`, `death_date`, `web_address`, `brief_description`, `creation_date`, `modification_date`) VALUES
(1, 'AGILE', 2, '2007-04-23', '0000-00-00', 'http://agile.rm.iasf.cnr.it/', NULL, '2011-02-25 15:44:15', '2011-03-04 12:49:14'),
(2, 'Advanced Composition Explorer (ACE)', 1, '1997-08-25', '2024-01-01', 'http://www.srl.caltech.edu/ACE/ASC/orbit.html', NULL, '2011-02-25 16:06:28', NULL),
(3, 'Rosetta', 2, '2004-03-02', '2015-12-01', 'http://www.esa.int/esaMI/Rosetta/SEMYMF374OD_0.html', NULL, '2011-02-28 12:56:32', '2011-03-04 12:44:50'),
(4, 'Mars Express', 2, '2003-06-02', '2012-12-31', 'http://www.esa.int/SPECIALS/Mars_Express/SEMFU55V9ED_0.html', NULL, '2011-02-28 13:14:52', '2011-03-04 00:05:17'),
(5, 'Cassini-Huygens', 2, '1997-10-15', '2017-00-00', 'http://sci.esa.int/science-e/www/area/index.cfm?fareaid=12', NULL, '2011-02-28 13:23:36', '2011-03-04 12:47:25'),
(6, 'Bepicolumbo', 2, '2014-00-00', '2021-00-00', 'http://sci.esa.int/science-e/www/area/index.cfm?fareaid=30', NULL, '2011-02-28 13:25:47', '2011-03-04 00:07:27'),
(7, 'Cluster', 1, '2000-08-09', '2014-12-31', 'http://sci.esa.int/science-e/www/area/index.cfm?fareaid=8', NULL, '2011-03-02 16:03:09', NULL),
(8, 'International Gamma-Ray Astrophysics Laboratory (INTEGRAL)', 2, '2002-10-17', '2014-12-31', 'http://sci.esa.int/science-e/www/area/index.cfm?fareaid=21', NULL, '2011-03-02 16:59:18', '2011-03-03 03:42:23'),
(9, 'Planck', 2, '2009-05-14', '2012-01-01', 'http://sci.esa.int/science-e/www/area/index.cfm?fareaid=17', NULL, '2011-03-02 23:31:21', NULL),
(10, 'XMM-Newton', 2, '1999-12-10', '2014-12-31', 'http://sci.esa.int/science-e/www/area/index.cfm?fareaid=23', NULL, '2011-03-03 00:02:24', NULL),
(11, 'The Hubble Space Telescope', 1, '1990-04-24', '2014-12-31', 'http://hubble.nasa.gov/', NULL, '2011-03-03 00:27:48', '2011-03-03 00:44:36'),
(12, 'HERSCHEL', 2, '2009-05-14', '2012-01-01', 'http://sci.esa.int/science-e/www/area/index.cfm?fareaid=16', NULL, '2011-03-03 01:49:26', NULL),
(13, 'Suzaku', 6, '2005-07-10', '0000-00-00', 'http://www.nasa.gov/mission_pages/astro-e2/main/index.html', NULL, '2011-03-03 02:43:26', NULL),
(14, 'Chandrayaan-1', 11, '2008-10-22', '0000-00-00', 'http://www.isro.gov.in/Chandrayaan/htmls/home.htm', NULL, '2011-03-03 03:32:02', NULL),
(15, 'Hinode', 6, '2006-09-22', '0000-00-00', 'http://www.isas.jaxa.jp/e/enterp/missions/hinode/', NULL, '2011-03-03 04:16:56', NULL),
(16, 'COROT', 4, '2006-12-27', '2013-03-31', 'http://smsc.cnes.fr/COROT/', NULL, '2011-03-03 04:37:08', NULL),
(17, 'Prisma', 9, '2010-06-15', '2012-01-01', 'http://www.dlr.de/rb/en/desktopdefault.aspx/tabid-6813/11187_read-25543/', NULL, '2011-03-03 21:37:23', NULL),
(18, 'Akari', 6, '2006-02-21', '0000-00-00', 'http://www.ir.isas.jaxa.jp/ASTRO-F/Outreach/index_e.html', NULL, '2011-03-03 22:01:34', NULL),
(19, 'The Advanced Composition Explorer (ACE)', 1, '1997-08-25', '2024-01-01', 'http://www.srl.caltech.edu/ACE/', NULL, '2011-03-03 22:43:50', '2011-03-03 23:09:09'),
(20, 'Calipso', 1, '2006-04-28', '0000-00-00', 'http://www.nasa.gov/mission_pages/calipso/spacecraft/index.html', NULL, '2011-03-04 00:25:26', NULL),
(21, 'EPOXI', 1, '2005-01-12', '0000-00-00', 'http://www.nasa.gov/mission_pages/epoxi/index.html', NULL, '2011-03-04 00:40:10', NULL),
(22, 'Terra', 1, '1999-08-12', '0000-00-00', 'http://www.nasa.gov/mission_pages/terra/index.html', NULL, '2011-03-04 00:48:52', '2011-03-04 10:36:26'),
(23, 'International Space Station', 1, '1998-00-00', '2015-00-00', 'http://www.nasa.gov/mission_pages/station/main/index.html', NULL, '2011-03-04 01:01:20', NULL),
(24, 'Venus Express', 2, '2005-11-09', '2012-12-00', 'http://www.esa.int/SPECIALS/Venus_Express/', NULL, '2011-03-04 10:25:27', NULL),
(25, 'TanDEM-X', 9, '2010-06-21', '0000-00-00', 'http://www.dlr.de/eo/en/desktopdefault.aspx/tabid-5727/10086_read-21046/', NULL, '2011-03-04 10:31:57', NULL),
(26, 'SATCOMBw', 9, '2009-01-10', '2024-00-00', 'http://www.dlr.de/rb/en/desktopdefault.aspx/tabid-6813/11187_read-25574/', NULL, '2011-03-04 10:51:58', NULL),
(27, 'SAR-Lupe', 9, '2006-12-19', '0000-00-00', 'http://www.dlr.de/en/desktopdefault.aspx/tabid-1/86_read-13077/', NULL, '2011-03-04 11:01:03', '2011-03-04 12:48:19'),
(28, 'CloudSat', 1, '2006-04-28', '0000-00-00', 'http://www.nasa.gov/mission_pages/cloudsat/main/index.html', NULL, '2011-03-04 11:21:00', NULL),
(29, 'ARCTAS NASA', 1, '2008-07-01', '0000-00-00', 'http://www.nasa.gov/mission_pages/arctas/', NULL, '2011-03-04 11:30:55', NULL),
(30, 'GOES-O', 1, '2009-06-26', '0000-00-00', 'http://www.nasa.gov/mission_pages/GOES-O/main/index.html', NULL, '2011-03-04 11:39:34', NULL),
(31, 'GOES-P', 1, '2010-03-04', '0000-00-00', 'http://www.nasa.gov/mission_pages/GOES-P/main/index.html', NULL, '2011-03-04 11:50:00', NULL),
(32, 'Kepler', 1, '2009-03-07', '2012-12-30', 'http://kepler.nasa.gov/', NULL, '2011-03-04 12:02:04', NULL),
(33, 'NOAA-N Prime', 1, '2009-02-06', '0000-00-00', 'http://www.nasa.gov/mission_pages/NOAA-N-Prime/main/index.html', NULL, '2011-03-04 12:12:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `space_mission_to_research_areas`
--

DROP TABLE IF EXISTS `space_mission_to_research_areas`;
CREATE TABLE IF NOT EXISTS `space_mission_to_research_areas` (
  `space_mission_id` int(10) unsigned NOT NULL,
  `research_area_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`space_mission_id`,`research_area_id`),
  KEY `space_mission_id_3` (`space_mission_id`),
  KEY `research_area_id_2` (`research_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `space_mission_to_research_areas`
--

INSERT INTO `space_mission_to_research_areas` (`space_mission_id`, `research_area_id`) VALUES
(1, 16),
(2, 7),
(2, 11),
(2, 16),
(3, 55),
(4, 3),
(4, 25),
(5, 3),
(6, 3),
(6, 12),
(6, 23),
(6, 25),
(7, 4),
(7, 23),
(7, 35),
(7, 36),
(7, 37),
(7, 38),
(7, 39),
(8, 13),
(8, 17),
(8, 40),
(8, 41),
(8, 42),
(9, 6),
(9, 9),
(9, 10),
(9, 13),
(9, 17),
(9, 20),
(9, 33),
(9, 43),
(9, 44),
(9, 45),
(9, 46),
(9, 47),
(10, 9),
(10, 13),
(10, 14),
(10, 17),
(10, 48),
(10, 49),
(10, 50),
(11, 6),
(11, 9),
(11, 10),
(11, 40),
(11, 46),
(11, 51),
(11, 52),
(11, 53),
(12, 3),
(12, 4),
(12, 6),
(12, 7),
(12, 9),
(12, 13),
(12, 46),
(12, 47),
(12, 54),
(12, 55),
(12, 56),
(12, 57),
(13, 5),
(13, 6),
(13, 17),
(13, 20),
(13, 58),
(13, 59),
(14, 3),
(14, 60),
(14, 61),
(14, 62),
(14, 63),
(15, 9),
(15, 11),
(15, 13),
(15, 64),
(16, 8),
(16, 9),
(16, 13),
(16, 65),
(17, 12),
(18, 28),
(19, 4),
(19, 7),
(19, 11),
(19, 13),
(19, 16),
(19, 22),
(19, 36),
(19, 38),
(20, 4),
(20, 25),
(21, 55),
(22, 25),
(23, 15),
(24, 68),
(25, 69),
(26, 70),
(27, 70),
(28, 4),
(29, 4),
(29, 25),
(30, 4),
(30, 25),
(31, 4),
(31, 25),
(32, 13),
(32, 56),
(33, 4),
(33, 25);

-- --------------------------------------------------------

--
-- Table structure for table `space_mission_to_sensors`
--

DROP TABLE IF EXISTS `space_mission_to_sensors`;
CREATE TABLE IF NOT EXISTS `space_mission_to_sensors` (
  `space_mission_id` int(10) unsigned NOT NULL,
  `sensor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`space_mission_id`,`sensor_id`),
  KEY `space_mission_id_1` (`space_mission_id`),
  KEY `sensor_id_1` (`sensor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `space_mission_to_sensors`
--

INSERT INTO `space_mission_to_sensors` (`space_mission_id`, `sensor_id`) VALUES
(1, 158),
(1, 159),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(3, 146),
(3, 147),
(3, 148),
(3, 149),
(3, 150),
(3, 151),
(3, 152),
(3, 153),
(3, 154),
(4, 111),
(5, 156),
(6, 112),
(7, 24),
(8, 50),
(8, 51),
(8, 52),
(8, 53),
(9, 29),
(10, 30),
(10, 31),
(10, 32),
(11, 34),
(11, 35),
(11, 36),
(11, 37),
(11, 38),
(11, 39),
(12, 40),
(12, 41),
(12, 42),
(13, 43),
(13, 44),
(13, 45),
(13, 46),
(14, 47),
(14, 48),
(14, 49),
(15, 54),
(15, 55),
(15, 56),
(16, 57),
(16, 58),
(17, 60),
(17, 61),
(17, 62),
(18, 63),
(18, 64),
(19, 100),
(19, 101),
(19, 102),
(19, 103),
(19, 104),
(19, 105),
(19, 106),
(19, 107),
(19, 108),
(19, 109),
(20, 113),
(20, 114),
(20, 115),
(22, 127),
(22, 128),
(22, 129),
(22, 130),
(22, 131),
(24, 122),
(24, 123),
(24, 124),
(24, 125),
(25, 126),
(27, 157),
(28, 133),
(30, 134),
(31, 135),
(31, 136),
(31, 137),
(31, 138),
(32, 139),
(33, 140),
(33, 141),
(33, 142),
(33, 143),
(33, 144),
(33, 145);

-- --------------------------------------------------------

--
-- Table structure for table `space_mission_to_targets`
--

DROP TABLE IF EXISTS `space_mission_to_targets`;
CREATE TABLE IF NOT EXISTS `space_mission_to_targets` (
  `space_mission_id` int(10) unsigned NOT NULL,
  `target_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`space_mission_id`,`target_id`),
  KEY `space_mission_id_2` (`space_mission_id`),
  KEY `target_id_2` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `space_mission_to_targets`
--

INSERT INTO `space_mission_to_targets` (`space_mission_id`, `target_id`) VALUES
(1, 2),
(2, 45),
(3, 31),
(4, 3),
(5, 5),
(5, 38),
(5, 39),
(5, 48),
(5, 52),
(6, 53),
(7, 2),
(7, 45),
(8, 2),
(9, 2),
(9, 45),
(10, 2),
(11, 2),
(12, 2),
(12, 45),
(13, 2),
(13, 50),
(14, 2),
(14, 9),
(15, 2),
(15, 45),
(16, 2),
(16, 47),
(17, 2),
(18, 2),
(19, 45),
(19, 46),
(20, 2),
(21, 31),
(22, 2),
(23, 2),
(24, 1),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 50),
(33, 2);

-- --------------------------------------------------------

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
CREATE TABLE IF NOT EXISTS `targets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_family` varchar(45) NOT NULL,
  `target_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `targets`
--

INSERT INTO `targets` (`id`, `target_family`, `target_name`) VALUES
(1, 'PLANETS', 'Venus'),
(2, 'PLANETS', 'Earth'),
(3, 'PLANETS', 'Mars'),
(4, 'PLANETS', 'Jupiter'),
(5, 'PLANETS', 'Saturn'),
(6, 'PLANETS', 'Uranus'),
(7, 'PLANETS', 'Neptune'),
(8, 'PLANETS', 'Pluto'),
(9, 'PLANETS/Earth', 'Moon'),
(10, 'PLANETS/Mars', 'Phobos'),
(11, 'PLANETS/Mars', 'Deimos'),
(12, 'PLANETS/Jupiter', 'Jupiter Satellites'),
(13, 'PLANETS/Jupiter', 'Io'),
(14, 'PLANETS/Jupiter', 'Ganymede'),
(15, 'PLANETS/Jupiter', 'Callisto'),
(16, 'PLANETS/Saturn', 'Janus'),
(17, 'PLANETS/Saturn', 'Mimas'),
(18, 'PLANETS/Saturn', 'Enceladus'),
(19, 'PLANETS/Saturn', 'Tethys'),
(20, 'PLANETS/Saturn', 'Dione'),
(21, 'PLANETS/Saturn', 'Rhea'),
(22, 'PLANETS/Saturn', 'Titan'),
(23, 'PLANETS/Saturn', 'Hyperion'),
(24, 'PLANETS/Saturn', 'Iapetus'),
(25, 'PLANETS/Saturn', 'Phoebe'),
(26, 'PLANETS/Uranus', 'Uranus Satellites'),
(27, 'PLANETS/Neptune', 'Neptune Satellites'),
(28, 'PLANETS/Neptune', 'Nereid'),
(29, 'PLANETS/Pluto', 'Pluto Satellites'),
(30, 'PLANETS/Pluto', 'Charon'),
(31, 'SMALL BODIES', 'Comets'),
(32, 'SMALL BODIES', 'Kuiper Belt and Oort Cloud'),
(33, 'SMALL BODIES', 'Asteroids'),
(34, 'SMALL BODIES', 'Meteors'),
(35, 'PLANETS/Mars', 'Mars Satellites'),
(36, 'SMALL BODIES', 'TNO (Trans-Neptunian Objects)'),
(37, 'SMALL BODIES', 'SMALL BODIES'),
(38, 'PLANETS', 'RINGS'),
(39, 'PLANETS/Saturn', 'Saturn Rings'),
(40, 'PLANETS/Jupiter', 'Jupiter Rings'),
(41, 'PLANETS/Uranus', 'Uranus Rings'),
(42, 'PLANETS/Neptune', 'Neptune Rings'),
(43, 'SMALL BODIES/Asteroids', 'Vesta'),
(44, 'SMALL BODIES/Asteroids', 'Ceres'),
(45, 'SUN', 'SUN'),
(46, 'DUST', 'DUST'),
(47, 'EXOPLANETS', 'EXOPLANETS'),
(48, 'PLANETS', 'SATELLITES'),
(49, 'PLANETS/Jupiter', 'Europa'),
(50, 'PLANETS', 'PLANETS'),
(51, 'SMALL BODIES', 'Meteorites'),
(52, 'PLANETS/Saturn', 'Saturn Satellites'),
(53, 'PLANETS', 'Mercury');

-- --------------------------------------------------------

--
-- Table structure for table `telescopes`
--

DROP TABLE IF EXISTS `telescopes`;
CREATE TABLE IF NOT EXISTS `telescopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `telescope_name` text,
  `telescope_type` int(10) unsigned NOT NULL,
  `telescope_elements` int(10) unsigned DEFAULT NULL,
  `diameter_m` float(10,6) DEFAULT NULL,
  `focallength_m` varchar(10) DEFAULT NULL,
  `antenna_type` int(10) unsigned NOT NULL,
  `wavelength` text,
  `wavelength_begin` float(10,6) DEFAULT NULL,
  `wavelength_b_unit` int(10) unsigned NOT NULL,
  `wavelength_end` float(10,6) DEFAULT NULL,
  `wavelength_e_unit` int(10) unsigned NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `telescope_type_id` (`telescope_type`),
  KEY `wavelength_unit_id_1` (`wavelength_b_unit`),
  KEY `wavelength_unit_id_2` (`wavelength_e_unit`),
  KEY `antenna_type_id` (`antenna_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `telescopes`
--

INSERT INTO `telescopes` (`id`, `telescope_name`, `telescope_type`, `telescope_elements`, `diameter_m`, `focallength_m`, `antenna_type`, `wavelength`, `wavelength_begin`, `wavelength_b_unit`, `wavelength_end`, `wavelength_e_unit`, `comments`) VALUES
(1, NULL, 10, NULL, 30.000000, '', 1, 'Radiowaves, LF - Microwaves, EHF', NULL, 1, NULL, 1, NULL),
(2, NULL, 15, NULL, 2.200000, '22.6 m', 1, '', NULL, 1, NULL, 1, NULL),
(3, NULL, 15, NULL, 0.600000, '', 1, '', NULL, 1, NULL, 1, NULL),
(4, NULL, 3, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(5, NULL, 7, NULL, 0.250000, '', 1, '', NULL, 1, NULL, 1, NULL),
(6, NULL, 15, NULL, 0.430000, '', 1, '', NULL, 1, NULL, 1, NULL),
(7, NULL, 3, NULL, 0.355000, '', 1, '', NULL, 1, NULL, 1, NULL),
(8, NULL, 10, NULL, 32.000000, '', 1, '925.0-931.5 MHz or 1415-1425 MHz', NULL, 1, NULL, 1, NULL),
(9, NULL, 10, NULL, 40.000000, '', 1, '214.3-234.7 MHz', NULL, 1, NULL, 1, NULL),
(10, NULL, 10, NULL, 32.000000, '', 1, '921.0-933.5 MHz', NULL, 1, NULL, 1, NULL),
(11, NULL, 10, NULL, 42.000000, '', 1, '485.0-515.0 MHz', NULL, 1, NULL, 1, NULL),
(12, NULL, 10, NULL, 32.000000, '', 1, '485.0-515.0 MHz', NULL, 1, NULL, 1, NULL),
(13, NULL, 10, NULL, 32.000000, '', 1, '929.0-930.5 MHz or 1415-1425 MHz', NULL, 1, NULL, 1, NULL),
(14, NULL, 3, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(15, NULL, 15, NULL, 40.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(16, NULL, 7, NULL, 20.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(17, NULL, 3, NULL, 36.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(18, NULL, 7, NULL, 40.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(19, NULL, 15, NULL, 70.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(20, NULL, 5, NULL, 125.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(21, NULL, 7, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(22, NULL, 7, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(23, NULL, 7, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(24, NULL, 3, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(25, NULL, 3, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(26, NULL, 3, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(27, NULL, 2, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(28, NULL, 15, NULL, 0.400000, '', 1, '', NULL, 1, NULL, 1, NULL),
(29, NULL, 15, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(30, NULL, 2, NULL, 0.600000, '', 1, '', NULL, 1, NULL, 1, NULL),
(31, NULL, 3, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(32, NULL, 2, NULL, 0.150000, '', 1, '', NULL, 1, NULL, 1, NULL),
(33, NULL, 7, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(34, NULL, 2, NULL, 2.600000, '3.85, 16, ', 1, '', NULL, 1, NULL, 1, NULL),
(35, NULL, 3, NULL, 1.000000, '2.13', 1, '', NULL, 1, NULL, 1, NULL),
(36, NULL, 10, NULL, 32.000000, '', 1, 'L Band', NULL, 1, NULL, 1, NULL),
(37, NULL, 15, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(38, NULL, 13, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(39, NULL, 12, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(40, NULL, 9, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(41, NULL, 10, NULL, 40.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(42, NULL, 10, NULL, 14.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(43, NULL, 10, NULL, 34.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(44, NULL, 10, NULL, 26.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(45, NULL, 10, NULL, 34.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(46, NULL, 10, NULL, 70.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(47, NULL, 3, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(48, NULL, 15, NULL, 0.360000, '3.9', 1, 'Celestron', NULL, 1, NULL, 1, NULL),
(49, NULL, 3, NULL, 0.280000, '0.04', 1, '', NULL, 1, NULL, 1, NULL),
(50, NULL, 7, NULL, 0.070000, '0.007', 1, '', NULL, 1, NULL, 1, NULL),
(51, NULL, 1, NULL, 0.212000, '0.045', 1, '', NULL, 1, NULL, 1, NULL),
(52, NULL, 3, NULL, 0.400000, '4', 1, '', NULL, 1, NULL, 1, NULL),
(53, NULL, 9, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(54, NULL, 15, NULL, 1.200000, '', 1, 'Robotic', NULL, 1, NULL, 1, NULL),
(55, NULL, 12, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(56, NULL, 15, NULL, 1.550000, '', 1, 'Infrared', NULL, 1, NULL, 1, NULL),
(57, NULL, 15, NULL, 1.500000, '', 1, 'Solar', NULL, 1, NULL, 1, NULL),
(58, NULL, 15, NULL, 0.400000, '', 1, 'Optical', NULL, 1, NULL, 1, NULL),
(59, NULL, 10, NULL, 25.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(60, NULL, 15, NULL, 0.500000, '', 1, 'Grubb Parsons', NULL, 1, NULL, 1, NULL),
(61, NULL, 10, NULL, 3.000000, '', 1, 'HI', NULL, 1, NULL, 1, NULL),
(62, NULL, 7, NULL, 0.450000, '7', 1, 'Radcliffe', NULL, 1, NULL, 1, NULL),
(63, NULL, 7, NULL, 0.200000, '3.2', 1, 'Fry', NULL, 1, NULL, 1, NULL),
(64, NULL, 15, NULL, 0.360000, '3.91', 1, 'Celestron Reflector', NULL, 1, NULL, 1, NULL),
(65, NULL, 15, NULL, 0.600000, '7', 1, 'Allen Reflector', NULL, 1, NULL, 1, NULL),
(66, NULL, 7, NULL, 0.600000, '', 1, 'Radcliffe', NULL, 1, NULL, 1, NULL),
(67, NULL, 15, NULL, 0.600000, '', 1, 'Thornton Reflector', NULL, 1, NULL, 1, NULL),
(68, NULL, 15, NULL, 0.400000, '', 1, 'Hindle Reflector', NULL, 1, NULL, 1, NULL),
(69, NULL, 7, NULL, 0.310000, '', 1, 'Grubb', NULL, 1, NULL, 1, NULL),
(70, NULL, 2, NULL, 0.020000, '', 1, '', NULL, 1, NULL, 1, NULL),
(71, NULL, 3, NULL, 0.036000, '', 1, '', NULL, 1, NULL, 1, NULL),
(72, NULL, 15, NULL, 1.000000, '', 1, 'Laser & Astrometric', NULL, 1, NULL, 1, NULL),
(73, NULL, 2, NULL, 0.610000, '0.003', 1, '', NULL, 1, NULL, 1, NULL),
(74, NULL, 15, NULL, 0.310000, '1.31', 1, 'Altair', NULL, 1, NULL, 1, NULL),
(75, NULL, 3, NULL, 0.305000, '3.05', 1, '', NULL, 1, NULL, 1, NULL),
(76, NULL, 3, NULL, 0.400000, '4', 1, '', NULL, 1, NULL, 1, NULL),
(77, NULL, 4, NULL, 0.090000, '', 1, '', NULL, 1, NULL, 1, NULL),
(78, NULL, 15, NULL, 0.500000, '', 1, 'Meade LX200', NULL, 1, NULL, 1, NULL),
(79, NULL, 15, NULL, 1.200000, '', 1, '', NULL, 1, NULL, 1, NULL),
(80, NULL, 15, NULL, 1.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(81, NULL, 1, NULL, 0.200000, '', 1, '', NULL, 1, NULL, 1, NULL),
(82, NULL, 2, NULL, 0.400000, '2', 1, '', NULL, 1, NULL, 1, NULL),
(83, NULL, 7, NULL, 0.080000, '', 1, 'Achromatic', NULL, 1, NULL, 1, NULL),
(84, NULL, 15, NULL, 0.402000, '', 1, 'Friedrich-Meier', NULL, 1, NULL, 1, NULL),
(85, NULL, 7, NULL, 0.203000, '', 1, '', NULL, 1, NULL, 1, NULL),
(86, NULL, 7, NULL, 0.150000, '1.2', 1, '', NULL, 1, NULL, 1, NULL),
(87, NULL, 15, NULL, 0.300000, '3.57', 1, 'Reflector', NULL, 1, NULL, 1, NULL),
(88, NULL, 7, NULL, 0.150000, '1.5', 1, '', NULL, 1, NULL, 1, NULL),
(89, NULL, 2, NULL, 0.300000, '7', 1, '', NULL, 1, NULL, 1, NULL),
(90, NULL, 4, NULL, 0.300000, '4.8', 1, '', NULL, 1, NULL, 1, NULL),
(91, NULL, 15, NULL, 0.127000, '1.9', 1, 'Meade ETX-125', NULL, 1, NULL, 1, NULL),
(92, NULL, 15, NULL, 0.356000, '3.556', 1, 'Meade LX200', NULL, 1, NULL, 1, NULL),
(93, NULL, 15, NULL, 0.406000, '4.064', 1, 'Kreiken', NULL, 1, NULL, 1, NULL),
(94, NULL, 7, NULL, 0.150000, '2.25', 1, 'Coude', NULL, 1, NULL, 1, NULL),
(95, NULL, 15, NULL, 0.300000, '1.5', 1, 'Astrograph', NULL, 1, NULL, 1, NULL),
(96, NULL, 7, NULL, 0.120000, '2.32', 1, 'Chromosphere', NULL, 1, NULL, 1, NULL),
(97, NULL, 7, NULL, 0.130000, '2', 1, 'Photosphere', NULL, 1, NULL, 1, NULL),
(98, NULL, 7, NULL, 0.250000, '', 1, '', NULL, 1, NULL, 1, NULL),
(99, NULL, 2, NULL, 0.380000, '', 1, '', NULL, 1, NULL, 1, NULL),
(100, NULL, 2, NULL, 0.520000, '', 1, '', NULL, 1, NULL, 1, NULL),
(101, NULL, 2, NULL, 0.560000, '', 1, '', NULL, 1, NULL, 1, NULL),
(102, NULL, 7, NULL, 1.040000, '', 1, '', NULL, 1, NULL, 1, NULL),
(103, NULL, 3, NULL, 0.190000, '', 1, '', NULL, 1, NULL, 1, NULL),
(104, NULL, 15, NULL, 0.600000, '', 1, 'Sky Survey', NULL, 1, NULL, 1, NULL),
(105, NULL, 3, NULL, 0.360000, '', 1, '', NULL, 1, NULL, 1, NULL),
(106, NULL, 2, NULL, 0.500000, '', 1, '', NULL, 1, NULL, 1, NULL),
(107, NULL, 10, NULL, 4.500000, '', 1, '', NULL, 1, NULL, 1, NULL),
(108, NULL, 7, NULL, 0.150000, '', 1, '', NULL, 1, NULL, 1, NULL),
(109, NULL, 15, NULL, 0.600000, '6', 1, 'Solar Multi Channel Telescope', NULL, 1, NULL, 1, NULL),
(110, NULL, 15, NULL, 0.600000, '', 1, 'Grubb Parson Coleostat', NULL, 1, NULL, 1, NULL),
(111, NULL, 9, NULL, 0.200000, '18', 1, '', NULL, 1, NULL, 1, NULL),
(112, NULL, 15, NULL, 0.300000, '', 1, 'Meade LX200', NULL, 1, NULL, 1, NULL),
(113, NULL, 15, NULL, 1.000000, '', 1, 'McLellan', NULL, 1, NULL, 1, NULL),
(114, NULL, 9, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(115, NULL, 15, NULL, 1.800000, '', 1, 'MOA', NULL, 1, NULL, 1, NULL),
(116, NULL, 15, NULL, 0.610000, '', 1, 'Boller&Chivens', NULL, 1, NULL, 1, NULL),
(117, NULL, 15, NULL, 0.600000, '', 1, 'Optical', NULL, 1, NULL, 1, NULL),
(118, NULL, 10, NULL, 26.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(119, NULL, 10, NULL, 14.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(120, NULL, 15, NULL, 2.300000, '', 1, 'Advanced Technology', NULL, 1, NULL, 1, NULL),
(121, NULL, 15, NULL, 1.000000, '', 1, 'Boller&Chivens', NULL, 1, NULL, 1, NULL),
(122, NULL, 3, NULL, 1.240000, '', 1, '', NULL, 1, NULL, 1, NULL),
(123, NULL, 15, NULL, 2.000000, '', 1, 'Faulkes', NULL, 1, NULL, 1, NULL),
(124, NULL, 15, NULL, 3.900000, '', 1, 'Anglo-Australian', NULL, 1, NULL, 1, NULL),
(125, NULL, 15, NULL, 1.500000, '', 1, 'Nasmyth', NULL, 1, NULL, 1, NULL),
(126, NULL, 9, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(127, NULL, 15, NULL, 0.900000, '', 1, 'Nasmyth', NULL, 1, NULL, 1, NULL),
(128, NULL, 15, NULL, 10.400000, '', 1, 'Submillimeter', NULL, 1, NULL, 1, NULL),
(129, NULL, 2, NULL, 3.600000, '', 1, 'Optical and infrared', NULL, 1, NULL, 1, NULL),
(130, NULL, 2, NULL, 8.100000, '', 1, 'Optical and infrared', NULL, 1, NULL, 1, NULL),
(131, NULL, 2, NULL, 8.100000, '', 1, 'Optical and infrared', NULL, 1, NULL, 1, NULL),
(132, NULL, 10, NULL, 37.000000, '', 1, 'Radio ', NULL, 1, NULL, 1, NULL),
(133, NULL, 2, NULL, 15.000000, '', 1, 'Submillimeter', NULL, 1, NULL, 1, NULL),
(134, NULL, 5, NULL, 2.300000, '2', 1, '', NULL, 1, NULL, 1, NULL),
(135, NULL, 2, NULL, 1.200000, '', 1, '', NULL, 1, NULL, 1, NULL),
(136, NULL, 5, NULL, 1.000000, '1.35', 1, '', NULL, 1, NULL, 1, NULL),
(137, NULL, 2, NULL, 0.500000, '0.74', 1, '', NULL, 1, NULL, 1, NULL),
(138, NULL, 2, NULL, 0.400000, '0.24', 1, '', NULL, 1, NULL, 1, NULL),
(139, NULL, 2, NULL, 0.900000, '1.8', 1, '', NULL, 1, NULL, 1, NULL),
(140, NULL, 10, NULL, 32.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(141, NULL, 10, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(142, NULL, 2, NULL, 0.600000, '1.2', 1, '', NULL, 1, NULL, 1, NULL),
(143, NULL, 5, NULL, 1.520000, '1.2', 1, '', NULL, 1, NULL, 1, NULL),
(144, NULL, 7, NULL, 0.400000, '6', 1, '', NULL, 1, NULL, 1, NULL),
(145, NULL, 15, NULL, 0.600000, '2.4', 1, '', NULL, 1, NULL, 1, NULL),
(146, NULL, 15, NULL, 0.330000, '3.43', 1, '', NULL, 1, NULL, 1, NULL),
(147, NULL, 3, NULL, 0.980000, '2.4', 1, '', NULL, 1, NULL, 1, NULL),
(148, NULL, 15, NULL, 1.800000, '', 1, '', NULL, 1, NULL, 1, NULL),
(149, NULL, 2, NULL, 0.810000, '', 1, '', NULL, 1, NULL, 1, NULL),
(150, NULL, 2, NULL, 0.250000, '', 1, '', NULL, 1, NULL, 1, NULL),
(151, NULL, 15, NULL, 0.800000, '1.6', 1, '', NULL, 1, NULL, 1, NULL),
(152, NULL, 2, NULL, 0.910000, '4.143', 1, '', NULL, 1, NULL, 1, NULL),
(153, NULL, 2, NULL, 0.610000, '1.21', 1, '', NULL, 1, NULL, 1, NULL),
(154, NULL, 2, NULL, 1.050000, '0.994', 1, '', NULL, 1, NULL, 1, NULL),
(155, NULL, 8, NULL, 0.430000, '7', 1, '', NULL, 1, NULL, 1, NULL),
(156, NULL, 15, NULL, 0.800000, '', 1, '', NULL, 1, NULL, 1, NULL),
(157, NULL, 15, NULL, 0.200000, '1.14', 1, '', NULL, 1, NULL, 1, NULL),
(158, NULL, 15, NULL, 6.000000, '24', 1, '', NULL, 1, NULL, 1, NULL),
(159, NULL, 10, NULL, 600.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(160, NULL, 15, NULL, 1.000000, '', 1, '', NULL, 1, NULL, 1, NULL),
(161, NULL, 2, NULL, 0.600000, '', 1, '', NULL, 1, NULL, 1, NULL),
(162, NULL, 10, NULL, 0.000000, '', 1, '3.3-30m', NULL, 1, NULL, 1, NULL),
(163, NULL, 10, NULL, 0.000000, '', 1, '1.2-2.7m', NULL, 1, NULL, 1, NULL),
(164, NULL, 9, NULL, 10000.000000, 'GNIRS', 1, '1-5.4 microns', NULL, 1, NULL, 1, NULL),
(165, NULL, 9, NULL, 0.000000, '', 1, '', NULL, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `telescope_to_instruments`
--

DROP TABLE IF EXISTS `telescope_to_instruments`;
CREATE TABLE IF NOT EXISTS `telescope_to_instruments` (
  `telescope_id` int(10) unsigned NOT NULL,
  `instrument_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`telescope_id`,`instrument_id`),
  KEY `telescope_id_2` (`telescope_id`),
  KEY `instrument_id_1` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `telescope_to_instruments`
--


-- --------------------------------------------------------

--
-- Table structure for table `telescope_types`
--

DROP TABLE IF EXISTS `telescope_types`;
CREATE TABLE IF NOT EXISTS `telescope_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `telescope_types`
--

INSERT INTO `telescope_types` (`id`, `name`) VALUES
(1, 'Newton'),
(2, 'Cassegrain'),
(3, 'Schmidt-Cassegrain'),
(4, 'Maksutov'),
(5, 'Ritchey-Chretien'),
(6, 'Dobson'),
(7, 'Refracting Telescope'),
(8, 'Binocular Telescope'),
(9, 'Spectrograph'),
(10, 'Radio Telescope'),
(11, 'Underground Telescope'),
(12, 'Interferometer'),
(13, 'Magnetometer'),
(14, 'Riometer'),
(15, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
CREATE TABLE IF NOT EXISTS `timezones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `timezone`) VALUES
(1, '+00'),
(2, '+01'),
(3, '+02'),
(4, '+03'),
(5, '+04'),
(6, '+05'),
(7, '+06'),
(8, '+07'),
(9, '+08'),
(10, '+09'),
(11, '+10'),
(12, '+11'),
(13, '+12'),
(14, '-01'),
(15, '-02'),
(16, '-03'),
(17, '-04'),
(18, '-05'),
(19, '-06'),
(20, '-07'),
(21, '-08'),
(22, '-09'),
(23, '-10'),
(24, '-11'),
(25, '-12');

-- --------------------------------------------------------

--
-- Table structure for table `users_levels`
--

DROP TABLE IF EXISTS `users_levels`;
CREATE TABLE IF NOT EXISTS `users_levels` (
  `level` int(10) unsigned NOT NULL,
  `category` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_levels`
--

INSERT INTO `users_levels` (`level`, `category`, `description`) VALUES
(0, 'anonymous', 'access without login'),
(11, 'browsing', 'read-only access for registered users'),
(21, 'processing', 'data processing for selected users'),
(31, 'super user', 'full access');

-- --------------------------------------------------------

--
-- Table structure for table `users_list`
--

DROP TABLE IF EXISTS `users_list`;
CREATE TABLE IF NOT EXISTS `users_list` (
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
  KEY `level` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users_list`
--

INSERT INTO `users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES
(1, 'anonymous', NULL, NULL, NULL, NULL, NULL, NULL, 'other', 0),
(2, 'stoeckler', '530e90856e3fa433e5ad31f3359ea47e', 'Mr.', 'Robert', 'Stöckler', 'robert.stoeckler@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', 31),
(3, 'ftopf', '5e12806b179c04620320b332f205a80c', 'Mr.', 'Florian', 'Topf', 'florian.topf@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', 31),
(4, 'nagpal', '28e29334745b11450410d66f147239d7', 'Mr.', 'Parinesh', 'Nagpal', 'p.nagpal@ucl.ac.uk', 'UCL', 'scientific', 11),
(5, 'smiller', '28e29334745b11450410d66f147239d7', 'Prof.', 'Steve', 'Miller', 's.miller@ucl.ac.uk', 'UCL', 'scientific', 11),
(6, 'mscherf', '9996535e07258a7bbfd8b132435c5962', 'Mr.', 'Manuel', 'Scherf', 'manuel.scherf@oeaw.ac.at', 'IWF-OeAW', 'scientific', 11);

-- --------------------------------------------------------

--
-- Table structure for table `users_statistics`
--

DROP TABLE IF EXISTS `users_statistics`;
CREATE TABLE IF NOT EXISTS `users_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `page` int(10) unsigned NOT NULL,
  `epoch` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `page` (`page`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `users_statistics`
--


-- --------------------------------------------------------

--
-- Table structure for table `wavelength_ranges`
--

DROP TABLE IF EXISTS `wavelength_ranges`;
CREATE TABLE IF NOT EXISTS `wavelength_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acronym` text NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `wavelength_ranges`
--

INSERT INTO `wavelength_ranges` (`id`, `acronym`, `name`) VALUES
(1, 'radiowaves', 'radio frequencies'),
(2, 'radiowave (VHF)', 'very high frequency'),
(3, 'radiowave (HF)', 'high frequency'),
(4, 'radiowave (MF)', 'medium frequency'),
(5, 'radiowave (LF)', 'low frequency'),
(6, 'microwaves', 'microwave frequencies'),
(7, 'microwave (EHF)', 'extremely high frequency'),
(8, 'microwave (SHF)', 'super high frequency'),
(9, 'microwave (UHF)', 'ultra high frequency'),
(10, 'submillimeter', 'terahertz frequency'),
(11, 'infrared', 'infrared frequencies');

-- --------------------------------------------------------

--
-- Table structure for table `wavelength_units`
--

DROP TABLE IF EXISTS `wavelength_units`;
CREATE TABLE IF NOT EXISTS `wavelength_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wavelength_unit` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `wavelength_units`
--

INSERT INTO `wavelength_units` (`id`, `wavelength_unit`) VALUES
(1, '---'),
(2, 'Hz'),
(3, 'KHz'),
(4, 'MHz'),
(5, 'GHz'),
(6, 'THz');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_information`
--
ALTER TABLE `additional_information`
  ADD CONSTRAINT `observatory_id_4` FOREIGN KEY (`id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `camera_properties`
--
ALTER TABLE `camera_properties`
  ADD CONSTRAINT `observatory_id_6` FOREIGN KEY (`id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `hidden_fields`
--
ALTER TABLE `hidden_fields`
  ADD CONSTRAINT `observatory_id_5` FOREIGN KEY (`id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `instruments`
--
ALTER TABLE `instruments`
  ADD CONSTRAINT `instrument_type_id` FOREIGN KEY (`instrument_type`) REFERENCES `instrument_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `wavelength_unit_id_3` FOREIGN KEY (`wavelength_b_unit`) REFERENCES `wavelength_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `wavelength_unit_id_4` FOREIGN KEY (`wavelength_e_unit`) REFERENCES `wavelength_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `observatories`
--
ALTER TABLE `observatories`
  ADD CONSTRAINT `clear_nights_id` FOREIGN KEY (`clear_nights`) REFERENCES `clearnights_ranges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `precipitation_id` FOREIGN KEY (`precipitation`) REFERENCES `precipitation_ranges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `timezone_id` FOREIGN KEY (`timezone`) REFERENCES `timezones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `observatory_to_research_areas`
--
ALTER TABLE `observatory_to_research_areas`
  ADD CONSTRAINT `observatory_id_3` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `research_area_id_1` FOREIGN KEY (`research_area_id`) REFERENCES `research_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `observatory_to_scientific_contacts`
--
ALTER TABLE `observatory_to_scientific_contacts`
  ADD CONSTRAINT `observatory_id_1` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `scientific_contact_id_1` FOREIGN KEY (`scientific_contact_id`) REFERENCES `scientific_contacts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `observatory_to_targets`
--
ALTER TABLE `observatory_to_targets`
  ADD CONSTRAINT `observatory_id_7` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `target_id_1` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `observatory_to_telescopes`
--
ALTER TABLE `observatory_to_telescopes`
  ADD CONSTRAINT `observatory_id_2` FOREIGN KEY (`observatory_id`) REFERENCES `observatories` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `telescope_id_1` FOREIGN KEY (`telescope_id`) REFERENCES `telescopes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pages_list`
--
ALTER TABLE `pages_list`
  ADD CONSTRAINT `pages_list_ibfk_1` FOREIGN KEY (`level`) REFERENCES `users_levels` (`level`);

--
-- Constraints for table `sensor_to_science_goals`
--
ALTER TABLE `sensor_to_science_goals`
  ADD CONSTRAINT `science_goal_id` FOREIGN KEY (`science_goal_id`) REFERENCES `science_goals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sensor_id_3` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sensor_to_scientific_contacts`
--
ALTER TABLE `sensor_to_scientific_contacts`
  ADD CONSTRAINT `scientific_contact_id_2` FOREIGN KEY (`scientific_contact_id`) REFERENCES `scientific_contacts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `sensor_id_2` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `space_missions`
--
ALTER TABLE `space_missions`
  ADD CONSTRAINT `mission_agency_id` FOREIGN KEY (`mission_agency`) REFERENCES `agencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `space_mission_to_research_areas`
--
ALTER TABLE `space_mission_to_research_areas`
  ADD CONSTRAINT `research_area_id_2` FOREIGN KEY (`research_area_id`) REFERENCES `research_areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `space_mission_id_3` FOREIGN KEY (`space_mission_id`) REFERENCES `space_missions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `space_mission_to_sensors`
--
ALTER TABLE `space_mission_to_sensors`
  ADD CONSTRAINT `sensor_id_1` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `space_mission_id_1` FOREIGN KEY (`space_mission_id`) REFERENCES `space_missions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `space_mission_to_targets`
--
ALTER TABLE `space_mission_to_targets`
  ADD CONSTRAINT `space_mission_id_2` FOREIGN KEY (`space_mission_id`) REFERENCES `space_missions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `target_id_2` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `telescopes`
--
ALTER TABLE `telescopes`
  ADD CONSTRAINT `antenna_type_id` FOREIGN KEY (`antenna_type`) REFERENCES `antenna_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `telescope_type_id` FOREIGN KEY (`telescope_type`) REFERENCES `telescope_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `wavelength_unit_id_1` FOREIGN KEY (`wavelength_b_unit`) REFERENCES `wavelength_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `wavelength_unit_id_2` FOREIGN KEY (`wavelength_e_unit`) REFERENCES `wavelength_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `telescope_to_instruments`
--
ALTER TABLE `telescope_to_instruments`
  ADD CONSTRAINT `instrument_id_1` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `telescope_id_2` FOREIGN KEY (`telescope_id`) REFERENCES `telescopes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users_list`
--
ALTER TABLE `users_list`
  ADD CONSTRAINT `users_list_ibfk_1` FOREIGN KEY (`level`) REFERENCES `users_levels` (`level`);

--
-- Constraints for table `users_statistics`
--
ALTER TABLE `users_statistics`
  ADD CONSTRAINT `users_statistics_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_statistics_ibfk_2` FOREIGN KEY (`page`) REFERENCES `pages_list` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;