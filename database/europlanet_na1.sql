SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `europlanet_na1` ;
CREATE SCHEMA IF NOT EXISTS `europlanet_na1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `europlanet_na1` ;

-- -----------------------------------------------------
-- Table `europlanet_na1`.`countries`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`countries` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `acronym` VARCHAR(5) NOT NULL ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`precipitation_ranges`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`precipitation_ranges` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `range` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`clearnights_ranges`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`clearnights_ranges` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `range` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`timezones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`timezones` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `timezone` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`observatories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`observatories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  `founded` INT NULL DEFAULT NULL ,
  `institution` TEXT NULL DEFAULT NULL ,
  `web_address` TEXT NULL DEFAULT NULL ,
  `address` TEXT NULL DEFAULT NULL ,
  `zip_code` VARCHAR(10) NULL DEFAULT NULL ,
  `city` TEXT NULL DEFAULT NULL ,
  `country_id` INT UNSIGNED NOT NULL ,
  `phone` VARCHAR(22) NULL DEFAULT NULL ,
  `email` TEXT NOT NULL ,
  `latitude` DOUBLE(10,6) NULL DEFAULT NULL ,
  `longitude` DOUBLE(10,6) NULL DEFAULT NULL ,
  `approx_position` TEXT NULL DEFAULT NULL ,
  `sealevel_m` INT NULL DEFAULT NULL ,
  `precipitation` INT UNSIGNED NULL DEFAULT NULL ,
  `clear_nights` INT UNSIGNED NULL DEFAULT NULL ,
  `timezone` INT UNSIGNED NULL DEFAULT NULL ,
  `observatory_status` TEXT NULL DEFAULT NULL ,
  `partner_observatories` TEXT NULL DEFAULT NULL ,
  `user_id` INT NOT NULL DEFAULT 0 ,
  `creation_date` DATETIME NOT NULL ,
  `modification_date` DATETIME NULL DEFAULT NULL ,
  `approved` TINYINT(1)  NULL DEFAULT FALSE ,
  `saved_for_later` TINYINT(1)  NULL DEFAULT FALSE ,
  `last_saved_by` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `country_id` (`country_id` ASC) ,
  INDEX `precipitation_id` (`precipitation` ASC) ,
  INDEX `clear_nights_id` (`clear_nights` ASC) ,
  INDEX `timezone_id` (`timezone` ASC) ,
  CONSTRAINT `country_id`
    FOREIGN KEY (`country_id` )
    REFERENCES `europlanet_na1`.`countries` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `precipitation_id`
    FOREIGN KEY (`precipitation` )
    REFERENCES `europlanet_na1`.`precipitation_ranges` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `clear_nights_id`
    FOREIGN KEY (`clear_nights` )
    REFERENCES `europlanet_na1`.`clearnights_ranges` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `timezone_id`
    FOREIGN KEY (`timezone` )
    REFERENCES `europlanet_na1`.`timezones` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`telescope_types`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`telescope_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`additional_information`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`additional_information` (
  `id` INT UNSIGNED NOT NULL ,
  `further_contacts` TEXT NULL DEFAULT NULL ,
  `additional_instruments` TEXT NULL DEFAULT NULL ,
  `array_description` TEXT NULL DEFAULT NULL ,
  `backend_description` TEXT NULL DEFAULT NULL ,
  `research_comments` TEXT NULL DEFAULT NULL ,
  `target_comments` TEXT NULL DEFAULT NULL ,
  `general_comments` TEXT NULL DEFAULT NULL ,
  `feedback` TEXT NULL DEFAULT NULL ,
  INDEX `observatory_id_4` (`id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `observatory_id_4`
    FOREIGN KEY (`id` )
    REFERENCES `europlanet_na1`.`observatories` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`research_areas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`research_areas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `domain` TEXT NOT NULL ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`hidden_fields`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`hidden_fields` (
  `id` INT UNSIGNED NOT NULL ,
  `web_address` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `address` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `phone` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `email` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `latitude` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `longitude` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `scientific_contacts` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  `further_contacts` TINYINT(1)  NOT NULL DEFAULT FALSE ,
  INDEX `observatory_id_5` (`id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `observatory_id_5`
    FOREIGN KEY (`id` )
    REFERENCES `europlanet_na1`.`observatories` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`scientific_contacts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`scientific_contacts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  `email` TEXT NOT NULL ,
  `institution` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`observatory_to_research_areas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`observatory_to_research_areas` (
  `observatory_id` INT UNSIGNED NOT NULL ,
  `research_area_id` INT UNSIGNED NOT NULL ,
  INDEX `observatory_id_3` (`observatory_id` ASC) ,
  INDEX `research_area_id_1` (`research_area_id` ASC) ,
  PRIMARY KEY (`observatory_id`, `research_area_id`) ,
  CONSTRAINT `observatory_id_3`
    FOREIGN KEY (`observatory_id` )
    REFERENCES `europlanet_na1`.`observatories` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `research_area_id_1`
    FOREIGN KEY (`research_area_id` )
    REFERENCES `europlanet_na1`.`research_areas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`observatory_to_scientific_contacts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`observatory_to_scientific_contacts` (
  `observatory_id` INT UNSIGNED NOT NULL ,
  `scientific_contact_id` INT UNSIGNED NOT NULL ,
  INDEX `observatory_id_1` (`observatory_id` ASC) ,
  INDEX `scientific_contact_id_1` (`scientific_contact_id` ASC) ,
  PRIMARY KEY (`observatory_id`, `scientific_contact_id`) ,
  CONSTRAINT `observatory_id_1`
    FOREIGN KEY (`observatory_id` )
    REFERENCES `europlanet_na1`.`observatories` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `scientific_contact_id_1`
    FOREIGN KEY (`scientific_contact_id` )
    REFERENCES `europlanet_na1`.`scientific_contacts` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`wavelength_units`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`wavelength_units` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `wavelength_unit` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`antenna_types`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`antenna_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `antenna_type` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`telescopes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`telescopes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `telescope_name` TEXT NULL DEFAULT NULL ,
  `telescope_type` INT UNSIGNED NOT NULL ,
  `mobile_flag` TINYINT(1)  NULL DEFAULT FALSE ,
  `telescope_elements` INT UNSIGNED NULL DEFAULT NULL ,
  `diameter_m` FLOAT(10,6) NULL DEFAULT NULL ,
  `focallength_m` VARCHAR(10) NULL DEFAULT NULL ,
  `antenna_type` INT UNSIGNED NOT NULL ,
  `wavelength` TEXT NULL DEFAULT NULL ,
  `wavelength_begin` FLOAT(10,6) NULL DEFAULT NULL ,
  `wavelength_b_unit` INT UNSIGNED NOT NULL ,
  `wavelength_end` FLOAT(10,6) NULL DEFAULT NULL ,
  `wavelength_e_unit` INT UNSIGNED NOT NULL ,
  `comments` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `telescope_type_id` (`telescope_type` ASC) ,
  INDEX `wavelength_unit_id_1` (`wavelength_b_unit` ASC) ,
  INDEX `wavelength_unit_id_2` (`wavelength_e_unit` ASC) ,
  INDEX `antenna_type_id` (`antenna_type` ASC) ,
  CONSTRAINT `telescope_type_id`
    FOREIGN KEY (`telescope_type` )
    REFERENCES `europlanet_na1`.`telescope_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `wavelength_unit_id_1`
    FOREIGN KEY (`wavelength_b_unit` )
    REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `wavelength_unit_id_2`
    FOREIGN KEY (`wavelength_e_unit` )
    REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `antenna_type_id`
    FOREIGN KEY (`antenna_type` )
    REFERENCES `europlanet_na1`.`antenna_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`observatory_to_telescopes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`observatory_to_telescopes` (
  `observatory_id` INT UNSIGNED NOT NULL ,
  `telescope_id` INT UNSIGNED NOT NULL ,
  INDEX `observatory_id_2` (`observatory_id` ASC) ,
  INDEX `telescope_id_1` (`telescope_id` ASC) ,
  PRIMARY KEY (`observatory_id`, `telescope_id`) ,
  CONSTRAINT `observatory_id_2`
    FOREIGN KEY (`observatory_id` )
    REFERENCES `europlanet_na1`.`observatories` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `telescope_id_1`
    FOREIGN KEY (`telescope_id` )
    REFERENCES `europlanet_na1`.`telescopes` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`agencies`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`agencies` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `acronym` VARCHAR(20) NOT NULL ,
  `name` TEXT NOT NULL ,
  `web_address` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`space_missions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_missions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `mission_name` TEXT NOT NULL ,
  `mission_agency` INT UNSIGNED NOT NULL ,
  `launch_date` DATE NOT NULL ,
  `death_date` DATE NULL DEFAULT NULL ,
  `web_address` TEXT NOT NULL ,
  `brief_description` TEXT NULL DEFAULT NULL ,
  `creation_date` DATETIME NOT NULL ,
  `modification_date` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `mission_agency_id` (`mission_agency` ASC) ,
  CONSTRAINT `mission_agency_id`
    FOREIGN KEY (`mission_agency` )
    REFERENCES `europlanet_na1`.`agencies` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`sensors`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`sensors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `sensor_name` TEXT NOT NULL ,
  `sensor_type` TEXT NOT NULL ,
  `underlying` TEXT NULL DEFAULT NULL ,
  `range_begin` FLOAT NULL ,
  `range_end` FLOAT NULL ,
  `units` TEXT NULL ,
  `measured` TEXT NULL ,
  `resolution` TEXT NULL ,
  `field_of_view` TEXT NULL ,
  `web_address` TEXT NULL DEFAULT NULL ,
  `sensor_comments` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`space_mission_to_sensors`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_mission_to_sensors` (
  `space_mission_id` INT UNSIGNED NOT NULL ,
  `sensor_id` INT UNSIGNED NOT NULL ,
  INDEX `space_mission_id_1` (`space_mission_id` ASC) ,
  INDEX `sensor_id_1` (`sensor_id` ASC) ,
  PRIMARY KEY (`space_mission_id`, `sensor_id`) ,
  CONSTRAINT `space_mission_id_1`
    FOREIGN KEY (`space_mission_id` )
    REFERENCES `europlanet_na1`.`space_missions` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `sensor_id_1`
    FOREIGN KEY (`sensor_id` )
    REFERENCES `europlanet_na1`.`sensors` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`targets`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`targets` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `target_family` VARCHAR(100) NOT NULL ,
  `target_name` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`space_mission_to_targets`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_mission_to_targets` (
  `space_mission_id` INT UNSIGNED NOT NULL ,
  `target_id` INT UNSIGNED NOT NULL ,
  INDEX `space_mission_id_2` (`space_mission_id` ASC) ,
  INDEX `target_id_2` (`target_id` ASC) ,
  PRIMARY KEY (`space_mission_id`, `target_id`) ,
  CONSTRAINT `space_mission_id_2`
    FOREIGN KEY (`space_mission_id` )
    REFERENCES `europlanet_na1`.`space_missions` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `target_id_2`
    FOREIGN KEY (`target_id` )
    REFERENCES `europlanet_na1`.`targets` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`sensor_to_scientific_contacts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`sensor_to_scientific_contacts` (
  `sensor_id` INT UNSIGNED NOT NULL ,
  `scientific_contact_id` INT UNSIGNED NOT NULL ,
  INDEX `sensor_id_2` (`sensor_id` ASC) ,
  INDEX `scientific_contact_id_2` (`scientific_contact_id` ASC) ,
  PRIMARY KEY (`sensor_id`, `scientific_contact_id`) ,
  CONSTRAINT `sensor_id_2`
    FOREIGN KEY (`sensor_id` )
    REFERENCES `europlanet_na1`.`sensors` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `scientific_contact_id_2`
    FOREIGN KEY (`scientific_contact_id` )
    REFERENCES `europlanet_na1`.`scientific_contacts` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`space_mission_to_research_areas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_mission_to_research_areas` (
  `space_mission_id` INT UNSIGNED NOT NULL ,
  `research_area_id` INT UNSIGNED NOT NULL ,
  INDEX `space_mission_id_3` (`space_mission_id` ASC) ,
  INDEX `research_area_id_2` (`research_area_id` ASC) ,
  PRIMARY KEY (`space_mission_id`, `research_area_id`) ,
  CONSTRAINT `space_mission_id_3`
    FOREIGN KEY (`space_mission_id` )
    REFERENCES `europlanet_na1`.`space_missions` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `research_area_id_2`
    FOREIGN KEY (`research_area_id` )
    REFERENCES `europlanet_na1`.`research_areas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`observatory_to_targets`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`observatory_to_targets` (
  `observatory_id` INT UNSIGNED NOT NULL ,
  `target_id` INT UNSIGNED NOT NULL ,
  INDEX `observatory_id_7` (`observatory_id` ASC) ,
  INDEX `target_id_1` (`target_id` ASC) ,
  PRIMARY KEY (`observatory_id`, `target_id`) ,
  CONSTRAINT `observatory_id_7`
    FOREIGN KEY (`observatory_id` )
    REFERENCES `europlanet_na1`.`observatories` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `target_id_1`
    FOREIGN KEY (`target_id` )
    REFERENCES `europlanet_na1`.`targets` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`science_goals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`science_goals` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `acronym` VARCHAR(5) NOT NULL ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`sensor_to_science_goals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`sensor_to_science_goals` (
  `sensor_id` INT UNSIGNED NOT NULL ,
  `science_goal_id` INT UNSIGNED NOT NULL ,
  INDEX `sensor_id_3` (`sensor_id` ASC) ,
  INDEX `science_goal_id` (`science_goal_id` ASC) ,
  PRIMARY KEY (`sensor_id`, `science_goal_id`) ,
  CONSTRAINT `sensor_id_3`
    FOREIGN KEY (`sensor_id` )
    REFERENCES `europlanet_na1`.`sensors` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `science_goal_id`
    FOREIGN KEY (`science_goal_id` )
    REFERENCES `europlanet_na1`.`science_goals` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`instrument_types`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`instrument_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`instruments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`instruments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `instrument_name` TEXT NULL DEFAULT NULL ,
  `instrument_type` INT UNSIGNED NOT NULL ,
  `focal_position` TEXT NULL DEFAULT NULL ,
  `wavelength` TEXT NULL ,
  `wavelength_begin` FLOAT(10,6) NULL DEFAULT NULL ,
  `wavelength_b_unit` INT UNSIGNED NOT NULL ,
  `wavelength_end` FLOAT(10,6) NULL DEFAULT NULL ,
  `wavelength_e_unit` INT UNSIGNED NOT NULL ,
  `spatial_resolution` TEXT NULL DEFAULT NULL ,
  `spectral_resolution` TEXT NULL DEFAULT NULL ,
  `polarisation` TEXT NULL DEFAULT NULL ,
  `field_of_view` TEXT NULL DEFAULT NULL ,
  `max_frames_per_sec` FLOAT NULL DEFAULT NULL ,
  `frame_size` TEXT NULL DEFAULT NULL ,
  `min_exposure_time` FLOAT NULL DEFAULT NULL ,
  `max_exposure_time` FLOAT NULL DEFAULT NULL ,
  `color_bw_chip` TINYINT(1)  NULL DEFAULT NULL ,
  `ccd_chip_type` TEXT NULL DEFAULT NULL ,
  `comments` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `instrument_type_id` (`instrument_type` ASC) ,
  INDEX `wavelength_unit_id_3` (`wavelength_b_unit` ASC) ,
  INDEX `wavelength_unit_id_4` (`wavelength_e_unit` ASC) ,
  CONSTRAINT `instrument_type_id`
    FOREIGN KEY (`instrument_type` )
    REFERENCES `europlanet_na1`.`instrument_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `wavelength_unit_id_3`
    FOREIGN KEY (`wavelength_b_unit` )
    REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `wavelength_unit_id_4`
    FOREIGN KEY (`wavelength_e_unit` )
    REFERENCES `europlanet_na1`.`wavelength_units` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`telescope_to_instruments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`telescope_to_instruments` (
  `telescope_id` INT UNSIGNED NOT NULL ,
  `instrument_id` INT UNSIGNED NOT NULL ,
  INDEX `telescope_id_2` (`telescope_id` ASC) ,
  INDEX `instrument_id_1` (`instrument_id` ASC) ,
  PRIMARY KEY (`telescope_id`, `instrument_id`) ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`wavelength_ranges`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`wavelength_ranges` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `acronym` TEXT NOT NULL ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`precipitation_ranges`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`precipitation_ranges` (`id`, `range`) VALUES (NULL, '<10');
INSERT INTO `europlanet_na1`.`precipitation_ranges` (`id`, `range`) VALUES (NULL, '11-50');
INSERT INTO `europlanet_na1`.`precipitation_ranges` (`id`, `range`) VALUES (NULL, '51-100');
INSERT INTO `europlanet_na1`.`precipitation_ranges` (`id`, `range`) VALUES (NULL, '101-200');
INSERT INTO `europlanet_na1`.`precipitation_ranges` (`id`, `range`) VALUES (NULL, '201-500');
INSERT INTO `europlanet_na1`.`precipitation_ranges` (`id`, `range`) VALUES (NULL, '>500');
INSERT INTO `europlanet_na1`.`precipitation_ranges` (`id`, `range`) VALUES (NULL, '---');

COMMIT;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`clearnights_ranges`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES (NULL, '<50');
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES (NULL, '51-100');
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES (NULL, '101-150');
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES (NULL, '151-200');
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES (NULL, '251-300');
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES (NULL, '>300');
INSERT INTO `europlanet_na1`.`clearnights_ranges` (`id`, `range`) VALUES (NULL, '---');

COMMIT;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`timezones`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+00');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+01');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+02');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+03');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+04');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+05');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+06');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+07');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+08');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+09');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+10');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+11');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '+12');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-01');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-02');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-03');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-04');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-05');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-06');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-07');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-08');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-09');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-10');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-11');
INSERT INTO `europlanet_na1`.`timezones` (`id`, `timezone`) VALUES (NULL, '-12');

COMMIT;

-- -----------------------------------------------------
-- Data for table `europlanet_na1`.`wavelength_units`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `europlanet_na1`;
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, '---');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'Hz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'KHz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'MHz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'GHz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'THz');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, '&Aring;');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'nm');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, '&micro;m');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'mm');
INSERT INTO `europlanet_na1`.`wavelength_units` (`id`, `wavelength_unit`) VALUES (NULL, 'cm');

COMMIT;
