SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

/* ALTER TABLE `europlanet_na1`.`telescopes` DROP FOREIGN KEY `telescope_type_id` ;

ALTER TABLE `europlanet_na1`.`observatory_to_telescopes` DROP FOREIGN KEY `telescope_id_1` ; */

/* ALTER TABLE `europlanet_na1`.`telescopes` DROP COLUMN `telescope_type` , ADD COLUMN `telescope_name` TEXT NULL DEFAULT NULL  AFTER `id` , ADD COLUMN `telescope_type` INT(10) UNSIGNED NOT NULL  AFTER `telescope_name` , ADD COLUMN `telescope_elements` INT(10) UNSIGNED NULL DEFAULT NULL  AFTER `telescope_type` , ADD COLUMN `antenna_type` INT(10) UNSIGNED NOT NULL  AFTER `focallength_m` , ADD COLUMN `wavelength_begin` FLOAT NULL DEFAULT NULL  AFTER `wavelength` , ADD COLUMN `wavelength_b_unit` INT(10) UNSIGNED NOT NULL  AFTER `wavelength_begin` , ADD COLUMN `wavelength_end` FLOAT NULL DEFAULT NULL  AFTER `wavelength_b_unit` , ADD COLUMN `wavelength_e_unit` INT(10) UNSIGNED NOT NULL  AFTER `wavelength_end` , ADD COLUMN `comments` TEXT NULL DEFAULT NULL  AFTER `wavelength_e_unit` , */
  ALTER TABLE `europlanet_na1`.`telescopes` ADD COLUMN `telescope_name` TEXT NULL DEFAULT NULL  AFTER `id` , ADD COLUMN `telescope_elements` INT(10) UNSIGNED NULL DEFAULT NULL  AFTER `telescope_type` , ADD COLUMN `antenna_type` INT(10) UNSIGNED NOT NULL  AFTER `focallength_m` , ADD COLUMN `wavelength_begin` FLOAT NULL DEFAULT NULL  AFTER `wavelength` , ADD COLUMN `wavelength_b_unit` INT(10) UNSIGNED NOT NULL  AFTER `wavelength_begin` , ADD COLUMN `wavelength_end` FLOAT NULL DEFAULT NULL  AFTER `wavelength_b_unit` , ADD COLUMN `wavelength_e_unit` INT(10) UNSIGNED NOT NULL  AFTER `wavelength_end` , ADD COLUMN `comments` TEXT NULL DEFAULT NULL  AFTER `wavelength_e_unit` , 
/*  ADD CONSTRAINT `telescope_type_id`
  FOREIGN KEY (`telescope_type` )
  REFERENCES `europlanet_na1`.`telescope_types` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, */
  ADD CONSTRAINT `wavelength_unit_id_1`
  FOREIGN KEY (`wavelength_b_unit` )
  REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `wavelength_unit_id_2`
  FOREIGN KEY (`wavelength_e_unit` )
  REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `antenna_type_id`
  FOREIGN KEY (`antenna_type` )
  REFERENCES `europlanet_na1`.`antenna_types` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
/*, ADD INDEX `telescope_type_id` (`telescope_type` ASC) */
, ADD INDEX `wavelength_unit_id_1` (`wavelength_b_unit` ASC) 
, ADD INDEX `wavelength_unit_id_2` (`wavelength_e_unit` ASC) 
, ADD INDEX `antenna_type_id` (`antenna_type` ASC); 
/* , DROP INDEX `telescope_type_id` ; */

/* ALTER TABLE `europlanet_na1`.`observatory_to_telescopes` DROP COLUMN `telescope_id` , ADD COLUMN `telescope_id` INT(10) UNSIGNED NOT NULL  AFTER `observatory_id` , 
  ADD CONSTRAINT `telescope_id_1`
  FOREIGN KEY (`telescope_id` )
  REFERENCES `europlanet_na1`.`telescopes` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION
, ADD INDEX `telescope_id_1` (`telescope_id` ASC) 
, DROP INDEX `telescope_id_1` ; */

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`wavelength_units` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `wavelength_unit` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, '---');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'Hz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'KHz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'MHz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'GHz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'THz');

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`instruments` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `instrument_name` TEXT NULL DEFAULT NULL ,
  `instrument_type` INT(10) UNSIGNED NOT NULL ,
  `focal_position` TEXT NULL DEFAULT NULL ,
  `wavelength` TEXT NULL DEFAULT NULL ,
  `wavelength_begin` FLOAT NULL DEFAULT NULL ,
  `wavelength_b_unit` INT(10) UNSIGNED NOT NULL ,
  `wavelength_end` FLOAT NULL DEFAULT NULL ,
  `wavelength_e_unit` INT(10) UNSIGNED NOT NULL ,
  `field_of_view` TEXT NULL DEFAULT NULL ,
  `spatial_resolution` TEXT NULL DEFAULT NULL ,
  `spectral_resolution` TEXT NULL DEFAULT NULL ,
  `polarisation` TEXT NULL DEFAULT NULL ,
  `comments` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `instrument_type_id` (`instrument_type` ASC) ,
  CONSTRAINT `instrument_type_id`
    FOREIGN KEY (`instrument_type` )
    REFERENCES `europlanet_na1`.`instrument_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`telescope_to_instruments` (
  `telescope_id` INT(10) UNSIGNED NOT NULL ,
  `instrument_id` INT(10) UNSIGNED NOT NULL ,
  INDEX `telescope_id_2` (`telescope_id` ASC) ,
  INDEX `instrument_id_1` (`instrument_id` ASC) ,
  CONSTRAINT `telescope_id_2`
    FOREIGN KEY (`telescope_id` )
    REFERENCES `europlanet_na1`.`telescopes` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `instrument_id_1`
    FOREIGN KEY (`instrument_id` )
    REFERENCES `europlanet_na1`.`instruments` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`instrument_types` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`antenna_types` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `antenna_type` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
