SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `europlanet_na1` DEFAULT CHARACTER SET latin1 ;
USE `europlanet_na1` ;

-- -----------------------------------------------------
-- Table `europlanet_na1`.`space_mission_to_targets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `europlanet_na1`.`space_mission_to_targets` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`space_mission_to_targets` (
  `space_mission_id` INT UNSIGNED NOT NULL ,
  `target_id` INT UNSIGNED NOT NULL ,
  INDEX `space_mission_id_2` (`space_mission_id` ASC) ,
  INDEX `target_id_2` (`target_id` ASC) ,
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
-- Table `europlanet_na1`.`observatory_to_targets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `europlanet_na1`.`observatory_to_targets` ;

CREATE  TABLE IF NOT EXISTS `europlanet_na1`.`observatory_to_targets` (
  `observatory_id` INT UNSIGNED NOT NULL ,
  `target_id` INT UNSIGNED NOT NULL ,
  INDEX `observatory_id_7` (`observatory_id` ASC) ,
  INDEX `target_id_1` (`target_id` ASC) ,
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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
