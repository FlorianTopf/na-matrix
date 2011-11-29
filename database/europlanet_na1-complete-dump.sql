-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2011 at 09:45 AM
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

DROP SCHEMA IF EXISTS `europlanet_na1_test` ;
CREATE SCHEMA IF NOT EXISTS `europlanet_na1_test` DEFAULT CHARACTER SET latin1 ;
USE `europlanet_na1_test` ;

-- --------------------------------------------------------

--
-- Table structure for table `additional_information`
--

DROP TABLE IF EXISTS `additional_information`;
CREATE TABLE IF NOT EXISTS `additional_information` (
  `id` int(10) unsigned NOT NULL,
  `further_contacts` text,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

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
(11, 'Parabolic');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `instrument_types`
--

INSERT INTO `instrument_types` (`id`, `name`) VALUES
(1, 'Spectrograph'),
(2, 'Interferometer'),
(3, 'Polarimeter'),
(4, 'Riometer'),
(5, 'Camera'),
(6, 'Other'),
(7, 'Heterodyne Receiver');

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
  `user_id` int(11) NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  `approved` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `precipitation_id` (`precipitation`),
  KEY `clear_nights_id` (`clear_nights`),
  KEY `timezone_id` (`timezone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `observatories`
--


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
  `domain` text NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `research_areas`
--

INSERT INTO `research_areas` (`id`, `domain`, `name`) VALUES
(4, 'ATMOSPHERIC PHYSICS', 'ATMOSPHERIC PHYSICS'),
(9, 'STELLAR PHYSICS', 'STELLAR PHYSICS'),
(11, 'SPACE PHYSICS', 'Solar Physics'),
(12, 'GEODESY', 'GEODESY'),
(13, 'COSMOLOGY', 'COSMOLOGY'),
(14, 'OBSERVATIONAL ASTROPHYSICS', 'Stellar Occultations'),
(15, 'PUBLIC OUTREACH / EDUCATION ETC.', 'PUBLIC OUTREACH / EDUCATION ETC.'),
(16, 'ASTROPARTICLE PHYSICS', 'ASTROPARTICLE PHYSICS'),
(18, 'ASTROBIOLOGY', 'ASTROBIOLOGY'),
(19, 'ASTROCHEMISTRY', 'ASTROCHEMISTRY'),
(20, 'STELLAR PHYSICS', 'Physics of White Dwarfs, Neutron Stars etc.'),
(21, 'CELESTIAL MECHANICS', 'Orbital Mechanics'),
(23, 'SPACE PHYSICS', 'Magnetospheric Physics'),
(25, 'ATMOSPHERIC PHYSICS', 'Climatology'),
(27, 'OBSERVATIONAL ASTROPHYSICS', 'Radio Astronomy'),
(28, 'OBSERVATIONAL ASTROPHYSICS', 'Astronomical Survey'),
(29, 'ATMOSPHERIC PHYSICS', 'Synoptic Meteorology'),
(31, 'OBSERVATIONAL ASTROPHYSICS', 'Optical Astronomy'),
(32, 'OBSERVATIONAL ASTROPHYSICS', 'Infrared Astronomy'),
(33, 'COSMOLOGY', 'Cosmic Microwave Background'),
(35, 'SPACE PHYSICS', 'Plasma Physics'),
(37, 'SPACE PHYSICS', 'Space Weather'),
(40, 'ASTROPARTICLE PHYSICS', 'High-Energy, VHE & UHE Gamma Ray Astronomy'),
(43, 'COSMOLOGY', 'The Observable Universe'),
(45, 'COSMOLOGY', 'Cosmogony, Big Bang & Early Universe'),
(48, 'COSMOLOGY', 'Exotic Matter, Dark Matter & Energy'),
(54, 'STELLAR PHYSICS', 'Star Formation'),
(58, 'ASTROCHEMISTRY', 'Chemical Evolution'),
(60, 'PLANETARY SCIENCES', 'Planetary Geology'),
(63, 'ASTROCHEMISTRY', 'Geochemistry'),
(65, 'STELLAR PHYSICS', 'Stellar Structure'),
(67, 'INSTRUMENTATION', 'INSTRUMENTATION'),
(71, 'PLANETARY SCIENCES', 'PLANETARY SCIENCES'),
(72, 'ASTROBIOLOGY', 'Abiogenesis (Astrobiology)'),
(73, 'ASTROBIOLOGY', 'Biomarkers'),
(74, 'ASTROBIOLOGY', 'Evolution of Life & Biodiversity'),
(75, 'ASTROBIOLOGY', 'Exoplanetary Research (Astrobiology)'),
(76, 'ASTROBIOLOGY', 'Life in the Solar System'),
(77, 'ASTROBIOLOGY', 'Planetary Habitability'),
(78, 'ASTROBIOLOGY', 'SETI - Search for Extra-Terrestrial Intelligence'),
(79, 'ASTROBIOLOGY', 'Stellar, Planetary & Atmospheric Evolution'),
(80, 'ASTROCHEMISTRY', 'Abiogenesis (Astrochemistry)'),
(81, 'ASTROCHEMISTRY', 'Atomic & Molecular Astrophysics'),
(82, 'ASTROCHEMISTRY', 'Cosmochemistry'),
(83, 'ASTROCHEMISTRY', 'Nucleocosmochronology'),
(84, 'ASTROPARTICLE PHYSICS', 'Cosmic Ray Physics (Astroparticle Physics)'),
(85, 'ASTROPARTICLE PHYSICS', 'Neutrino Astronomy (Astroparticle Physics)'),
(86, 'ASTROPARTICLE PHYSICS', 'Particle Physics  in Cosmology (Astroparticle Physics)'),
(87, 'ASTROPARTICLE PHYSICS', 'Related Astrophysics - Supernovae, AGN etc.'),
(88, 'ATMOSPHERIC PHYSICS', 'Aeronomy'),
(89, 'ATMOSPHERIC PHYSICS', 'Atmospheric Dynamics & Circulation'),
(90, 'ATMOSPHERIC PHYSICS', 'Atmospheric Energetics'),
(91, 'ATMOSPHERIC PHYSICS', 'Physical & Chemical Processes in the Atmosphere'),
(92, 'ATMOSPHERIC PHYSICS', 'Weather Forecasting'),
(93, 'ATMOSPHERIC PHYSICS', 'Weather Systems'),
(94, 'CELESTIAL MECHANICS', 'Astrometry'),
(95, 'CELESTIAL MECHANICS', 'CELESTIAL MECHANICS'),
(96, 'CELESTIAL MECHANICS', 'Celestial Navigation'),
(97, 'CELESTIAL MECHANICS', 'Ephemerides'),
(98, 'CELESTIAL MECHANICS', 'Lunar Theory'),
(99, 'COSMOLOGY', 'Gravitational Physics'),
(100, 'COSMOLOGY', 'Non-Standard Cosmology'),
(101, 'COSMOLOGY', 'Particle Physics in Cosmology'),
(102, 'COSMOLOGY', 'Structure Formation'),
(103, 'COSMOLOGY', 'Ultimate Fate of the Universe'),
(104, 'GEODESY', 'Cartography'),
(105, 'GEODESY', 'Geodetic Astronomy'),
(106, 'GEODESY', 'Photogrammetry'),
(107, 'GEODESY', 'Physical Geodesy'),
(108, 'GEODESY', 'Surveying'),
(109, 'OBSERVATIONAL ASTROPHYSICS', 'Earth Monitoring'),
(110, 'OBSERVATIONAL ASTROPHYSICS', 'Gamma Ray Astronomy'),
(111, 'OBSERVATIONAL ASTROPHYSICS', 'Gravitational Wave Astronomy'),
(112, 'OBSERVATIONAL ASTROPHYSICS', 'Neutrino Astronomy (Observational Astrophysics)'),
(113, 'OBSERVATIONAL ASTROPHYSICS', 'OBSERVATIONAL ASTROPHYSICS'),
(114, 'OBSERVATIONAL ASTROPHYSICS', 'Spectroscopy'),
(115, 'OBSERVATIONAL ASTROPHYSICS', 'UV Astronomy'),
(116, 'OBSERVATIONAL ASTROPHYSICS', 'X-Ray Astronomy'),
(117, 'PLANETARY SCIENCES', 'Exoplanetary Research (Planetary Sciences)'),
(118, 'PLANETARY SCIENCES', 'Geomorphology'),
(119, 'PLANETARY SCIENCES', 'Planetary Astronomy'),
(120, 'PLANETARY SCIENCES', 'Theoretical Planetology'),
(121, 'SPACE PHYSICS', 'Cosmic Ray Physics (Space Physics)'),
(122, 'SPACE PHYSICS', 'Heliospheric, Solar & Planetary Radio Emissions'),
(123, 'SPACE PHYSICS', 'Physics of Shockwaves'),
(124, 'SPACE PHYSICS', 'Planetary Aurorae'),
(125, 'SPACE PHYSICS', 'SPACE PHYSICS'),
(126, 'SPACE PHYSICS', 'Synchrotron Radiation'),
(127, 'STELLAR PHYSICS', 'Accretion Disks'),
(128, 'STELLAR PHYSICS', 'Asteroseismology'),
(129, 'STELLAR PHYSICS', 'Plasma Physics (Stellar Physics)'),
(130, 'STELLAR PHYSICS', 'Stellar Evolution');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `science_goals`
--

INSERT INTO `science_goals` (`id`, `acronym`, `name`) VALUES
(1, 'MA', 'Magnetospheres'),
(2, 'SA', 'Satellites'),
(3, 'AT', 'Atmospheres'),
(4, 'AU', 'Aurorae');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `scientific_contacts`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sensors`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `space_missions`
--


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


-- --------------------------------------------------------

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
CREATE TABLE IF NOT EXISTS `targets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_family` varchar(100) NOT NULL,
  `target_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=218 ;

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
(8, 'SMALL BODIES/Dwarf Planets/TNOs/KBOs/Plutinos/Plutoids', 'Pluto'),
(9, 'PLANETS/Earth/Satellites', 'Moon'),
(10, 'PLANETS/Mars/Satellites', 'Phobos'),
(11, 'PLANETS/Mars/Satellites', 'Deimos'),
(12, 'PLANETS/Jupiter/Satellites', 'Jupiter Satellites'),
(13, 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites', 'Io'),
(14, 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites', 'Ganymede'),
(15, 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites', 'Callisto'),
(16, 'PLANETS/Saturn/Satellites/Co-Orbitals', 'Janus'),
(17, 'PLANETS/Saturn/Satellites/Inner Large Satellites', 'Mimas'),
(18, 'PLANETS/Saturn/Satellites/Inner Large Satellites', 'Enceladus'),
(19, 'PLANETS/Saturn/Satellites/Inner Large Satellites', 'Tethys'),
(20, 'PLANETS/Saturn/Satellites/Inner Large Satellites', 'Dione'),
(21, 'PLANETS/Saturn/Satellites/Outer Large Satellites', 'Rhea'),
(22, 'PLANETS/Saturn/Satellites/Outer Large Satellites', 'Titan'),
(23, 'PLANETS/Saturn/Satellites/Outer Large Satellites', 'Hyperion'),
(24, 'PLANETS/Saturn/Satellites/Outer Large Satellites', 'Iapetus'),
(25, 'PLANETS/Saturn/Satellites/Irregular Satellites', 'Phoebe'),
(26, 'PLANETS/Uranus/Satellites', 'Uranus Satellites'),
(27, 'PLANETS/Neptune/Satellites', 'Neptune Satellites'),
(28, 'PLANETS/Neptune/Satellites/Irregular Satellites', 'Nereid'),
(30, 'SMALL BODIES/TNOs/KBOs/Plutinos', 'Charon'),
(31, 'SMALL BODIES/Comets', 'COMETS'),
(32, 'SMALL BODIES/TNOs/KBOs', 'KBOs (Kuiper Belt Objects)'),
(33, 'SMALL BODIES/Asteroids', 'ASTEROIDS'),
(34, 'SMALL BODIES', 'Meteors'),
(35, 'PLANETS/Mars/Satellites', 'Mars Satellites'),
(36, 'SMALL BODIES/TNOs', 'TNOs (Trans-Neptunian Objects)'),
(37, 'SMALL BODIES', 'SMALL BODIES'),
(38, 'PLANETS/Rings', 'RINGS'),
(39, 'PLANETS/Saturn/Rings', 'Saturn Rings'),
(40, 'PLANETS/Jupiter/Rings', 'Jupiter Rings'),
(41, 'PLANETS/Uranus/Rings', 'Uranus Rings'),
(42, 'PLANETS/Neptune/Rings', 'Neptune Rings'),
(43, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Vesta'),
(44, 'SMALL BODIES/Dwarf Planets', 'Ceres'),
(45, 'SUN', 'SUN'),
(46, 'PARTICLES', 'DUST'),
(47, 'STELLAR OBJECTS/Exoplanets', 'EXOPLANETS'),
(48, 'PLANETS/Satellites', 'SATELLITES'),
(49, 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites', 'Europa'),
(50, 'PLANETS', 'PLANETS'),
(51, 'SMALL BODIES', 'Meteorites'),
(52, 'PLANETS/Saturn/Satellites', 'Saturn Satellites'),
(53, 'PLANETS', 'Mercury'),
(54, 'ARTIFICIAL SATELLITES', 'ARTIFICIAL SATELLITES'),
(55, 'ATMOSPHERIC PHENOMENA', 'ATMOSPHERIC PHENOMENA'),
(56, 'COSMIC MICROWAVE BACKGROUND', 'COSMIC MICROWAVE BACKGROUND'),
(57, 'DARK ENERGY', 'DARK ENERGY'),
(58, 'DARK MATTER', 'DARK MATTER'),
(59, 'DEEP SPACE', 'DEEP SPACE'),
(60, 'EARLY UNIVERSE', 'BIG BANG'),
(61, 'EARLY UNIVERSE', 'EARLY UNIVERSE'),
(62, 'EXOTIC OBJECTS', 'EXOTIC OBJECTS'),
(63, 'GALAXIES', 'GALAXIES'),
(64, 'GALAXIES', 'STARBURST GALAXIES'),
(65, 'GALAXIES/Active Galactic Nuclei', 'ACTIVE GALACTIC NUCLEI'),
(66, 'GALAXIES/Active Galactic Nuclei', 'BLAZARS'),
(67, 'GALAXIES/Active Galactic Nuclei', 'LINER GALAXIES'),
(68, 'GALAXIES/Active Galactic Nuclei', 'Quasars'),
(69, 'GALAXIES/Active Galactic Nuclei', 'Radio Galaxies'),
(70, 'GALAXIES/Active Galactic Nuclei', 'SEYFERT GALAXIES'),
(71, 'GALAXIES/Groups and Clusters', 'GROUPS AND CLUSTERS'),
(72, 'GALAXIES/Groups and Clusters', 'LOCAL GROUP'),
(73, 'GALAXIES/The Milky Way', 'Sagittarius A'),
(74, 'GALAXIES/The Milky Way', 'THE MILKY WAY'),
(75, 'GAMMA RAY BURSTS', 'GAMMA RAY BURSTS'),
(76, 'GRAVITATIONAL WAVES', 'GRAVITATIONAL WAVES'),
(77, 'INTERGALACTIC MEDIUM', 'INTERGALACTIC MEDIUM'),
(78, 'INTERGALACTIC MEDIUM', 'VOIDS'),
(79, 'INTERPLANETARY MEDIUM', 'INTERPLANETARY MEDIUM'),
(80, 'INTERSTELLAR MEDIUM', 'INTERSTELLAR CLOUDS AND NEBULAE'),
(81, 'INTERSTELLAR MEDIUM', 'INTERSTELLAR MEDIUM'),
(82, 'LARGE SCALE STRUCTURES', 'LARGE SCALE STRUCTURES'),
(83, 'PARTICLES', 'COSMIC RAYS'),
(84, 'PARTICLES', 'NEUTRINOS'),
(85, 'PARTICLES', 'PARTICLES'),
(86, 'PARTICLES', 'SEPs (Solar Energetic Particles)'),
(87, 'PLANETS/Jupiter/Satellites/Irregular Satellites', 'Himalia'),
(88, 'PLANETS/Jupiter/Satellites/Irregular Satellites', 'Jupiter Irregular Satellites'),
(89, 'PLANETS/Jupiter/Satellites/Regular Satellites', 'Regular Satellites'),
(90, 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites', 'Galilean Satellites'),
(91, 'PLANETS/Jupiter/Satellites/Regular Satellites/Inner Satellites (Amalthea Group)', 'Amalthea'),
(92, 'PLANETS/Jupiter/Satellites/Regular Satellites/Inner Satellites (Amalthea Group)', 'Jupiter Inner Satellites (Amalthea Group)'),
(93, 'PLANETS/Neptune/Satellites/Irregular Satellites', 'Neptune Irregular Satellites'),
(94, 'PLANETS/Neptune/Satellites/Irregular Satellites', 'Triton'),
(95, 'PLANETS/Neptune/Satellites/Regular Satellites', 'Proteus'),
(96, 'PLANETS/Neptune/Satellites/Regular Satellites', 'Regular Satellites'),
(97, 'PLANETS/Saturn/Satellites/Alkyonides', 'Alkyionides'),
(98, 'PLANETS/Saturn/Satellites/Co-Orbitals', 'Saturn Co-Orbitals'),
(99, 'PLANETS/Saturn/Satellites/Co-Orbitals', 'Epimeteus'),
(100, 'PLANETS/Saturn/Satellites/Inner Large Satellites', 'Saturn Inner Large Satellites'),
(101, 'PLANETS/Saturn/Satellites/Irregular Satellites', 'Saturn Irregular Satellites'),
(102, 'PLANETS/Saturn/Satellites/Outer Large Satellites', 'Outer Large Satellites'),
(103, 'PLANETS/Saturn/Satellites/Ring Moonlets', 'Ring Moonlets'),
(104, 'PLANETS/Saturn/Satellites/Sheperd Satellites', 'Sheperd Satellites'),
(105, 'PLANETS/Saturn/Satellites/Trojan Satellites', 'Trojan Satellites'),
(106, 'PLANETS/Uranus/Satellites/Inner Satellites', 'Uranus Inner Satellites'),
(107, 'PLANETS/Uranus/Satellites/Inner Satellites', 'Puck'),
(108, 'PLANETS/Uranus/Satellites/Irregular Satellites', 'Uranus Irregular Satellites'),
(109, 'PLANETS/Uranus/Satellites/Large Satellites', 'Ariel'),
(110, 'PLANETS/Uranus/Satellites/Large Satellites', 'Large Satellites'),
(111, 'PLANETS/Uranus/Satellites/Large Satellites', 'Miranda'),
(112, 'PLANETS/Uranus/Satellites/Large Satellites', 'Oberon'),
(113, 'PLANETS/Uranus/Satellites/Large Satellites', 'Titania'),
(114, 'PLANETS/Uranus/Satellites/Large Satellites', 'Umbriel'),
(115, 'SMALL BODIES/Asteroids/Centaurs', 'Chariklo'),
(116, 'SMALL BODIES/Asteroids/Centaurs', 'Chiron'),
(117, 'SMALL BODIES/Asteroids/Jupiter Trojans', 'Jupiter Trojans'),
(118, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Astraea'),
(119, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Cybele'),
(120, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Davida'),
(121, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Eunomia'),
(122, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Europa (Asteroid)'),
(123, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Hebe'),
(124, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Hygiea'),
(125, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Interanmia'),
(126, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Iris'),
(127, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Juno'),
(128, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Main Asteroid Belt'),
(129, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Pallas'),
(130, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Psyche'),
(131, 'SMALL BODIES/Asteroids/Main Asteroid Belt', 'Sylvia'),
(132, 'SMALL BODIES/Asteroids/NEOs', 'Apophis'),
(133, 'SMALL BODIES/Asteroids/NEOs', 'Ganymed (Asteroid)'),
(134, 'SMALL BODIES/Asteroids/NEOs', 'NEOs (Near-Earth Objects)'),
(135, 'SMALL BODIES/Asteroids/Neptune Trojans', 'Neptune Trojans'),
(136, 'SMALL BODIES/Asteroids/NEOs', 'Eros'),
(137, 'SMALL BODIES/Centaurs', '2010 KZ39'),
(138, 'SMALL BODIES/Centaurs', 'CENTAURS'),
(139, 'SMALL BODIES/Comets', 'Churyumov-Gerasimenko'),
(140, 'SMALL BODIES/Comets', 'Encke'),
(141, 'SMALL BODIES/Comets', 'Halley'),
(142, 'SMALL BODIES/Comets', 'Holmes'),
(143, 'SMALL BODIES/Comets', 'Tempel 1'),
(144, 'SMALL BODIES/Comets', 'Wild 2'),
(145, 'SMALL BODIES/Comets/Kreutz Sungracers', 'Kreutz Sungracers'),
(146, 'SMALL BODIES/Dwarf Planets', 'DWARF PLANETS'),
(147, 'SMALL BODIES/Dwarf Planets/TNOs/KBOs/Cubewanos/Plutoids', 'Makemake'),
(148, 'SMALL BODIES/Dwarf Planets/TNOs/KBOs/Plutoids', 'Haumea'),
(149, 'SMALL BODIES/Dwarf Planets/TNOs/SDOs/Plutoids', 'Eris'),
(150, 'SMALL BODIES/Oort Cloud', 'OORT CLOUD'),
(151, 'SMALL BODIES/TNOs/Cubewanos', 'Cubewanos '),
(152, 'SMALL BODIES/TNOs/KBOs', '(120348) 2004 TY364'),
(153, 'SMALL BODIES/TNOs/KBOs', '(230965) 2004 XA192'),
(154, 'SMALL BODIES/TNOs/KBOs', '2007 JJ43'),
(155, 'SMALL BODIES/TNOs/KBOs/2:5 resonance', '(26375) 1999 DE9'),
(156, 'SMALL BODIES/TNOs/KBOs/2:5 resonance', '(84522) 2002 TC302'),
(157, 'SMALL BODIES/TNOs/KBOs/4:7 resonance', '1999 CD158'),
(158, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(120347) 2004 SB60'),
(159, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(144897) 2004 UX10'),
(160, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(145452) 2005 RN43'),
(161, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(15760) 1992 QB1'),
(162, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(174567) 2003 MW12'),
(163, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(202421) 2005 UQ513'),
(164, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(35671) 1998 SN165'),
(165, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(55565) 2002 AW197'),
(166, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(55637) 2002 UX25'),
(167, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '(90568) 2004 GV9'),
(168, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '19521 Chaos'),
(169, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '1998 WW31'),
(170, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '2002 MS4'),
(171, 'SMALL BODIES/TNOs/KBOs/Cubewanos', '2004 NT33'),
(172, 'SMALL BODIES/TNOs/KBOs/Cubewanos', 'Quaoar'),
(173, 'SMALL BODIES/TNOs/KBOs/Cubewanos', 'Varuna'),
(174, 'SMALL BODIES/TNOs/KBOs/Plutinos', '(208996) 2003 AZ84'),
(175, 'SMALL BODIES/TNOs/KBOs/Plutinos', '(84922) 2003 VS2'),
(176, 'SMALL BODIES/TNOs/KBOs/Plutinos', '2001 QF298'),
(177, 'SMALL BODIES/TNOs/KBOs/Plutinos', '2002 XV93'),
(178, 'SMALL BODIES/TNOs/KBOs/Plutinos', '2003 UZ413'),
(179, 'SMALL BODIES/TNOs/KBOs/Plutinos', 'Huya'),
(180, 'SMALL BODIES/TNOs/KBOs/Plutinos', 'Ixion'),
(181, 'SMALL BODIES/TNOs/KBOs/Plutinos', 'Orcus'),
(182, 'SMALL BODIES/TNOs/KBOs/Plutinos', 'Plutinos'),
(183, 'SMALL BODIES/TNOs/KBOs/Twotinos', '(119979) 2002 WC19'),
(184, 'SMALL BODIES/TNOs/KBOs/Twotinos', 'Twotinos'),
(185, 'SMALL BODIES/TNOs/SDOs', '(145451) 2005 RM43'),
(186, 'SMALL BODIES/TNOs/SDOs', '(15874) 1996 TL66'),
(187, 'SMALL BODIES/TNOs/SDOs', '(225088) 2007 OR10'),
(188, 'SMALL BODIES/TNOs/SDOs', '(26181) 1996 GQ21'),
(189, 'SMALL BODIES/TNOs/SDOs', '(82075) 2000 YW134'),
(190, 'SMALL BODIES/TNOs/SDOs', '2005 QU182'),
(191, 'SMALL BODIES/TNOs/SDOs', '2006 QH181'),
(192, 'SMALL BODIES/TNOs/SDOs', '2007 UK126'),
(193, 'SMALL BODIES/TNOs/SDOs', 'SDOs (Scattered Disc Objects)'),
(194, 'SMALL BODIES/TNOs/SDOs/4:9 resonance', '(42301) 2001 UR163'),
(195, 'SMALL BODIES/TNOs/SDOs/Detached Objects', '(120132) 2003 FY128'),
(196, 'SMALL BODIES/TNOs/SDOs/Detached Objects', '(48639) 1995 TL8'),
(197, 'SMALL BODIES/TNOs/SDOs/Detached Objects', '2003 QX113'),
(198, 'SMALL BODIES/TNOs/SDOs/Detached Objects', '2004 XR190'),
(199, 'SMALL BODIES/TNOs/SDOs/Detached Objects', 'Sedna'),
(200, 'STAR CLUSTERS', 'GLOBULAR CLUSTERS'),
(201, 'STAR CLUSTERS', 'OPEN CLUSTERS'),
(202, 'STAR CLUSTERS', 'STAR ASSOCIATION'),
(203, 'STAR CLUSTERS', 'STAR CLUSTERS'),
(204, 'STELLAR OBJECTS', 'BINARY STARS'),
(205, 'STELLAR OBJECTS', 'BLACK HOLES'),
(206, 'STELLAR OBJECTS', 'BROWN DARFS'),
(207, 'STELLAR OBJECTS', 'CIRCUMSTELLAR DISCS'),
(208, 'STELLAR OBJECTS', 'NEUTRON STARS'),
(209, 'STELLAR OBJECTS', 'PULSARS'),
(210, 'STELLAR OBJECTS', 'STARS'),
(211, 'STELLAR OBJECTS', 'STELLAR OBJECTS'),
(212, 'STELLAR OBJECTS', 'WHITE DARFS'),
(213, 'STELLAR OBJECTS/Exoplanets', 'BIO MARKERS'),
(214, 'STELLAR OBJECTS/Extraterrestrial Life', 'ARTIFICIAL SIGNALS'),
(215, 'STELLAR OBJECTS/Extraterrestrial Life', 'EXTRATERRESTRIAL LIFE'),
(216, 'SUN', 'SOLAR WIND'),
(217, 'SUPERNOVAE/NOVAE', 'SUPERNOVAE/NOVAE');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `telescopes`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

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
(10, 'Radio Telescope'),
(11, 'Underground Telescope'),
(13, 'Magnetometer'),
(14, 'Riometer'),
(15, 'Other'),
(16, 'Newton-Cassegrain'),
(17, 'Reflecting Telescope'),
(18, 'Schmidt'),
(19, 'Gregorian Telescope'),
(20, 'Solar Telescope');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users_list`
--

INSERT INTO `users_list` (`id`, `username`, `passwd`, `title`, `fname`, `lname`, `email`, `affiliation`, `category`, `level`) VALUES
(1, 'anonymous', NULL, NULL, NULL, NULL, NULL, NULL, 'other', 0),
(2, 'stoeckler', '530e90856e3fa433e5ad31f3359ea47e', 'Mr.', 'Robert', 'Stöckler', 'robert.stoeckler@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', 31),
(3, 'ftopf', '5e12806b179c04620320b332f205a80c', 'Mr.', 'Florian', 'Topf', 'florian.topf@oeaw.ac.at', 'Institut für Weltraumforschung', 'commercial', 31),
(4, 'nagpal', '28e29334745b11450410d66f147239d7', 'Mr.', 'Parinesh', 'Nagpal', 'p.nagpal@ucl.ac.uk', 'UCL', 'scientific', 11),
(5, 'smiller', '28e29334745b11450410d66f147239d7', 'Prof.', 'Steve', 'Miller', 's.miller@ucl.ac.uk', 'UCL', 'scientific', 21),
(6, 'mscherf', '9996535e07258a7bbfd8b132435c5962', 'Mr.', 'Manuel', 'Scherf', 'manuel.scherf@oeaw.ac.at', 'IWF-OeAW', 'scientific', 21);

-- --------------------------------------------------------

--
-- Table structure for table `users_statistics`
--

DROP TABLE IF EXISTS `users_statistics`;
CREATE TABLE IF NOT EXISTS `users_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `page` varchar(45) NOT NULL,
  `epoch` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

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
(11, 'infrared (IR)', 'infrared frequencies'),
(12, 'optical', 'visible light frequencies'),
(13, 'ultraviolet (UV)', 'ultraviolet light frequencies'),
(14, 'x-rays', 'x-ray frequencies'),
(15, 'gamma-rays', 'gamma-ray frequencies');

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
-- Constraints for table `users_statistics`
--
ALTER TABLE `users_statistics`
  ADD CONSTRAINT `users_statistics_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users_list` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
