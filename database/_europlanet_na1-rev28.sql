SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `europlanet_na1`.`observatory_to_research_areas` DROP FOREIGN KEY `research_area_id` ;

ALTER TABLE `europlanet_na1`.`observatory_to_scientific_contacts` DROP FOREIGN KEY `scientific_contact_id` ;

ALTER TABLE `europlanet_na1`.`space_mission_to_sensors` DROP FOREIGN KEY `space_mission_id_1` , DROP FOREIGN KEY `sensor_id` ;

ALTER TABLE `europlanet_na1`.`scientific_contacts` ADD COLUMN `institution` TEXT NULL DEFAULT NULL  AFTER `email` ;

ALTER TABLE `europlanet_na1`.`observatory_to_research_areas` 
  ADD CONSTRAINT `research_area_id_1`
  FOREIGN KEY (`research_area_id` )
  REFERENCES `europlanet_na1`.`research_areas` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `research_area_id` 
, ADD INDEX `research_area_id_1` (`research_area_id` ASC) ;

ALTER TABLE `europlanet_na1`.`observatory_to_scientific_contacts` 
  ADD CONSTRAINT `scientific_contact_id_1`
  FOREIGN KEY (`scientific_contact_id` )
  REFERENCES `europlanet_na1`.`scientific_contacts` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION
, DROP INDEX `scientific_contact_id` 
, ADD INDEX `scientific_contact_id_1` (`scientific_contact_id` ASC) ;

ALTER TABLE `europlanet_na1`.`space_missions` DROP COLUMN `comments` , DROP COLUMN `mission_target` , ADD COLUMN `web_address` TEXT NULL DEFAULT NULL  AFTER `death_date` , CHANGE COLUMN `mission_agency` `mission_agency` INT(10) UNSIGNED NOT NULL  , 
  ADD CONSTRAINT `mission_agency_id`
  FOREIGN KEY (`mission_agency` )
  REFERENCES `europlanet_na1`.`agencies` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `mission_agency_id` (`mission_agency` ASC) ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`sensors` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `sensor_name` TEXT NOT NULL ,
  `sensor_type` TEXT NOT NULL ,
  `underlying` TEXT NULL DEFAULT NULL ,
  `range_begin` FLOAT NULL DEFAULT NULL ,
  `range_end` FLOAT NULL DEFAULT NULL ,
  `units` TEXT NULL DEFAULT NULL ,
  `measured` TEXT NULL DEFAULT NULL ,
  `resolution` TEXT NULL DEFAULT NULL ,
  `field_of_view` TEXT NULL DEFAULT NULL ,
  `science_goals` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

ALTER TABLE `europlanet_na1`.`space_mission_to_sensors` 
  ADD CONSTRAINT `space_mission_id_1`
  FOREIGN KEY (`space_mission_id` )
  REFERENCES `europlanet_na1`.`space_missions` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `sensor_id_1`
  FOREIGN KEY (`sensor_id` )
  REFERENCES `europlanet_na1`.`sensors` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION
, ADD INDEX `sensor_id_1` (`sensor_id` ASC) 
, DROP INDEX `sensor_id` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`agencies` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`targets` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `target_family` VARCHAR(45) NOT NULL ,
  `target_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_mission_to_target` (
  `space_mission_id` INT(10) UNSIGNED NOT NULL ,
  `target_id` INT(10) UNSIGNED NOT NULL ,
  INDEX `space_mission_id_2` (`space_mission_id` ASC) ,
  INDEX `target_id` (`target_id` ASC) ,
  CONSTRAINT `space_mission_id_2`
    FOREIGN KEY (`space_mission_id` )
    REFERENCES `europlanet_na1`.`space_missions` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `target_id`
    FOREIGN KEY (`target_id` )
    REFERENCES `europlanet_na1`.`targets` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`sensors_to_scientific_contacts` (
  `sensor_id` INT(10) UNSIGNED NOT NULL ,
  `scientific_contact_id` INT(10) UNSIGNED NOT NULL ,
  INDEX `sensor_id_2` (`sensor_id` ASC) ,
  INDEX `scientific_contact_id_2` (`scientific_contact_id` ASC) ,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_mission_to_research_areas` (
  `space_mission_id` INT(10) UNSIGNED NOT NULL ,
  `research_area_id` INT(10) UNSIGNED NOT NULL ,
  INDEX `space_mission_id_3` (`space_mission_id` ASC) ,
  INDEX `research_area_id_2` (`research_area_id` ASC) ,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

DROP TABLE IF EXISTS `europlanet_na1`.`space_mission_sensors` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
