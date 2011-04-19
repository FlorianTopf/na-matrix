SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `europlanet_na1`.`observatories` DROP FOREIGN KEY `instruments_number_id` ;

ALTER TABLE `europlanet_na1`.`observatories` DROP COLUMN `instruments_number` , ADD COLUMN `observatory_status` TEXT NULL DEFAULT NULL  AFTER `timezone` 
, DROP INDEX `instruments_number_id` ;

ALTER TABLE `europlanet_na1`.`space_missions` ADD COLUMN `brief_description` TEXT NULL DEFAULT NULL  AFTER `web_address` ;

ALTER TABLE `europlanet_na1`.`sensors` ADD COLUMN `sensor_comments` TEXT NULL DEFAULT NULL  AFTER `web_address` ;

DROP TABLE IF EXISTS `europlanet_na1`.`number_of_instruments` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
