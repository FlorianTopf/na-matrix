SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 336 */

TRUNCATE TABLE `users_statistics`;

ALTER TABLE `europlanet_na1`.`users_list` DROP FOREIGN KEY `users_list_ibfk_1` ;

ALTER TABLE `europlanet_na1`.`users_statistics` DROP FOREIGN KEY `users_statistics_ibfk_2` ;

ALTER TABLE `europlanet_na1`.`users_list` 
DROP INDEX `level` ;

ALTER TABLE `europlanet_na1`.`users_statistics` CHANGE COLUMN `page` `page` VARCHAR(45) NOT NULL  
, DROP INDEX `page` ;

DROP TABLE IF EXISTS `europlanet_na1`.`pages_list` ;

DROP TABLE IF EXISTS `europlanet_na1`.`users_levels` ;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 401 */

/* extend length of names */
ALTER TABLE `europlanet_na1`.`targets` CHANGE COLUMN `target_family` `target_family` VARCHAR(100) NOT NULL ;
ALTER TABLE `europlanet_na1`.`targets` CHANGE COLUMN `target_name` `target_name` VARCHAR(100) NOT NULL  ;

/* update old targets */
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PARTICLES' WHERE `targets`.`id` =46 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Earth/Satellites' WHERE `targets`.`id` =9 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Jupiter/Rings' WHERE `targets`.`id` =40 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Jupiter/Satellites' WHERE `targets`.`id` =12 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites' WHERE `targets`.`id` =15 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites' WHERE `targets`.`id` =49 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites' WHERE `targets`.`id` =14 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Jupiter/Satellites/Regular Satellites/Galilean Satellites' WHERE `targets`.`id` =13 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Mars/Satellites' WHERE `targets`.`id` =11 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Mars/Satellites' WHERE `targets`.`id` =35 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Mars/Satellites' WHERE `targets`.`id` =10 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Neptune/Rings' WHERE `targets`.`id` =42 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Neptune/Satellites' WHERE `targets`.`id` =27 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Neptune/Satellites/Irregular Satellites' WHERE `targets`.`id` =28 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Rings' WHERE `targets`.`id` =38 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Satellites' WHERE `targets`.`id` =48 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Rings' WHERE `targets`.`id` =39 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites' WHERE `targets`.`id` =52 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Co-Orbitals' WHERE `targets`.`id` =16 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Inner Large Satellites' WHERE `targets`.`id` =17 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Inner Large Satellites' WHERE `targets`.`id` =18 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Inner Large Satellites' WHERE `targets`.`id` =19 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Inner Large Satellites' WHERE `targets`.`id` =20 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Irregular Satellites' WHERE `targets`.`id` =25 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Outer Large Satellites' WHERE `targets`.`id` =24 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Outer Large Satellites' WHERE `targets`.`id` =22 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Outer Large Satellites' WHERE `targets`.`id` =21 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Saturn/Satellites/Outer Large Satellites' WHERE `targets`.`id` =23 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Uranus/Rings' WHERE `targets`.`id` =41 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'PLANETS/Uranus/Satellites' WHERE `targets`.`id` =26 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/Asteroids', `target_name` = 'ASTEROIDS' WHERE `targets`.`id` =33 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/Asteroids/Main Asteroid Belt' WHERE `targets`.`id` =43 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/Comets', `target_name` = 'COMETS' WHERE `targets`.`id` =31 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/Dwarf Planets' WHERE `targets`.`id` =44 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/Dwarf Planets/TNOs/KBOs/Plutinos/Plutoids' WHERE `targets`.`id` =8 LIMIT 1 ;
/* will be divided into two single targets (INSERT Oort Cloud afterwards) */
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/TNOs/KBOs', `target_name` = 'KBOs (Kuiper Belt Objects)' WHERE `targets`.`id` =32 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/TNOs', `target_name` = 'TNOs (Trans-Neptunian Objects)' WHERE `targets`.`id` =36 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'SMALL BODIES/TNOs/KBOs/Plutinos' WHERE `targets`.`id` =30 LIMIT 1 ;
UPDATE `europlanet_na1`.`targets` SET `target_family` = 'STELLAR OBJECTS/Exoplanets' WHERE `targets`.`id` =47 LIMIT 1 ;
/* delete pluto satellites */
DELETE FROM `europlanet_na1`.`targets` WHERE `targets`.`id` = 29 LIMIT 1
/* insert new targets */
INSERT INTO `europlanet_na1`.`targets` (`id`, `target_family`, `target_name`) VALUES
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

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 416 */
ALTER TABLE `europlanet_na1`.`research_areas` ADD COLUMN `domain` TEXT NOT NULL  AFTER `name` ;

/** update old research areas */
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Key Area 1 (Planetary aurorae, planetary radio emissions, planetary space weather)' WHERE `research_areas`.`id` =1 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Key Area 2 (Small solar system objects: Astrometry, spectroscopy, stellar occultations, meteoroid impact effects)' WHERE `research_areas`.`id` =2 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Key Area 3 (Airless bodies in the solar system: Moon, Mercury, Galilean satellites)' WHERE `research_areas`.`id` =3 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'ATMOSPHERIC PHYSICS',
`domain` = 'ATMOSPHERIC PHYSICS' WHERE `research_areas`.`id` =4 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Supernovae / Novae' WHERE `research_areas`.`id` =5 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Galaxies' WHERE `research_areas`.`id` =6 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Interstellar Medium' WHERE `research_areas`.`id` =7 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Exoplanets' WHERE `research_areas`.`id` =8 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'STELLAR PHYSICS',
`domain` = 'STELLAR PHYSICS' WHERE `research_areas`.`id` =9 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Large Scale Structures' WHERE `research_areas`.`id` =10 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Solar Physics',
`domain` = 'SPACE PHYSICS' WHERE `research_areas`.`id` =11 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'GEODESY',
`domain` = 'GEODESY' WHERE `research_areas`.`id` =12 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'COSMOLOGY',
`domain` = 'COSMOLOGY' WHERE `research_areas`.`id` =13 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Stellar Occultations',
`domain` = 'OBSERVATIONAL ASTROPHYSICS' WHERE `research_areas`.`id` =14 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'PUBLIC OUTREACH / EDUCATION ETC.',
`domain` = 'PUBLIC OUTREACH / EDUCATION ETC.' WHERE `research_areas`.`id` =15 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'ASTROPARTICLE PHYSICS',
`domain` = 'ASTROPARTICLE PHYSICS' WHERE `research_areas`.`id` =16 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Black Holes' WHERE `research_areas`.`id` =17 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'ASTROBIOLOGY',
`domain` = 'ASTROBIOLOGY' WHERE `research_areas`.`id` =18 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'ASTROCHEMISTRY',
`domain` = 'ASTROCHEMISTRY' WHERE `research_areas`.`id` =19 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Physics of White Dwarfs, Neutron Stars etc.',
`domain` = 'STELLAR PHYSICS' WHERE `research_areas`.`id` =20 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Orbital Mechanics',
`domain` = 'CELESTIAL MECHANICS' WHERE `research_areas`.`id` =21 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Interplanetary Medium' WHERE `research_areas`.`id` =22 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Magnetospheric Physics',
`domain` = 'SPACE PHYSICS' WHERE `research_areas`.`id` =23 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Variable Stars' WHERE `research_areas`.`id` =24 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Climatology',
`domain` = 'ATMOSPHERIC PHYSICS' WHERE `research_areas`.`id` =25 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Instability phenomena in the universe' WHERE `research_areas`.`id` =26 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `domain` = 'OBSERVATIONAL ASTROPHYSICS' WHERE `research_areas`.`id` =27 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Astronomical Survey',
`domain` = 'OBSERVATIONAL ASTROPHYSICS' WHERE `research_areas`.`id` =28 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Synoptic Meteorology',
`domain` = 'ATMOSPHERIC PHYSICS' WHERE `research_areas`.`id` =29 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Small Solar System Objects' WHERE `research_areas`.`id` =30 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `domain` = 'OBSERVATIONAL ASTROPHYSICS' WHERE `research_areas`.`id` =31 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `domain` = 'OBSERVATIONAL ASTROPHYSICS' WHERE `research_areas`.`id` =32 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `domain` = 'COSMOLOGY' WHERE `research_areas`.`id` =33 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Solar System' WHERE `research_areas`.`id` =34 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Plasma Physics',
`domain` = 'SPACE PHYSICS' WHERE `research_areas`.`id` =35 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Sun-Earth Interaction' WHERE `research_areas`.`id` =36 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Space Weather',
`domain` = 'SPACE PHYSICS' WHERE `research_areas`.`id` =37 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Solar Wind Interaction' WHERE `research_areas`.`id` =38 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Earth''s Magnetic Environment' WHERE `research_areas`.`id` =39 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'High-Energy, VHE & UHE Gamma Ray Astronomy',
`domain` = 'ASTROPARTICLE PHYSICS' WHERE `research_areas`.`id` =40 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Energetic Radiation' WHERE `research_areas`.`id` =41 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Iron Quasar' WHERE `research_areas`.`id` =42 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'The Observable Universe',
`domain` = 'COSMOLOGY' WHERE `research_areas`.`id` =43 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Sunyaev-Zel''dovich effect' WHERE `research_areas`.`id` =44 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Cosmogony, Big Bang & Early Universe',
`domain` = 'COSMOLOGY' WHERE `research_areas`.`id` =45 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Expansion of Universe' WHERE `research_areas`.`id` =46 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Beginning of Universe' WHERE `research_areas`.`id` =47 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Exotic Matter, Dark Matter & Energy',
`domain` = 'COSMOLOGY' WHERE `research_areas`.`id` =48 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: X-rays' WHERE `research_areas`.`id` =49 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Observations of GRB' WHERE `research_areas`.`id` =50 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Deep Space' WHERE `research_areas`.`id` =51 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Quasars' WHERE `research_areas`.`id` =52 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Gamma-ray bursts' WHERE `research_areas`.`id` =53 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Star Formation',
`domain` = 'STELLAR PHYSICS' WHERE `research_areas`.`id` =54 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Comets' WHERE `research_areas`.`id` =55 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Planets' WHERE `research_areas`.`id` =56 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Solar System Objects' WHERE `research_areas`.`id` =57 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Chemical Evolution',
`domain` = 'ASTROCHEMISTRY' WHERE `research_areas`.`id` =58 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: X-ray emitting temperatures' WHERE `research_areas`.`id` =59 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Planetary Geology',
`domain` = 'PLANETARY SCIENCES' WHERE `research_areas`.`id` =60 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Electromagnetic Radiation' WHERE `research_areas`.`id` =61 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Lunar Geology' WHERE `research_areas`.`id` =62 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Geochemistry',
`domain` = 'ASTROCHEMISTRY' WHERE `research_areas`.`id` =63 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Investigation of magnetic activity of the Sun' WHERE `research_areas`.`id` =64 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'Stellar Structure',
`domain` = 'STELLAR PHYSICS' WHERE `research_areas`.`id` =65 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Dark Matter' WHERE `research_areas`.`id` =66 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'INSTRUMENTATION',
`domain` = 'INSTRUMENTATION' WHERE `research_areas`.`id` =67 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Atmospheric Observations' WHERE `research_areas`.`id` =68 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Radar Imaging' WHERE `research_areas`.`id` =69 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Military Defence' WHERE `research_areas`.`id` =70 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'PLANETARY SCIENCES',
`domain` = 'PLANETARY SCIENCES' WHERE `research_areas`.`id` =71 LIMIT 1 ;
/* insert new research areas */
/* ALTER TABLE `europlanet_na1`.`research_areas`  AUTO_INCREMENT =72 */
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES
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
/* change table order */
ALTER TABLE `europlanet_na1`.`research_areas` CHANGE COLUMN `domain` `domain` TEXT NOT NULL  AFTER `id` ;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 427 */
ALTER TABLE `additional_information` DROP `instrument_comments;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 450 */
INSERT INTO `wavelength_ranges` (`id`, `acronym`, `name`) VALUES
(12, 'optical', 'visible light frequencies');

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 671 */
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Key Area 1 (..)' WHERE `research_areas`.`id` =1 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Key Area 2 (..)' WHERE `research_areas`.`id` =2 LIMIT 1 ;
UPDATE `europlanet_na1`.`research_areas` SET `name` = 'DEPRECATED: Key Area 3 (..)' WHERE `research_areas`.`id` =3 LIMIT 1 ;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 687 */
UPDATE  `europlanet_na1`.`wavelength_ranges` SET  `acronym` =  'infrared (IR)' WHERE  `wavelength_ranges`.`id` =11;
INSERT INTO `wavelength_ranges` (`id`, `acronym`, `name`) VALUES
(13, 'ultraviolet (UV)', 'ultraviolet light frequencies')

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 704 */
UPDATE  `europlanet_na1`.`instrument_types` SET  `name` =  'Spectrograph' WHERE  `instrument_types`.`id` =1;
DELETE FROM `europlanet_na1`.`telescope_types` WHERE `telescope_types`.`id`=9;
DELETE FROM `europlanet_na1`.`telescope_types` WHERE `telescope_types`.`id`=9;
UPDATE `europlanet_na1`.`telescopes` SET `antenna_type` = '1' WHERE `telescopes`.`antenna_type` =12;
DELETE FROM `europlanet_na1`.`antenna_types` WHERE `antenna_types`.`id` = 12

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 739 */
ALTER TABLE `europlanet_na1`.`observatories` ADD COLUMN `user_id` INT(11) NOT NULL DEFAULT 0 AFTER `partner_observatories`;
ALTER TABLE `europlanet_na1`.`observatories` ADD COLUMN `approved` TINYINT(1) NULL DEFAULT FALSE AFTER `modification_date`;
UPDATE `europlanet_na1`.`observatories` SET `observatories`.`approved`=1;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 873 */
INSERT INTO  `europlanet_na1`.`wavelength_ranges` (`id` , `acronym` , `name`) VALUES
(NULL, 'x-rays', 'x-ray frequencies'),
(NULL, 'gamma-rays', 'gamma-ray frequencies');

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 896 */
ALTER DATABASE europlanet_na1 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 904 */
DELETE FROM `research_areas` WHERE `name` LIKE "%DEPRECATED%";

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 910    */
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, '&Aring;');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'nm');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, '&micro;m');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'mm');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'cm');

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 975 */
UPDATE  `europlanet_na1`.`research_areas` SET  `domain` =  'GENERAL ASTRONOMY',
`name` =  'GENERAL ASTRONOMY' WHERE  `research_areas`.`id` =131 LIMIT 1 ;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 993 */
ALTER TABLE `hidden_fields` DROP `zip_code`, DROP `city`;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 996 */
ALTER TABLE `europlanet_na1`.`observatories` ADD COLUMN `saved_for_later` TINYINT(1) NULL DEFAULT FALSE  AFTER `approved` ;

ALTER TABLE `europlanet_na1`.`additional_information` 
ADD COLUMN `target_comments` TEXT NULL DEFAULT NULL  AFTER `research_comments` , 
ADD COLUMN `feedback` TEXT NULL DEFAULT NULL  AFTER `general_comments` ;

ALTER TABLE `europlanet_na1`.`telescopes` ADD COLUMN `mobile_flag` TINYINT(1) NULL DEFAULT FALSE  AFTER `telescope_type` ;

/** Clear night additions */
UPDATE  `europlanet_na1`.`clearnights_ranges` SET  `range` =  '201-250' WHERE  `clearnights_ranges`.`id` =5 LIMIT 1 ;
UPDATE  `europlanet_na1`.`clearnights_ranges` SET  `range` =  '251-300' WHERE  `clearnights_ranges`.`id` =6 LIMIT 1 ;
UPDATE  `europlanet_na1`.`clearnights_ranges` SET  `range` =  '>300' WHERE  `clearnights_ranges`.`id` =7 LIMIT 1 ;
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES ('8', '---');
/** Change existing entries (+1) */
UPDATE  `europlanet_na1`.`observatories` SET  `clear_nights` = '6' WHERE  `clear_nights` = '5';
UPDATE  `europlanet_na1`.`observatories` SET  `clear_nights` = '7' WHERE  `clear_nights` = '6';
UPDATE  `europlanet_na1`.`observatories` SET  `clear_nights` = '8' WHERE  `clear_nights` = '7';

ALTER TABLE `europlanet_na1`.`observatories` ADD COLUMN `last_saved_by` INT(11) NULL DEFAULT 0  AFTER `saved_for_later` ;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 1002 */

TRUNCATE TABLE `wavelength_ranges`;
INSERT INTO `wavelength_ranges` (`id`, `acronym`, `name`) VALUES
(1, 'radiowave', 'radio frequencies'),
(2, 'microwave', 'microwave frequencies'),
(3, 'submillimeter', 'terahertz frequency'),
(4, 'infrared', 'infrared frequencies'),
(5, 'optical', 'visible light frequencies'),
(6, 'ultraviolet', 'ultraviolet light frequencies'),
(7, 'x-ray', 'x-ray frequencies'),
(8, 'gamma-ray', 'gamma-ray frequencies');

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 1011 */
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-09:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-04:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-03:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+03:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+04:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+05:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+05:45');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+06:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+09:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+10:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+11:30');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+12:45'); 

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 1013 */
ALTER TABLE `observatories`
  DROP `zip_code`,
  DROP `city`;

INSERT INTO  `europlanet_na1`.`antenna_types` (`id` , `antenna_type`)
VALUES (NULL ,  'Other');

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION 1017 */
INSERT INTO  `europlanet_na1`.`research_areas` (`id` , `domain` , `name`) VALUES 
(133 ,  'ASTROPHYSICS',  'ASTROPHYSICS');
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES 
(134, 'PLANETARY ATMOSPHERES & CLIMATE SCIENCE', 'PLANETARY ATMOSPHERES & CLIMATE SCIENCE');
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES 
(135, 'PLANETARY MAGNETOSPHERES & AURORAE', 'PLANETARY MAGNETOSPHERES & AURORAE');
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES 
(136, 'PLANETARY SURFACES', 'PLANETARY SURFACES');
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES 
(137, 'EXOPLANETARY RESEARCH', 'EXOPLANETARY RESEARCH');
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES 
(138, 'SMALL SOLAR SYSTEM BODIES', 'SMALL SOLAR SYSTEM BODIES');
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES 
(139, 'INTERSTELLAR MEDIUM', 'INTERSTELLAR MEDIUM');
UPDATE  `europlanet_na1`.`research_areas` SET  `domain` =  'CELESTIAL MECHANICS & ASTROMETRY',
`name` =  'CELESTIAL MECHANICS & ASTROMETRY' WHERE  `research_areas`.`id` =95;
INSERT INTO `europlanet_na1`.`research_areas` (`id`, `domain`, `name`) VALUES 
(140, 'SKY SURVEY & SEARCHES', 'SKY SURVEY & SEARCHES');

/** Temporary Change of names to identify the areas which will remain in the database */
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_GENERAL ASTRONOMY' WHERE  `research_areas`.`id` =131;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_ASTROBIOLOGY' WHERE  `research_areas`.`id` =18;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_ASTROCHEMISTRY' WHERE  `research_areas`.`id` =19;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_ASTROPHYSICS' WHERE  `research_areas`.`id` =133;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_PLANETARY SCIENCES' WHERE  `research_areas`.`id` =71;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_PLANETARY ATMOSPHERES & CLIMATE SCIENCE' WHERE  `research_areas`.`id` =134;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_PLANETARY MAGNETOSPHERES & AURORAE' WHERE  `research_areas`.`id` =135;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_PLANETARY SURFACES' WHERE  `research_areas`.`id` =136;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_EXOPLANETARY RESEARCH' WHERE  `research_areas`.`id` =137;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_SMALL SOLAR SYSTEM BODIES' WHERE  `research_areas`.`id` =138;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_GEODESY' WHERE  `research_areas`.`id` =12;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_Solar Physics' WHERE  `research_areas`.`id` =11;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_SPACE PHYSICS' WHERE  `research_areas`.`id` =125;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_STELLAR PHYSICS' WHERE  `research_areas`.`id` =9;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_INTERSTELLAR MEDIUM' WHERE  `research_areas`.`id` =139;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_CELESTIAL MECHANICS & ASTROMETRY' WHERE  `research_areas`.`id` =95;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_Stellar Occultations' WHERE  `research_areas`.`id` =14;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_SKY SURVEY & SEARCHES' WHERE  `research_areas`.`id` =140;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_INSTRUMENTATION' WHERE  `research_areas`.`id` =67;
UPDATE  `europlanet_na1`.`research_areas` SET  `name` =  '1-NEW_PUBLIC OUTREACH / EDUCATION ETC.' WHERE  `research_areas`.`id` =15;

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION XXXX */
/** SELECT * FROM `europlanet_na1`.`targets` WHERE id IN 
(183,195,158,152,159,185,160,161,186,162,163,174,187,153,188,155,164,194,196,165,166,189,156,175,167,
168,169,157,176,170,177,197,178,171,198,190,191,154,192,137);
SELECT * FROM `europlanet_na1`.`observatory_to_targets` WHERE `target_id` IN 
(183,195,158,152,159,185,160,161,186,162,163,174,187,153,188,155,164,194,196,165,166,189,156,175,167,
168,169,157,176,170,177,197,178,171,198,190,191,154,192,137);
SELECT * FROM `europlanet_na1`.`space_mission_to_targets` WHERE `target_id` IN 
(183,195,158,152,159,185,160,161,186,162,163,174,187,153,188,155,164,194,196,165,166,189,156,175,167,
168,169,157,176,170,177,197,178,171,198,190,191,154,192,137); */
/** rename 1998 WW31 to TNOs (observatory 55) */
UPDATE  `europlanet_na1`.`observatory_to_targets` SET  `target_id` =  '36' WHERE  
`observatory_to_targets`.`observatory_id` =55 AND `observatory_to_targets`.`target_id` =169 LIMIT 1 ;
/** obsolete small bodies => not used (40) */
DELETE FROM `europlanet_na1`.`targets` WHERE id IN 
(183,195,158,152,159,185,160,161,186,162,163,174,187,153,188,155,164,194,196,165,166,189,156,175,167,
168,169,157,176,170,177,197,178,171,198,190,191,154,192,137);
INSERT INTO `europlanet_na1`.`targets` (`id`, `target_family`, `target_name`) VALUES (218, 'ALL', 'ALL');
UPDATE  `europlanet_na1`.`targets` SET  `target_family` = 'PLANETARY SATELLITES', 
`target_name` =  'PLANETARY SATELLITES' WHERE  `targets`.`id` =48 LIMIT 1;
UPDATE  `europlanet_na1`.`targets` SET  `target_family` =  'SMALL BODIES/Minor Planets', 
`target_name` =  'MINOR PLANETS' WHERE  `targets`.`id` =146 LIMIT 1 ;

/** Temporary Change of names to identify the targets which will remain in the database */
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_ALL' WHERE  `targets`.`id` =218 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Mercury' WHERE  `targets`.`id` =53 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Venus' WHERE  `targets`.`id` =1 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Earth' WHERE  `targets`.`id` =2 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Mars' WHERE  `targets`.`id` =3 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Jupiter' WHERE  `targets`.`id` =4 LIMIT 1;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Saturn' WHERE  `targets`.`id` =5 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Uranus' WHERE  `targets`.`id` =6 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Neptune' WHERE  `targets`.`id` =7 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Moon' WHERE  `targets`.`id` =9 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_SUN' WHERE  `targets`.`id` =45 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_PLANETARY SATELLITES' WHERE  `targets`.`id` =48 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_COMETS' WHERE  `targets`.`id` =31 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_ASTEROIDS' WHERE  `targets`.`id` =33 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_Meteors' WHERE  `targets`.`id` =34 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_TNOs (Trans-Neptunian Objects)' WHERE  `targets`.`id` =36 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_MINOR PLANETS' WHERE  `targets`.`id` =146 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1-NEW_EXOPLANETS' WHERE  `targets`.`id` =47 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1_NEW-ARTIFICIAL SATELLITES' WHERE  `targets`.`id` =54 LIMIT 1 ;
UPDATE  `europlanet_na1`.`targets` SET  `target_name` =  '1_NEW-INTERPLANETARY MEDIUM' WHERE  `targets`.`id` =79 LIMIT 1 ;


/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION XXXX */


/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION XXXX */


/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION XXXX */

/** -------------------------------------------------------------------------------------------- */
/** ALTER SCRIPTS FOR REVISION XXXX */



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;