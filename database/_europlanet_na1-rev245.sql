SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `europlanet_na1`.`instruments` DROP FOREIGN KEY `instrument_type_id` ;

ALTER TABLE `europlanet_na1`.`observatory_to_instruments` DROP FOREIGN KEY `instrument_id` ;

ALTER TABLE `europlanet_na1`.`instrument_types` RENAME TO  `europlanet_na1`.`telescope_types` ;

ALTER TABLE `europlanet_na1`.`instruments` 
  ADD CONSTRAINT `instrument_type_id`
  FOREIGN KEY (`instrument_type` )
  REFERENCES `europlanet_na1`.`telescope_types` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, RENAME TO  `europlanet_na1`.`telescopes` ;

ALTER TABLE `europlanet_na1`.`observatory_to_instruments` 
  ADD CONSTRAINT `instrument_id`
  FOREIGN KEY (`instrument_id` )
  REFERENCES `europlanet_na1`.`telescopes` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION, RENAME TO  `europlanet_na1`.`observatory_to_telescopes` ;
  
ALTER TABLE `europlanet_na1`.`telescopes` DROP FOREIGN KEY `instrument_type_id` ;

ALTER TABLE `europlanet_na1`.`observatory_to_telescopes` DROP FOREIGN KEY `instrument_id` ;

ALTER TABLE `europlanet_na1`.`telescopes` CHANGE COLUMN `instrument_type` `telescope_type` INT(10) UNSIGNED NOT NULL  , 
  ADD CONSTRAINT `telescope_type_id`
  FOREIGN KEY (`telescope_type` )
  REFERENCES `europlanet_na1`.`telescope_types` (`id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, DROP INDEX `instrument_type_id` 
, ADD INDEX `telescope_type_id` (`telescope_type` ASC) ;

ALTER TABLE `europlanet_na1`.`observatory_to_telescopes` CHANGE COLUMN `instrument_id` `telescope_id` INT(10) UNSIGNED NOT NULL  , 
  ADD CONSTRAINT `telescope_id_1`
  FOREIGN KEY (`telescope_id` )
  REFERENCES `europlanet_na1`.`telescopes` (`id` )
  ON DELETE CASCADE
  ON UPDATE NO ACTION
, DROP INDEX `instrument_id` 
, ADD INDEX `telescope_id_1` (`telescope_id` ASC) ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
