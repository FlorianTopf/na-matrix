SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

/* updating the reference columns to REAL default value (---) */
UPDATE `europlanet_na1`.`telescopes` SET antenna_type='1';
UPDATE `europlanet_na1`.`telescopes` SET wavelength_b_unit='1';
UPDATE `europlanet_na1`.`telescopes` SET wavelength_e_unit='1';

/* change several float numbers to float(10,6) */
ALTER TABLE `europlanet_na1`.`telescopes` CHANGE `diameter_m` `diameter_m` FLOAT(10,6) NULL DEFAULT NULL;
ALTER TABLE `europlanet_na1`.`telescopes` CHANGE `wavelength_begin` `wavelength_begin` FLOAT(10,6) NULL DEFAULT NULL;
ALTER TABLE `europlanet_na1`.`telescopes` CHANGE `wavelength_end` `wavelength_end` FLOAT(10,6) NULL DEFAULT NULL;
ALTER TABLE `europlanet_na1`.`instruments` CHANGE `wavelength_begin` `wavelength_begin` FLOAT(10,6) NULL DEFAULT NULL;
ALTER TABLE `europlanet_na1`.`instruments` CHANGE `wavelength_end` `wavelength_end` FLOAT(10,6) NULL DEFAULT NULL;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;