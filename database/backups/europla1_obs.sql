-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 26. Nov 2012 um 13:18
-- Server Version: 5.1.58
-- PHP-Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `europla1_obs`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `areasofresearch`
--

CREATE TABLE IF NOT EXISTS `areasofresearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyresearch` text,
  `extraresearch` text,
  `comments` text,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10204 ;

--
-- Daten für Tabelle `areasofresearch`
--

INSERT INTO `areasofresearch` (`id`, `keyresearch`, `extraresearch`, `comments`, `oid`) VALUES
(3, NULL, '<br>Supernovae/Novae<br>Galaxies<br>Large Scale Structures<br>Cosmology<br>Public Outreach / Education etc', NULL, 3),
(9, '<br>Key Area 2 <br>Key Area 3 ', '<br>Supernovae/Novae<br>Galaxies<br>Stellar Physics<br>Public Outreach / Education etc', NULL, 9),
(14, '<br>Key Area 3 ', '<br>Galaxies<br>Cosmology<br>Public Outreach / Education etc', NULL, 14),
(15, 'Key Area 1 ', NULL, NULL, 15),
(23, 'Key Area 1 <br>Key Area 2 <br>Key Area 3 ', '<br>Galaxies<br>Large Scale Structures<br>Stellar Occultations<br>Public Outreach / Education etc', NULL, 23),
(26, NULL, '<br>Supernovae/Novae<br>Galaxies<br>Cosmology', NULL, 26),
(36, '<br>Key Area 2 ', '<br>Supernovae/Novae<br>Public Outreach / Education etc', NULL, 36),
(37, NULL, NULL, NULL, 37),
(46, '<br>Key Area 2 ', NULL, NULL, 46),
(47, '<br>Key Area 2 ', '<br>Public Outreach / Education etc', NULL, 47),
(48, NULL, '<br>No research, just visual observing', NULL, 48),
(52, 'Key Area 1 <br>Key Area 3 ', '<br>Supernovae/Novae<br>Galaxies<br>Exoplanets<br>Stellar Physics<br>Solar Physics<br>Cosmology<br>Black Holes<br>Astrobiology<br>Neutron Stars / Pulsars etc<br>Gravitational lensing', NULL, 52),
(58, '<br>Key Area 2 ', '<br>Supernovae/Novae<br>Galaxies<br>Exoplanets<br>Stellar Occultations<br>Public Outreach / Education etc<br><br>Comments:<br>Focused mainly on the light curve and brightness measurements of the exoplanets, asteroids, supernovae, GRB''s and other similar type o stellar phenomena.', 'Focused mainly on the light curve and brightness measurements of the exoplanets, asteroids, supernovae, GRB''s and other similar type o stellar phenomena.', 58),
(64, 'Key Area 1 <br>Key Area 3 ', '<br>Public Outreach / Education etc', NULL, 64),
(66, '<br>Key Area 2 ', '<br>Exoplanets<br>Solar Physics<br>Stellar Occultations<br>Public Outreach / Education etc', NULL, 66),
(67, '<br>Key Area 2 ', '<br>Public Outreach / Education etc', NULL, 67),
(82, NULL, '<br>Public Outreach / Education etc', NULL, 82),
(89, '<br>Key Area 2 ', '<br>Supernovae/Novae<br>photometry of comet', NULL, 89),
(94, 'Key Area 1 <br>Key Area 2 <br>Key Area 3 ', 'Atmospheric Physics<br>Solar Physics<br>Cosmology<br>Magnetospheric Physics<br>Cosmic ray', NULL, 94),
(98, NULL, NULL, NULL, 98),
(100, NULL, NULL, NULL, 100),
(109, '<br>Key Area 2 ', '<br>Exoplanets', NULL, 109),
(110, '<br>Key Area 2 ', NULL, NULL, 110),
(113, 'Key Area 1 ', '<br>Supernovae/Novae<br>Galaxies<br>Interstellar Medium<br>Exoplanets<br>Stellar Physics<br>Large Scale Structures<br>Geodesy<br>Cosmology<br>Black Holes<br>Astrochemistry<br>Neutron Stars / Pulsars etc<br>Inpterplanetary Medium<br>Magnetospheric Physics', NULL, 113),
(115, '<br>Key Area 2 ', '<br>Supernovae/Novae<br>Galaxies<br>Interstellar Medium<br>Exoplanets<br>Stellar Physics<br>Cosmology<br>Public Outreach / Education etc<br>Astrobiology<br>Astrochemistry<br>Inpterplanetary Medium<br>Magnetospheric Physics<br><br>Comments:<br>Research areas apply to the carrier, the instrument has no research limits.', 'Research areas apply to the carrier, the instrument has no research limits.', 115),
(116, '<br>Key Area 2 ', '<br>Exoplanets', NULL, 116),
(118, NULL, '<br>Public Outreach / Education etc', NULL, 118),
(120, '<br>Key Area 2 ', '<br>Supernovae/Novae<br>Galaxies<br>Interstellar Medium<br>Exoplanets<br>Stellar Physics<br>Large Scale Structures<br>Cosmology<br>Stellar Occultations<br>Public Outreach / Education etc<br>Black Holes<br>Neutron Stars / Pulsars etc<br>Orbital Mechanics', NULL, 120),
(121, NULL, NULL, NULL, 121),
(10108, '', 'Galaxies', '', 10002),
(10109, '', '', '', 10003),
(10099, '', '', '', 10004),
(10105, '', '', '', 10005),
(10107, '', '', '', 10007),
(10013, '', '', '', 10009),
(10102, '', '', '', 10010),
(10103, '', '', '', 10014),
(10106, '', '', '', 10018),
(10104, '', '', '', 10022),
(10101, '', '', '', 10030),
(10040, '', '', '', 10036),
(10100, '', 'Stellar Physics', '', 10047),
(10062, '', '', '', 10057),
(10066, '', '', '', 10061),
(10111, '', 'Galaxies,Cosmology', '', 10066),
(10117, '', 'Cosmology,Astrobiology', '', 10070),
(10202, '', '', '', 10078),
(10146, '', '', '', 10090),
(10150, '', '', '', 10094),
(10157, '', '', '', 10101),
(10161, '', '', '', 10105),
(10181, '', '', '', 10125),
(10186, '', 'Stellar Physics', 'Main research areas are on-stationary processes and magnetism in stars and stellar systems, connected with powerful energy releases, and evolution of chemical abundances in cosmic bodies.', 10130),
(10190, '', '', '', 10134),
(10191, '', 'Galaxies,Cosmology', '', 10135);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FurthurContact` text,
  `contactdata` int(11) DEFAULT NULL,
  `emailaddress` int(11) DEFAULT NULL,
  `phonenumber` int(11) DEFAULT NULL,
  `postalcode` int(11) DEFAULT NULL,
  `url` int(11) DEFAULT NULL,
  `sc` int(11) DEFAULT NULL,
  `gc` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10204 ;

--
-- Daten für Tabelle `contact`
--

INSERT INTO `contact` (`id`, `FurthurContact`, `contactdata`, `emailaddress`, `phonenumber`, `postalcode`, `url`, `sc`, `gc`, `oid`) VALUES
(3, NULL, 0, 0, 1, 1, 0, 0, 1, 3),
(9, NULL, 0, 0, 1, 0, 0, 0, 0, 9),
(14, NULL, 0, 0, 0, 0, 0, 0, 0, 14),
(15, NULL, 0, 0, 0, 0, 0, 0, 0, 15),
(23, NULL, 0, 0, 1, 1, 0, 0, 0, 23),
(26, NULL, 1, 0, 1, 0, 0, 0, 1, 26),
(36, NULL, 0, 0, 0, 0, 0, 0, 0, 36),
(37, NULL, 0, 0, 0, 0, 0, 0, 0, 37),
(46, NULL, 0, 0, 1, 0, 0, 0, 0, 46),
(47, NULL, 0, 0, 0, 0, 0, 0, 0, 47),
(48, NULL, 0, 1, 1, 0, 0, 0, 0, 48),
(52, NULL, 0, 0, 0, 0, 0, 0, 0, 52),
(58, NULL, 0, 0, 0, 0, 0, 0, 0, 58),
(64, NULL, 0, 0, 0, 0, 0, 0, 0, 64),
(66, NULL, 0, 0, 0, 0, 0, 0, 0, 66),
(67, NULL, 0, 0, 0, 0, 0, 0, 0, 67),
(82, NULL, 0, 0, 0, 0, 0, 0, 0, 82),
(89, NULL, 0, 0, 1, 1, 0, 0, 1, 89),
(94, NULL, 0, 0, 0, 0, 0, 0, 0, 94),
(98, NULL, 0, 0, 0, 0, 0, 0, 0, 98),
(100, NULL, 0, 0, 0, 0, 0, 0, 0, 100),
(109, NULL, 0, 0, 1, 0, 0, 0, 0, 109),
(110, NULL, 1, 0, 1, 1, 1, 0, 1, 110),
(113, NULL, 1, 0, 1, 0, 0, 1, 0, 113),
(115, NULL, 0, 0, 0, 0, 0, 1, 0, 115),
(116, NULL, 0, 0, 0, 0, 0, 0, 0, 116),
(118, 'administrativee contact:  stalder-joe@bluewin.ch', 0, 0, 0, 0, 0, 1, 0, 118),
(120, 'Zeki EKER  TUB?TAK National Observatory  Akdeniz University Campus  07058  Antalya-TURKEY', 0, 0, 0, 0, 0, 0, 0, 120),
(121, NULL, 0, 0, 0, 0, 0, 0, 0, 121),
(10108, '', 0, 0, 0, 0, 0, 0, 0, 10002),
(10109, '', 0, 0, 0, 0, 0, 0, 0, 10003),
(10099, '', 0, 0, 0, 0, 0, 0, 0, 10004),
(10105, '', 0, 0, 0, 0, 0, 0, 0, 10005),
(10107, '', 0, 0, 0, 0, 0, 0, 0, 10007),
(10013, '', 0, 0, 0, 0, 0, 0, 0, 10009),
(10102, '', 0, 0, 0, 0, 0, 0, 0, 10010),
(10103, '', 0, 0, 0, 0, 0, 0, 0, 10014),
(10106, '', 0, 0, 0, 0, 0, 0, 0, 10018),
(10104, '', 0, 0, 0, 0, 0, 0, 0, 10022),
(10101, '', 0, 0, 0, 0, 0, 0, 0, 10030),
(10040, '', 0, 0, 0, 0, 0, 0, 0, 10036),
(10100, '', 0, 0, 0, 0, 0, 0, 0, 10047),
(10062, '', 0, 0, 0, 0, 0, 0, 0, 10057),
(10066, '', 0, 0, 0, 0, 0, 0, 0, 10061),
(10111, '', 0, 0, 0, 0, 0, 0, 0, 10066),
(10117, 'Professor: Valtaoja, Esko Tel: +358 (0)2 333 8235 Email: esko.valtaoja@utu.fi', 0, 0, 0, 0, 0, 0, 0, 10070),
(10202, '', 0, 0, 0, 0, 0, 0, 0, 10078),
(10146, '', 0, 0, 0, 0, 0, 0, 0, 10090),
(10150, '', 0, 0, 0, 0, 0, 0, 0, 10094),
(10157, '', 0, 0, 0, 0, 0, 0, 0, 10101),
(10161, '', 0, 0, 0, 0, 0, 0, 0, 10105),
(10181, '', 0, 0, 0, 0, 0, 0, 0, 10125),
(10186, '', 0, 0, 0, 0, 0, 0, 0, 10130),
(10190, '', 0, 0, 0, 0, 0, 0, 0, 10134),
(10191, '', 0, 0, 0, 0, 0, 0, 0, 10135);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `extrainstruments`
--

CREATE TABLE IF NOT EXISTS `extrainstruments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `furthurcommentsins` text,
  `additionalcommentsins` text,
  `arraydesc` text,
  `backenddesc` text,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10204 ;

--
-- Daten für Tabelle `extrainstruments`
--

INSERT INTO `extrainstruments` (`id`, `furthurcommentsins`, `additionalcommentsins`, `arraydesc`, `backenddesc`, `oid`) VALUES
(3, 'Instrument 1 is a Hyperstar III on a Celestron GPS C11 with a Starlight Xpress M25C 6 megapixel one-shot colour camera', '', 'Refractor array comprising 4 x Sky 90 refractors each with a 10 Megapixel one shot colour CCD - FOV is 6 x 4 degrees with a sampling of 3 arcseconds per pixel', 'Brand/Type of Camera: SXVF M25C and M26C<br>Maximum Frame per Second: 1<br>Framesize: APS size chip<br>Max. Exposure Time: 1 hour<br>Min. Exposure Time: 10 seconds<br>Color / BW Chip: Colour<br>CCD Chip Type: One shot colour cooled', 3),
(9, '0.3m cass: vintage 1960 fecker. No automation.    Both refractors on GOTO mounts with autocorrection capability from ST-10 camera ', '', '', 'Brand/Type of Camera: SBIG ST-10XME<br>Maximum Frame per Second: 1<br>Framesize: 2184 x 1472 pixels  6.8X6.8um<br>Max. Exposure Time: 30 min<br>Min. Exposure Time: .125 sec<br>Color / BW Chip: BW<br>CCD Chip Type: KAF-3200ME<br><br>Description of Back-End Equipment:<br>low-light level NTSC B/W video also available. presently used in asteroid occultation work. 30fps    RGB, Ha, Hb, S II , O III and Johnson V filters available for imaging use', 9),
(14, '', 'Allsky camera; wide field telescopes.', '', 'Brand/Type of Camera: SBIG 6303E<br>Framesize: 18.5mm x 27.7mm chip image area<br>Max. Exposure Time: unlimited<br>Min. Exposure Time: 0.11sec<br>Color / BW Chip: bw<br>CCD Chip Type: kodak KAF-6303E Class 1<br><br>Description of Back-End Equipment:<br>L, R, G, B, IR pass, Ha, O[III] and SII filters.  Tilt/tip refractive tertiary adaptive optic (SBIG AO-L)', 14),
(15, 'Meade LX-200GPS (300mm)', '', '', 'Brand/Type of Camera: To be added', 15),
(23, '', '', '', 'Brand/Type of Camera: Canon<br>Maximum Frame per Second: 3<br>Framesize: aps-c<br>Max. Exposure Time: bulb<br>Min. Exposure Time: 767011<br>Color / BW Chip: color', 23),
(26, '', '', '', 'Brand/Type of Camera: SBIG St-10XME<br>Maximum Frame per Second: n/a<br>Framesize: 2184 x 1472<br>Max. Exposure Time: ~<br>Min. Exposure Time: 0.01<br>Color / BW Chip: BW<br>CCD Chip Type: Kodak<br><br>Description of Back-End Equipment:<br>rgb filters  hydrogen-alpha filter', 26),
(36, '', '', '', '', 36),
(37, '', '', '', '', 37),
(46, '', '', '', 'Brand/Type of Camera: SBIG ST-8XME<br>Maximum Frame per Second: .2<br>Max. Exposure Time: 15 min<br>Min. Exposure Time: .12 sec<br>Color / BW Chip: mono<br>CCD Chip Type: Kodak<br><br>Description of Back-End Equipment:<br>ST-8 AO', 46),
(47, '', '', '', 'Brand/Type of Camera: Artemis 285<br>Color / BW Chip: BW<br>CCD Chip Type: Sony', 47),
(48, 'Instrument1 and instrument 3 have no drives, Instrument 2 has sidereal drive', '', '', 'Brand/Type of Camera: no cameras currently<br><br>Description of Back-End Equipment:<br>none', 48),
(52, '', '', '', 'Brand/Type of Camera: Philips ToUCam Pro (long exposure modified)<br>Maximum Frame per Second: 5<br>Framesize: 640x480<br>Max. Exposure Time: Unlimited<br>Min. Exposure Time: 1/10,000s<br>Color / BW Chip: Color', 52),
(58, '', '', '', 'Brand/Type of Camera: SBIG ST-8XME<br>Maximum Frame per Second: 2<br>Framesize: 1530 x 1020<br>Max. Exposure Time: 3600<br>Min. Exposure Time: 0.12<br>Color / BW Chip: BW<br>CCD Chip Type: Kodak KAF-1603ME<br><br>Description of Back-End Equipment:<br>Johnson UBVRI photometric filters, color filters, Optec NextGen 0.5 Focal Reducer, SBIG AO-7 Adaptive Optics Accessory, Baader OIII filter, Baader UV/IR Cut filter, Baader U-Filter &quot;Venusfilter&quot; (Photo-only), Baader UHC-S Nebula filter, Baader Solar Continuum filter, Celestron Polarizer filter, Neodymium Moon &amp; Skyglow filter', 58),
(64, '', '', '', 'Brand/Type of Camera: Videocamera<br>Maximum Frame per Second: 30<br>Framesize: 640x480 / 1024x768<br>Max. Exposure Time: 30s<br>Min. Exposure Time: 1/10000s<br>Color / BW Chip: BW<br>CCD Chip Type: ICX098BL<br><br>Description of Back-End Equipment:<br>H-Alpha Coronado SM90  Calzium K-Line 2nm FWHM  Methane-Filter 7nm/50nm FWHM  Near-UV-Filter 350nm  Nera-IR Filter &gt;685nm/&gt;1000nm  Spectroscopic grating 200L/mm  ', 64),
(66, 'Two lens Spectrograph of ......  R: 6884  Spectral resolution: 1.0 Angstrom  Bandwith: 3958 - 7894 Angstrom  Minimum Doppler shift: 35 Km/sec', 'APO refractor ES 80 f/6      Coronado 90 mm. H-alpha filter 0.7 A    Array set of filters: Photometric, Imaging, Methane, etc.', '', 'Brand/Type of Camera: SBIG / ST8XE with AO<br>Maximum Frame per Second: 100 f/sec. under WinScan control<br>Framesize: variable<br>Max. Exposure Time: 60 minutes<br>Min. Exposure Time: 0.001 sec. under WinScancontrol<br>Color / BW Chip: BW<br>CCD Chip Type: Full Frame<br><br>Description of Back-End Equipment:<br>SBIG CCD camera ST-8300M  IS CCD camera DMK21AF04   IS CCD camera DMK41AF02', 66),
(67, '', '', '', 'Brand/Type of Camera: Starligt Xpress MX916<br><br>Description of Back-End Equipment:<br>LRGB, Ha, O3 and S2 filters', 67),
(82, '', '', '', 'Brand/Type of Camera: ST 10', 82),
(89, 'The instruments 1 and 2 are established on one equatorial automated mount. ', '', '', 'Brand/Type of Camera: QHY-6<br>Maximum Frame per Second: 1<br>Framesize: 8''x11''<br>Max. Exposure Time: 20min<br>Min. Exposure Time: 0.001sec<br>Color / BW Chip: BW<br>CCD Chip Type: Sony ICX259AL', 89),
(94, '', '', '', '', 94),
(98, '', '', '', '', 98),
(100, '', '', '', '', 100),
(109, 'ASA 0.73 reducer/correctors', '', '', 'Brand/Type of Camera: SBIG ST-8300<br>Max. Exposure Time: 3600 seconds<br>Min. Exposure Time: 0.1<br>Color / BW Chip: BW Chip<br>CCD Chip Type: Kodak KAF-8300<br><br>Description of Back-End Equipment:<br>MX-716', 109),
(110, 'Meade LX200R 12&quot;  Pentax 75 SDHF ', '', '', 'Brand/Type of Camera: StarlightXPress MX7C<br>Maximum Frame per Second: N.A.<br>Framesize: 752 x 582 pixel<br>Max. Exposure Time: Unlimited<br>Min. Exposure Time: 0,001 sec.<br>Color / BW Chip: Color<br>CCD Chip Type: Sony ICX249AK<br><br>Description of Back-End Equipment:<br>Guide camera: StarlightXPress MX5C', 110),
(113, '', '', '14 radio telescopes of 25m diameter located in an East-West direction. Ten of the telescopes (labeled 0 to 9) are on fixed mountings, 144 metres apart; the four (2 x 2) remaining dishes (labeled A, B, C, D) are movable along two railtracks. One, 300 m long, is adjacent to the fixed array and another, 180 m long, is 9 x 144 m eastwards. The movable dishes can be used at any position of the rail tracks. The maximum baseline is 2.7km', '<br><br>Description of Back-End Equipment:<br>1. An 8x20 MHz, quarter-million complex spectral channel IVC/DZB backend system.  2. The WSRT Pulsar Machine (PuMa) is a fully digital and highly flexible pulsar backend.  ', 113),
(115, 'Alt-Az mount', '', '', 'Brand/Type of Camera: SBIG STL-1001E<br>Maximum Frame per Second: 0.2<br>Framesize: 1024x1024<br>Max. Exposure Time: 32767<br>Min. Exposure Time: 0.12<br>Color / BW Chip: BW<br>CCD Chip Type: KAF-1001E', 115),
(116, '', '', '', 'Brand/Type of Camera: ST8<br>Framesize: 15x10mm', 116),
(118, 'Instrument 3: PST Solar telescope', 'Heliostat for sun ligth projection', '', '', 118),
(120, '', '', '', 'Brand/Type of Camera: Spectral Instruments / Imaging<br>Maximum Frame per Second: -<br>Framesize: 4096x4096<br>Max. Exposure Time: -<br>Min. Exposure Time: 1 sec<br>Color / BW Chip: BW Chip<br>CCD Chip Type: Fairchild 486 BI<br><br>Description of Back-End Equipment:<br>TFOSC (Faint Object Spektrograph and Camera), Andor DW436 CCD (Photometric Imaging), Finger Lakes Instruments CCD (Photometric Imaging), Coude spectrometer with Andor DW436 CCD.', 120),
(121, '', '', '', 'Brand/Type of Camera: cannon rebel', 121),
(10108, 'Telescope 1 has OMR Cassegrain Spectrograph, The WET standard 3-channel high speed photometer, CCD camera.', 'Another EOS 1m Telescope, with focal length f/8.', '', '', 10002),
(10109, '', '40m Radio Telescope', '', '', 10003),
(10099, '', '', '', '', 10004),
(10105, '', '', '', '', 10005),
(10107, 'It has a Ritchey-Chretien Reflector, several CCD direct imaging cameras, Faint Object Spectrograph and Camera (FOSC) and Large Area Imager.', '', '', '', 10007),
(10013, 'High Resolution Echelle Spectrograph, Imaging Camera with a 3-element Wynne Corrector.', '', '', '', 10009),
(10102, 'Both telescopes consist 1000 of dipoles arranged in a T shape. Radioheliograph, High Resolution Radio Spectrograph, Polarization Interferometer', '', '', '', 10010),
(10103, '', '', '', '', 10014),
(10106, '', '', '', '', 10018),
(10104, 'LN2 cooled CCD camera, Spectrometer, colour CCd video', '', '', '', 10022),
(10101, '', '', '', '', 10030),
(10040, '', 'Also 1.2m and 1.3m Optical telescopes', 'Veritas Array-Gamma GeV to TeV array of 12m Telescopes. Highest sensitivity in 50 GeV to 50 TeV range.', 'MMT: Spectrograph Spectrograph 3200-8000 A ; ARIES Imager ; CLIO Imager ; Hectochelle Spectrograph ; Hectospec Spectrograph ; Megacam Imager 18k x 18k ; MIRAC3 Imager Near Infrared ; PISCES Imager ; SPOL Imager/Spectropolarimeter 4000-9000 ? ; SWIRC Camera 2048 x 2048 ; MAESTRO Camera 3185-9850 A ;', 10036),
(10100, 'Available detectors: CCD camera Andor Newton DU-970N, ?CCD camera HPC-1, ?CCD camera ST-6, ?CCD camera ORBIS.', '', '', '', 10047),
(10062, '', '', 'Y shaped 27 x 25 m Radio Telescopes. Sensitivity of a Dish 130 m Across', '', 10057),
(10066, '', '', '', '', 10061),
(10111, 'Alt/Az Mount. Millimetre/Submillimetre range', '', '', '', 10066),
(10117, '', '', '', '', 10070),
(10202, '', '', '', 'ISIS?- single-slit spectroscopy ACAM? AF2/WYFFOS?- multi-object fibre-fed spectroscopy NAOMI/OASIS?- integral-field spectroscopy NAOMI/INGRID?- IR imaging LIRIS?- IR spectroscopy prime-focus?- optical imaging ACAM?- optical imaging, low-resolution spectroscopy', 10078),
(10146, '', '', '', 'ISIS?- single-slit spectroscopy ; ACAM?; AF2/WYFFOS?- multi-object fibre-fed spectroscopy ; NAOMI/OASIS?- integral-field spectroscopy ; NAOMI/INGRID?- IR imaging ; LIRIS?- IR spectroscopy prime-focus?- optical imaging; ACAM?- optical imaging, low-resolution spectroscopy', 10090),
(10150, '', '', '', '', 10094),
(10157, '', 'Additional 26 and 34 m Telescopes', '', '', 10101),
(10161, '', '', 'Radio Array under construction, completed in 2012. cm wavelength.', '', 10105),
(10181, 'Planned 6.5 m Instrument', '', '', '', 10125),
(10186, '', 'Gamma-telescope GT-48, which has a range of 75 GHz up to 100 GHz a and an area of 54 square meters.', '', '', 10130),
(10190, '', '', 'It has a range between 5 - 300 GHz. It works alongside the Evpatoria RT-70 radio telescope and the Galenki RT-70 radio telescope.', '', 10134),
(10191, '', 'Also, there is a 0.6m optical telescope.', 'It has a range of 610 MHz to 30 GHz', '', 10135);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hiddenfields`
--

CREATE TABLE IF NOT EXISTS `hiddenfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Contact` text,
  `email` text,
  `phone` text,
  `zip` varchar(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sciconname` varchar(100) DEFAULT NULL,
  `sciconcon` varchar(100) DEFAULT NULL,
  `latitude` varchar(12) DEFAULT NULL,
  `longitude` varchar(12) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10204 ;

--
-- Daten für Tabelle `hiddenfields`
--

INSERT INTO `hiddenfields` (`id`, `Contact`, `email`, `phone`, `zip`, `url`, `sciconname`, `sciconcon`, `latitude`, `longitude`, `oid`) VALUES
(3, NULL, 'mobiusltd@aol.com', '+44 (0)1590 622775', 'SO42 7QW', 'http://www.newforestobservatory.com/', 'Professor Greg Parker<br>', 'mobiusltd@aol.com<br>', '50 49 10 N', '1 35 24 W', 3),
(9, NULL, 'pbealo@comcast.net', '1-978-204-9848', NULL, 'www.chachka.net', 'Peter Bealo<br>', 'pbealo@comcast.net<br>', '42 49'' 50&qu', '71 04'' 03&qu', 9),
(14, NULL, 'mark.manner@h3gm.com', '615-351-3172', NULL, 'http://www.spotastro.com', 'Mark Manner<br>', 'mark.manner@h3gm.com<br>', '35°53''04.8&q', '87°33''55.0&q', 14),
(15, NULL, 'admin@thecgo.com', '909-210-0337', NULL, 'http://www.thecgo.com', 'Lou DuBois<br>', 'admin@thecgo.com<br>', 'N34.10 ', 'W117.10 ', 15),
(23, NULL, 'dafuzz_9@yahoo.com', '941-228-5329', NULL, 'http://whistlestopobs.googlepages.com/', 'Chip Frappier<br>', 'dafuzz_9@yahoo.com<br>', '82.54.48W', '27.56.24N', 23),
(26, NULL, 'jonesee@aol.com', NULL, NULL, 'http://www.astrobytes.net', 'Wesley Jones<br>', 'jonesee@aol.com<br>', ' 37°31''1.17&', '122°16''31.73', 26),
(36, NULL, 'observe@astro.umd.edu', '001-301-405-6555', NULL, 'http://www.astro.umd.edu/openhouse/', 'Dr. Eric McKenzie<br>Elizabeth Warner', 'eric@astro.umd.edu<br>warnerem@astro.umd.edu', '39° 00'' 07&q', '76° 57'' 22&q', 36),
(37, NULL, 'helmut@sternwarte-Herrenberg.de', '049 7032 34385', NULL, NULL, NULL, NULL, NULL, 'WSG84 8°49''5', 37),
(46, NULL, 'pete@petersonengineering.com', '401-245-4068', '02806-3727', 'http://www.peterson-web.com/wish', 'Pete Peterson<br>', 'pete@petersonengineering.com<br>', '41° 45'' 41.3', '71° 17'' 57.3', 46),
(47, NULL, 'tweenhills@dmiller.demon.co.uk', NULL, NULL, 'http://www.dmiller.demon.co.uk/astronomy.htm', 'Duncan Miller<br>', 'tweenhills[at]dmiller.demon.co.uk<br>', NULL, NULL, 47),
(48, NULL, 'bobhampton@yancey.main.nc.us', '828-675-4449', NULL, 'http://thunderstruckobservatory.com', NULL, NULL, '35°56''47', '82°12''53', 48),
(52, NULL, 'hwy37@yahoo.com', NULL, NULL, 'http://www.pbase.com/rolfolsen', 'Rolf Olsen<br>', NULL, NULL, NULL, 52),
(58, NULL, 'warkauden.kassiopeia@ursa.fi', NULL, NULL, 'http://english.taurushill.net/', 'Veli-Pekka Hentunen <br>Harri Haukka', 'veli-pekka.hentunen[at]kassiopeia.net<br>harri.haukka[at]kassiopeia.net', '62° 18.896', '28° 23.357', 58),
(64, NULL, 'Ralf@Gerstheimer.de', '0049 5606 53 8 55', 'D-34317', 'http://www.sternwarte-habichtswald.de', 'Ralf@Gerstheimer.de<br>', 'Ralf@Gerstheimer.de<br>', NULL, NULL, 64),
(66, NULL, 'PLEIADES@telefonica.net', '34-922-486346', NULL, 'http://www.astropalma.com', 'Joan Genebriera<br>', 'PLEIADES@telefonica.net<br>', ' 28º  38’ 29', '17g 52m 03.5', 66),
(67, NULL, 'mail@spaceguarduk.com', '44 (0)1547 520247', 'LD7 1LW', 'http://www.spaceguarduk.com', 'J R Tate<br>', 'mail@spaceguarduk.com<br>', '52 19 30 N', '03 01 08 W ', 67),
(82, NULL, 'mail@sternwarte-radebeul.de', NULL, 'D-01445', 'http://www.sternwarte-radebeul.de', 'Ulf Peschel<br>Michael Funke', 'peschel@sternwarte-radebeul.de<br>funke@sternwarte-radebeul.de', '51°06''59'''' N', '13°37''20'''' E', 82),
(89, NULL, 'b42@tut.by', NULL, NULL, 'http://nevski.belastro.net/', 'Vitali Nevski<br>', 'nevski@tut.by<br>', '30°19''39&quo', '55°03''40&quo', 89),
(94, NULL, 'info@zvjezdarnica.hr', '00385 1 4851355', NULL, 'http://www.zvjezdarnica.hr/', 'Dragan Roša<br>dmaricic@zvjezdarnica.hr', 'drosa@zvjezdarnica.hr<br>dhrzina@zvjezdarnica.hr', '15°58''29.7&q', '45°49''08.2&q', 94),
(98, NULL, 'manuel.scherf@oeaw.ac.at', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98),
(100, NULL, 'a@a.at', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100),
(109, NULL, 'filipfratev@yahoo.com', NULL, NULL, 'http://a79.starrydreams.com/', 'FilipFratev<br>', 'filipfratev@yahoo.com<br>', '23°50''36&quo', '42°03''49  N', 109),
(110, NULL, 'specolasantamama@interfree.it', NULL, 'I-52010', 'http:specolasantamama.interfree.it', 'TREVISAN Stefano<br>', 'specolasantamama@interfree.it<br>', 'N43°37''51&qu', '011°51''27&qu', 110),
(113, NULL, 'sciencesupport@astron.nl', '0030 521 595 100', '7990AA', 'http://www.astron.nl', 'A. Polatidis<br>', 'polatidis[at]astron.nl<br>', '52d54''55.04', '6d37''59.99', 113),
(115, NULL, 'info@astro.uu.se', '+46 18 471 3038', '751 20', 'http://www.astro.uu.se/grundutb/wt/Welcome.html', 'Eric Stempels<br>Ola Karlsson', 'eric.stempels@fysast.uu.se<br>ola.karlsson@fysast.uu.se', '59°50''14.9&q', '17°38''51.8&q', 115),
(116, NULL, 'office@observatorium.at', '0043/7712/7070', 'A-4780 Sch', 'www.observatorium.at', 'Gierlinger Richard<br>', 'office@observatorium.at<br>', '48°47''01 N', '13°28''28 E', 116),
(118, NULL, 'info@planetarium-kreuzlingen.ch', '+41 71 677 38 00', 'CH-8280 ', 'http://www.sternwarte-kreuzlingen.ch', NULL, NULL, ' 47°38''29&qu', ' 09°09''37&qu', 118),
(120, NULL, 'omur.cakirli@tug.tubitak.gov.tr', '+0090 242 2278401', NULL, 'www.tug.tubitak.gov.tr', 'Tansel AK<br>Zeki EKER', 'tanselak@tug.tubitak.gov.tr<br>eker@tug.tubitak.gov.tr', '36 49 28 N', '30 20 09 E', 120),
(121, NULL, 'skywatcher@personainternet.com', '709 884 2336', 'A0G 4M0', NULL, 'James Gillard<br>', NULL, '49 37 02.4', '54 45 28.8', 121),
(10108, '', '', '', '', 'http://www.xinglong-naoc.org/', '', '', '40.39417?N', '117.575?E', 10002),
(10109, '', 'ynaobgs@ynao.ac.cn', '(+86)(0)871 3920919', '650011', 'http://www.ynao.ac.cn/', 'Han Zhanwen', '', '102? 47&#824', '25? 2&#8242', 10003),
(10099, '', '', '', '', 'http://www.trao.re.kr/', '', '', '127? 22&#824', '36? 23&#8242', 10004),
(10105, '', '', '', '442', '', '', '', '137? 22? 16.', '34? 50? 10.?', 10005),
(10107, '', 'noah@wise.tau.ac.il', '972-3-6408729', '39040', 'http://wise-obs.tau.ac.il/general.html', 'Dr. Noah Brosch', '', '34?45''48'''' E', '30?35''45'''' N', 10007),
(10013, '', 'diriia@iiap.res.in', '91 (04174) 203014', '635701', 'http://www.iiap.res.in/centers/vbo', 'Prof. S. S. Hasan', '', '78? 50''E', '12? 34''N', 10009),
(10102, '', 'webmaster@iiap.res.in', '91 8155-291655', '561210', 'http://www.iiap.res.in/centers/radio', '', '', '77.44?E', '13.60? N', 10010),
(10103, '', '', '81-267-98-4300', 'Nagano', 'http://www.nro.nao.ac.jp/~nro45mrt/index-e.html', 'Dr. N. Kuno', '', '138? 28&#824', '35? 56&#8242', 10014),
(10106, '', 'daishido@waseda.jp', '81-3-3203-4141', '169-8050', 'http://www.astro.phys.waseda.ac.jp/index-e.html', 'Professor Tsuneaki Daishido', '', '139? 12'' 48', '35? 23'' 18', 10018),
(10104, '', '', '81-76-434-9098', '930-0155', 'http://www.tsm.toyama.toyama.jp/tao/index-j.htm', 'Dr. Atsushi Nakajima', '', '?', '?', 10022),
(10101, '', 'www@gmrt.ncra.tifr.res.in', '91-2132-252112/3/6/7', '411 007', 'http://www.gmrt.ncra.tifr.res.in', '', '', '9? 5'' 47 E', '74? 2'' 59 N', 10030),
(10040, '', '', '520-621-1558', '85721', 'http://www.mmto.org/', '', '', '110?52''42''''W', '31?40''52''''N', 10036),
(10100, '', '', '372-7410-265', '', 'www.aai.ee', 'L.Leedj?rv', 'leed@aai.ee', '58? 15'' 55''''', '26? 27'' 58''N', 10047),
(10062, '', 'info@nrao.edu', '', '87801-0387', 'http://www.vla.nrao.edu/', '', '', '107?37''6.06''', '34?4''44.28''''', 10057),
(10066, '', '', '', '', 'http://www.physics.sfasu.edu/observatory/obs.htm', '', '', '94?39''38.32''', '31?45''35.59''', 10061),
(10111, '', '', '', '', '', '', '', '139?16''0''''W', '90? S', 10066),
(10117, 'Professor: Valtaoja, Esko Tel: +358 (0)2 333 8235 Email: esko.valtaoja@utu.fi', '', '+358 2 333 8221', 'FI-21500', 'www.astro.utu.fi/', '', '', '60?24&#8242;', '22?26&#8242', 10070),
(10202, '', 'crb@ing.iac.es', '', '', 'http://www.ing.iac.es/Astronomy/astronomy.html', 'Chris Benn', 'crb@ing.iac.es', '28.760361?N?', '17.881408?W?', 10078),
(10146, '', '', '', '', 'http://www.ing.iac.es/Astronomy/astronomy.html', 'Chris Benn', 'crb@ing.iac.es', '17.881408?W', '28.760361?N', 10090),
(10150, '', '', '', '', '', 'Hans Van Winckel', 'hans@ster.kuleuven.be', '17?52''42''''W', '28?45''44'''' N', 10094),
(10157, '', '', '', '', 'http://www.atnf.csiro.au/observers/tidbinbilla/', 'Jimi Green', 'James.Green@atnf.csiro.au', '151?5''49''''E', '33?46''28''''S', 10101),
(10161, '', '', '', '', 'http://www.ska.ac.za/', '', '', '?', '?', 10105),
(10181, '', '', '', '', 'http://www.ioa.s.u-tokyo.ac.jp/TAO/', '', '', '22? 59''12''''S', '22?59''12''''S', 10125),
(10186, '', 'webmaster@crao.crimea.ua', '', '', 'http://quake.stanford.edu/~crao/', '', '', '+44:43:36', '2h?16m?03s', 10130),
(10190, '', '', '', '', 'http://radioastron.ru/?dep=16', '', '', '?', '?', 10134),
(10191, '', 'admsao@sao.ru', '+7(87878) 46436', '369167', 'http://w0.sao.ru/Doc-en/index.html', 'Parijski Yuri Nikolaevich', 'par@sao.ru', '43?38&#8242;', '41?26&#8242;', 10135);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `instruments`
--

CREATE TABLE IF NOT EXISTS `instruments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument` varchar(75) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `diameter` text,
  `focallength` text,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10324 ;

--
-- Daten für Tabelle `instruments`
--

INSERT INTO `instruments` (`id`, `instrument`, `type`, `diameter`, `focallength`, `oid`) VALUES
(2, 'Instrument1: Schmidt-Cassegrain<br>Instrument2: Array', '', '0.28', '0.558', 3),
(8, 'Instrument1: Cassegrain<br>Instrument2: Refracting Telescope<br>Instrument3', '', '0.3<br>0.15<br>0.094', '', 9),
(13, 'Instrument1: Ritchey-Chretien<br>Instrument2: Maksutov<br>Instrument3: Refr', '', '0.406<br>0.250<br>0.155', '', 14),
(14, 'Instrument1: Schmidt-Cassegrain', '', '', '', 15),
(22, 'Instrument1: Schmidt-Cassegrain<br>Instrument2: Maksutov<br>Instrument3: Ne', '', '', '', 23),
(25, 'Instrument1: Ritchey-Chretien<br>Instrument2: Refracting Telescope<br>Instr', '', '.25 m<br>.08 m<br>0.3 m', '', 26),
(35, 'Instrument1: Cassegrain<br>Instrument2: Schmidt-Cassegrain<br>Instrument3: ', '', '.51<br>.36<br>.18', '', 36),
(36, '', '', '', '', 37),
(45, 'Instrument1: Schmidt-Cassegrain', '', '.35', '3.556 reduced to 2.230', 46),
(46, 'Instrument1: Schmidt-Cassegrain<br>Instrument2: Refracting Telescope<br>Ins', '', '.305<br>.08<br>.04', '', 47),
(47, 'Instrument1: Dobson<br>Instrument2: Newton<br>Instrument3: Newton', '', '0.333<br>0.254<br>0.102', '', 48),
(51, 'Instrument1: Newton', '', '0.25m', '1.27m', 52),
(57, 'Instrument1: Schmidt-Cassegrain<br>Instrument2: Schmidt-Cassegrain<br>Instr', '', '', '', 58),
(63, 'Instrument1: Newton<br>Instrument2: Refracting Telescope<br>Instrument3: Re', '', '', '', 64),
(65, 'Instrument1: Cassegrain<br>Instrument2: Refracting Telescope<br>Instrument3', '', '0.4<br>0.12<br>n/a', '', 66),
(66, 'Instrument1: Schmidt-Cassegrain<br>Instrument2: Schmidt-Cassegrain<br>Instr', '', '.356<br>.25<br>.33', '', 67),
(81, 'Instrument1: Maksutov<br>Instrument2: Refracting Telescope', '', '0,35 m<br>0,15 m', '1,6 m<br>2,25 m', 82),
(88, 'Instrument1: Newton<br>Instrument2: Maksutov<br>Instrument3: Binocular Tele', '', '0.3<br>0.15<br>0.11', '', 89),
(93, 'Instrument1: Refracting Telescope<br>Instrument2: Refracting Telescope<br>I', '', '175 mm<br>130 mm<br>200 mm', '1400 mm<br>1950 mm<br>2000 mm', 94),
(97, '', '', '', '', 98),
(99, '', '', '', '', 100),
(108, 'Instrument1: Newton<br>Instrument2: Newton', '', '0.35<br>0.25', '', 109),
(109, 'Instrument1: Ritchey-Chretien<br>Instrument2: Refracting Telescope', '', '', '', 110),
(112, 'Instrument1: Interferometer', '', '', '', 113),
(114, 'Instrument1: Cassegrain', '', '0.90', '', 115),
(115, 'Instrument1: Newton<br>Instrument2: Refracting Telescope', '', '0.7m<br>0.15m', '2.9m<br>2.25m', 116),
(117, 'Instrument1: Cassegrain<br>Instrument2: Refracting Telescope<br>Instrument3', '', '0.48<br>0.125<br>0.06', '5 m<br>1.3 m<br>0.5', 118),
(119, 'Instrument1: Cassegrain<br>Instrument2: Ritchey-Chretien<br>Instrument3: Ri', '', '', '', 120),
(120, 'Instrument1: Schmidt-Cassegrain', '', '12&quot;LX 200', '3048 mm', 121),
(124, '', '', '', '', 0),
(125, '', '', '', '', 0),
(126, '', '', '', '', 0),
(127, '', '', '', '', 0),
(128, '', '', '', '', 0),
(129, '', '', '', '', 0),
(130, '', '', '', '', 0),
(131, '', '', '', '', 0),
(132, '', '', '', '', 0),
(133, '', '', '', '', 0),
(134, '', '', '', '', 0),
(135, '', '', '', '', 0),
(136, '', '', '', '', 0),
(137, '', '', '', '', 0),
(138, '', '', '', '', 0),
(139, '', '', '', '', 0),
(140, '', '', '', '', 0),
(141, '', '', '', '', 0),
(142, '', '', '', '', 0),
(143, '', '', '', '', 0),
(144, '', '', '', '', 0),
(145, '', '', '', '', 0),
(146, '', '', '', '', 0),
(147, '', '', '', '', 0),
(148, '', '', '', '', 0),
(149, '', '', '', '', 0),
(150, '', '', '', '', 0),
(10180, 'The Large Sky Area Multi-object Fibre Spectroscopic Telescope (LAMOST) - Sc', 'Optical<br>Optical<br>Infrared', '4.00<br>2.16<br>1.26', '<br>3.00', 10002),
(10181, 'Ynao Optical Telescope<br>Lijang Optical Telescope', 'Optical<br>Optical', '1.00<br>2.40', NULL, 10003),
(10165, 'Radio Paraboloid Telescope', 'radio', '13.70', NULL, 10004),
(10173, '', 'Optical<br>Optical<br>Optical', '1.50<br>2.00<br>3.00', NULL, 10005),
(10177, 'Boller and Chivens Telescope', 'Optical', '1.00', '4.00', 10007),
(10025, 'Vainu Bappu Cassegrain Telescope<br>Carl Zeiss Telescope', 'telescope<br>telescope', '2.30<br>1.00', '3.25<br>13.00', 10009),
(10169, 'Gauribidanur Radio Telescope<br>Mauritius Radio Telescope', 'Radio<br>Radio', '99.99<br>99.99', NULL, 10010),
(10171, 'Paraboloid Radio Telescope', 'Radio', '45.00', NULL, 10014),
(10176, 'Radio Telescope', 'Radio', '15.00', NULL, 10018),
(10172, 'Nasmith Reflecting Telescope', 'Optical', '1.00', NULL, 10022),
(10168, 'Giant Metrewave Radio Telescope (GMRT)', 'Radio', '45.00', NULL, 10030),
(10065, 'MMT Observatory<br>Whipple Gamma', 'telescope<br>telescope<br>telesc', '6.50<br>10.00<1.50>', NULL, 10036),
(10166, 'Cassegrain Reflector telescope', 'Optical', '1.50', NULL, 10047),
(10109, '', '', NULL, NULL, 10057),
(10117, '', 'Optical', '1.04', NULL, 10061),
(10159, 'Schmidt-camera', 'Optical', '0.50', NULL, 10043),
(10167, 'Reflecting telescope', 'Optical', '0.60', NULL, 10047),
(10183, 'Alt-Az Optical Telescope', 'Optical', '1.20', NULL, 10003),
(10187, 'SPT', 'Radio', '10.00', '0.70', 10066),
(10195, 'Reflector<br>Solar Radio Telescope<br>Schmidt Telescope', 'Optical<br>Radio<br>Optical', '1.00<br>2.00<br>0.70', NULL, 10070),
(10321, 'William Herschel Telescope (WHT)', 'Optical Reflecting Telescope', '4.20', NULL, 10078),
(10241, 'Optical Telescope', 'Optical', '4.20', NULL, 10090),
(10245, 'The Mercator Telescope', 'Optical Telescope', '1.20', NULL, 10094),
(10252, '', 'radio<br>radio<br>radio', '70.00<br>64.00<br>34.00', NULL, 10101),
(10259, '', '', NULL, NULL, 10105),
(10291, 'miniTao', 'Optical, Infrared', '1.00', NULL, 10125),
(10297, 'Shajn telescope<br>Optical Telescope 1<br>Optical Telescope 2', 'Optical telescope<br>Optical tel', '2.60<br>1.25<br>1.25', NULL, 10130),
(10303, 'Suffa RT-70 radio telescope', 'Radio Telescope', '70.00', NULL, 10134),
(10304, 'RATAN-600<br>BTA-6?optical telescope', 'Radio Telescope<br>Optical Teles', '600.00<br>6.00', NULL, 10135),
(10306, '1?m?Zeiss-1000', 'Optical Telescope', '1.00', NULL, 10135);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `maintable`
--

CREATE TABLE IF NOT EXISTS `maintable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Founded` varchar(4) DEFAULT NULL,
  `Institution` text,
  `URL` varchar(75) DEFAULT NULL,
  `Country` varchar(75) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Sciencecontactname` varchar(60) DEFAULT NULL,
  `Sciencecontactnemail` varchar(60) DEFAULT NULL,
  `latitude` varchar(16) DEFAULT NULL,
  `longitude` varchar(16) DEFAULT NULL,
  `meters` text,
  `precipitation` text,
  `clearnights` text,
  `timezone` text,
  `insnumber` text,
  `partners` text,
  `comments` text,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10204 ;

--
-- Daten für Tabelle `maintable`
--

INSERT INTO `maintable` (`id`, `Name`, `Founded`, `Institution`, `URL`, `Country`, `Address`, `Phone`, `email`, `Sciencecontactname`, `Sciencecontactnemail`, `latitude`, `longitude`, `meters`, `precipitation`, `clearnights`, `timezone`, `insnumber`, `partners`, `comments`, `oid`) VALUES
(3, 'The New Forest Observatory', '2004', 'Professor Greg Parker', 'http://www.newforestobservatory.com/', 'United Kingdom', '52 New Forest Drive', '+44 (0)1590 622775', 'mobiusltd@aol.com', 'Professor Greg Parker<br>', 'mobiusltd@aol.com<br>', '50 49 10 N', '1 35 24 W', '15', '101-200', '51-100', '0', NULL, NULL, NULL, 3),
(9, 'Sweet Hill Observatory', '1995', 'Peter Bealo', 'www.chachka.net', 'United States', '82 Sweet Hill Rd', '1-978-204-9848', 'pbealo@comcast.net', 'Peter Bealo<br>', 'pbealo@comcast.net<br>', '42 49'' 50&quot; ', '71 04'' 03&quot; ', '50', '11-50', '51-100', '-5', NULL, NULL, NULL, 9),
(14, 'Spot Observatory', '2004', 'Mark Manner', 'http://www.spotastro.com', 'United States', '3330 HWY 230 West', '615-351-3172', 'mark.manner@h3gm.com', 'Mark Manner<br>', 'mark.manner@h3gm.com<br>', '35°53''04.8&quot;', '87°33''55.0&quot;', '225', '11-50', '51-100', '-6', '>3', 'Vanderbilt University Dyer Observatory, Nashville, TN', NULL, 14),
(15, 'The Cedar Glen Observatory', '2001', 'Private by appointment', 'http://www.thecgo.com', NULL, 'P.O. Box 537', '909-210-0337', 'admin@thecgo.com', 'Lou DuBois<br>', 'admin@thecgo.com<br>', 'N34.10 ', 'W117.10 ', '1524', '201-500', '251-300', '7', '1', NULL, 'Please come use this Observatory. ', 15),
(23, 'Whistlestop Observatory', '2007', 'Chip Frappier', 'http://whistlestopobs.googlepages.com/', 'United States', '1805 53rd St E', '941-228-5329', 'dafuzz_9@yahoo.com', 'Chip Frappier<br>', 'dafuzz_9@yahoo.com<br>', '82.54.48W', '27.56.24N', '7 m', '201-500', '<50', '-5', '3', NULL, NULL, 23),
(26, 'Twin Pines Observatory', '2002', 'Private', 'http://www.astrobytes.net', 'United States', NULL, NULL, 'jonesee@aol.com', 'Wesley Jones<br>', 'jonesee@aol.com<br>', ' 37°31''1.17&quot', '122°16''31.73&quo', '13', '11-50', '151-200', '-8', '2', NULL, NULL, 26),
(36, 'Univerity of Maryland Observatory', '1964', 'University of Maryland', 'http://www.astro.umd.edu/openhouse/', 'United States', 'Department of Astronomy, UM', '001-301-405-6555', 'observe@astro.umd.edu', 'Dr. Eric McKenzie<br>Elizabeth Warner', 'eric@astro.umd.edu<br>warnerem@astro.umd.edu', '39° 00'' 07&quot;', '76° 57'' 22&quot;', '53 m', NULL, NULL, '-5', NULL, NULL, NULL, 36),
(37, 'Sternwarte-Herrenberg', '1995', 'private', NULL, 'Germany', 'Michels Helmut', '049 7032 34385', 'helmut@sternwarte-Herrenberg.de', NULL, NULL, NULL, 'WSG84 8°49''59,3&', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37),
(46, 'Wishing Star Observatory', '2006', 'Private observatory - MPC designation I15', 'http://www.peterson-web.com/wish', 'United States', '405 New Meadow Road', '401-245-4068', 'pete@petersonengineering.com', 'Pete Peterson<br>', 'pete@petersonengineering.com<br>', '41° 45'' 41.3&quo', '71° 17'' 57.3&quo', '3', '11-50', '51-100', '-5', '1', NULL, NULL, 46),
(47, 'Tweenhills Observatory (J68)', '2004', 'Private', 'http://www.dmiller.demon.co.uk/astronomy.htm', 'United Kingdom', NULL, NULL, 'tweenhills@dmiller.demon.co.uk', 'Duncan Miller<br>', 'tweenhills[at]dmiller.demon.co.uk<br>', NULL, NULL, '44', '>500', '<50', '0', '3', NULL, NULL, 47),
(48, 'Thunderstruck Observatory', '2004', 'Bob Hampton private person', 'http://thunderstruckobservatory.com', 'United States', '225 Thunder Road', '828-675-4449', 'bobhampton@yancey.main.nc.us', NULL, NULL, '35°56''47', '82°12''53', '1000 m', NULL, '151-200', '-4', '3', NULL, NULL, 48),
(52, 'Titirangi Observatory', '2004', 'Private', 'http://www.pbase.com/rolfolsen', 'New Zealand', NULL, NULL, 'hwy37@yahoo.com', 'Rolf Olsen<br>', NULL, NULL, NULL, '200m', NULL, NULL, NULL, '1', NULL, 'I''d be happy to image planets, stars, galaxies or any other astronomical objects as requested, anytime (weather permitting)  Please see my astrophoto galleries at http://www.pbase.com/rolfolsen for examples of my work.', 52),
(58, 'Taurus Hill Observatory', '2003', 'Astronomical Association Warkauden Kassiopeia', 'http://english.taurushill.net/', 'Finland', 'Härkämäentie 88', '-142409', 'warkauden.kassiopeia@ursa.fi', 'Veli-Pekka Hentunen <br>Harri Haukka', 'veli-pekka.hentunen[at]kassiopeia.net<br>harri.haukka[at]kas', '62° 18.896', '28° 23.357', '150', '201-500', '51-100', '2', '3', 'Tuorla Observatory (http://www.astro.utu.fi/), Hankasalmi Observatory (http://murtoinen.dyndns.org/)', 'Please contact our research team if You have some good projects for our equipment.', 58),
(64, 'Sternwarte-Habichtswald', '2007', 'Private Persons', 'http://www.sternwarte-habichtswald.de', 'Germany', 'Schöne Aussicht 26', '0049 5606 53 8 55', 'Ralf@Gerstheimer.de', 'Ralf@Gerstheimer.de<br>', 'Ralf@Gerstheimer.de<br>', NULL, NULL, '320 m', '>500', '51-100', '1', '>3', NULL, NULL, 64),
(66, 'Tacande Observatory', '2002', 'Joan Genebriera (private)', 'http://www.astropalma.com', 'Spain', 'Juana Morales,34', '34-922-486346', 'PLEIADES@telefonica.net', 'Joan Genebriera<br>', 'PLEIADES@telefonica.net<br>', ' 28º  38’ 29,55”', '17g 52m 03.57s W', '765 m.', '201-500', '251-300', '-1', '>3', NULL, NULL, 66),
(67, 'The Spaceguard Centre', '2001', 'Spaceguard UK', 'http://www.spaceguarduk.com', 'United Kingdom', 'The Spaceguard Centre, Llanshay Lane', '44 (0)1547 520247', 'mail@spaceguarduk.com', 'J R Tate<br>', 'mail@spaceguarduk.com<br>', '52 19 30 N', '03 01 08 W ', '417', '201-500', '51-100', '0', NULL, NULL, NULL, 67),
(82, 'Volkssternwarte Radebeul', '1959', 'Town of Radebeul', 'http://www.sternwarte-radebeul.de', 'Germany', 'Auf den Ebenbergen 10 a', '493518305905', 'mail@sternwarte-radebeul.de', 'Ulf Peschel<br>Michael Funke', 'peschel@sternwarte-radebeul.de<br>funke@sternwarte-radebeul.', '51°06''59'''' N', '13°37''20'''' E', '130 m', '201-500', '51-100', '1', '2', NULL, NULL, 82),
(89, 'Vitebsk amateur observatory', '1991', 'private persons', 'http://nevski.belastro.net/', 'Belarus', 'Tereshkova st. 16/4-47', '375297168840', 'b42@tut.by', 'Vitali Nevski<br>', 'nevski@tut.by<br>', '30°19''39&quot; E', '55°03''40&quot; N', '180', NULL, '51-100', '2', '3', 'Observatory &quot;Taurus-1&quot;  http://www.taurusskystars.narod.ru/  shurpakov_A98@tut.by', NULL, 89),
(94, 'Zagreb Observatory', '1903', 'city observatory', 'http://www.zvjezdarnica.hr/', 'Croatia', 'Opaticka 22', '00385 1 4851355', 'info@zvjezdarnica.hr', 'Dragan Roša<br>dmaricic@zvjezdarnica.hr', 'drosa@zvjezdarnica.hr<br>dhrzina@zvjezdarnica.hr', '15°58''29.7&quot;', '45°49''08.2&quot;', ' 226.7m', NULL, NULL, '1', '>3', 'Hvar Observatory - Croatia, Kanzelhohe Observatory - Austria, Aragat space station - Armenia. ', NULL, 94),
(109, 'Zvezdno Obshtestvo Observatory IAU-A79', '2005', 'Filip Fratev', 'http://a79.starrydreams.com/', 'Bulgaria', 'Persenk bl34B, ap33', '359898362715', 'filipfratev@yahoo.com', 'FilipFratev<br>', 'filipfratev@yahoo.com<br>', '23°50''36&quot; E', '42°03''49  N', '1455 m', NULL, '151-200', '2', '2', 'IAU, MPC, CARA', NULL, 109),
(110, 'Specola Santa Mama', '2004', 'Private', 'http:specolasantamama.interfree.it', 'Italy', 'Loc. Castagnoli 127/I', '390575487013', 'specolasantamama@interfree.it', 'TREVISAN Stefano<br>', 'specolasantamama@interfree.it<br>', 'N43°37''51&quot;', '011°51''27&quot;', '320 m', '51-100', '51-100', '1', '1', NULL, 'Observatory IAU code: B38', 110),
(113, 'Westerbork Synthesis Radio Telescope', '1970', 'ASTRON, the Netherlands Institute for Radio Astronomy', 'http://www.astron.nl', 'Netherlands', 'PO Box 2', '0030 521 595 100', 'sciencesupport@astron.nl', 'A. Polatidis<br>', 'polatidis[at]astron.nl<br>', '52d54''55.04', '6d37''59.99', '30', NULL, NULL, '1', '1', NULL, NULL, 113),
(115, 'Westerlundteleskopet', '2003', 'Uppsala Astronomical Observatory', 'http://www.astro.uu.se/grundutb/wt/Welcome.html', 'Sweden', 'Ångströmlaboratoriet, Lägerhyddsvägen 1, Box 516', '+46 18 471 3038', 'info@astro.uu.se', 'Eric Stempels<br>Ola Karlsson', 'eric.stempels@fysast.uu.se<br>ola.karlsson@fysast.uu.se', '59°50''14.9&quot;', '17°38''51.8&quot;', '51 m', '>500', '51-100', '1', '1', NULL, NULL, 115),
(116, 'Sternwarte Gaisberg', '2005', 'Gierlinger Richard / private', 'www.observatorium.at', NULL, 'A.-Stifterstrasse 45', '0043/7712/7070', 'office@observatorium.at', 'Gierlinger Richard<br>', 'office@observatorium.at<br>', '48°47''01 N', '13°28''28 E', '430', NULL, '51-100', '1', '2', NULL, NULL, 116),
(118, 'Sternwarte Kreuzlingen', '1976', 'Stiftung Sternwarte &amp; Planetarium Kreuzlingen', 'http://www.sternwarte-kreuzlingen.ch', 'Switzerland', 'Breitenrainstrasse 21 ', '+41 71 677 38 00', 'info@planetarium-kreuzlingen.ch', NULL, NULL, ' 47°38''29&quot; ', ' 09°09''37&quot; ', '480 m', NULL, NULL, '1', '>3', NULL, 'public observatory, no scientific research intention.  A Zeiss Planetarium (70 places) is part of the observatory', 118),
(120, 'TUBITAK National Observatory', '1997', 'Institute', 'www.tug.tubitak.gov.tr', 'Turkey', 'TUBITAK National Observatory Akdeniz University Campus', '+0090 242 2278401', 'omur.cakirli@tug.tubitak.gov.tr', 'Tansel AK<br>Zeki EKER', 'tanselak@tug.tubitak.gov.tr<br>eker@tug.tubitak.gov.tr', '36 49 28 N', '30 20 09 E', '2500', NULL, '151-200', '3', '>3', NULL, NULL, 120),
(121, 'Twillingate Astronomical Observatory', '2000', 'private', NULL, 'Canada', 'Box 59 ,  5 Gillard''s Lane', '709 884 2336', 'skywatcher@personainternet.com', 'James Gillard<br>', NULL, '49 37 02.4', '54 45 28.8', '35', NULL, NULL, '3', NULL, NULL, NULL, 121),
(10108, 'Xinglong Station', '', 'NAOC', 'http://www.xinglong-naoc.org/', 'China', 'Yanshan,Hebei Province,,Beijing', '', '', '', '', '40.39417?N', '117.575?E', '960', NULL, '210.0', '8', '4', '', '', 10002),
(10109, 'Yunnan Astronomical Observaotry', '1938', 'Chinese Academy of Sciences', 'http://www.ynao.ac.cn/', 'China', 'P.0.Box110,Kunming ,650011,Yunnan', '(+86)(0)871 3920919', 'ynaobgs@ynao.ac.cn', 'Han Zhanwen', '', '102? 47&#8242; 0', '25? 2&#8242; 0&', '2014', NULL, NULL, NULL, '4', '', '', 10003),
(10099, 'Taeduk Radio Astronomy Observatory', '1986', 'Korea Astronomy and Space Institute', 'http://www.trao.re.kr/', 'South Korea', ',,,Taejon City', '', '', '', '', '127? 22&#8242; 1', '36? 23&#8242; 53', '110', NULL, NULL, '9', '1', '', '', 10004),
(10105, 'Toyokawa Observatory', '', 'Nagoya University', '', 'Japan', '13 Honohara,3-chrome,442,Toyokawa', '', '', '', '', '137? 22? 16.??E', '34? 50? 10.??N', NULL, NULL, NULL, '9', '3', '', '', 10005),
(10107, 'Wise Observatory', '1971', 'Tel-Aviv University', 'http://wise-obs.tau.ac.il/general.html', 'Israel', 'Tel-Aviv University,69978 Tel-Aviv,39040,Negev', '972-3-6408729', 'noah@wise.tau.ac.il', 'Dr. Noah Brosch', '', '34?45''48'''' E', '30?35''45'''' N', '875', NULL, '170.0', '2', '1', '', '', 10007),
(10013, 'The Vainu Bappu Observatory', '1792', 'Indian Institute of Astrophysics', 'http://www.iiap.res.in/centers/vbo', 'India', 'Vainu Bappu Observatory,Alangayam,635701,Kavalur', '91 (04174) 203014', 'diriia@iiap.res.in', 'Prof. S. S. Hasan', '', '78? 50''E', '12? 34''N', '700', NULL, NULL, '5', '2', '', '', 10009),
(10102, 'The Gauribidanur Radio Observatory', '1976', 'Indian Institute of Astrophysics', 'http://www.iiap.res.in/centers/radio', 'India', 'Gauribidanur,Hossur post Kolar District,561210,Bangalore', '91 8155-291655', 'webmaster@iiap.res.in', '', '', '77.44?E', '13.60? N', NULL, NULL, NULL, '5', '2', '', '', 10010),
(10103, 'The Nobeyama Radio Observaotry', '', 'Ministry of Education, Science and Culture', 'http://www.nro.nao.ac.jp/~nro45mrt/index-e.html', 'Japan', 'Minamimki, Minamisaku,Nagano,384-1305', '81-267-98-4300', '', 'Dr. N. Kuno', '', '138? 28&#8242; 3', '35? 56&#8242; 30', '1350', NULL, NULL, '9', '1', '', '', 10014),
(10106, 'WASEDA Radio AstrophysicalObservatory', '', 'Institute of Astrophysic, Waseda University', 'http://www.astro.phys.waseda.ac.jp/index-e.html', 'Japan', '1-6-1 Nishi-Waseda,Shinjuku-Ku,169-8050,Tokyo', '81-3-3203-4141', 'daishido@waseda.jp', 'Professor Tsuneaki Daishido', '', '139? 12'' 48 E', '35? 23'' 18 N', NULL, NULL, NULL, '9', '1', '', '', 10018),
(10104, 'Toyama Observatory', '', 'JAXA', 'http://www.tsm.toyama.toyama.jp/tao/index-j.htm', 'Japan', '49-4 San-no-kuma,Toyama city,930-0155,Toyama', '81-76-434-9098', '', 'Dr. Atsushi Nakajima', '', '?', '?', NULL, NULL, NULL, '9', '1', '', '', 10022),
(10101, 'Tata Institute of Fundamental Research', '', '', 'http://www.gmrt.ncra.tifr.res.in', 'India', 'Post Bag 3,Ganeshkhind,411 007,Pune', '91-2132-252112/3/6/7', 'www@gmrt.ncra.tifr.res.in', '', '', '9? 5'' 47 E', '74? 2'' 59 N', '650', NULL, NULL, '5', '1', '', '', 10030),
(10040, 'Whipple Observatory', '1966', 'University of Arizona,Smithsonian Institute', 'http://www.mmto.org/', 'USA', 'MMT Observatory , P.O. Box 210065 University of Arizona ,85721,Tucson AZ', '520-621-1558', '', '', '', '110?52''42''''W', '31?40''52''''N', '2606', NULL, NULL, NULL, NULL, '', 'Schedules: http://www.mmto.org/schedules/current.shtml Deadlines: Usually in late February', 10036),
(10100, 'Tartu Observatory', '1946', '', 'www.aai.ee', 'Estonia', '61602, T?ravere,,Tartumaa', '372-7410-265', '', 'L.Leedj?rv', 'leed@aai.ee', '58? 15'' 55''''E', '26? 27'' 58''N', NULL, NULL, NULL, NULL, '2', '', '', 10047),
(10062, 'Very Large Array', '', '', 'http://www.vla.nrao.edu/', 'USA', 'Socorro New Mexico NRAO,P.O. Box O1003 Lopezville Road,87801-0387 ,Socorro NM', '', 'info@nrao.edu', '', '', '107?37''6.06''''W', '34?4''44.28''''N', '2123', NULL, NULL, NULL, NULL, '', 'Deadlines usually October 1, June 1,Feb 2. Apply through http://my.nrao.edu/ Schedules: http://www.vla.nrao.edu/cgi-bin/schedules.cgi', 10057),
(10066, 'Steven F Austin Observatory', '', 'Stephen F Austin State', 'http://www.physics.sfasu.edu/observatory/obs.htm', 'USA', ',,,Texas', '', '', '', '', '94?39''38.32''''W', '31?45''35.59''''N', '149', NULL, NULL, NULL, NULL, '', '', 10061),
(10111, 'South Pole Telescope', '', 'University of Chicago', '', 'Antarctica', ',,,', '', '', '', '', '139?16''0''''W', '90? S', NULL, NULL, NULL, NULL, '1', '', '', 10066),
(10117, 'Tuorla Observatory', '1952', 'University of Turku', 'www.astro.utu.fi/', 'Finland', 'V?is?l?ntie 20,,FI-21500,PIIKKI?', '+358 2 333 8221', '', '', '', '60?24&#8242;57&#', '22?26&#8242;36&', '61', NULL, NULL, '2', '4', '', '', 10070),
(10202, 'William Herschel Telescope (WHT) (Roque de los Muchachos Observatory)', '1987', 'Isaac Newton Group of Telescopes', 'http://www.ing.iac.es/Astronomy/astronomy.html', 'Spain', 'Roque de los Muchachos Observatory,,,La Palma', '', 'crb@ing.iac.es', 'Chris Benn', 'crb@ing.iac.es', '28.760361?N?', '17.881408?W?', '2332', NULL, '274.0', '0', '1', '', 'Fill out the form: http://www.otri.iac.es/cci/ ', 10078),
(10146, 'William Herschel Telescope (WHT) (Roque de los Muchachos Observatory)', '', '', 'http://www.ing.iac.es/Astronomy/astronomy.html', 'Spain', ',,,La Palma', '', '', 'Chris Benn', 'crb@ing.iac.es', '17.881408?W', '28.760361?N', '2332', NULL, NULL, NULL, NULL, '', '31st March deadline form : http://www.otri.iac.es/cci/', 10090),
(10150, 'The Mercator Telescope (Roque de los Muchachos Observatory )', '', '', '', 'Spain', ',,,La Palma', '', '', 'Hans Van Winckel', 'hans@ster.kuleuven.be', '17?52''42''''W', '28?45''44'''' N', '2333', NULL, NULL, NULL, NULL, '', '', 10094),
(10157, 'Tidbinbilla?(Canberra Deep Space Communication Complex)', '1974', '', 'http://www.atnf.csiro.au/observers/tidbinbilla/', 'Australia', ',,,', '', '', 'Jimi Green', 'James.Green@atnf.csiro.au', '151?5''49''''E', '33?46''28''''S', '1184', NULL, NULL, NULL, NULL, '', '', 10101),
(10161, 'Square Kilometre Array', '', '', 'http://www.ska.ac.za/', 'South Africa', ',,,', '', '', '', '', '?', '?', NULL, NULL, NULL, '2', NULL, '', '', 10105),
(10181, 'University of Tokyo Atacama Observatory (Llano de Chajnantor Observatory)', '', '', 'http://www.ioa.s.u-tokyo.ac.jp/TAO/', 'Chile', ',,,Atacama', '', '', '', '', '22? 59''12''''S', '22?59''12''''S', '5104', NULL, NULL, NULL, '1', '', '', 10125),
(10186, 'The Crimean Observatory', '1961', '', 'http://quake.stanford.edu/~crao/', 'Ukraine', 'The Crimean Observatory, Nauchny,Ukraine,,Nauchny', '', 'webmaster@crao.crimea.ua', '', '', '+44:43:36', '2h?16m?03s', '600', NULL, NULL, '2', '4', '', '', 10130),
(10190, 'Suffa Radio Observatory', '', '', 'http://radioastron.ru/?dep=16', 'Uzbekistan', 'Suffa RT-70 radio telescope ,, Suffa plateau, Uzbekistan,,Suffa plateau', '', '', '', '', '?', '?', NULL, NULL, NULL, '5', '1', '', '', 10134),
(10191, 'Special Astrophysical Observatory', '1966', 'Russian Academy of Science', 'http://w0.sao.ru/Doc-en/index.html', 'Russia', 'Special Astrophysical Observatory, ,Nizhnij Arkhyz, Zelenchukskiy region, Karachai-Cherkessian Republic,369167,Karachai-Cherkessian Republic', '+7(87878) 46436', 'admsao@sao.ru', 'Parijski Yuri Nikolaevich', 'par@sao.ru', '43?38&#8242;48.5', '41?26&#8242;25.6', '970', NULL, NULL, '3', '4', '', '', 10135);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
