SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `europlanet_na1`.`sensors` ADD COLUMN `web_address` TEXT NULL DEFAULT NULL  AFTER `science_goals` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`science_goals` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `acronym` VARCHAR(5) NOT NULL ,
  `name` TEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_mission_to_science_goals` (
  `sensor_id` INT(10) UNSIGNED NOT NULL ,
  `science_goal_id` INT(10) UNSIGNED NOT NULL ,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
