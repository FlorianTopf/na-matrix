SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- -----------------------------------------------------
-- Table `europlanet_na1`.`sensor_to_scientific_contacts`
-- -----------------------------------------------------
-- DROP WRONG OLD TABLE
DROP TABLE IF EXISTS `europlanet_na1`.`sensors_to_scientific_contacts` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`sensor_to_scientific_contacts` (
  `sensor_id` INT UNSIGNED NOT NULL ,
  `scientific_contact_id` INT UNSIGNED NOT NULL ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `europlanet_na1`.`sensor_to_science_goals`
-- -----------------------------------------------------
-- DROP WRONG OLD TABLE
DROP TABLE IF EXISTS `europlanet_na1`.`space_mission_to_science_goals` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`sensor_to_science_goals` (
  `sensor_id` INT UNSIGNED NOT NULL ,
  `science_goal_id` INT UNSIGNED NOT NULL ,
  INDEX `sensor_id_3` (`sensor_id` ASC) ,
  INDEX `science_goal_id` (`science_goal_id` ASC) ,
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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
