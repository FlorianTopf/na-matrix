-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 10, 2014 at 05:58 PM
-- Server version: 5.1.58
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `europla1_spa`
--

-- --------------------------------------------------------

--
-- Table structure for table `maintable`
--

CREATE TABLE IF NOT EXISTS `maintable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Mission` varchar(75) DEFAULT NULL,
  `Agency` varchar(6) DEFAULT NULL,
  `Launch` date DEFAULT NULL,
  `Death` date DEFAULT NULL,
  `Orbit` varchar(75) DEFAULT NULL,
  `Notes` text,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `maintable`
--

INSERT INTO `maintable` (`id`, `Mission`, `Agency`, `Launch`, `Death`, `Orbit`, `Notes`, `sid`) VALUES
(17, 'Huygens Probe', 'NASA', '2004-12-25', '0000-00-00', '', 'http://articles.adsabs.harvard.edu/cgi-bin/nph-iarticle_query?bibcode=1997ESASP1177..109T&db_key=AST&page_ind=0&plate_select=NO&data_type=GIF&type=SCREEN_GIF&classic=YES\r\n', 3),
(19, 'Kepler', 'NASA', '2009-03-07', '2012-00-00', '', 'Earth Trailing Heliocentric', 5),
(20, 'Mars Express', 'NASA', '2003-06-02', '2012-12-31', '', 'Mars', 6),
(21, 'Mars Odyssey', 'NASA', '2001-04-07', '2015-00-00', '', 'Mars\r\nhttp://grs.lpl.arizona.edu/content/learning/aboutgrs/\r\n', 7),
(39, 'Mars Reconnaissance Orbiter', 'NASA', '2005-08-12', '2010-00-00', '', 'Mars orbiter.', 8),
(25, 'Hubble', 'NASA', '1990-04-24', '2021-00-00', '', '', 10),
(26, 'New Horizons', 'NASA', '2006-01-19', '2029-00-00', '', 'Pluto', 11),
(27, 'Juno', 'NASA', '0000-00-00', '0000-00-00', '', 'Jupiter', 12),
(29, 'Chandrayaan-1', 'ISRO', '2008-10-22', '2010-00-00', 'http://www.isro.org/chandrayaan/htmls/mission_sequence.htm', 'ESA. Moon', 14),
(30, 'COROT', 'NASA', '2006-12-27', '0000-00-00', 'http://www.esa.int/SPECIALS/COROT/SEMMY0D4VUE_0.html', 'Earth Orbit', 15),
(31, 'ExoMars', 'NASA', '2016-00-00', '2020-00-00', 'http://exploration.esa.int/science-e/www/object/index.cfm?fobjectid=46048', 'Mars\r\n', 16),
(32, 'Gaia', 'NASA', '2012-00-00', '0000-00-00', '', 'http://www.esa.int/esaSC/120377_index_0_m.html\r\n', 17),
(33, 'INTEGRAL', 'NASA', '2002-10-00', '0000-00-00', '', 'Earth Orbit', 18),
(34, 'James Webb Telescope', 'NASA', '2014-00-00', '0000-00-00', 'http://www.esa.int/esaSC/SEM16E1A6BD_index_0.html', 'Low Earth Orbit\r\n', 19),
(35, 'IXO', 'NASA', '2015-00-00', '2020-00-00', 'http://sci.esa.int/science-e/www/object/index.cfm?fobjectid=43971', 'ESA/JAXA ', 20),
(43, 'Chandra X-ray Observatory', 'NASA', '1999-07-00', '0000-00-00', 'Earth', '', 26);

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

CREATE TABLE IF NOT EXISTS `sensors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sensor` varchar(300) DEFAULT NULL,
  `Type` varchar(200) DEFAULT NULL,
  `underlying` text,
  `rangebegin` float(10,2) DEFAULT NULL,
  `rangeend` float(10,2) DEFAULT NULL,
  `units` varchar(12) DEFAULT NULL,
  `measured` text,
  `resolution` text,
  `fov` text,
  `sciencegoals` varchar(75) DEFAULT NULL,
  `prin_inv` varchar(75) DEFAULT NULL,
  `prin_inv_con` varchar(75) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=647 ;

--
-- Dumping data for table `sensors`
--

INSERT INTO `sensors` (`id`, `Sensor`, `Type`, `underlying`, `rangebegin`, `rangeend`, `units`, `measured`, `resolution`, `fov`, `sciencegoals`, `prin_inv`, `prin_inv_con`, `sid`) VALUES
(187, 'ACP (Aerosol Collector and Pyrolyser)', 'Collector ', 'Pump Unit, OH heating element pyrolysis furnace (250?C or 600?C)', 135.00, 32.00, 'km', 'Titans Atmospheres,,', '', ' x ', 'SA', 'Guy Israel', 'guy.israel@aerov.jussieu.fr', 3),
(188, 'DISR (Descent Imager and Spectral Radiometer)', 'Photometer', 'Violet Photometer [ULV]', 350.00, 480.00, 'nm', 'photons,,', '', '170? x (5-88)?', 'SA', 'M Tomasko', 'mtomasko@lpl.arizona.edu', 3),
(189, 'DISR (Descent Imager and Spectral Radiometer)', 'Spectrometer', 'Visible Spectrometer [ULVS]', 480.00, 960.00, 'nm', 'photons,,', '', '170? x (5-88)?', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(190, 'DISR (Descent Imager and Spectral Radiometer)', 'Spectrometer', 'Infrared Spectrometer [ULIS]', 870.00, 1700.00, 'nm', 'photons,,', '', '170? x (5-88)?', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(191, 'DISR (Descent Imager and Spectral Radiometer)', 'Polarimeter', 'Solar Aureole Vertical Polarisation [SA 1]', 475.00, 525.00, 'nm', 'photons,,', '', '6? x (25-75)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(192, 'DISR (Descent Imager and Spectral Radiometer)', 'Polarimeter', 'Solar Aureole Horizontal Polarisation [SA 2]', 475.00, 525.00, 'nm', 'photons,,', '', '6? x (25-75)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(193, 'DISR (Descent Imager and Spectral Radiometer)', 'Polarimeter', 'Solar Aureole Vertical Polarisation [SA 3]', 900.00, 970.00, 'nm', 'photons,,', '', '6? x (25-75)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(194, 'DISR (Descent Imager and Spectral Radiometer)', 'Polarimeter', 'Solar Aureole Horizontal Polarisation [SA 4]', 900.00, 970.00, 'nm', 'photons,,', '', '6? x (25-75)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(195, 'DISR (Descent Imager and Spectral Radiometer)', 'Sensor', 'Sun Sensor [SS]', 933.00, 945.00, 'nm', 'photons,,', '', '64? cone x (25-75)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(196, 'DISR (Descent Imager and Spectral Radiometer)', 'Photometer', 'Violet Photometer [DLV]', 350.00, 480.00, 'nm', 'photons,,', '', '170? x  (5-88)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(197, 'DISR (Descent Imager and Spectral Radiometer)', 'Spectrometer', 'Visible Spectrometer [DLVS]', 480.00, 960.00, 'nm', 'photons,,', '', '4? x (10-50)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(198, 'DISR (Descent Imager and Spectral Radiometer)', 'Spectrometer', 'Infrared Spectrometer [DLIS]', 870.00, 1700.00, 'nm', 'photons,,', '', '3? x (15.5 - 24.5)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(199, 'DISR (Descent Imager and Spectral Radiometer)', 'Imager', 'High Resolution Imager [HRI]', 660.00, 1000.00, 'nm', 'photons,,', '', '9.6? x (6.5 - 21.5)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(200, 'DISR (Descent Imager and Spectral Radiometer)', 'Imager', 'Medium Resolution Imager [MRI]', 660.00, 1000.00, 'nm', 'photons,,', '', '21.1? x  (15.75 - 46.2)? [Azimuth x Zenith]', 'SA', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(201, 'DISR (Descent Imager and Spectral Radiometer)', 'Imager', 'Side-Looerking Imag [SLI]', 660.00, 1000.00, 'nm', 'photons,,', '', '25.6? x  (45.2 - 96)? [Azimuth x Zenith]', '', 'M Tomasko', 'asko@lpl.arizona.edu', 3),
(202, 'DWE (Doppler Wind Experiment)', '', 'S-band radio link with Cassini Orbiter', NULL, NULL, '', 'Direction and Strength of Titans zonal winds,,', 'm s-1', ' x ', 'AT', 'M Bird', 'mbird@astro.uni-bonn.de', 3),
(203, 'GCMS (Gas Chromatograph and Mass Spectrometer)', '', 'Quadrupole Mass Filter', 2.00, 141.00, 'Daltons', 'Determine Isotope ratios in Titan''s Atmosphere,,', '1 x 10-6 daltons', ' x ', 'AT', 'H Niemann', 'hasso.b.niemann@nasa.gov', 3),
(204, 'HASI (Huygens Atmospheric  Structure Instrument)', 'Chromatograph, Spectrometer', 'Pressure Profile Instrument [PPI]', 0.00, 2000.00, 'mbar', 'Atmospheric Pressure,,', '?0.005 mbar', ' x ', 'AT', 'M. Fulchignoni', 'fulchignoni@obspm.fr', 3),
(205, 'HASI (Huygens Atmospheric  Structure Instrument)', '', 'Temperature [TEM]', 60.00, 330.00, 'K', 'Temperature,,', '0.02K, 0.07K', ' x ', 'SA', 'M. Fulchignoni', 'fulchignoni@obspm.fr', 3),
(206, 'HASI (Huygens Atmospheric  Structure Instrument)', '', 'Acceleromters [ACC]', -20.00, 20.00, 'g', 'Servo Accelerometer,,', '?50mg', ' x ', 'SA', 'M. Fulchignoni', 'fulchignoni@obspm.fr', 3),
(207, 'HASI (Huygens Atmospheric  Structure Instrument)', '', 'Permittivity, Wave and Altimetry [PWA]', NULL, NULL, '', 'Natural Wave Phenomena, Atmospheric Electricity, Electron Conductivities, Ion-Electron Conductivities, Natural Acoustic Phenomena, Surface Structure,,', '2 &#956;V/m/Hz, 1 mV/m,  2 - 3s, 60s, (Amplitude 3%, Frequency 50 Hz, Time 1s), 40m @ 24km', ' x ', 'SA', 'M. Fulchignoni', 'fulchignoni@obspm.fr', 3),
(208, 'SSP (Surface Science Package)', '', 'Tiltmeter TI', NULL, NULL, '', ',,', '', ' x ', '', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(209, 'SSP (Surface Science Package)', '', 'External Accelerometer [ACC-E]', 1.00, 2000.00, 'N', 'Force (Impact Penetrometer),,', 'Depth resolution &#8776; 1mm  (Sample Rate 10khz)', 'Surface Area &#8776; 1 cm2  x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(210, 'SSP (Surface Science Package)', '', 'Internal Accelerometer [ACC-I]', -100.00, 100.00, 'g', 'Acceleration (Impact Accelerometer),,', 'Resolution 0.5 m s-2  (Sampling precision 12 bits)', ' x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(211, 'SSP (Surface Science Package)', '', 'Acoustic Properties Instrument [API-S]', 0.00, 1000.00, 'm', 'Topography (Acoustic Sounder),,', 'Sonar sampling rate 1kHz', 'Beamwidth &#8776; 20 ? x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(212, 'SSP (Surface Science Package)', '', 'Acoustic Properties Instrument [API-V]', NULL, NULL, '', 'Speed of Sound,,', '8 cm s-1', ' x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(213, 'SSP (Surface Science Package)', '', 'Density Sensor [DEN]', NULL, NULL, '', 'Density of Fluid,,', '', ' x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(214, 'SSP (Surface Science Package)', '', 'Permittivity Sensor [PER]', NULL, NULL, '', 'Polar Molecules in Titan''s Ocean (Capacitance Sensor),,', '', ' x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(215, 'SSP (Surface Science Package)', '', 'Refractive Index Sensor [REF]', 1.25, 1.45, '', 'Refractive Index,,', '0', ' x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(216, 'SSP (Surface Science Package)', '', 'Thermal Properties Sensor [THP]', NULL, NULL, '', 'Ocean and Atmosphere Temperature and Thermal Conductivity,,', '', ' x ', 'SA', 'J Zarnecki', 'j.c.zarnecki@open.ac.uk', 3),
(220, 'Photometer (Kepler Photometer)', 'Telescope', 'Schmidt Telescope', 430.00, 890.00, 'nm', 'MS Stars,,', '0.95m Aperture, 42 CCDs (each 50 x 22mm) each CCD 2200 x 1024 pixels', '105? x 105?', '', 'William Borucki', 'wborucki@mail.arc.nasa.gov', 5),
(221, 'HRSC (High Resolution Stereo Camera)', 'Camera', 'CCD Line Sensors', 375.00, 1015.00, 'nm', 'photons,,', 'Detector Pixel Size 7 x 7 &#956;m', '18.9? x 18.9?', 'AT, SP', 'Gerhard Neukum', 'gerhard.neukum@fu-berlin.de', 6),
(222, 'ASPERA (Energetic Neutron Atoms Analyser)', 'Analyser', '2 x Energetic Neutral Atom sensors', 100.00, 10000.00, 'eV', 'Neutral Particles,,', '&#8710;E/E = 0.5, amu/q = 1, 16  Angular Resolution (FWHM) 4.6? x 11.5? and 5? x 40?', '9? x 344?', 'AT, SP', 'R. Lundin', 'rickard.lundin@irf.se', 6),
(223, 'ASPERA (Energetic Neutron Atoms Analyser)', 'Spectrometer', 'Electron Spectrometer', 0.01, 20.00, 'keV', 'Energetic Electrons,,', '&#8710;E/E =  0.08, Angular Resolution (FWHM) = 2? x 22.5?', '4? x 360?', 'AT, SP', 'R. Lundin', 'rickard.lundin@irf.se', 6),
(224, 'ASPERA (Energetic Neutron Atoms Analyser)', 'Analyzer', 'Ion Mass Analyzer', 0.01, 36.00, 'keV/q', 'Ion Components H+,He++,He+, O+ and molecular ions 20 - 80 amu/q', '&#8710;E/E = 0.07, Angular Resolution (FWHM) 4.5? x 22.5?', '90? x 360?', 'AT, SP', 'R. Lundin', 'rickard.lundin@irf.se', 6),
(225, 'PFS (Planetary Fourier Spectrometer)', 'Spectrometer', 'Photoconductor and Pyroelectric detectors', 1.20, 45.00, 'um', 'Infrared Photons,,', 'Spectral Resolution 1.5 cm-1', '2? x 2?', 'SP', 'V. Formisano', 'vittorio.formisano@ifsi.rm.cnr.it', 6),
(226, 'OMEGA (Visible and Infrared Mineralogical Mapping Spectrometer  [VNIR Channel])', 'Spectrometer', 'Silicon CCD detectors', 0.36, 1.05, 'um', 'Visible and Near Infrared Light,,', 'Spectral Resolution (&#955;/&#8710;&#955;) 70 - 200', '0.154 rad and 0.4mrad per pixel x ', 'SP', 'Jean-Pierre Bibring', 'bibring@ias.fr', 6),
(227, 'OMEGA (Visible and Infrared Mineralogical Mapping Spectrometer  [VNIR Channel])', 'Spectrometer', 'Photovoltaic Linear Array', 0.93, 5.20, 'um', 'Short Wavelength Infrared Range,,', '13-20 nm', 'Cross-track field of view 8.8? x ', 'SP', 'Jean-Pierre Bibring', 'bibring@ias.fr', 6),
(228, 'MARSIS (Sub-Surface Sounding Radar Altimeter)', 'Altimeter', 'Nadir-looking pulse limited radar sounder and altimeter', 1.30, 5.50, 'Mhz', 'Radio Signals,,', '', ' x ', 'AT, SP', 'G Picardi', 'picar@infocom.inguniroma1.it', 6),
(229, 'MaRS (Radio Science Experiment)', '', 'Sonar', 2.30, 8.40, 'GHz', 'Phase and Amplitude change of signal,,', '&#8710;f = 10-13', ' x ', 'AT, SP', 'Martin Paetzold', 'paetzold@geo.uni-koln.de', 6),
(230, 'SPICAM (Ultraviolet and Infrared Mass Atmospheric Spectrometer)', 'Spectrometer', 'Ultraviolet Channel [CCD, 384 x 288 pixels]', 118.00, 320.00, 'nm', 'Ultraviolet Photons,,', '0.55nm/pixel', '40 x 40 arc seconds (per pixel)', 'AT, SP', 'J-L Bertaux', 'jean-loup.bertaux@aerov.jussieu.fr', 6),
(231, 'SPICAM (Ultraviolet and Infrared Mass Atmospheric Spectrometer)', 'Spectrometer', 'Infrared Channel [InGaAs PIN photodiode]', 1.10, 1.70, 'um', 'Infrared Photons,,', '5 x 5km at NADIR, 0.45 - 1.12nm sampling per pixel', '1? (3  x 10-4 steradians)', 'AT, SP', 'J-L Bertaux', 'jean-loup.bertaux@aerov.jussieu.fr', 6),
(232, 'THEMIS (Thermal Emission Imaging System)', 'Imager', 'Infrared Spectroscopy', 0.42, 14.88, 'um', 'Martian Rock Mineralogies,,', 'Visual Images (18 meters per pixel), Infrared Images (100 per pixel)', 'IR (4.6? cross-track, 3.5? down-track, 0.25mrad IFOV at nadir) Visible (2.66? cross-track, 2.64? down-track, 0.045mrad IFOV in nadir) x ', 'SP', 'Philip Christensen', 'phil.christensen@asu.edu', 7),
(233, 'GRS (Gamma Ray Spectrometer)', 'Spectrometer', 'Gamma Rays off Martian Surface', NULL, NULL, '', ',,', '', ' x ', 'SP', 'W V Boynton', 'wboynton@gamma1.lpl.arizona.edu', 7),
(234, 'Neutron Spectrometer', 'Spectrometer', '', NULL, NULL, '', ',,', '', ' x ', 'SP', 'W V Boynton', 'wboynton@gamma1.lpl.arizona.edu', 7),
(235, 'High Energy Neutron Detector', 'Detector', '', NULL, NULL, '', ',,', '', ' x ', 'SP', 'W V Boynton', 'wboynton@gamma1.lpl.arizona.edu', 7),
(236, 'MARIE (Mars Radiation Environment Experiment)', 'radiometer', 'Solid State and High refractive index Cherenkov detectors', 15.00, 500.00, 'MeV/n', 'Radiation of Protons, Neutrons and Heavy Ions,,', '', ' x ', 'SP', 'Gautam Badhwar', 'gbadhwar@jsc.nasa.gov', 7),
(354, 'SHARAD (Shallow Radar)', 'Radar', 'Dipole Radiating element antenna', 15.00, 25.00, 'MHz', 'Martian subsurface,,', 'Vertical Resolution &#8776;7m, Penetration Depth &#8776; 0.1 - 1km, Horizontal Resolution &#8776; (0.3 - 1)km x (3-7)km (Alongo track x Cross Track)', '3.75km (free space)  x  400 km (range by azimuth)', 'SP', 'R. Seu', 'robseu@infocom.ing.uniroma1.it', 8),
(353, 'MCS (Mars Climate Sounder)', 'Sounder', 'Thermophile detectors', 0.30, 3.00, 'um', 'Temperature, humidity and dust content of the Martin Atmosphere,', '5km vertical resolution', '4.31?  x  4.31?', 'AT, SP', 'Daniel McCleese', 'djmcc@scnl.jpl.nasa.gov', 8),
(352, 'CRISM (Compact Reconnaissance Imaging Spectrometer for Mars)', 'Spectrometer', 'Ritchey - Chretien telescope. VNIR and IR detectors', 362.00, 3920.00, 'nm', 'Minerals on Martian Surface,,', '15 - 20 m/pixel', '2.12?  x  ', 'SP', 'S Murchie', 'murchie@jhuapl.edu', 8),
(351, 'MARCI (Mars Colour Imager)', 'Imager', 'CCD Detector', 260.00, 725.00, 'nm', 'Ultraviolet and Visible Photons,,', '1 to 10 kilometers per pixel range', '180?  x  ', 'SP', 'Michael Malin', 'malin@mss.com', 8),
(349, 'HiRISE (High Resolution Imaging Science Experiment)', 'Camera', '14 CCD dectors', 400.00, 1000.00, 'nm', 'Visible and Near Infrared Photons,,', '30 cm/pixel (from 300km height)', '1.14?  x  0.08?', 'SP', 'Alfred McEwen', 'mcewen@lpl.arizona.edu', 8),
(350, 'CTX (Context Camera)', 'Camera', 'CCD line array', 500.00, 800.00, 'nm', 'Visible and Near Infrared Photons,,', '&#8776; 6 meters per pixel', '6?  x  ', 'SP', 'Michael Malin', 'malin@mss.com', 8),
(263, 'COS (Cosmic Origins SpUltraviolet spectrographectrograph)', 'spectrograph', 'Ultraviolet spectrograph', 115.00, 320.00, 'nm', ',,', 'spectral resolution = 1,500 to 21,000', ' 2.5 arc second diameter entrance aperture x  ', '', '', '', 10),
(262, 'STIS (Space Telescope Imaging Spectrograph)', 'Spectrograph', '?Multi-Anode Multichannel Arrays', 115.00, 310.00, 'nm', ',,', '0.02 arc sec/pixel', '0.007  x  0.007', '', '', '', 10),
(260, 'WFC3 (Wide Field Camera 3)', 'Camera', 'CCD', 200.00, 1700.00, 'nm', ',,', '0.04 arc sec/pixel', '0.046  x  0.046', '', '', '', 10),
(261, 'STIS (Space Telescope Imaging Spectrograph)', 'Spectrograph', 'CCD', 200.00, 1030.00, 'nm', ',,', '0.05 arcsec/pixel', '0.014  x  0.014', '', '', '', 10),
(259, 'ACS (Advanced Camera for Surveys)', 'Camera', 'CCD', 200.00, 1000.00, 'nm', '0.025 arc sec/pixel,,', '', '0.007  x  0.008 degrees', '', '', '', 10),
(264, 'FGS (Fine Guidance Sensor)', 'Interferometer', 'Interferrometer', NULL, NULL, 'optical', 'Stars,,', '2-5 milli seconds arc stability', ' 0.0014 x  0.0014', '', '', '', 10),
(265, 'NICMOS (Near Infrared Camera and Multi-Object Spectrometer)', 'Spectrometer', 'Coronagraphic and Polarimetric imaging, and slitless spectroscopy, Hg0.554Cd0.446Te infrared detectors', 0.80, 2.40, 'um', ',,', '0.1 arcsec/pixel', ' 0.014 x  0.014', '', '', '', 10),
(266, 'LORRI (Long Range Reconnaissance Imager)', 'Imager', 'CCD', 350.00, 850.00, 'nm', 'Pluto,Charon,', '4.95 microrad/pixel', '0.29 x 0.29 deg', 'AT, SP', 'Andrew Chang', 'Andrew.cheng@jhuapl.edu', 11),
(267, 'REX (Radio Science Experiment)', '', '', NULL, NULL, 'X band Radio', 'Temperature and Pressure of Pluto''s atmosphere,,', 'delf/f = 3 x 10^-13', ' x ', 'AT', 'L. Tyler', 'Len.tyler@stanford.edu', 11),
(268, 'ALICE (UV imaging spectrometer)', 'spectrometer', '', 465.00, 1880.00, 'A', 'Pluto and Charon Atmosphere,,', '3 - 10 angstroms', '4 x 0.1', 'AT', 'S. A. Stern', 'alan.stern@nasa.gov', 11),
(269, 'RALPH', 'Camera', 'Multicolour Visible Imaging Camera [MVIC]', 400.00, 975.00, 'nm', 'Imaging in Blue, Red, CH4 and NIR bands,,', '20 micro rad /pixel', '5.7 x 0.15', 'SP', 'S. A. Stern', 'alan.stern@nasa.gov', 11),
(270, 'RALPH', 'Camera', 'Linear Etalon Imaging Spectral Array [LEISA]', 1.25, 2.50, 'um', 'Pluto mapping,,', '62 micro rad/pixel', '0.9 x 0.9', 'SP', 'D. Jennings', 'donald.e.jennings@nasa.gov', 11),
(271, 'SWAP (Solar Wind At Pluto)', '', '', 2.50, 7500.00, 'eV', 'Solar Wind,,', 'delE/E = 0.4', '200 x 10', 'AT', 'D. McComas', 'dmccomas@swri.edu', 11),
(272, 'PEPSSI (Pluto Energetic Particle Spectrometer Science Investigation)', '', 'Energetic Particle detector', 1.00, 1000.00, 'KeV', 'Energetic particles (protons and CNO ions),,', '25 x 12 deg', '160 x 12', 'AT', 'R. McNutt', 'ralph.mcnutt@jhuapl.edu', 11),
(273, '', '', '', NULL, NULL, '', ',,', '', ' x ', '', '', '', 12),
(291, 'TMC (Terrain Mapping Stereo Camera)', 'Camera', 'Stereoscopic Camera', 0.40, 0.90, 'um', 'Panchromatic Spectral band,,', '5m spatial resolution', '25.02 x 25.02 deg', '', 'AS Kiran', 'kiran@sac.isro.gov.in', 14),
(292, 'LLRI (Lunar Laser Ranging Instrument)', 'Altimeter', 'Diode, Laser Transmitter, Reciever', NULL, NULL, '', 'Silicon avalanches,,', 'more than 5m (altimeter)', '0.025 x 0.025 deg', '', 'JA Kamalakar', 'kamalakar@leosisro.com', 14),
(293, 'HySI (Hyper Spectral Imaging Camera)', 'Camera', 'Area Detector', 0.40, 0.92, 'um', ',64 continuous bands, spectra,', 'Spectral: 15nm, Spacial: 80m', '20km x ', '', 'AS Kiran', 'kiran@sac.isro.gov.in', 14),
(294, 'HEX (High Energy X-ray Spectrometer)', 'spectrometer', 'High energy X-ray spectrometer', NULL, NULL, '', '46.5 keV line from radioactive Pb,,', 'spatial: 33km', '33 x 33 km', '', 'JN Goswami', 'goswami@prl.ernet.in', 14),
(295, 'MIP (Moon Impact Probe)', 'Altimeter, spectrometer', 'Radar Altimeter, spectrometer', NULL, NULL, '', ',,', 'mass resolution: 0.5 atomic units', ' x ', '', '', '', 14),
(296, 'C1XS (Chandrayaan-1 X-ray Spectrometer)', '', 'Solid State Detector', NULL, NULL, '', 'Mg,Al,Si, Ca, Ti', 'spatial: 25km', ' x ', '', '', '', 14),
(297, 'SIR-2 (Near Infra-red Spectrometer)', '', '', NULL, NULL, '', ',,', 'spectral: 6nm', ' x ', '', '', '', 14),
(298, 'SARA  (Sub keV Atom Reflecting Analyser)', 'Spectrometer', 'Mass spectrometer', 10.00, 3000.00, 'eV', ',,', '', ' x ', '', 'Anil Bhardwaj', 'anil_bhardwaj@vssc.org', 14),
(299, 'RADOM (Radiation Dose Monitor Experiment)', 'Spectrometer', 'X-ray Fluorescence Spectrometer', 1.00, 10.00, 'KeV', ',,', 'Spatial: 5m', ' x ', '', 'N Bhandari', 'bhandari@prl.ernet.in', 14),
(300, 'Mini-SAR (Miniature Synthetic Aperture Radar)', '', 'Radar Device', NULL, NULL, '', 'Circular polarisation ratio,,', '', ' x ', '', '', '', 14),
(301, 'M3 (Moon Mineralogy Mapper)', '', 'Imaging Spectrometer', NULL, NULL, '', ',,', '', ' x ', '', '', '', 14),
(302, '0.3 m Telescope', '', 'Telescope, Charge-Couple devices', NULL, NULL, '', ',,', '', '3.5 x 3.5 deg', '', '', '', 15),
(303, 'Wide Field, two-part camera', '', '', NULL, NULL, '', ',,', '', ' x ', 'EX', '', '', 15),
(304, 'PanCam', 'Camera (Panoramic Camera for mapping the Martian terrain)', 'Multi-spectral stereo imager', 440.00, 670.00, 'nm', 'Water Vapour, Depth measuremet,Water Vapour, Depth measurement,', '', '65 x 65 deg', '', 'Andrew John Coates', ' ajc@mssl.ucl.ac.uk', 16),
(305, 'MOMA (Mars Organic Molecule Analyser)', 'Spectrometer', 'Mass Spectrometer', NULL, NULL, '', 'Proteogenic Amino Acids ,,', '', ' x ', '', 'Fred Goesmann', '', 16),
(306, 'MicrOmega-IR (Infra-red Imaging spectrometer)', 'spectrometer', 'Spectral Microscope', 0.90, 4.00, 'um', 'Minerals,Ferric Oxides,Sulphates, Carbonates, Ices', '', ' x ', '', 'Jean-Pierre Bibring', 'bibring@ias.fr', 16),
(307, 'Mars-XRD (Mars X-ray Diffractor)', 'Diffractor', 'X-ray diffractor', NULL, NULL, '', 'Minerals,,', '', ' x ', '', 'Lucia Marinangeli', 'luciam@irsps.unich.it', 16),
(308, 'Raman Spectrometer', '', '', NULL, NULL, '', 'Organic/Inorganic molecules,,', '0.1nm', ' x ', '', 'Fernando Rull Perez', 'rull@fmc.uva.es', 16),
(309, 'WISDOM (Water Ice and Subsurface Deposit Observation on Mars)', '', 'ground penetrating radar, permittivity probe', 0.50, 3.00, 'Ghz', 'GPR: depth of around 50m,PP: electrical permittivity of the soil,', '2m', ' x ', '', 'Valerie Ciarletti', 'valerie.ciarletti@cetp.ipsl.fr', 16),
(310, 'MA_MISS (Mars Multispectral Imager for Subsurface Studies)', 'Spectrometer', 'Spectrometer', NULL, NULL, '', 'lateral wall of borehole created by the drill. ,,', '', ' x ', '', 'A. Coradini', '', 16),
(311, 'Two optical Telescopes ', '', '', NULL, NULL, '', 'positional, radial velocity,photometric measurements', '', ' x ', '', '', '', 17),
(312, 'SPI (Gamma-ray Spectrometer)', '', '', 0.02, 8.00, 'MeV', 'Gamma Ray Bursts,,', '50 millisecond', '16 x 16 deg', '', 'JP Roques', '', 18),
(313, 'IBIS (Gamma-ray Imager)', '', 'Two large Gamma-ray telescopes', 0.02, 10.00, 'MeV', 'Gamma Rays,,', '12 arcseconds', '29 x 29', '', 'P Ubertini', 'ubertini@rm.iasf.cnr.it', 18),
(314, 'JEM-X (Joint European X-ray Monitor)', '', '', 3.00, 35.00, 'keV', 'X-rays,,', '3 arcseconds', '10 x 10 ', '', 'Soren Brandt', 'sb@spacecenter.dk', 18),
(315, 'OMC (Optical Monitoring Camera)', '', '', 500.00, 600.00, 'nm', 'optical emissions from gamma-ray instruments and x-ray monitor,,', '', '5 x 5 deg', '', 'Miguel Mas-Hesse', ' mm@laeff.inta.es', 18),
(316, 'IREM (INTEGRAL Radiation Environment Monitor)', 'Spectrometer', 'Spectrometer', NULL, NULL, '', ',,', '', ' x ', '', '', '', 18),
(317, 'MIRI (Mid Infra-Red Instrument)', 'Spectrometer', 'Spectrometer', NULL, NULL, '', 'Infra-red wavelength,,', '', '8 x 8 arcseconds', '', 'Dr George Rieke', 'grieke@as.arizona.edu', 19),
(318, 'NIRCam (Near Infra-Red Camera)', 'Spectrograph', 'Two HgCdTe Detector Arrays', NULL, NULL, '', 'Near Infra-Red Wavelengths,,', '0.0317 arcseconds', '2.2 x 4.4', '', 'Dr Marcia Rieke', 'mrieke@as.arizona.edu', 19),
(319, 'NIRSpec (Near Infra-Red Spectrograph)', 'Camera', 'Tunable Filter Camera', NULL, NULL, '', 'Infra-red spectra for over 100 objects,,', '', '9 x 9 arcminutes', '', 'Dr Peter Jackobsen', '', 19),
(320, 'FGS (Fine Guidance Sensor)', '', '', NULL, NULL, '', ',,', '', '2.4 x 2.4', '', 'John Hutchings and Rene Doyon', 'John.Hutchings@nrc-cnrc.gc.ca', 19),
(321, 'WFI (Wide Field Imager)', 'Spectrometer', 'Imaging X-ray spectrometer', 0.10, 15.00, 'keV', 'X-rays,,', '50eV', '18 x 18 arcminutes', '', '', '', 20),
(322, 'HXI (Hard X-ray Imager)', 'Imager', 'Cadmium Talleride Detector', 7.00, 30.00, 'KeV', 'X-rays,,', '', '8 x 8 arcminutes', '', '', '', 20),
(323, 'XMS (X-ray Microcalorimeter Spectrometer)', 'Spectrometer', 'non dispersive imaging spectrometer', 0.30, 7.00, 'kev', 'X-rays,,', '2.5 eV', '5.4 x 5.4 arcminutes', '', '', '', 20),
(324, 'HTRS  (High Time Resolution Spectrometer)', 'Spectrometer', 'spectrometer', 0.30, 10.00, 'kev', 'Spectral: 150 eV,,', '', ' x ', '', '', '', 20),
(325, 'X-POL (X-ray Polarimeter)', 'Polarimeter', 'Gas Pixel Detector', 2.00, 10.00, 'KeV', ',,', 'around 5keV', '2.5 x 2.5 arcminutes', '', '', '', 20),
(326, 'XGS (X-ray Grating Spectrometer)', 'Spectrometer', 'wavelength dispersive spectrometer', 0.30, 1.00, 'KeV', ',,', '80eV', ' x ', '', '', '', 20),
(372, 'ACIS', 'Advanced CCD Imaging Spectrometer', '', 0.10, 10.00, 'keV', ',,', '', ' x ', '', '', '', 26),
(373, 'HRC', 'High Resolution Camera', '', 0.10, 10.00, 'keV', ',,', '25 microns', '30 x 30', '', '', '', 26);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
